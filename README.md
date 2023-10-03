
# Rozpoznání obrázku v Matlabu

Bonusová úloha č. 1 (2 body)


## Funkce
```matlab
readImage(filePath)
```
- filePath - cesta k černo-bílému obrázku
- vrací dvourozměrnou matici s pixely obrázku
___
```matlab
calculateColors(image)
```
- image - dvourozměrná matice s obrázkem
- vrací jednorozměrnou matici struktur
    - color - hodnota barvy
    - amount - počet výskytů v matici
___

```matlab
reduceColors(image, colors, maxColors)
```
- image - dvourozměrná matice s obrázkem
- color - matice s hodnoty a počtem výskytů všech barev
- maxColor - počet barev na který chceme barvy redukovat
- vrací dvourozměrnou matici s pixely obrázku, které mají 2 barvy.

Funkce nejprve redukuje všechny barvy na počet určený maxColors. Následně vezme dvě nejčastější. Předpokládá se, že pozadí je vždy světlejší. Tímto určíme barvu pozadí a tvaru. Následně všechny pixely, které mají barvu pozadí změníme na bílé a zbytek na černé. Tímto docílíme obrázku, který má pouze dvě barvy.
Bohužel se tímto většinou prokopíruje i kousek stínu.
___
```matlab
deleteShadow(image, deleteConst)
```
- image - dvourozměrná matice s obrázkem
- deleteConst - počet pixelů, ktérý bude od tělese odstraněn kolem celého obvodu

Jelikož se při redukování barev většinou prokopíruje kousek stínu, tak ho odstraníme pomocí zmenšení tělese kolem celého obvodu.
U obrázků 64x64 se prokázala efektivní hodnota 3.
