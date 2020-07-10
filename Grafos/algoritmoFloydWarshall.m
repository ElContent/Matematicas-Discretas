function algoritmoFloydWarshall()

% Introducimos matriz de pesos:
mPesos = input("Introduce matriz de pesos (pon los infinitos como Inf): ");
N = size(mPesos, 1);
mRecorridos = zeros(N);

% % Montando la tabla de recorridos:
for i = 1:N
    for j = 1:N
        if mPesos(i, j) ~= Inf
            mRecorridos(i, j) = i;
        end
    end
end

% Paso 1:
paso = 1;
fprintf("\n## Paso %d ## \n", paso);

fprintf("Matriz de pesos: \n");
disp(mPesos);

fprintf("Matriz de recorridos: \n");
disp(mRecorridos);

% Operando:
for i = 1:N
    fprintf("\n## Paso %d ## \n", i + 1);
    mPesos_anterior = mPesos;
    mPesos = min(mPesos, mPesos(:, i) + mPesos(i, :));
    
    for r = 1:N
        for s = 1:N
            if mPesos(r, s) ~= mPesos_anterior(r, s)
                mRecorridos(r, s) = mRecorridos(i, s);
            end
        end
    end
    
    fprintf("Matriz de pesos (modificada) \n");
    disp(mPesos);
    
    fprintf("Matriz de recorridos \n");
    disp(mRecorridos);
end




end

