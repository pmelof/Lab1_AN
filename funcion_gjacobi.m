% Converge siempre que la matriz sea dominante.

function [X, error, opCounter, time] = funcion_gjacobi(A, b, iter)
    tic;
    z = iter;            %n° iteraciones.
    [m, n] = size(A);
    opCounter = 0;

    X0=zeros(1,n);      %vector inicial o punto inicial.
    for f=1:z
        for i=1:n
            suma=0;
            for j=1:n
                if i~=j
                    suma=suma+A(i,j)*X0(j);
                    opCounter = opCounter + 3;
                end
            end
            X(i)=(b(i)-suma)/A(i,i);
            if (f>1)
                errorActual = norm(X0-X);
                error(f) = errorActual;
            end
            opCounter = opCounter + 4;
        % fprintf('%10.4f',X(i));
        end
    % fprintf('\n');
   % error = norm(X0-X);
    X0=X;
    end
    time = toc;
end