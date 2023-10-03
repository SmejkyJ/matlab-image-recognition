
# Rozpoznání obrázku v Matlabu

Bonusová úloha č. 1 (2 body)

## Popis
*Program nejdříve spočítá všechny barvy v obrázku. Následně vezme ty nejčastější a podobné (méně časté) barvy do nich sloučí, tak abyhom měli pouze 10 barev.
Ty následně seřadíme od nejvíce časté po nejméně. Víme že nejčastější a druhá nejčastější barva jsou barvy tělesa a pozadí. Dále také počítáme s tím, že pozadí je vždy světlejší než tvar.
Poté se všechny barvy dají na černou až na barvu tělesa, která se dá na bílou. Bohužel zde bude bílý i kus stínu, protože v nějaké části má stejnou, nebo alespoň dostatečně podobnou barvu jako tvar. Tento problém řeším funkcí která všechny bílé pixely, které sousedí s černým pixelem přeměním na černé. Toto provedu 2x-3x po sobě. Takto se efektivně zbavím nepřesnostem jako je například stín. Teď akorát přeměním všechny bílé pixely které nesousedí s černým pixelem na černé a tím docílím dokonalého obvodu tvaru. Budu předpokládat že daný tvar je kruh. Tedy najdu bíle pixely nejvíc vlevo vpravo nahoře a dole, ze kterých si vypočítám souřadnice středu a poloměr kruhu. Nyní si přes sinus a cosinus vypočítám ideální kružnici, které dám tloušťku a tak z ní udělám prstenec (k tomu slouží proměnná analyzeClearence). Pokud se v tomto prstenci (v obrázku je znázorněn šede) nachází 95% pixelů tvaru, znamená to, že je tvar kruh.*

*Tento způsob je velmi efektivní, zejména u větších těles. U menších by bylo vhodné zavést výpočet pro tloušťku kontrolního prstence, která je prozatím konstantí.*

*Dosažená úspěšnost: 100%*

![Příklad](https://raw.githubusercontent.com/SmejkyJ/matlab-image-recognition/main/example_1.png)

___
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
isEdge(image, Y, X)
```
- image - dvourozměrná matice s obrázkem
- Y - souřadnice Y
- X - souřadnice X
- vrací **true**, pokud pixel na souřadnicích X a Y sousedí s černým pixelem.

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
- clearence - konstanta s tolerancí *(pro 64x64 obrázky se osvědčila hodnota 2 až 3)*
- sections - konstanta s počtem kontrol *(čím víc, tím líp - pro 64x64 obrázky použita hodnota 120)*
- vrací char buď **k** pro kružnici, nebo **c** pro čtverec
___
