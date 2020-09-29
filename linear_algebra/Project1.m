%% Author: Alec Sblendorio 
%% Due Date: September 28, 2020
%% Subject: EP 501 Numerical Methods for Scientists and Engineers 
%% Project #1 
% Problem #1: Develop some basic elimination and substitution tools for linear equations
% Problem #2: Elimination methods for computing matrix inverses
% Problem #3: Numerical approaches for computing determinants

%% Import test data for calibration of software
Data1 = importdata('/Users/alecsblendorio/Documents/Projects/EP501_assignments/assignments/HW1/lowertriang_testproblem.mat');
Data2 = importdata('/Users/alecsblendorio/Documents/Projects/EP501_assignments/assignments/HW1/testproblem.mat');

A = Data2.A;
b = Data2.b;
b2 = Data2.b2;
b3 = Data2.b3;
L = Data1.L;
bL = Data1.bL;

%% Problem #1: Develop some basic elimination and substitution tools for linear equations
%%Part A and B: Upper Triangular
disp('%%%%%%%%%%%%%%%%%%PROBLEM #1 ANSWER BEGIN%%%%%%%%%%%%%%%%%%');
soln = @forwardElim;
x = soln(A,b);
disp(x);
 
%%Part C and D: Lower Triangular
soln2 = @LowTriangle;
y = soln2(L,bL);
disp('%%%%%%%%%%%%%%%%%%PROBLEM #1 ANSWER END%%%%%%%%%%%%%%%%%%');
%% Problem #2: Elimination methods for computing matrix inverses
disp('%%%%%%%%%%%%%%%%%%PROBLEM #2 ANSWER BEGIN%%%%%%%%%%%%%%%%%%');
%%Part A B,C, and D: Gauss-Jordan Elimination with back substitution and Inverse
soln3 = @gaussjordanElim;
g = soln3(A,b);
disp(g);
disp('%%%%%%%%%%%%%%%%%%PROBLEM #2 ANSWER END%%%%%%%%%%%%%%%%%%');
%% Problem #3: Numerical approaches for computing determinants
%%Part A and B: Create Gaussian Elimination function with Determinant
%%solution, compare to Matlab
disp('%%%%%%%%%%%%%%%%%%PROBLEM #3 ANSWER BEGIN%%%%%%%%%%%%%%%%%%');
soln4 = @determinant;
h = soln4(A,b);
disp(h);
disp('%%%%%%%%%%%%%%%%%%PROBLEM #3 ANSWER END%%%%%%%%%%%%%%%%%%');

%% END PROJECT #1 







