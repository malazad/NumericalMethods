clc;
clear all;
n = input('Enter the number of variables : ');
h = 1;
for i=1:n
    for j=1:n+1
        fprintf('a(%2.00f,%2.00f)',i,j);
        a(i,j,h) = input('');
    end
end
for h=2:n
    current = 1;
    for i=1:n-h+1
        for j=1:n+1
            a(i,j,h)=(a(current,j,h-1)*a(i+1,h-1,h-1))/a(current,h-1,h-1);
        end
        for j=1:n+1
            a(i,j,h)= a(i+1,j,h-1)-a(i,j,h);
        end
    end
end
h=n;
while h>0
    num = a(1,n+1,h);
    p=h;
    while p<n
        num=num - a(1,p+1,h)*x(p+1);
        p=p+1;
    end
    x(h) = num/a(1,h,h);
    h=h-1;
end
for i=1:n
    fprintf('x(%2.00f) = %2.4f\n',i,x(i));
end