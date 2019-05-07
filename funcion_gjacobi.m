

function [X, error] = funcion_gjacobi(A, b)
    z = 100;            %n° iteraciones.
    [m, n] = size(A);

    X0=zeros(1,n);      %vector inicial o punto inicial.
    for f=1:z
        for i=1:n
            suma=0;
            for j=1:n
                if i~=j
                    suma=suma+A(i,j)*X0(j);
                end
            end
            X(i)=(b(i)-suma)/A(i,i);
        % fprintf('%10.4f',X(i));
        end
    % fprintf('\n');
    error = norm(X0-X);
    X0=X;
    end
end