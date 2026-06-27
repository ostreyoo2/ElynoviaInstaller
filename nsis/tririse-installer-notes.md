# TriRise Installer Notes

## Bezpieczny wariant bieżący

Aktualny installer pozostaje standardowym NSIS generowanym przez Tauri. Branding zapewniają:

- nazwa produktu TriRise;
- ikona TriRise dla instalatora, exe i skrótu;
- angielski interfejs instalatora, który unika brakujących komunikatów językowych;
- hook usuwający legacy skróty PortfelPilot i tworzący skróty TriRise.

## Dark modern installer

Pełne kolorowanie standardowych kontrolek NSIS jest ryzykowne: przyciski mogą stać się niewidoczne zależnie od systemowego motywu i wersji Windows. Dlatego nie włączamy niesprawdzonego dark-mode hacka.

Bezpieczna ścieżka rozwoju:

1. Przygotować bitmapy nagłówka i panelu bocznego w wymaganych wymiarach NSIS.
2. Zachować standardowe kontrolki i kontrast systemowy.
3. Testować instalację, upgrade i uninstall na Windows 10 oraz 11.
4. Dopiero po testach podpiąć assety w głównym `tauri.conf.json`.

Priorytet: czytelny instalator przed efektownym instalatorem.
