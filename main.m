%Laboratorio 1 de Algoritmos numéricos.
%Patricia Melo

%clear all

A = load('sistemas/289x289/A289.dat');
b = load('sistemas/289x289/b289.dat');

%[res1, e1] = funcion_gs(A,b);
%[res2, e2] = funcion_LU(A, b);
%[res3, e3] = funcion_cholesky(A, b);
%[res4, e4] = funcion_givens(A, b);
[res5, e5] = funcion_householder(A, b);
[res6, e6] = funcion_gjacobi(A, b);
[res7, resV, time, op] = funcion_gseidel(A, b, 100);
