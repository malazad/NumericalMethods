clc
clear all;

m=input('Order of the polynomial : ')
n=input('Number of sample : ')


    for i=1:n
        fprintf('x(%2.0f)=',i);
        x(i)=input('');
        fprintf('y(%2.0f)= ',i);
        y(i)=input('');
    end
    %----------------------------------------------------------%
       for j=1:2*m
           sum_of_y=0;
           sum_of_x_to_the_power(j)=0;
           for k=1:n
            
            product_of_x=1;
            for p=1:j
                product_of_x=x(k)*product_of_x;
            end
             sum_of_x_to_the_power(j)=sum_of_x_to_the_power(j)+product_of_x;
             sum_of_y=sum_of_y+y(k);
            end
       end
  %------------------------------------------------------------------%
               for i=1:m
                   
                   for j=1:n
                       sum_of_xy(i)=0;
                       product_of_xx(j)=1;
                       for p=1:i
                         product_of_xx(j)=product_of_xx(j)*x(j);
                       end
                       %product_of_xy(j)=product_of_xx(j)*y(j);
                       
                   end
                   for q=1:n
                   sum_of_xy(i)=sum_of_xy(i)+product_of_xx(q)*y(q);
                   end
               end
               
    %------------------------------------------------------------------%           
     
      b(1,1)=n;
      row=1;
     % loc=0;
    for i=1:m+1
        
        power=row-1;
           for j=1:m+1
               if (i>1) || (j>1)    
                   b(i,j)= sum_of_x_to_the_power(power) 
               end
               power=power+1;
                  % loc=loc+1;
              
           end
           row=row+1;
    end
    b(1,m+2)=sum_of_y;
    for i=1:m+1
        if i>1
             b(i,m+2)=sum_of_xy(i-1);
        end
    end
%-------------------------------------------------------------------------%



for i=1:m+1
    div=b(i,i);
        for j=1:m+2
            b(i,j)=b(i,j)/div; 
        end
        for k=1:m+1
            multi=b(k,i);
            if k~=i
                for j=1:m+2
                    b(k,j)=b(k,j)-(b(i,j)*multi);
                end
            end
        end
end
%-------------------------------------------------------------------------%


x=-100:0.001:100;
y=b(1,m+2);
for k=2:m+1
    x_to_the_power=1;
    for h=1:k-1
        x_to_the_power=x_to_the_power.*x;
    end
    y=y+(b(k,m+2).*x_to_the_power);
end
plot(x,y);
axis on
grid on
