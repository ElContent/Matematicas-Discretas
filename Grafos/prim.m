function prim(mPesos)
    %% ALGORITMO DE PRIM
    %% Entrada de datos
    if exist('mPesos') == false
        % Pedimos que se inserte la matriz de pesos:
        mPesos = input("Introduce matriz de pesos (pon los infinitos como Inf): ");
    end
    
    %% Filtrado de datos de entrada:
    if size(mPesos, 1) ~= size(mPesos, 2) || size(mPesos, 1) == size(mPesos, 2) && size(mPesos, 1) == 1
        error("Matriz de Pesos no válida");
    end
    
    %% Preparando variables:
    N = length(mPesos);
end

