function x=inv_ulaw(y,u)
%INV_ULAW  the inverse of u-law nonlinearity
%X=INV_ULAW(Y,U) X=normalized output of the u-law nonlinearity.

% todo: 
len=length(y);            
%获取向量长度，为循环做准备

x=y;                                 
%给x赋初值为y

for i=1:len                 
    abs_y=abs(y(i));                    
    x(i) = (power(u + 1 , abs_y ) - 1) / u;        
    %利用反函数进行压缩并赋值给x
    
    if(y(i)<0)                       
        x(i) = - x(i);
    end
    %通过y(i)的正负判断x（i）是否要取负
end
end