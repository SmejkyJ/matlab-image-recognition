
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
- vrací dvourozměrnou matici s pixely obrázku, který má 2 barvy (bílou a černou)

*Funkce nejprve redukuje všechny barvy na počet určený maxColors. Následně vezme dvě nejčastější. Předpokládá se, že pozadí je vždy světlejší. Tímto určíme barvu pozadí a tvaru. Následně všechny pixely, které mají barvu pozadí změníme na bílé a zbytek na černé. Tímto docílíme obrázku, který má pouze dvě barvy.
Bohužel se tímto většinou prokopíruje i kousek stínu.*
___
```matlab
deleteShadow(image, deleteConst)
```
- image - dvourozměrná matice s obrázkem
- deleteConst - konstanta s počtem pixelů, ktérý bude od tělese odstraněn kolem celého obvodu
- vrací dvourozměrnou matici s pixely obrázku, který má 2 barvy (bílou a černou)

*Jelikož se při redukování barev většinou prokopíruje kousek stínu, tak ho odstraníme pomocí zmenšení tělesa o deleteConst kolem celého obvodu.
U obrázků 64x64 se prokázala efektivní hodnota 2.*
___
```matlab
findCenter(image)
```
- image - dvourozměrná matice s obrázkem
- vrací strukturu s informací o středu
    - X - souřadnice středu x
    - Y - souřadnice středu y
    - r - poloměr kružnice (pokud to je kružnice)
___
```matlab
analyze(image, center, clearence, sections)
```
- image - dvourozměrná matice s obrázkem
- center - struktura s informací o středu
- clearence - konstanta s tolerancí *(pro 64x64 obrázky se osvědčila hodnota 2)*
- sections - konstanta s počtem kontrol *(čím víc, tím líp - pro 64x64 obrázky použita hodnota 120)*
- vrací char buď k pro kružnici, nebo c pro čtverec
___
