%% Write a forward substitution function for a lower-triangular system
%adding test edit
function [Alow] = LowTriangle(L,b)
tic
% L=[1, 4, 2; ...
%    3, 2, 1; ...
%    2, 1, 3];
% b=[15;10;13];

nref=length(b); %system size for reference problem
x = zeros(nref,1);
Alow=cat(2,L,b);
%x(1)=Alow(nref,nref+1)/Alow(nref,nref);
x(1)=Alow(1,nref+1)/Alow(1,1);

for i=1:nref-1
    x(i)=Alow(i,nref+1)/Alow(i,i+1);
end %for    

% for i=1:nref-1
%     Alow(i) = b(i)/L(i,i);
%     x(i+1:nref) = x(i+1:nref) - Alow(i)*L(i+1:nref,i);
% end % for 

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
