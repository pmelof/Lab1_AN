format long 
syms x1 x2 x3
clear;
tol = 10.^-20;  %tol is a converge tolerance 

%initial guess or values 
x1=0; 
x2=0; 
x3=0; 
iter= 10; %iterations 
xnew =[x1;x2;x3]; 
%xold = zeros(size(xnew));
xold=[37;5;3];

errores =[];
resultados =[];

while norm(xnew - xold) > tol 
    iter= iter + 1; 
    xold = xnew; % update x1, x2, and x3. 
    x1 = xold(1); 
    x2 = xold(2); 
    x3 = xold(3); 
    
    %Defining the functions for x1, x2, and x3. 
    f = (x1)^2 + x2 - 37; 
    g = x1 - (x2)^2 - 5; 
    h = x1 + x2 + x3 - 3; 
    
    %Partial derivatives in terms of x1, x2, and x3. 
    dfdx1 = 2 * x1; 
    dfdx2 = 1; 
    dfdx3 = 0; 
    
    dgdx1 = 1; 
    dgdx2 = -2 * x2; 
    dgdx3 = 0; 
    
    dhdx1 = 1; 
    dhdx2 = 1; 
    dhdx3 = 1; 
    
    %Jacobian matrix 
    J = [dfdx1 dfdx2 dfdx3; dgdx1 dgdx2 dgdx3; dhdx1 dhdx2 dhdx3]; 
    
    
    
    % Applying the Newton-Raphson method 
    if iter>1
        if iter>2
            errores = [errores; norm(xnew(1)-xold(1))/norm(xnew(1)), norm(xnew(2)-xold(2) - xold(2))/norm(xnew(2)), norm(xnew(3))];
        end
        xold = xnew;
    end
    xnew = xold - J\[f;g;h];
    resultados = [resultados;(xnew)'];
end





