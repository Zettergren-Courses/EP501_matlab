%%Problem #2
%%Create a function that implements Gauss-Jordan elimination; 
%%you should start from your forward elimination function for multiple RHS 
%%and add the backward eliminations needed.

function [Ajord] = gaussjordanElim(A,b)

nref=length(b);                %system size for reference problem                          
%note that the elimination procedure coded below modifies the matrix B
Ajord=cat(2,A,b);           %This is our working version of the matrix used to perform elimination (i.e. it will be modified)

for ir1=2:nref
    %loop over rows from 2 to n performing elimination, this index marks what row we are starting the elimination from (i.e. using) for this particular column
    for ir2=ir1:nref                                     %this index marks the present position where elimination is being performed - i.e. where we are applying the elementary row operations
        fact=Ajord(ir2,ir1-1);
        %multiplier of the variable we are attempting to eliminate, its ir-1 column of this row
        Ajord(ir2,:)=Ajord(ir2,:)-fact/Ajord(ir1-1,ir1-1).*Ajord(ir1-1,:);
        %subtract off previous row modified by a factor that eliminates the ir-1 column term in this row (so it has only super-diagonal elements), this is a little bit wasteful as it uses entire row...
    end %for
end %for

disp('elim([Aref,bref]) = ');
disp(Ajord);

%Just need to reverse the indices and add instead of subtract in the algorithm
for ir1=nref-1:-1:1
    %loop over rows from n to n-1 performing elimination, this index marks what row we are starting the elimination from (i.e. using) for this particular column
    for ir2=ir1:-1:1 %this index marks the present position where elimination is being performed - i.e. where we are applying the elementary row operations
        fact=Ajord(ir2,ir1+1);
        %multiplier of the variable we are attempting to eliminate, its ir+1 column of this row
        Ajord(ir2,:)=Ajord(ir2,:)-fact/Ajord(ir1+1,ir1+1).*Ajord(ir1+1,:);
        %add off previous row modified by a factor (ir+1)
    end %for
end %for

for ir2=1:length(b)
    Ajord(ir2,:)=Ajord(ir2,:)./Ajord(ir2,ir2);
end %for

disp('Gauss-Jordan Elimination Solution is:');
disp(abs(Ajord));

disp('Matlab,GNU/Octave built-in solution:  ');
disp(inv(A));

% disp('Compared Solution');
% disp(Ajord\A);
end %function 