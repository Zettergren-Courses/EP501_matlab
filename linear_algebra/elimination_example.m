% A simple script to solve a system of equations, while checking various
% aspects of the matrix representation of that system
%
%This script requires files containing the functions Gauss_elim, backsub, and Jacobi.  


%% Illustrate the number of operations needed to implement Cramer's rule
n=1:10;
nops=(n-1).*factorial(n+1)+n;      %see book for discussion
figure(1);
loglog(n,nops,'o','LineWidth',2,'MarkerSize',20,'MarkerFaceColor','blue');
xlabel('size of system (# of unknowns)');
ylabel('number of multiply/divides needed to solve');
title('Theoretical Computational Cost of Cramer''s Rule')


%% Define the example problem discussed in class
% Example solved by hand in class
%   x1 + 4*x2 + 2*x3  = 15
% 3*x1 + 2*x2 +   x3 = 10
% 2*x1 +   x2 + 3*x3 = 13
A=[1, 4, 2; ...
   3, 2, 1; ...
   2, 1, 3];
b=[15;10;13];
x=A\b;
disp('(class problem Matlab solution) x = ');
disp(x);


%% Illustrate vanilla forward elimination
nref=length(b);                %system size for reference problem

%note that the elimination procedure coded below modifies the matrix B
Awork=cat(2,A,b);          %This is our working version of the matrix used to perform elimination (i.e. it will be modified)
for ir1=2:nref                                           %loop over rows from 2 to n performing elimination, this index marks what row we are starting the elimination from (i.e. using) for this particular column
    for ir2=ir1:nref                                     %this index marks the present position where elimination is being performed - i.e. where we are applying the elementary row operations
        fact=Awork(ir2,ir1-1);                                    %multiplier of the variable we are attempting to eliminate, its ir-1 column of this row
        Awork(ir2,:)=Awork(ir2,:)-fact/Awork(ir1-1,ir1-1).*Awork(ir1-1,:);    %subtract off previous row modified by a factor that eliminates the ir-1 column term in this row (so it has only super-diagonal elements), this is a little bit wasteful as it uses entire row...
    end %for
end %for

disp('elim([Aref,bref]) = ');
disp(Awork);


%% Illustrate back substitution on B using provided Matlab function
xsoln=backsub(Awork);
disp('Elimination/back sub solution:  ');
disp(xsoln);
disp('Matlab,GNU/Octave built-in solution:  ');
disp(A\b);