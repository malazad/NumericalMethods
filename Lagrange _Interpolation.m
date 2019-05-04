clc
clear all

n = input('Enter number of point =');
for i=1:n
    fprintf('x(%2.0f) =',i); 	% Values for x
    x(i) = input('');
    fprintf('f(%2.0f) =',i); 	% Values for f(x)
    f(i) = input('');
end
y = input('Enter the value of x to evaluate the function value =');


%------------------------------------------------------------------------%
lx=0;
for i=1:n
    product=1;
    for j=1:n
        if j~=i
            product=product*((y-x(j))/(x(i)-x(j)));
        end
    end
    lx=lx+(product*f(i))
end

fprintf('f(%2.15f) = %2.15f.\n',y,lx);
