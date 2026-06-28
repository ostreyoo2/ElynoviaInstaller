# TriRise Installer Branding

## English

TriRise  
Finance • Fitness • Diet  
A private local dashboard for building your better self.

## Polski

TriRise  
Finanse • Forma • Dieta  
Prywatne lokalne centrum rozwoju.

## Kierunek wizualny

- praktycznie czarne lub bardzo ciemne tło;
- jasny tekst o wysokim kontraście;
- akcenty cyan, green i violet;
- logo TriRise bez legacy brandingu;
- czytelne przyciski we wszystkich stanach;
- bez pełnego custom dark NSIS przed testami Windows 10/11.

## Assety

| Plik | Rozmiar | Przeznaczenie |
| --- | ---: | --- |
| `tririse-installer-header.bmp` | 150×57 | finalne `headerImage` Tauri/NSIS |
| `tririse-installer-sidebar.bmp` | 164×314 | finalne `sidebarImage` Welcome/Finish |
| `tririse-installer-header.png` | 150×57 | podgląd finalnego headera |
| `tririse-installer-sidebar.png` | 164×314 | podgląd finalnego sidebara |
| `tririse-installer-banner.png` | 600×228 | większy preview headera |
| `tririse-installer-welcome.png` | 656×1256 | większy preview kompozycji pionowej |
| `tririse-installer-header-source.png` | źródło | wygenerowane tło szerokie |
| `tririse-installer-sidebar-source.png` | źródło | wygenerowane tło pionowe |

Finalne bitmapy są projektowane bezpośrednio w rozmiarach 150×57 i 164×314. Nie powstają przez zmniejszanie dużych kompozycji. Można je odtworzyć poleceniem:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\generate-installer-assets.ps1
```

Pliki `*-source.png` zachowano jako wcześniejsze koncepcje wizualne. Aktualny generator używa wyłącznie oryginalnego znaku TriRise i rysuje uproszczone tło, tekst oraz linie bezpośrednio w finalnej rozdzielczości. Tagline usunięto z małych bitmap dla lepszej ostrości.
