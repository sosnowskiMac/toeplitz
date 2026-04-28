function y = toeplitz_fft(c, r, x)
% TOEPLITZ_FFT  Mnożenie macierzy Toeplitza przez wektor z użyciem FFT
%
% Dane:
%   c - pierwsza kolumna macierzy Toeplitza (n x 1)
%   r - pierwszy wiersz macierzy Toeplitza (n x 1)
%   x - wektor (n x 1)
%
% Wynik:
%   y = T * x

n = length(x);

% Sprawdzenie zgodności
if length(c) ~= n || length(r) ~= n
    error('Wektory c, r, x muszą mieć tę samą długość');
end

if c(1) ~= r(1)
    error('Pierwszy element c i r musi być taki sam (Toeplitz)');
end

% Najmniejsza potęga 2 >= 2n
N = 2^nextpow2(2*n);

% --- Konstrukcja wektora a ---
a = zeros(N,1);
a(1) = c(1);
a(2:n) = r(2:n);
a(N-n+2:N) = c(2:n);

% --- Rozszerzenie x ---
x_ext = zeros(N,1);
x_ext(1:n) = x;

y_full = ifft( fft(a) .* fft(x_ext) );

% --- Wynik ---
y = y_full(1:n);

end
