I = imread('test.png');  %读取文件
[size_x,size_y,size_z] = size(I); %获取文件大小
fprintf('x的范围是1-%d\n',size_x);%提示用户图片的x的范围
fprintf('y的范围是1-%d\n',size_y);%提示用户图片的y的范围
x = input('请输入x的值:');%输入x的值
y = input('请输入y的值:');%输入y的值
left = max(x-1,1); %左边界检查
right = min(x+1,size_x);%右边界检查
top = max(y-1,1);%上边界检查
bottom = min(y+1,size_y);%下边界检查
if(left > right || top > bottom) %如果超出范围就提示用户
    fprintf("超出图片范围\n");
end
for i = left : right %对于给定点的周围八个点进行遍历
    for j = top : bottom
        fprintf('(%d, %d): (%d, %d, %d)\n', i, j, I(i, j, 1), I(i, j, 2), I(i, j, 3)); %输出对应的点的RGB的值
    end
end
