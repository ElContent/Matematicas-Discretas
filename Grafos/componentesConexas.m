function componentesConexas()

% Inicio:
fprintf("C�lculo de componentes conexas: \n\n");
fprintf("En este programa debes introducir una matriz, ya sea la de \n");
fprintf("acceso o la de accesibilidad. Y se mostrar� la traspuesta a la \n");
fprintf("introducida y la de las componentes conexas. \n");
fprintf("OJO: Eres t� qui�n debe saber qu� matriz es cada una. \n\n");

% Introducci�n de datos:
MO = input("Introduce matriz: ");

% C�lculo de la traspuesta:
MT = MO';

% C�lculo de las componentes conexas:
N = size(MO, 1);
MCO = zeros(N);
for i = 1:N
    for j = 1:N
        MCO(i, j) = MO(i, j) * MT(i, j);
    end
end

% Comprobando las que son iguales:
MU = unique(MCO, "rows");
nMU = size(MU, 1);
MU_MCO = zeros(size(MU));
for i = 1:N
    filaActual = MCO(i, :);
    for j = 1:nMU
        filaMU = MU(j, :);
        if filaActual == filaMU
            MU_MCO(j, i) = i;
        end
    end
end
solu = string(zeros(nMU, 1));
for i = 1:nMU
    solu(i) = "Grupo " + i + ": ";
    for j = 1:N
        if MU_MCO(i, j) ~= 0
            solu(i) = solu(i) + "V" + j + " ";
        end
    end
end

% Mostramos:
fprintf("Matriz original: \n");
disp(MO);

fprintf("Matriz traspuesta: \n");
disp(MT);

fprintf("Matriz de componentes conexas: \n");
disp(MCO);
disp(solu);

nSolu = size(solu, 1);

if N == nSolu
    fprintf("El grafo es conexo. \n");
    if mod(N, 2) == 0
        fprintf("Adem�s, el grafo es Euleriano y se puede usar el Algoritmo de Fleury. \n");
    end
end


end
