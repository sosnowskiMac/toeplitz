function X = fft_recursive(x)
% FFT_RECURSIVE  Rekurencyjna Szybka Transformata Fouriera (Cooley-Tukey, radix-2)
%
% Dane:    x - wektor zespolony długości n, gdzie n jest potęgą liczby 2
% Wynik:   X - wektor X = FFT(x) długości n
%
% Użycie:
%   X = fft_recursive([1; 2; 3; 4]);

n = length(x);

% Przypadek bazowy: n = 1
if n == 1
    X = x;
    return;
end

% Podział na podwektory parzystych i nieparzystych indeksów (1-based)
x_parzyste    = x(1:2:n);   % elementy o indeksach 1, 3, 5, ..., n-1
x_nieparzyste = x(2:2:n);   % elementy o indeksach 2, 4, 6, ..., n

% Rekurencyjne wywołania
E = fft_recursive(x_parzyste);
O = fft_recursive(x_nieparzyste);

% Scalanie wyników (motylki)
X = zeros(n, 1);
for k = 1 : n/2
    omega_k = exp(-2 * pi * 1i * (k-1) / n);   % czynnik obrotu (twiddle factor)
    X(k)         = E(k) + omega_k * O(k);
    X(k + n/2)   = E(k) - omega_k * O(k);
end

end