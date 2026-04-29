function y = solve_toeplitz_fft(filename, outname, printToConsole)
% SOLVE_TOEPLITZ_FFT
% Czyta plik, liczy y = T*x i zapisuje wynik
%
% Parametry (opcjonalne):
%   filename        - plik wejściowy (domyślnie 'input.txt')
%   outname         - plik wyjściowy (domyślnie 'solution_<filename>')
%   printToConsole  - true/false (czy wypisać wynik)

% --- Domyślne wartości ---
if nargin < 1 || isempty(filename)
    filename = 'input.txt';
end

if nargin < 2
    outname = '';
end

if nargin < 3
    printToConsole = false;
end

% --- Wczytanie pliku ---
fid = fopen(filename, 'r');
if fid == -1
    error('Nie można otworzyć pliku: %s', filename);
end

line1 = fgetl(fid);
line2 = fgetl(fid);
line3 = fgetl(fid);
fclose(fid);

if ischar(line1) == 0 || ischar(line2) == 0 || ischar(line3) == 0
    error('Plik musi zawierać co najmniej 3 linie');
end

% --- Parsowanie (bezpieczne) ---
c = sscanf(line1, '%f');
r = sscanf(line2, '%f');
x = sscanf(line3, '%f');

n = length(x);
if length(c) ~= n || length(r) ~= n
    error('Wektory c, r, x muszą mieć tę samą długość');
end

% --- Obliczenie ---
y = toeplitz_fft(c, r, x);

% --- Folder na wyniki ---
resultsFolder = 'results';

if ~exist(resultsFolder, 'dir')
    mkdir(resultsFolder);
end

% --- Domyślna nazwa wyjścia ---
if isempty(outname)
    [~, name, ext] = fileparts(filename);
    outname = fullfile(resultsFolder, ['solution_' name ext]);
end

% --- Zapis do pliku ---
fid = fopen(outname, 'w');
if fid == -1
    error('Nie można zapisać pliku: %s', outname);
end

fprintf(fid, '%g ', y(1:end-1));
fprintf(fid, '%g\n', y(end));

fclose(fid);

% --- Wypisanie na konsolę ---
if printToConsole
    fprintf('%g ', y(1:end-1));
    fprintf('%g\n', y(end));
end

end