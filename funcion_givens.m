function [sol, error] = funcion_givens(A, b)
    n = length(A(:,1));
    Q = eye(n);
    R = A;

    for j = 1:(n-1)
        for i = n:(-1):(j+1)
            G = eye(n);
            [c,s] = GivensRotation( A(i-1,j),A(i,j) );
            G(i-1,(i-1):i) = [c s];
            G(i,(i-1):i)   = [-s c];
            Q = Q*G';
            R = G*R;
        end
    end
    Y = inv(Q)*b;
    sol = inv(R)*Y;
    error = norm(eye(n)-inv(Q*R)*A);
end