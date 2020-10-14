%% EP 501 - Numerical Methods
%% Homework 3
% Vittorio Baraldi

clear all; close all; clc

%% Ex. 3
%% Part a)
syms x y
f=@(x,y) x^2+y^2-2*x-y;
g=@(x,y) x^2/4+y^2-1;
x0=4;
y0=4;
% gradf={ 3.*x.^2-3.*y; 3.*y.^2-3.*x};
% gradg={ 2.*x; 2.*y};
% d1=[gx;gy];
% d2=[fx;fy];
maxit=600;
tol=1e-7;
[rootx,rooty,it,success]=newton2D_exact(f,gradf,g,gradg,x0,y0,maxit,tol);
