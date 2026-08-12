# Elynovia Release Checklist

## Build

- [ ] `npm.cmd run test`, `lint` i `build` przechodzą.
- [ ] `npm.cmd run tauri build` tworzy instalator NSIS.
- [ ] Build CI ma klucz podpisujący i tworzy odpowiadający plik `.sig`.
- [ ] Header ma 150×57 px, a sidebar 164×314 px.

## Instalacja

- [ ] Instalator, skróty i okno aplikacji pokazują nazwę oraz ikonę Elynovia.
- [ ] Instalacja dla bieżącego użytkownika kończy się poprawnie.
- [ ] Standardowe przyciski są widoczne na jasnym i ciemnym motywie Windows.
- [ ] Starsze skróty PortfelPilot i TriRise nie pozostają aktywne.

## Smoke test

- [ ] Elynovia Nexus oraz Finanse, Forma, Dieta i Ustawienia otwierają się.
- [ ] PL/EN przełącza się bez restartu.
- [ ] Zamknięcie i ponowne uruchomienie aplikacji działa.
- [ ] Lokalne dane pozostają zachowane po aktualizacji.

## Publikacja

- [ ] Workflow prywatnego repo `ostreyoo2/Elynovia` tworzy draft.
- [ ] Draft zawiera instalator NSIS, `.sig` i `latest.json`.
- [ ] `latest.json` wskazuje publiczny URL `ostreyoo2/ElynoviaInstaller`.
- [ ] Draft przechodzi ręczny smoke test przed publikacją.
- [ ] Plik `.exe` nie jest śledzony przez Git.
