I = imread('eight.tif');                % 读取文件
J2 = imnoise(I, 'salt & pepper', 0.04); % 叠加密度为0.04的椒盐噪声。
filter1 = medfilt2(J2, [3 3]);          % 中值,窗口大小为3×3
h = fspecial('average', [3 3]);         % 均值,窗口大小为3×3
filter2 = imfilter(J2, h);
figure
subplot(2, 2, 1), imshow(I), title("原图"); %显示原图
subplot(2, 2, 2), imshow(J2), title("加噪图片");     %显示加噪后的图片              
subplot(2, 2, 3), imshow(filter1), title("去噪算法1");   %显示用第一种方法去噪后的图片                 
subplot(2, 2, 4), imshow(filter2), title("去噪算法2");   %显示用第二种方法去噪后的图片