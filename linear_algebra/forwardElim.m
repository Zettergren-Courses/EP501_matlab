%%Problem #1 
%%Write a MATLAB or Python function that uses simple forward elimination (without pivoting or scaling, viz. not Gaussian elimination).
%%Note that this has already been implemented in script form in class; 
%% need to convert it into a function so it may be easily used with later programs to be developed as part of future assignments.

function [A,b] = forwardElim(Awork)
A=[1, 4, 2; ..
   3, 2, 1; ...
   2, 1, 3];
b=[15;10;13];

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

end %function 


