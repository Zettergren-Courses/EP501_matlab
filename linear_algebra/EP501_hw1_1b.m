%% EP 501
% Homework 1
%% Ex. 1
% Part b
clear all
close all

load C:\Users\Vittorio\EP501_matlab\linear_algebra\testproblem.mat

%solving the problem with the implemented forward elimination function and
%the back-substitution function from the course repository
Asol=simple_elimination(A,b);
xsol=backsub(Asol);

%verifying the previous sol. using the in-built Matlab functions and the
%Gaussian elimination code from the repository
[Acheck,ord]=Gauss_elim(A,b);
xgauss=backsub(Acheck(ord,:));
xcheck=A\b;

disp('Solution for simple elimination: ')
disp(xsol)
disp('Solution for Gaussian elimination: ')
disp(xgauss)
disp('Solution for built-in MatLab function: ')
disp(xcheck)