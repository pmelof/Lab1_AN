% La matriz debe ser cuadrada.
% O().

function [sol, error, opCounter, time] = funcion_givens(A, b)
    tic;
    n = length(A(:,1));
    Q = eye(n);
    R = A;
    opCounter = 0;

    for j = 1:(n-1)
        for i = n:(-1):(j+1)
            G = eye(n);
            [c,s, suma] = GivensRotation( A(i-1,j),A(i,j) );
            G(i-1,(i-1):i) = [c s];
            G(i,(i-1):i)   = [-s c];
            Q = Q*G';
            R = G*R;
            opCounter = opCounter + 6 + suma;
        end
    end
    Y = inv(Q)*b;
    sol = inv(R)*Y;
    error = norm(eye(n)-inv(Q*R)*A);
    time = toc;
end