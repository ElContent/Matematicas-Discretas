function toBinaryEuclides(INT)
izq = INT;

it = 1;
while izq >= 1
    next = fix(izq/2);
    if izq == next * 2
        suma = 0;
    elseif izq == (next * 2 + 1)
        suma = 1;
    else
        fprintf("Error");
    end
    inv(it) = suma;
    it = it + 1;
    fprintf("\t%d = 2 * %d + %d \n", izq, next, suma);
    izq = next;
end

N = length(inv);
bin = zeros(1, N);
for i = 1:N
    bin(i) = inv(N - i + 1);
end
    fprintf("\n\t%d en binario es: ", INT);
    disp(bin);
end

