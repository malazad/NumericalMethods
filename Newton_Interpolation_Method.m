clc
clear all
m = input('Enter the order of interpolation :')
n = input('Enter number of point =');
if n>m
    for i=1:n
        fprintf('x(%2.0f) =',i);
        x(i) = input('');
        fprintf('f(%2.0f) =',i);
        f(i,1) = input('');
    end
    y = input('Enter the value of x to evaluate the function value =');
    for j=2:m+1
        for i=1:n-j+1
            f(i,j)=(f(i+1,j-1)-f(i,j-1))/(x(j+i-1)-x(i));
        end
    end
    Fx = f(1,1);
    for i=1:m
        sub = f(1,i+1);
        for j = 1:i
            sub = sub*(y-x(j));
        end
        Fx = Fx + sub;
    end
    fprintf('f(%2.04f)) = %2.04f\n',y,Fx);
end


