% Metodo de Householder.
% Si no tiene tantos ceros, es más util que givens, sino hace operaciones
% extras.
% La matriz debe ser cuadrada.
% O(2*n^2*(m-n/3)).

function[sol, error, opCounter, time] = funcion_householder(A, b)
    tic;
    [m, n] = size(A);

    R= A;
    Q = eye(m,m);
    n1=min(m,n);
    opCounter = 0;

    for i= 1:n1
        x = R(i:m, i);
        s=0;

        if x(1)==0
            s = 1;
        else
            s= sign(x(1));
        end

        e = zeros(m - i + 1, 1);   
        e(1)=1;   
        u = s * norm(x) * e + x;
        u = u / norm(u);
        R(i:m, i:n) =  R(i:m, i:n) - 2*(u*u')*R(i:m, i:n);
        Q(:,i:m) = Q(:,i:m) - Q(:,i:m)*(2*u*u'); 
        opCounter = opCounter + 16;
    end
    
    z = inv(Q)*b;
    sol = inv(R)*z; 
    error = norm(eye(m)-inv(Q*R)*A);
    time = toc;
end