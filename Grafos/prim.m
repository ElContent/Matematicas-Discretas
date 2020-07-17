function prim(mPesos, vInicial)
    %% ALGORITMO DE PRIM
    
    %% TENGO QUE QUITAR ESTE FRAGMENTO
    mPesos = [
        Inf 5 7 Inf Inf;
        5 Inf Inf 1 7;
        7 Inf Inf 3 10;
        Inf 1 3 Inf 4;
        Inf 7 10 4 Inf
    ];
    
    
    %% Entrada de datos
    if exist('mPesos') == false
        % Pedimos que se inserte la matriz de pesos:
        mPesos = input("Introduce matriz de pesos (pon los infinitos como Inf): ");
    end
    if exist('vInicial') == false
        vInicial = 1;
    end
    
    %% Filtrado de datos de entrada:
    if size(mPesos, 1) ~= size(mPesos, 2) || size(mPesos, 1) == size(mPesos, 2) && size(mPesos, 1) == 1
        error("Matriz de Pesos no válida");
    end
    
    %% Preparando variables:
    recorrido = 0;              % Recorrido mínimo
    N = length(mPesos);
    V = (1:1:N);                % Vector de Vértices
    orden = vInicial;           % Orden en el que resolvemos Prim - Vector dinámico
                                % Importante: orden(end) siempre será el
                                %   vértice actual
    mPesos_copia = mPesos;
    
    %% Luces, cámaras y acción:
    for k = 1:length(mPesos)
        %% Quitamos las posiciones ya vistas del array de vértices:
        i = 1;
        flag = true;
        while flag == true
            if orden(end) == V(i)
                V(i) = [];
                mPesos_copia(i, :) = [];
                mPesos_copia(:, i) = [];
                flag = false;
            end
            if flag == true && i > length(V)
                error("Error quitando posiciones de V")
            end
            i = i + 1;
        end

        %% Extraemos L:
        L = mPesos(orden(end), :);
        % Quitamos los que ya han sido vistos
        for i = 1:length(orden)
            flagL = true;
            for j = 1:length(L) %%%%%%%%%%%%%%%%% Estoy aqui
                if orden(i) == j && flagL == true
                    L(j) = [];
                    flagL = false;
                end
            end
        end

        % Imprimimos L:
        for i = 1:length(L)
            fprintf("L(%d) = %d \n", V(i), L(i));
        end
        fprintf("\n");

        %% Trabajamos L para conseguir el mínimo:
        % Buscamos los infinitos:
        j = 1;
        for i = 1:length(L)
            if L(i) == Inf
                infi(j) = i;
                j = j + 1;
            end
        end

        % Damos la vuelta a infi:
        Nac = length(infi);
        for i = 1:Nac
            copia(i) = infi(Nac - i + 1);
        end
        infi = copia;

        % Quitamos los infinitos:
        Nac = length(infi);
        for i = 1:Nac
            L(infi(i)) = [];
        end

        % Buscamos el valor mínimo:
        min = L(1);
        i = 2;
        flagMin = false;
        while i <= length(L)
            if L(i) < min
                min = L(i);
            end
            i = i + 1;
            flagMin = true;
        end
        
        if flagMin == true
            orden(end + 1) = i - 1;
        else
            orden(end + 1) = V(i);
        end

        recorrido = recorrido + min;
    end
end

