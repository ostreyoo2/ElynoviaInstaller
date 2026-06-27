# TriRiseInstaller

Lokalne repozytorium wspierające przygotowanie i weryfikację instalatora TriRise dla Windows.

## Zakres

Repozytorium zawiera branding instalatora, dokumentację wydania oraz bezpieczne skrypty pomocnicze. Nie zawiera kodu aplikacji, danych użytkownika ani gotowych instalatorów śledzonych przez Git.

Status `INSTALLER-REPO-02`: przygotowano natywne assety NSIS o bezpiecznych wymiarach, większe podglądy PNG oraz plan dark brandingu bez modyfikowania systemowych kontrolek instalatora.

Główny projekt aplikacji pozostaje w:

```text
C:\Users\kubao\Desktop\PortfelPilot
```

Instalator nadal jest budowany przez Tauri 2 i NSIS w głównym projekcie:

```powershell
npm.cmd run tauri build
```

## Szybkie użycie

Pełny lokalny build i skopiowanie artefaktu:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-installer.ps1
```

Skopiowanie już istniejącego instalatora:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\copy-release-artifacts.ps1
```

Weryfikacja brandingu:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\verify-installer-assets.ps1
```

Ponowne wygenerowanie finalnych bitmap z zapisanych źródeł:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\generate-installer-assets.ps1
```

Gotowy plik trafia do lokalnego katalogu `artifacts/`, który jest ignorowany przez Git.

## Zasady bezpieczeństwa

- Nie commituj plików `.exe`, `.msi`, archiwów ani katalogu `artifacts/`.
- Nie kopiuj tu backupów, eksportów XTB ani innych danych użytkownika.
- Nie wykonuj `git push` bez wyraźnej zgody właściciela.
- Nie zmieniaj z tego repo modeli, Dexie, backupu ani logiki aplikacji.
- Czytelność instalatora ma pierwszeństwo przed eksperymentalnym pełnym dark mode.
- Przykład bezpiecznej konfiguracji znajduje się w `nsis/examples/nsis-branding-snippet.md`.

## Branding

**EN**

> TriRise  
> Finance • Fitness • Diet  
> A private local dashboard for building your better self.

**PL**

> TriRise  
> Finanse • Forma • Dieta  
> Prywatne lokalne centrum rozwoju.
