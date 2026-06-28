# Installer Status

## Aktualny stan

- Produkt: TriRise
- Wersja: 0.3.0
- Platforma: Windows x64
- Technologia: Tauri 2 + NSIS
- Tryb instalacji: current user
- Język instalatora: English
- Identyfikator techniczny aplikacji: `pl.portfelpilot.app`
- Publiczna nazwa instalatora i skrótów: TriRise
- Branding assets: header/sidebar są podpięte w głównym repo aplikacji
- Sharp assets: `INSTALLER-REPO-04` przygotowane bezpośrednio w natywnych wymiarach NSIS

## Branding

- Ikona exe: TriRise
- Ikona instalatora: TriRise
- Ikona skrótu: pobierana z exe TriRise
- Logo i źródła ikon: dostępne w `branding/`
- Header NSIS: BMP 150×57 + PNG preview
- Sidebar NSIS: BMP 164×314 + PNG preview
- Finalne bitmapy są rysowane bezpośrednio w natywnych wymiarach NSIS
- Widoczne legacy branding PortfelPilot: niedozwolone

## Assety

Wymagane pliki są kontrolowane przez `scripts/verify-installer-assets.ps1`.

## Ograniczenia

Standardowy instalator NSIS nie otrzymał ryzykownego pełnego dark theme. Pełne ręczne kolorowanie kontrolek może powodować niewidoczne przyciski lub problemy zależne od wersji Windows. Przygotowany branding ogranicza się do bezpiecznych bitmap header/sidebar, ikony i krótkich tekstów.

## Dalsze opcje

- Przetestować instalację, upgrade i uninstall na Windows 10 i Windows 11.
