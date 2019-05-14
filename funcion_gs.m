%Función que descompone la matriz A en dos matrices: Q y R, 
%donde A = Q*R.
%Matriz cuadrada.

function [sol, error, opCounter, time] = funcion_gs(A, b)
tic;
[m, n] = size(A);       %m = filas, n = columnas.
Q = A;
R = zeros(n);           %nueva matriz R, mismo tamaño que A, llena de ceros.
sol = [];
error=0;
opCounter = 0;

for k=1:n
    for i=1:k-1
        R(i, k) = Q(:, i)' * A(:, k);
        Q(:, k) = Q(:, k) - Q(:, i) * R(i, k);
        opCounter = opCounter + 6;
    end
    R(k, k) = norm(Q(:, k));
    Q(:, k) = Q(:, k)/R(k, k);
    opCounter = opCounter + 4;
end
sol = inv(R)*Q'*b;
error = norm(eye(m)-inv(Q*R)*A);
time = toc;
end