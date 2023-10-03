clear all;
close all;
clc;

fileID = fopen('FileList.txt','r');                         % otevreni seznamu, ktery si musite vytvorit
textdata = textscan(fileID,'%s');                           % nacteni
fclose(fileID);                                             % zavreni seznamu
fileNames = string(textdata{:});                            % pole s nazvy souboru vcetne kompletnich cest
numFiles = size(fileNames, 1);                             % pocet souboru
numCorrect = 0;                                             % pocitadlo pro spravne rozpoznane objekty
for i = 1:numFiles
    objectType = extract(fileNames(i), strlength(fileNames(i))-6);    % z nazvu souboru vyrizneme 7. znak od konce -  'c' nebo 'k' a ulozime do pole objectType
    disp(fileNames(i));
    
    % ------- Algoritmus na rozhodování tvaru -------  %
    
    % -- Konstanty -- %
    maxColors = 8;
    shadowDelete = 2;
    analyceClearence = 2;
    sections = 120;

    % -- Samotný program -- %
    pixelArray = readImage(fileNames(i));
    allColors = calculateColors(pixelArray);
    pixelArray = reduceColors(pixelArray, allColors, maxColors);
    pixelArray = deleteShadow(pixelArray, shadowDelete);
    center = findCenter(pixelArray);
    result = analyze(pixelArray, center, analyceClearence, sections);
    disp(result);
    if result == objectType
        numCorrect = numCorrect + 1;
        disp('Correct');
    else
        disp('Wrong');
    end
    disp('--------------------------------------------------------------------------------')
end
score = numCorrect/numFiles * 100              % zde spocitate a vypisete celkove skore v procentech



