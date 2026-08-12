# NSIS Branding Snippet

Referencyjny fragment konfiguracji prywatnego repo aplikacji:

```json
{
  "bundle": {
    "windows": {
      "nsis": {
        "headerImage": "installer-assets/elynovia-nsis-header.bmp",
        "sidebarImage": "installer-assets/elynovia-nsis-sidebar.bmp",
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

Ścieżki są względne wobec `src-tauri/tauri.conf.json`.
