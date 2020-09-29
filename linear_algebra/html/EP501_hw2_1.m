%% EP 501 - Vittorio Baraldi
% Homework 2

clear all
close all
clc

%% Ex.1
load C:\Users\Vittorio\EP501_matlab\linear_algebra\testproblem.mat

%% Part a) and b)
%implementing a simple forward elimination method for LU factorization
[L,U,bt]=simple_elimination_dolittle(A,b);
%preparing matrix for back substitution algorithm
Awork=[U bt];
%back-substitution
x=backsub(Awork);

%checking results with buil-in Matlab function
check1=A\b;

disp('Final solution for linear system of eqns using LU factorization method: ')
disp(x)
disp('Built-in MatLab function result:')
disp(check1)



%% Part c)
%solving a multiple right hand side system
xt1=forwsub([L b]);
x1=backsub([U xt1]);
xt2=forwsub([L b2]);
x2=backsub([U xt2]);
xt3=forwsub([L b3]);
x3=backsub([U xt3]);
%final solution matrix
result=[x1 x2 x3];

%checking results with buil-in Matlab function
check2=A\b2;
check3=A\b3;

disp('Final solution for multiple right-hand side using LU factorization method:')
disp(result)
disp('Checking results with built-in MatLab function:')
disp([check1 check2 check3])



%% Part d)
%Find inverse matrix inv(A) starting from the LU factorization

n=size(A,1);
for i=1:n
    %initializing the RHS
    bt=zeros(n,1);
    %setting the i-th element to 1, all others to 0
    bt(i)=1;
    %performing a forwards+back substitutions
    inv1=forwsub([L bt]);
    inv2=backsub([U inv1]);
    %inv2 is equal to the i-th column of the inverse matrix
    invmatrix(:,i)=inv2;
end

%checking result with buil-in MatLab function
check4=inv(A);

disp('Inverse matrix from LU factorization:')
disp(invmatrix)
disp('Inverse matrix from MatLab built-in function:')
disp(check4)
    
    
    
    