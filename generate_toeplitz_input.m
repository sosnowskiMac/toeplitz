function filename = generate_toeplitz_input(n, minVal, maxVal)
% GENERATE_TOEPLITZ_INPUT
% Generuje plik wejściowy dla problemu Toeplitza:
% 1. linia: pierwsza kolumna c
% 2. linia: pierwszy wiersz r
% 3. linia: wektor x

% --- folder na pliki wejściowe ---
folder = 'inputs';

if ~exist(folder, 'dir')
    mkdir(folder);
end

% --- losowanie danych ---
c = randi([minVal, maxVal], 1, n);
r = randi([minVal, maxVal], 1, n);
x = randi([minVal, maxVal], 1, n);

% Macierz Toeplitza wymaga c(1) == r(1)
r(1) = c(1);

% --- nazwa pliku ---
filename = fullfile(folder, sprintf( ...
    'toeplitz_n-%d_range%d-%d.txt', n, minVal, maxVal));

% --- zapis do pliku ---
fid = fopen(filename, 'w');

if fid == -1
    error('Nie można utworzyć pliku: %s', filename);
end

fprintf(fid, '%d ', c(1:end-1));
fprintf(fid, '%d\n', c(end));

fprintf(fid, '%d ', r(1:end-1));
fprintf(fid, '%d\n', r(end));

fprintf(fid, '%d ', x(1:end-1));
fprintf(fid, '%d\n', x(end));

fclose(fid);

fprintf('Utworzono plik: %s\n', filename);

end