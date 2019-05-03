%Función que capta si una matriz es simétrica o no.

%Sin contar la diagonal, se debe cumplir que A(i,j) == A(j, i).
function [res] = simetrica(A)
res = true;
n = length(A(:,1));       %n° de filas.

for f = 1:n
    for c = 1:n
        if f ~= c
            if A(f, c) ~= A(c, f)
                res = false;
                break
            end
        end
    end
end
end

