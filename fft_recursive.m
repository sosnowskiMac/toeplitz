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

% Podział na podwektory parzystych i nieparzystych indeksów
x_parzyste = x(2:2:n);   % elementy o indeksach 2, 4, 6, ..., n
x_nieparzyste    = x(1:2:n);   % elementy o indeksach 1, 3, 5, ..., n-1

% Rekurencyjne wywołania
E = fft_recursive(x_parzyste);
O = fft_recursive(x_nieparzyste);

% Scalanie wyników (motylki)
k = (0:n/2-1).';                       
omega = exp(-2*pi*1i*k/n);             

t = omega .* O;                        

X = [E + t;
     E - t];

end
