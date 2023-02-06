function [a_quan]=ula_pcm(a,n,u)
%ULA_PCM  u-law PCM encoding of a sequence
%        [A_QUAN]=MULA_PCM(X,N,U).
%        X=input sequence.
%        n=number of quantization levels (even).      
%  a_quan=quantized output before encoding.
%       U the parameter of the u-law

% todo: 
% u为u-law的参数

a_max = max(abs(a));               
%获取输入信号中的绝对值最大值a_max

new_vec = a/a_max;                 
%创建一个新向量，每项的值都不大于1

a_ulaw = ulaw(new_vec,u);                
%首先对得到的向量进行压缩，得到了a_ulaw

a_ulaw_pcm=u_pcm(a_ulaw,n);         
%然后进行均匀量化

a_quan_invulaw = inv_ulaw(a_ulaw_pcm,u);       
%然后利用inv_ulaw函数进行扩张，得到结果

a_quan = a_quan_invulaw * a_max;          
%把扩张得到的结果乘以a_max，得到了最后的结果

end