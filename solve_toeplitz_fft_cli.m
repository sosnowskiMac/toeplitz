function solve_toeplitz_fft_cli(varargin)
% --help / -h
% --input / -i
% --output / -o
% --print / -p

% --- Domyślne wartości ---
filename = 'input.txt';
outname = '';
printToConsole = false;

% --- Parsowanie argumentów ---
i = 1;
while i <= numel(varargin)
    arg = varargin{i};

    switch lower(arg)

        case {'--input','-i'}
            if i+1 > numel(varargin)
                error('Brak wartości dla %s', arg);
            end
            if startsWith(varargin{i+1}, '-')
                error('Niepoprawna wartość dla %s', arg);
            end
            filename = varargin{i+1};
            i = i + 1;

        case {'--output','-o'}
            if i+1 > numel(varargin)
                error('Brak wartości dla %s', arg);
            end
            if startsWith(varargin{i+1}, '-')
                error('Niepoprawna wartość dla %s', arg);
            end
            outname = varargin{i+1};
            i = i + 1;

        case {'--print','-p'}
            printToConsole = true;

        case {'--help','-h'}
            fprintf(['Użycie:\n',...
                '  --input,  -i   plik wejściowy\n',...
                '  --output, -o   plik wyjściowy\n',...
                '  --print,  -p   wypisz wynik\n']);
            return;

        otherwise
            error('Nieznany argument: %s', arg);
    end

    i = i + 1;
end

% --- Wywołanie głównej funkcji ---
solve_toeplitz_fft(filename, outname, printToConsole);

end