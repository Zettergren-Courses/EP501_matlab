%%Problem #2
%%Create a new version of your simple forward elimination function which will work for multiple right-hand sides (RHS)
%%which will be a lower triangular matrix

function [Awork] = fwdElimrhs(A,b)
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
