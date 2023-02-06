I = imread('test.png'); %读取文件
I = im2double(I); %把它转化为double类型，否则无法进行下一步的运算
Gray = 0.29900 * I(:,:,1) + 0.58700 * I(:,:,2) + 0.11400 * I(:,:,3); %进行三维空间到一维空间的映射
var = var(Gray(:));  %求灰度图片的方差
imwrite(Gray,'gray.png'); %输出灰度图片，名字为gray.png
fprintf("灰度图片的方差为：%f\n", var); %输出方差
figure 
subplot(2, 1, 1), imshow(I), title("原图");%展示原图
subplot(2, 1, 2), imshow(Gray), title("生成图");%展示生成图
