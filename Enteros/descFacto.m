function descFacto(N)
i = 1;
Numero(i) = N;
Factores = factor(N);
Max = length(Factores);
while i <= Max
    Numero(i + 1) = Numero(i) / Factores(i);
    i = i + 1;
end
Factores(i) = 0;
Numero = Numero.';
Factores = Factores.';
T = table(Numero, Factores);
disp(T);
end

