%Laboratorio 1 de Algoritmos numéricos.
%Patricia Melo

clear all
tic;
%fprintf("Newton\n")
%newton;

% A = load('sistemas/289x289/A289.dat');
% b = load('sistemas/289x289/b289.dat');
resultados=[];
costos=[];
tiempo=[];
errores=[];

A = load('sistemas/1089x1089/A1089.dat');
b = load('sistemas/1089x1089/b1089.dat');

% A = load('sistemas/4225x4225/A4225.dat');
% b = load('sistemas/4225x4225/b4225.dat');



[n,m]=size(A);
if n==m       %matriz cuadrada.
    disp = dispersa(A); %ve si la matriz es dispersa.
    domn = dominante(A);
    neg = negativa(A);
    pos = positiva(A);
    semi_pos = semi_positiva(A);
    sime = simetrica(A);
    
    if sime==true
    fprintf("La matriz es simetrica\n")
    end
    if domn==true
    fprintf("La matriz es dominante\n")
    end
    if neg==true
    fprintf("La matriz es negativa\n")
    end
    if pos==true
    fprintf("La matriz es positiva\n")
    end
    if semi_pos==true
    fprintf("La matriz es semi positiva\n")
    end
    if disp==true
    fprintf("La matriz es dispersa\n")
    end
    
    if domn == true
        %jacobi
        [res6, e6, opC6, t6] = funcion_gjacobi(A, b, 100);  %converge siempre que sea dominante.
        resultados = [resultados, res6'];
        costos = [costos, opC6];
        tiempo = [tiempo, t6];
        
        % Errores Jacobi.
        figure
        plot(e6, "-g")    %gráfico de los errores por iteración en jacobi.
        title("Errores Jacobi");
        
        if sime == true
            if pos == true
                [res7, e7, opC7, t7] = funcion_gseidel(A, b, 100);  %converge siempre que sea dominante, simetrica y positiva.
                resultados = [resultados, res7'];
                costos = [costos, opC7];
                tiempo = [tiempo, t7];
                
                %Errores seidel.
                figure
                plot(e7, "-r")    %gráfico de los errores por iteración en seidel.
                title("Errores Seidel");
                               
            end
        end
    end
    if sime == true
        if pos == true
            [res3, e3, opC3, t3] = funcion_cholesky(A, b);  %siempre deben ser simetricas y positivas.
            resultados = [resultados, res3'];
            costos = [costos, opC3];
            errores = [errores, e3];
            tiempo = [tiempo, t3];
        end
    end
    
    %solo necesitan que la matriz sea cuadrada.
    %gram-schmidt o QR.
    [res1, e1, opC1, t1] = funcion_gs(A,b);
    resultados = [resultados, res1];
    costos = [costos, opC1];
    errores = [errores, e1];
    tiempo = [tiempo, t1];
    
    %LU
    [res2, e2, opC2, t2] = funcion_LU(A, b);
    resultados = [resultados, res2];
    costos = [costos, opC2];
    errores = [errores, e2];
    tiempo = [tiempo, t2];
    
    %householder
    [res5, e5, opC5, t5] = funcion_householder(A, b);
    resultados = [resultados, res5];
    costos = [costos, opC5];
    errores = [errores, e5];
    tiempo = [tiempo, t5];
    
    %givens
%    [res4, e4, opC4, t4] = funcion_givens(A, b);
%    resultados = [resultados, res4];
%    costos = [costos, opC4];
%    errores = [errores, e4];
%    tiempo = [tiempo, t4];
end

% Crear matriz con resultados, costos, errores y tiempo.


% Gráficos

%hold on


% Resultado de los métodos.
% figure
% plot(res1, "-g")    %gráfico de la función gram schmit.
% title("Resultado de los métodos");
% hold on
% plot(res2, "-r")
% hold on
% plot(res3, "-b")
% %hold on
% %plot(res4, "-k")
% hold on
% plot(res5, "-y")
% hold on
% plot(res6, "-c")
% hold on
% plot(res7, "-m")

tiempoTotal = toc;
