I = imread('pout.tif'); %读入图片
J = imadjust(I, [0.2, 0.6], [0, 1]);% 灰度拉伸
K = histeq(I);%直方图均衡化
figure
subplot(3, 2, 1), imshow(I), title("原图");  %输出原图
subplot(3, 2, 2), imhist(I), title("原图的灰度分布直方图"); %输出灰度分布直方图
subplot(3, 2, 3), imshow(J), title("灰度拉伸"); %输出灰度拉伸图
subplot(3, 2, 4), imhist(J), title("灰度拉伸的灰度分布直方图");%输出直方图均衡化
subplot(3, 2, 5), imshow(K), title("直方图均衡化");
subplot(3, 2, 6), imhist(K), title("直方图均衡化的灰度分布直方图");
