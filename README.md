# ElynoviaInstaller

Publiczne repozytorium podpisanych wydań Windows i automatycznych aktualizacji aplikacji Elynovia.

## Zakres

GitHub Releases udostępniają podpisany instalator NSIS dla Windows x64, podpis `.sig` oraz manifest aktualizatora `latest.json`. Kod aplikacji pozostaje w prywatnym repozytorium [`ostreyoo2/Elynovia`](https://github.com/ostreyoo2/Elynovia). Instalatory nie są śledzone na gałęzi `main`.

## Kanał zgodności

Poprzednia nazwa `TriRiseInstaller` pozostaje zarezerwowana jako przekierowanie GitHub dla starszych instalacji. Nie należy tworzyć nowego repozytorium pod tą nazwą.

## Lokalne narzędzia

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-installer.ps1 -AppProjectPath D:\Projekty\Aplikacja
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\verify-installer-assets.ps1
```

Katalog `artifacts/` jest ignorowany. Kluczy podpisujących, tokenów, backupów ani danych użytkownika nie wolno dodawać do repozytorium.
