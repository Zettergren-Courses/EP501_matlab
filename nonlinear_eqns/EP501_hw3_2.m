%% EP 501 - Numerical Methods
%% Homework 3
% Vittorio Baraldi

clear all; close all; clc

%This code implements the solution for multiple roots of a polynomial in
%both the real and complex case

%The procedure is the following: given a certain initial guess for the
%Newton method, a solution is found. Then, the initial function is deflated
%by factoring out the solution found in the previous step and so on and so
%forth until all solutions are found.

%% Ex. 2
%% Part a
f=@(x) x^5-15*x^4+85*x^3-225*x^2+274*x-120;

x1=newton_exact_approx(f,1.5,1000,1e-6);

f2=@(x) (x^5-15*x^4+85*x^3-225*x^2+274*x-120)/(x-x1);

x2=newton_exact_approx(f2,1.5,1000,1e-6);

f3=@(x) (x^5-15*x^4+85*x^3-225*x^2+274*x-120)/(x-x1)/(x-x2);

x3=newton_exact_approx(f3,1.5,1000,1e-6);

f4=@(x) (x^5-15*x^4+85*x^3-225*x^2+274*x-120)/(x-x1)/(x-x2)/(x-x3);

x4=newton_exact_approx(f4,1.5,1000,1e-6);

f5=@(x) (x^5-15*x^4+85*x^3-225*x^2+274*x-120)/(x-x1)/(x-x2)/(x-x3)/(x-x4);

x5=newton_exact_approx(f5,1.5,1000,1e-6);

solproblem1=[x1;x2;x3;x4;x5];

%% Part b

f=@(x) x^3-3*x^2+4*x-2;

x1=newton_exact_approx(f,0.5+0.5i,1000,1e-6);

f2=@(x) (x^3-3*x^2+4*x-2)/(x-x1);

x2=newton_exact_approx(f2,0.5-0.5i,1000,1e-6);

f3=@(x) (x^3-3*x^2+4*x-2)/(x-x1)/(x-x2);

x3=newton_exact_approx(f3,0.5+0.5i,1000,1e-6);

solproblem2=[x1;x2;x3];

%% Outputs

disp('Solution for part a:')
disp(solproblem1)
disp('Solution for part b:')
disp(solproblem2)