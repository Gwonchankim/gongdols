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
% n_features = 25;
% [W, H] = nnmf(fea, n_features); %MATLAB �Լ� �̿� ��

% ���� �ڵ��غ���
m = size(fea,1);
n = size(fea,2);
p = 25; % the number of features
n_epoch = 200;
rng(1)

W = zeros(m, p, n_epoch);
H = zeros(p, n, n_epoch);

W(:,:,1) = rand(m, p) * 255;
H(:,:,1) = rand(p, n) * 255;

X = fea;
for i_epoch = 2:n_epoch
    H(:,:,i_epoch) = H(:,:,i_epoch-1).*((W(:,:,i_epoch-1)'*X)./(W(:,:,i_epoch-1)'*W(:,:,i_epoch-1)*H(:,:,i_epoch-1)));
    W(:,:,i_epoch) = W(:,:,i_epoch-1).*((X*H(:,:,i_epoch-1)')./(W(:,:,i_epoch-1)*(H(:,:,i_epoch-1)*H(:,:,i_epoch-1)')));
end

n_features = p;

figure('position',[556, 237, 947, 699]);
i_epoch = n_epoch;
for i_features = 1:n_features
    subplot(5,5,i_features)
    imagesc(reshape(H(i_features,:, i_epoch), 32, 32)); colormap('gray');
end

% figure; imagesc(reshape(randn(1, 25) * H, 32, 32)); colormap('gray')

%% PCA �����ϱ�

[coeff, score, latent] = pca(fea);

figure('position',[556, 237, 947, 699]);
for i_features = 1:n_features
    subplot(5,5,i_features)
    imagesc(reshape(coeff(:, i_features), 32, 32)); colormap('gray');
end


%% NMF �������� ������ (epoch�� ���� ��ȭ)

newVid = VideoWriter('pic1', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

figure('position',[556, 237, 947, 699]);
for i_epoch = 1:n_epoch
    for i_features = 1:n_features
        subplot(5,5,i_features)
        imagesc(reshape(H(i_features,:, i_epoch), 32, 32)); colormap('gray');
    end
    t = text(-11.9444, -185.5345, ['Epoch: ',num2str(i_epoch)],'fontsize',15);
    
    if i_epoch == 1
        for i = 1:15 % ù��� 750 ms ���
            writeVideo(newVid, getframe(gcf))
        end
    end
    
    writeVideo(newVid, getframe(gcf))
    drawnow;
    if i_epoch < n_epoch
        delete(t);
    end
end


close(newVid)
