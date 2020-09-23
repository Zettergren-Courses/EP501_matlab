%% Write a forward substitution function for a lower-triangular system

function [Alow,x] = LowTriangle(L,b)
nref=length(b); %system size for reference problem
x = zeros(nref,1);
Alow=cat(2,L,b);
%x(1,1) = b(1)/L(1,1);
%x(1)=Alow(nref,nref+1)/Alow(nref,nref);
x(1)=Alow(1,nref+1)/Alow(1,1);

for i=2:nref
    x(i,1)=(b(i)-L(i,1:i-1)*x(1:i-1,1))./L(i,i);    
end %for 

 Alow(nref) = b(nref)/L(nref,nref);
 disp('Lower Triangular Forward Elim([Aref,bref]) = ');
 disp(Alow);
 disp('Results =');
 disp(x);

%% Illustrate forward substitution on B using provided Matlab function
% xsoln=tril(Alow);
% disp('Low Triangular solution:  ');
% disp(xsoln);
disp('Matlab,GNU/Octave built-in solution:  ');
disp(L\b); 
end %function 
