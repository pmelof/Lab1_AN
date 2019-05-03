%Función que capta si una matriz es dominante o no.

%Cada elemento de la diagonal debe ser mayor (en valor absoluto) que la
%suma de la fila (en valor absoluto).
function [res] = dominante(A)
res = false;
n = length(A(:,1));       %n° de filas.

for c = 1:n
    suma=0;
    fila = A(c,:);           %obtengo la fila.
    d = fila(:, c);          %d = diagonal de esa fila.
    fila(:,c)=[];            %quito d.
    suma = sum(fila, 2);     %sumo elementos de la fila sin d.
    if abs(d) <= abs(suma)
        res = false;
        break
    else
        res = true;
    end
end
end




