%Función que capta si una matriz es negativa o no.

%En cada sub matriz el determinante debe irse alternando entre un 
%valor negativo y positivo, inicia con negativo.
function [res] = negativa(A)
res = true;
n = length(A(:,1));       %n° de filas.

for c = 1:n
    subMatriz = A(1:c,1:c);             %obtengo matriz de tamaño fila x fila.

    if mod(c,2)==0      %si es par, entonces det debe ser positivo.
        if det(subMatriz) <= 0
            res = false;
            break
        end
    else
        if det(subMatriz) >= 0    
            res = false;
            break
        end
    end
end
end

