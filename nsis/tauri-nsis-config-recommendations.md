# Tauri NSIS Config Recommendations

## Potwierdzone możliwości Tauri 2

Lokalny schema `@tauri-apps/cli` potwierdza pola:

- `headerImage` — rekomendowane 150×57 px;
- `sidebarImage` — rekomendowane 164×314 px;
- `installerIcon`;
- `uninstallerIcon`;
- `uninstallerHeaderImage`;
- `installMode`;
- `languages`;
- `installerHooks`.

## Obecna konfiguracja aplikacji

- `installerIcon` i `uninstallerIcon`: aktywne;
- `installMode`: `currentUser`;
- `languages`: `English`;
- `installerHooks`: aktywny hook skrótów TriRise;
- `headerImage` i `sidebarImage`: jeszcze nieaktywne.

Hook skrótów nie modyfikuje UI instalatora. Usuwa legacy skróty PortfelPilot i tworzy skróty TriRise.

## Bezpieczna propozycja

1. Skopiować finalne BMP do `src-tauri/installer-assets/`.
2. Dodać dwie względne ścieżki w `bundle.windows.nsis`.
3. Pozostawić standardowe kontrolki, język English i obecny hook.
4. Zbudować oraz ręcznie sprawdzić instalator przed wydaniem.

Nie jest wymagany custom template `.nsi` ani zmiana modeli lub logiki aplikacji.
