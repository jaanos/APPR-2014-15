# Analiza podatkov s programom R, 2014/15

Avtor: Tina Hawlina

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

Za temo projekta pri predmetu APPR sem si izbrala plavanje, oziroma natančneje rekorde, ki so bili osvojeni tako na dolgi(olimpijski bazen-50m) in kratki progi(25m). Ker se tekmuje v različnih dolžinah in različnih slogih, bom analizirala naslednje:

Slogi(na 50m,100m in 200m):
- prosto
- hrbtno
- prsno
- delfin

Podatke bom primerjala po naslednjih spremenljivkah:
- urejenostne: proga, spol, slogi, dolžina
- številska: čas
- imenske: državljanstvo postavljalca rekorda, na katerem prvenstvu/olimpijskih igrah je bil rekord postavljen, datum postavitve rekorda

Cilji naloge:
- med seboj primerjati rekorde v različnih slogih; tako vidimo kateri izmed slogov je najlažji/najtežji
- primerjati postavljalce rekorda po državljanstvu, oz. katera država ima največ rekorderjev
- če so se rekordi tekom časa drastično spremenili(na bolje)
- če tekmuje več moških ali žensk
- kje, v kateri državi je bilo postavljenih največ rekordov

Navajam še dostop do podatkov(iz spletne strani Wikipedia),
http://en.wikipedia.org/wiki/List_of_world_records_in_swimming


## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
