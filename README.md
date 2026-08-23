# DokuWiki Home Assistant Add-on (Ingress Fork)
![DokuWiki Logo](https://www.dokuwiki.org/lib/tpl/dokuwiki/images/logo.png)

🇩🇪 [Deutsch](#deutsch) | 🇬🇧 [English](#english)

---

## Deutsch

Dies ist ein Fork von [gregorwolf1973/Hassioadon_Dokuwiki](https://github.com/gregorwolf1973/Hassioadon_Dokuwiki), da das Original derzeit nicht mehr aktiv gepflegt wird. Dieser Fork fügt native Home Assistant Ingress-Unterstützung hinzu und pinnt die jeweils aktuelle DokuWiki-Version. Probiert es gerne aus, wenn es euch hilft freue ich mich ;-)

### Über dieses Add-on
Dieses Add-on installiert [DokuWiki](https://www.dokuwiki.org) als Home Assistant Add-on. DokuWiki ist ein einfaches, aber mächtiges Wiki, das ohne Datenbank auskommt.

### Installation
[![Repository zu Home Assistant hinzufügen](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FAlokin90%2FHassioadon_Dokuwiki)

Oder manuell:
1. Füge dieses Repository in Home Assistant hinzu:
   - Einstellungen → Add-ons → Add-on Store → ⋮ → Repository hinzufügen
   - URL eingeben: `https://github.com/Alokin90/Hassioadon_Dokuwiki`
2. Das Add-on **DokuWiki (Ingress)** suchen und installieren
3. Add-on starten
4. Über die Seitenleiste (Ingress) öffnen, dann `/install.php` an die URL anhängen, um DokuWiki einmalig einzurichten

### Features
- DokuWiki ohne Datenbank
- Native Home Assistant Ingress-Unterstützung (kein separater Port nötig, Zugriff läuft abgesichert über den Supervisor)
- Persistente Datenspeicherung in `/share/dokuwiki`
- Unterstützt `amd64` und `aarch64`

### Datenspeicherung
Alle Wiki-Daten werden unter `/share/dokuwiki/` gespeichert und bleiben auch nach einer Deinstallation des Add-ons erhalten.

### Unterschiede zum Original
- Ingress-Unterstützung statt direktem Port-Zugriff
- Aktuell gepinnte DokuWiki-Version (statt `dokuwiki-stable.tgz`)
- Kein `armv7`-Support (nicht getestet)

### Support
Bei Problemen bitte ein [Issue in diesem Fork erstellen](https://github.com/Alokin90/Hassioadon_Dokuwiki/issues).

---

## English

This is a fork of [gregorwolf1973/Hassioadon_Dokuwiki](https://github.com/gregorwolf1973/Hassioadon_Dokuwiki), as the original is currently not actively maintained. This fork adds native Home Assistant Ingress support and pins the current DokuWiki release. Feel free to try it out — happy if it helps ;-)

### About this Add-on
This add-on installs [DokuWiki](https://www.dokuwiki.org) as a Home Assistant add-on. DokuWiki is a simple yet powerful wiki that requires no database.

### Installation
[![Add repository to Home Assistant](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FAlokin90%2FHassioadon_Dokuwiki)

Or manually:
1. Add this repository to Home Assistant:
   - Settings → Add-ons → Add-on Store → ⋮ → Repositories
   - Enter URL: `https://github.com/Alokin90/Hassioadon_Dokuwiki`
2. Find and install the **DokuWiki (Ingress)** add-on
3. Start the add-on
4. Open it via the sidebar (Ingress), then append `/install.php` to the URL to complete the one-time DokuWiki setup

### Features
- DokuWiki without a database
- Native Home Assistant Ingress support (no separate port needed, access secured through the Supervisor)
- Persistent data storage in `/share/dokuwiki`
- Supports `amd64` and `aarch64`

### Data Storage
All wiki data is stored under `/share/dokuwiki/` and persists even after uninstalling the add-on.

### Differences from the Original
- Ingress support instead of direct port access
- Pinned current DokuWiki version (instead of `dokuwiki-stable.tgz`)
- No `armv7` support (untested)

### Support
For issues, please [open an issue in this fork](https://github.com/Alokin90/Hassioadon_Dokuwiki/issues).