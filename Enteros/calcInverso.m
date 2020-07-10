function [inv] = calcInverso(Num, Base, desarrollo)
    if exist('desarrollo') == 0
        desarrollo = false;
    end
    if Num >= Base || Num < 0 || Base <= 0
        error("Datos incorrectos")
    end
    
    flag = true;
    i = 1;
    if Num == 0
        inv = NaN;
        flag = false;
        error("No existe inverso")
    end
    if desarrollo == true
        fprintf("\n\tCondición: \n");
        fprintf("\t(N * N^-1) %% Base == 1 \n");
        
        fprintf("\n\tOperaciones: \n"),
    end
    while flag == true
        inv = i - 1;
        if mod(Num * inv, Base) == 1 || i == Base
            flag = false;
        end
        if desarrollo == true
            fprintf("\t%d * %d %% %d = %d \n",...
                Num, inv, Base, mod(Num * inv, Base));
        end
        i = i + 1;
    end
end

