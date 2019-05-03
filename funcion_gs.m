%Funci�n que descompone la matriz A en dos matrices: Q y R, 
%donde A = Q*R.
%Aunque parece que en este caso A=R*Q.

function [Q,R] = funcion_gs(A)

[m, n] = size(A);
Q = A;
R = zeros(n);

for k=1:n
    for i=1:k-1
        R(i, k) = Q(:, i)' * A(:, k);
        Q(:, k) = Q(:, k) - Q(:, i) * R(i, k);
    end
    R(k, k) = norm(Q(:, k));
    Q(:, k) = Q(:, k)/R(k, k);
end
end