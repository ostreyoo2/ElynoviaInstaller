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

## Branding

- Ikona exe: TriRise
- Ikona instalatora: TriRise
- Ikona skrótu: pobierana z exe TriRise
- Logo i źródła ikon: dostępne w `branding/`
- Widoczne legacy branding PortfelPilot: niedozwolone

## Assety

Wymagane pliki są kontrolowane przez `scripts/verify-installer-assets.ps1`.

## Ograniczenia

Standardowy instalator NSIS nie otrzymał ryzykownego pełnego dark theme. Pełne ręczne kolorowanie kontrolek może powodować niewidoczne przyciski lub problemy zależne od wersji Windows. Aktualny kierunek to stabilny instalator z marką TriRise, poprawną ikoną i czytelnym standardowym UI.

## Dalsze opcje

- Przygotować dedykowane bitmapy nagłówka i panelu bocznego zgodne z wymaganiami NSIS.
- Przetestować je na Windows 10 i Windows 11 przed włączeniem do konfiguracji aplikacji.
- Rozważyć pełny custom UI tylko jako osobny, ręcznie testowany etap.
