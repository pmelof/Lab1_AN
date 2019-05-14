%Función que descompone la matriz A (matriz cuadrada) en dos matrices: U (mtriz triangular superior) y 
%L (matriz triangular inferior), donde A = L*U.
%Con doolittle.
%O(2*n^3/3).

function [sol, error, opCounter, time]=funcion_LU(A,b)
tic;
n = length(A(:,1));          %n° de filas.
L=A*0;                       %matrices L y U inicializadas en 0.
U=A*0;
sol = [];
opCounter = 0;

for k=1:n
    U(k,k:n) = A(k,k:n)-L(k,1:k-1)*U(1:k-1,k:n);
    L(k,k) = 1;                                     %Diagonal de L serán 1, para buscar el resto de valores de U y L.
    L(k+1:n,k) = (A(k+1:n,k)-L(k+1:n,1:k-1)*U(1:k-1,k))/U(k,k);
    opCounter = opCounter + 8;

end
z = inv(L)*b;
sol = inv(U)*z;
error = norm(eye(n)-inv(L*U)*A);
time = toc;
end