#!/bin/sh
set -e

# 1. Ensure the persistent directory exists
STORAGE_DIR="/share/dokuwiki"
mkdir -p $STORAGE_DIR

# 2. Create subdirectories if they don't exist
for dir in data/pages data/attic data/media data/media_attic data/media_meta \
           data/meta data/locks data/log data/index data/tmp data/cache \
           conf tpl plugins; do
    mkdir -p "$STORAGE_DIR/$dir"
done

# 3. Initial setup: Copy defaults if the config is missing
if [ ! -f "$STORAGE_DIR/conf/dokuwiki.php" ]; then
    echo "Initializing default configuration..."
    cp -r /var/www/dokuwiki.dist/conf/* "$STORAGE_DIR/conf/"
fi

# 3b. Warn if the setup wizard hasn't been run yet
if [ ! -f "$STORAGE_DIR/conf/local.php" ]; then
    echo "No DokuWiki configuration found."
    echo "Please open this add-on's Web UI and navigate to /install.php to complete setup."
fi

# 4. Sync Templates and Plugins (if empty)
[ ! -d "$STORAGE_DIR/tpl/dokuwiki" ] && cp -r /var/www/dokuwiki.dist/lib/tpl/dokuwiki "$STORAGE_DIR/tpl/"
[ ! -d "$STORAGE_DIR/plugins/config" ] && cp -r /var/www/dokuwiki.dist/lib/plugins/* "$STORAGE_DIR/plugins/"

# 5. SYMLINK MAGIC
# Clear internal folders to replace them with symlinks to /share
rm -rf /var/www/dokuwiki/data /var/www/dokuwiki/conf /var/www/dokuwiki/lib/tpl /var/www/dokuwiki/lib/plugins

ln -sf "$STORAGE_DIR/data" /var/www/dokuwiki/data
ln -sf "$STORAGE_DIR/conf" /var/www/dokuwiki/conf
ln -sf "$STORAGE_DIR/tpl" /var/www/dokuwiki/lib/tpl
ln -sf "$STORAGE_DIR/plugins" /var/www/dokuwiki/lib/plugins

# 6. INGRESS FIX
# Use local.protected.php so this survives install.php and the Config Manager,
# both of which only ever write to local.php.
PROTECTED_CONF="$STORAGE_DIR/conf/local.protected.php"
if [ ! -f "$PROTECTED_CONF" ]; then
    echo "Adding Ingress path logic to local.protected.php..."
    cat <<'EOF' > "$PROTECTED_CONF"
<?php
if (isset($_SERVER['HTTP_X_INGRESS_PATH'])) {
    $conf['basedir'] = $_SERVER['HTTP_X_INGRESS_PATH'] . '/';
}
EOF
fi

# 7. Permissions (Ensure Nginx/PHP can write to /share)
chown -R nobody:nobody "$STORAGE_DIR"
chown -R nobody:nobody /var/www/dokuwiki

# 8. Start Services
echo "Starting PHP-FPM..."
php-fpm83 -D

echo "Starting Nginx..."
exec nginx -g 'daemon off;'
