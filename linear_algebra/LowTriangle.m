%% Write a forward substitution function for a lower-triangular system
%adding test edit
function [A,b] = LowTriangle(L,b)
tic
A=[1, 4, 2; ...
   3, 2, 1; ...
   2, 1, 3];
b=[15;10;13];

nref=length(b); %system size for reference problem
%x = zeroes(nref,1);
Alow=cat(2,A,b);

for i=1:nref-1
    Alow(i) = b(i)/L(i,i);
    b(i+1:nref) = b(i+1:nref) - Alow(i)*L(i+1:nref,i);
end % for 
 Alow(nref) = b(nref)/L(nref,nref);
 disp('Lower Triangular Forward Elim([Aref,bref]) = ');
 disp(Alow);
 toc
%% Illustrate back substitution on B using provided Matlab function
xsoln=tril(Alow);
disp('Low Triangular solution:  ');
disp(xsoln);
disp('Matlab,GNU/Octave built-in solution:  ');
disp(Alow\b); 
end %function 
