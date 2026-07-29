# TriRise Release Checklist

## Build

- [ ] `npm.cmd run test` przechodzi w głównym projekcie.
- [ ] `npm.cmd run lint` przechodzi.
- [ ] `npm.cmd run build` przechodzi.
- [ ] `npm.cmd run tauri build` tworzy instalator NSIS.
- [ ] `verify-installer-assets.ps1` potwierdza komplet brandingu.
- [ ] Header ma dokładnie 150×57 px, a sidebar 164×314 px.
- [ ] `copy-release-artifacts.ps1` kopiuje instalator do `artifacts/`.

## Instalacja

- [ ] Instalator pokazuje nazwę TriRise i czytelne kontrolki.
- [ ] Header i sidebar TriRise wyświetlają się bez rozciągnięcia lub przycięcia.
- [ ] Standardowe przyciski pozostają widoczne na jasnym i ciemnym motywie Windows.
- [ ] Instalacja dla bieżącego użytkownika kończy się poprawnie.
- [ ] Skrót na pulpicie i w menu Start nazywa się TriRise.
- [ ] Skrót oraz okno aplikacji mają ikonę TriRise.
- [ ] Nie pozostał aktywny skrót PortfelPilot.

## Smoke test

- [ ] Home i sidebar nie pokazują uszkodzonych obrazów.
- [ ] PL/EN przełącza się bez restartu.
- [ ] Finanse, Forma, Dieta i Ustawienia otwierają się.
- [ ] Eksport i import backupu JSON są dostępne; nie używaj prywatnych danych bez potrzeby.
- [ ] Zamknięcie i ponowne uruchomienie aplikacji działa.
- [ ] Uninstall i reinstall nie pozostawiają błędnego skrótu.

## Publikacja testerska

- [ ] Workflow w prywatnym repo źródłowym zakończył się utworzeniem draftu release.
- [ ] Draft zawiera instalator NSIS, odpowiadający plik `.sig` i `latest.json`.
- [ ] `latest.json` wskazuje publiczny URL repo `ostreyoo2/TriRiseInstaller`.
- [ ] Draft został sprawdzony ręcznie przed publiczną publikacją.
- [ ] Plik `.exe` nie jest śledzony przez Git.
- [ ] Nazwa pliku i rozmiar zostały zapisane w informacji wydania.
- [ ] Wiadomość dla testerów została zaktualizowana.
- [ ] Instalator został przesłany na Discord dopiero po ręcznym smoke teście.
