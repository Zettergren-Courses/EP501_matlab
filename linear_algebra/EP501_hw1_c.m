%% EP501 
%% Vittorio Baraldi
% Homework 1
clear all
close all
%% Ex.1
% Part c
load C:\Users\Vittorio\EP501_assignments\assignments\HW1\lowertriang_testproblem.mat

% solving the lower triang. matrix using the forward substitution
Asol=[L bL];
x=forwsub(Asol);
%checking results with the built-in matlab function
xcheck=L\bL;
