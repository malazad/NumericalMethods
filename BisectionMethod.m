clc;
clear;
xl(1)=input ('Enter 1st initial value: ');
xu(1)=input('Enter 2nd initial value: ');
e=input('Enter desired relative parcentage of error: ');
d=input('Enter number of iterations: ');
fxl(1)=(667.38/xl(1))*(1-exp(-0.146843*xl(1)))-40; % Given Equation for finding root
fxu(1)=(667.38/xu(1))*(1-exp(-0.146843*xu(1)))-40;
if fxl(1)*fxu(1)<0
    for i=1: d
        fxl(i)=(667.38/xl(i))*(1-exp(-0.146843*xl(i)))-40
        fxu(i)=(667.38/xu(i))*(1-exp(-0.146843*xu(i)))-40
        xr(i)=(xl(i)+xu(i))/2;
        j(i)=i;
        fxr(i)=(667.38/xr(i))*(1-exp(-0.146843*xr(i)))-40
        if i>1
            er(i)=((xr(i)-xr(i-1))/xr(i))*100;
        end
        if i>1 && abs(er(i))<e
            break
        else if fxr(i)==0
                break
        end 
    end
    if fxr(i)>0 && fxl(i)>0			% Find new value for either xl or xu for next iteration 
              xl(i+1)=xr(i);
              xu(i+1)=xu(i);
          else if fxr(i)>0 && fxu(i)>0
                  xu(i+1)=xr(i);
                  xl(i+1)=xl(i);
              else if fxr(i)<0 && fxl(i)<0
                      xl(i+1)=xr(i);
                      xu(i+1)=xu(i);
                  else if fxr(i)<0 && fxu (i)<0
                          xu(i+1)=xr(i);
                          xl(i+1)=xl(i);
                      end

                  end
              end
          end
   end
 else if fxl(1)*fxu(1)>0
     display('wrong initial input')
      end
end
out =[j' xl' xu' fxl' fxu' xr' fxr' er']
fprintf('the root of the equation is : %2.15f\n', xr(i))


    

