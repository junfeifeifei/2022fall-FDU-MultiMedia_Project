function [z]=ulaw(y,u)
%  u-law nonlinearity for nonuniform PCM
%  X=ULAW(Y,U).
%  Y=input vector.

% todo: 
len=length(y);              
%获取向量长度，为循环做准备
z=y;                                   
%给z赋初值为y
for i=1:len                 
    abs_y=abs(y(i));                  
    z(i)=log(1 + u * abs_y)/log(u + 1);      
    %进行扩张并赋值给z
    if(y(i)<0)                          
        z(i)=-z(i);
    end
    %通过y(i)的正负判断z（i）是否要取负
end
end