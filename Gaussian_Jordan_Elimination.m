clc;
clear all;

m=input('Enter number of variables : ');

for i=1:m
    for j=1:m+1
        fprintf('a(%2.0f,%2.0f)=',i,j);
        b(i,j)=input(' ');
    end
end

for i=1:m
    div=b(i,i);
        for j=1:m+1
            b(i,j)=b(i,j)/div; 
        end
        for k=1:m
            multi=b(k,i);
            if k~=i
                for j=1:m+1
                    b(k,j)=b(k,j)-(b(i,j)*multi);
                end
            end
        end
end

for i = 1:m
    fprintf('x(%2.00f) = %2.04f\n',i,b(i,4))
end
    
    
 