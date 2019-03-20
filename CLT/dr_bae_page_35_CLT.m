clear; close all; clc;

% ���͹��� ���� ����������� å�� �ִ� ������ ���� ����� ������.
% ������ 35.
% 160909 ������

% data=1:3; % (1)�� ���̽�
data=zeros(1,10); data(1)=1; % (2)�� ���̽�.


n_iter=1000;
n_extract=400;
sum_collection=zeros(n_iter,1);
for i_iter=1:n_iter
    temp_sum=0;
    for i_extract=1:n_extract
        temp1=randperm(size(data,2));
        temp2=randperm(size(data,2));
        data_extract=[data(temp1(1)) data(temp2(1))];
        temp_sum=temp_sum+sum(data_extract);
    end
    sum_collection(i_iter,1)=temp_sum;
    clear temp_sum;
    hist(sum_collection,round(i_iter/10));
%     xlim([n_extract*4-n_extract/2 n_extract*4+n_extract/2])
    drawnow
end

hist(sum_collection,round(n_iter/10));
% xlim([n_extract*4-n_extract/2 n_extract*4+n_extract/2])