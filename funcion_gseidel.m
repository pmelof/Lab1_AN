function[res, resultValues,tiempo, opCounter] =funcion_gseidel(A,B,iter)


vectorResultados=[]; 
tic;
nFunctions=length(B);
result=0;
opCounter = 0;
resultValues=[];
aux = [];
X =zeros(1,nFunctions)';
 for p=1:iter
    for i=1:nFunctions
      for j=1:i-1 
            result=result + A(i,j)*X(j);
            opCounter = opCounter + 3;  
      end
      for j=i+1:nFunctions %lengt
            result= result + A(i,j)*X(j);
            opCounter = opCounter + 3; 
      end
            result=  (B(i)-result)/A(i,i);
            X(i)=result;
            opCounter = opCounter + 2; 
            result=0;
    end
    %Calculo de error relativo con el valor anterior.
    resultValues= [resultValues,X];
 end
 resultValues =resultValues';
 tiempo = toc;
 res = resultValues(iter, :);
end