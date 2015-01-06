# Poročilo

1. DEL

##Izbira tematike

Pri predmetu APPR sem si za temo svojega projekta izbrala plavanje. Izbira teme ni bila preprosta, saj je na internetu na voljo neskončno podatkov, ki bi jih lahko obdelalali. Najprej sem želela izbrati temo globalnega segrevanja ozračja (le za Ameriko), vendar sem ugotovila, da bi bilo verjetno pretežko analizirati toliko podatkov za vsako zvezno državo posebej (temperatura, padavine, snežne padavine, vlažnost, ekstremne vremenske razmere itd.) in jih dobiti v želenih oblikah (.csv, .xsl, .html). Poleg tega so podatki podani po vremenskih postajah, tako da bi bilo potrebno ugotoviti še kje se posamezna postaja nahaja.

Razmišjala sem še o ogromno ostalih temah, npr. delnice, zdravstvo, katerakoli tema is STAT-SI (ker bi bila analiza enostavnješa), naravne nesreče, bonitetne ocene... Med premišljevanjem sem ugotovila, da je zame najpomembnejši vidik enostavnost, saj se s programom R srečujem prvič.

Torej sem končno dobila idejo za temo plavanje. Za to temo sem se odločila predvsem zaradi osebnih preferenc, saj v prostem času kdaj pa kdaj skočim na Fakulteto za šport in odplavam nekaj dolžin, sem pa nekaj časa tudi redno plavala. Predvsem pomembno pa je bilo, da so podatki na voljo v všečnih oblikah in ne preveč zahtevni za prikaz in statistično analizo.

##Analiziranje podatkov

Podatke o doseženih rekordih v plavanju sem pridobila s spletne strani Wikipedia, navajam link:

http://en.wikipedia.org/wiki/List_of_world_records_in_swimming

Ker se pri plavanju tekmuje v različnih slogih, dolžinah, plavamo pa lahko tudi v dveh različnih bazenih-dolžine 50 in 25m, pri čemer daljšemu pravimo olimpijski bazen, kot ste verjetno že vsi slišali. Jaz sem se odločila za analizo rekordov doseženih na olimpijskem bazenu pri plavanju na 100 m  v osnovnih štirih tehnikah:
- prosto
- prsno
- hrbtno
- delfin

Tako sem si zagotovila, da bo podatkov čimveč, kar je za statistiko pomembno, saj potrebujemo čimvečji vzorec in spet ne preveč, da analiza ne bo pretežavna in da bo računalnik zmogel podatke hitro sprocesirati. Na voljo imam tudi dovolj spremenljivk, vseh treh tipov:

- urejenostne: spol, slogi
- številska: čas
- imenske: državljanstvo postavljalca rekorda, na katerem prvenstvu/olimpijskih igrah je bil rekord postavljen, datum postavitve rekorda

## Cilji naloge

Glavni cilj je narediti dobro statistično analizo in primerjati podatke tako, da lahko iz njih preberemo karkoli nas zanima in to na uporabniku prijazen način, z grafi, diagrami in podobno, tako da mu ni treba iskati željenega podatka v tabelah. Ostale primerjave po spremenljivkah, ki bi jih rada naredila:
- med seboj primerjati rekorde v različnih slogih; tako vidimo kateri izmed slogov je najlažji/najtežji
- ugotoviti, ali so rekordi večinoma postavljeni v olimpijskem bazenu ali bazenu dolžine 25m (pri bazenu 25m na koncu naredimo obrat, pri vsaki tehniki drugačen, pri čemer pridobimo hitrost-odriv od stene)
- primerjati postavljalce rekorda po državljanstvu, oz. katera država ima največ rekorderjev
- če so se rekordi tekom časa drastično spremenili(na bolje)
- če tekmuje več moških ali žensk
- kje, v kateri državi je bilo postavljenih največ rekordov
