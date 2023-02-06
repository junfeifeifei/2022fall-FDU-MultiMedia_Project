function [a_quan]=u_pcm(a,n)
%U_PCM  	uniform PCM encoding of a sequence
%       	[A_QUAN]=U_PCM(A,N)
%       	a=input sequence.  输入序列
%       	n=number of quantization levels (even).  量化级别的数目
%		a_quan=quantized output before encoding. 编码前的量化输出

% todo: 
    %给定的a代表的是输入序列，给定的n代表的是量化级别的数目，给定的a_quan是编码前的量化输出
    
    interval = 2/n;  
    % 这里的interval表示的是取样间隔
    new_vec = interval.*[0:n-1];
    % 这里的new_vec是一个新建的n位向量，第i位的值是i-1
    new_vec = new_vec-((n-1)/2)*interval;
    % n位的向量，从上一个向量进行变化而来，得到的每一位分别是1/n-1,3/n-1....
    a_max = max(abs(a));
    %max是输入的信号的绝对值的最大值
    a_quan = a/a_max;
    %获得一个新的向量,每一项的值都是是原始信号的值除以输入信号的绝对值的最大值
    
    %下一步要利用find函数找出落在[new_vec(i)-interval/2，new_vec(i)+interval/2)]区间的信号并赋值，然后进行n次循环即可
    for i=1:n
        a_quan(find((new_vec(i)-interval/2<=a_quan)&(a_quan<=new_vec(i)+interval/2)))=...
        new_vec(i).*ones(1,length(find((new_vec(i)-interval/2<=a_quan)&(a_quan<=new_vec(i)+interval/2))));
    end
    
    a_quan=a_quan*a_max;
     %乘以a_max，得到量化信号

end
