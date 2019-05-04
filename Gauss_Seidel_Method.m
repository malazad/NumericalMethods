clc;
clear all;
n = input('Enter the number of variables : ');
for i=1:n
    for j=1:n+1
        fprintf('a(%2.00f,%2.00f)=',i,j);
        a(i,j) = input('');
    end
end
input_error =input('Enter error percentage =');
it = input('Enter number of iteration =');
for i=2:n
    x(i) =0;
end
for t=1:it
    fprintf('it = %2.00f    ',t);
    count = 0;
    for i = 1:n
        num = a(i,n+1);
        for j=1:n
            if j~=i
                num = num -a(i,j)*x( j);
            end
        end
        if t>1
            previous_x(i)=x(i);
        end
        x(i) = num/a(i,i);
        fprintf('x(%2.00f) = %2.04f     ',i,x(i));
        if t>1
            er(i) = abs(x(i)-previous_x(i))/x(i);
               if er(i)<input_error
                   count = count +1;
               end
        end
    end
    fprintf('\n');
    if count>=n
        break;
    end
end
        
