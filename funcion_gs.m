%Función que descompone la matriz A en dos matrices: Q y R, 
%donde A = Q*R.
%Aunque parece que en este caso A=R*Q.

function [sol, error] = funcion_gs(A, b)

[m, n] = size(A);       %m = filas, n = columnas.
Q = A;
R = zeros(n);           %nueva matriz R, mismo tamaño que A, llena de ceros.
sol = [];
error=0;

for k=1:n
    for i=1:k-1
        R(i, k) = Q(:, i)' * A(:, k);
        Q(:, k) = Q(:, k) - Q(:, i) * R(i, k);
    end
    R(k, k) = norm(Q(:, k));
    Q(:, k) = Q(:, k)/R(k, k);
end
sol = inv(R)*Q'*b;
error = norm(eye(m)-inv(Q*R)*A);
end