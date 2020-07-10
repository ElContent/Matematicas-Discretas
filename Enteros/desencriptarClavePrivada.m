function [M] = desencriptarClavePrivada(M, r, s, z, desarrollo)
    if exist('desarrollo') == 0
        desarrollo = false;
    end
    alf = "";
    M = char(M);
    N = length(M);
    switch z
        case 27
            alf = [
                'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N'...
                'Ñ' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'
                ];
            alfMax = 27;
            
        case 28
            alf = [
                'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N'...
                'Ñ' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' ' '
                ];
            alfMax = 28;
            
        case 54
            alf = [
                'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N'...
                'Ñ' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'...
                'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'ñ'...
                'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'
                ];
            alfMax = 54;
            
        case 55
            alf = [
                'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N'...
                'Ñ' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'...
                'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'ñ'...
                'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' ' '
                ];
            alfMax = 55;
            
        case 65
            alf = [
                'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N'...
                'Ñ' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'...
                'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'ñ'...
                'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' ' '...
                '0' '1' '2' '3' '4' '5' '6' '7' '8' '9'
                ];
            alfMax = 65;
            
        otherwise
            error("Valor de Z no válido.")   
    end
    if gcd(r, z) ~= 1
        error("Valor de R no válido.")
    end
    
    if desarrollo == true
        fprintf("\tDESENCRIPTAR: \n");
        fprintf("\tOperación -> D([M]) = [R]^-1 * ([M] - [S]) \n");
        fprintf("\tM = "); disp(M);
        fprintf("\tR = %d \n", r);
        fprintf("\tS = %d \n", s);
        fprintf("\tZn = %d \n", z);
        
        fprintf("\n\n\tOperaciones: \n");
    end
    
    aux = zeros(1, N);
    invR = calcInverso(r, z);
    if desarrollo == true
        pos = zeros(1, N);
    end
    
    for i = 1:N
        for j = 1:alfMax
            if alf(j) == M(i)
                paso = j - s - 1;
                aux(i) = mod(paso * invR, z);
                if desarrollo == true
                    pos(i) = j - 1;
                    fprintf("\n\tC([%d]) = [%d]^-1 * ([%d] - [%d]) = %d \n", ...
                        pos(i), r, pos(i), s, aux(i));
                end
            end
        end
    end
    
    for i = 1:N
        M(i) = alf(aux(i) + 1);
    end
    
    if desarrollo == true
        fprintf("\n\n\tM en números = "); disp(pos);
        fprintf("\tM descodificado = "); disp(aux);
        fprintf("\tResultado = "); disp(M);
    end
    
end

