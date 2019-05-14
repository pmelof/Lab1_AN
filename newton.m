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
    xnew = xold - J\[f;g;h]; 
    %disp(sprintf('iter=%6.15f, x1=%6.15f, x2=%6.15f, x3=%6.15f', iter,xnew)); 
end

%gráfico
figure
plot(x1, "-.r")
title("Newton multivariable")
hold on
plot(x2, "-.b")
hold on
plot(x3, "-.g")
xlabel("iteración")
ylabel("valor")



