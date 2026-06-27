# NSIS Branding Snippet

Referencyjny fragment do zastosowania dopiero po skopiowaniu bitmap do głównego repo aplikacji:

```json
{
  "bundle": {
    "windows": {
      "nsis": {
        "headerImage": "installer-assets/tririse-installer-header.bmp",
        "sidebarImage": "installer-assets/tririse-installer-sidebar.bmp",
        "installerIcon": "icons/icon.ico",
        "uninstallerIcon": "icons/icon.ico",
        "installerHooks": "windows/nsis-hooks.nsh",
        "installMode": "currentUser",
        "languages": ["English"]
      }
    }
  }
}
```

Ścieżki są względne wobec `src-tauri/tauri.conf.json`. Fragment nie jest automatycznie stosowany przez repo instalatora.
