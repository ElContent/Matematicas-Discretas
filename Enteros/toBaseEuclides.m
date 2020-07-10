function ret = toBaseEuclides(INT, BASE)
izq = INT;
base = BASE;

it = 1;
while izq >= 1
    next = fix(izq/base);
    if izq == next * base
        suma = 0;
    else
        suma = izq - next * base;
    end
    inv(it) = suma;
    it = it + 1;
    fprintf("\t%d = %d * %d + %d \n", izq, base, next, suma);
    izq = next;
end

N = length(inv);
vec = zeros(1, N);
for i = 1:N
    vec(i) = inv(N - i + 1);
end
    fprintf("\n\t%d en base %d es: ", INT, BASE);
    disp(vec);
    
    N = length(vec);
    ret = 0;
    

end

