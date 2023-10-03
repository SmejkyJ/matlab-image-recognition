
# Rozpoznání obrázku v Matlabu

Bonusová úloha č. 1 (2 body)


## Funkce
```
readImage(filePath)
```
- filePath - cesta k černo-bílému obrázku
- vrací dvourozměrnou matici s pixely obrázku

```
calculateColors(image)
```
- image - dvourozměrná matice s obrázkem
- vrací jednorozměrnou matici struktur
    - color - hodnota barvy
    - amount - počet výskytů v matici

        Příklad:
        ```
        colors = calculateColors(image);
        ...
        colors(i).color     % Hodnota barvy
        colors(i).amount    % Počet výskytů
        ```
```
reduceColors(image, colors, maxColors)
```
- image - dvourozměrná matice s obrázkem
- color - matice s hodnoty a počtem výskytů všech barev
- maxColor - počet barev na který chceme barvy redukovat
- vrací dvourozměrnou matici s pixely obrázku, které mají max. maxColor barev

```
deleteShadow(image, colors, maxColors)
```
