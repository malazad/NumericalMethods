clc
clear all;

order = input('Order of the Equation :');
fprintf('Enter co-efficients of the equation :\n')
for  i=1:order
    fprintf('Co-efficient of X^%2.00f =',i);
    c(i)=input('');
end
constant = input('Constant term = ');
n = input('Number of segment :');
b = input('Upper limit :');
a = input('Lower limit : ');

h=(b-a)/n;
x=a;
sum =0;
for i = 1:n+1
    fx(i)=constant;
    for j = 1:order
        product_of_x=1;
        for k=1:j
            product_of_x = product_of_x*x;
        end
        fx(i)= fx(i)+ (c(j)*product_of_x);
    end
    if (i==1) || (i==n+1)
            fx(i)=fx(i)/2;
    end
    sum = sum + (fx(i)*h);
    x = x + h;
end

fprintf('Ans : %2.15f\n',sum);
        
