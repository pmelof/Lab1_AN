%Función que capta si una matriz es positiva o no.

%En cada sub matriz el determinante debe ser mayor que 0.
function [res] = positiva(A)
res = false;
n = length(A(:,1));       %n° de filas.

for c = 1:n
    determinante=0;
    subMatriz = A(1:c,1:c);              %obtengo matriz de tamaño fila x fila.
    determinante = det(subMatriz);       %determinante de subMatriz.

    if determinante <= 0
        res = false;
        break
    else
        res = true;
    end
end
end

