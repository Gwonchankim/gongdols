clear; close all; clc;

% SVD�� �ϴ� ����: �ٸ� �������� ��� �ִ� layer�� ���ؽ��� ������ �� �ִ�. 

A =[1,3;4,2]/4;

[U,S,V]=svd(A);

layer1 = U(:,1)*S(1,1)*V(:,1)'
layer2 = U(:,2)*S(2,2)*V(:,2)'

layer1+layer2

A

% ������ �̿��غ���.
img = double(rgb2gray(imread('lena_std.tif')));

[U,S,V]=svd(img);
figure;

for i = 1:size(S,1);
    imagesc(U(:,1:i)*S(1:i,1:i)*V(:,1:i)');
    colormap('gray')
    title(['layers added upto ', num2str(i)]);
    if i<30
        pause(0.5)
    elseif 3<=i<100
        pause(0.1)
    else
        pause(0.01)
    end
end

% GUI �̿�
lennaSVD_demo