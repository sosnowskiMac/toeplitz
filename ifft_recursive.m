function x = ifft_recursive(X)
% IFFT_RECURSIVE  Rekurencyjna odwrotna Szybka Transformata Fouriera
%
% Dane:    X - wektor zespolony długości n, gdzie n jest potęgą liczby 2
% Wynik:   x - wektor x = IFFT(X) taki, że FFT(x) = X
%
% Użycie:
%   x = ifft_recursive(X);

n = length(X);

% Krok 1: sprzężenie zespolone każdego elementu X
X_conj = conj(X);

% Krok 2: obliczenie FFT sprzężonego wektora
Y = fft_recursive(X_conj);

% Kroki 3-4: sprzężenie i normalizacja przez n
x = conj(Y) / n;

end
