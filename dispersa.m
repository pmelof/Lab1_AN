%Función que capta si una matriz es dispersa o no.

%En total tiene más 0 de que otro número.
function [res] = dispersa(A)
res = false;
n = length(A(:,1));       %n° de filas.
cantCeros = 0;
numeros = 0;

for f = 1:n
    for c = 1:n
        if A(f, c) == 0
            cantCeros = cantCeros+1;
        else
            numeros = numeros+1;
        end
    end
end

if cantCeros <= numeros
    res = false;
else
    res = true;
end
end



