function x=gauss_jordan_elim(A,b)

%This function performs a gauss-jordan elimination and gives out the
%solution vector or the matrix inverse in case that b is not a vector

Awork=[A b];
n=size(A,1);
[o,k]=size(b);
for ir=1:n
    Awork(ir,:)=Awork(ir,:)/Awork(ir,ir);
    for ir2=1:n
        if ir2~=ir
            Awork(ir2,:)=Awork(ir2,:)-Awork(ir2,ir)*Awork(ir,:);
        end
    end
end
if k==1
    x=Awork(:,n+1);
    x=x';
else
    x=Awork(:,n+1:n+k);
end
    
end