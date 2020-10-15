clear; close all; clc;

load('YaleB_32x32.mat'); % gnd�� ��� ��ȣ�ε�.
% ��ó: http://www.cad.zju.edu.cn/home/dengcai/Data/FaceData.html
% ����� �����ͼ��� �̸��� Extended Yale Face Database B��.

figure('position',[556, 237, 947, 699]);
for i= 1:25
    subplot(5,5,i)
    imagesc(reshape(fea(i,:), 32, 32)); colormap('gray')
end

%% NMF �����ϱ�
n_features = 25;
[W, H] = nnmf(fea, n_features);

figure('position',[556, 237, 947, 699]);
for i_features = 1:n_features
    subplot(5,5,i_features)
    imagesc(reshape(H(i_features,:), 32, 32)); colormap('gray');
end

% figure; imagesc(reshape(randn(1, 25) * H, 32, 32)); colormap('gray')

%% PCA �����ϱ�

[coeff, score, latent] = pca(fea);

figure('position',[556, 237, 947, 699]);
for i_features = 1:n_features
    subplot(5,5,i_features)
    imagesc(reshape(coeff(:, i_features), 32, 32)); colormap('gray');
end
