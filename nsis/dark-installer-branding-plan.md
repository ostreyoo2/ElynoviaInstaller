# Dark Installer Branding Plan

## Cel

Nadać instalatorowi klimat TriRise bez zastępowania standardowych kontrolek NSIS i bez ryzyka niewidocznych przycisków.

## Bezpiecznie brandowane elementy

- ikona instalatora, deinstalatora, exe i skrótu;
- header NSIS 150×57 px;
- sidebar stron Welcome/Finish 164×314 px;
- krótka angielska komunikacja produktu;
- nazwa TriRise bez widocznego legacy brandingu.

## Przygotowane assety

- `tririse-installer-header.bmp` — finalny header Tauri/NSIS;
- `tririse-installer-sidebar.bmp` — finalny sidebar Tauri/NSIS;
- warianty PNG — kontrola wizualna i dokumentacja;
- `tririse-installer-banner.png` — większy preview headera;
- `tririse-installer-welcome.png` — większy preview kompozycji pionowej;
- pliki `*-source.png` — źródła wysokiej rozdzielczości.

## Czego nie robimy

- nie kolorujemy ręcznie systemowych przycisków i pól;
- nie zastępujemy całego szablonu `.nsi`;
- nie wymuszamy kolorów zależnych od motywu Windows;
- nie ukrywamy standardowych stron lub kontrolek;
- nie podpinamy assetów do aplikacji bez osobnego testu integracyjnego.

## Ryzyka NSIS

Pełny custom skin wymaga ingerencji w kontrolki Win32. Kolory tekstu, tła i przycisków mogą różnić się między Windows 10, Windows 11 i ustawieniami wysokiego kontrastu. Header oraz sidebar są bezpieczniejsze, ponieważ są statycznymi bitmapami w miejscach przewidzianych przez Modern UI.

## Rekomendowany następny krok

Skopiować wyłącznie finalne pliki BMP do `src-tauri/installer-assets/`, podpiąć `headerImage` i `sidebarImage`, zbudować NSIS i ręcznie sprawdzić instalację, aktualizację oraz deinstalację na Windows 10/11. Pełny dark skin pozostaje poza zakresem.
