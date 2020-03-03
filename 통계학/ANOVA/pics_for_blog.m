clear; close all; clc;

addpath('D:\���α׷���_�ڵ����\gongdols\�����\')
%% Fig. 1. �� ǥ�� ������ ����

n_tot = 80;

pop_data = randn(n_tot,1) * 10 + 80;
pop_data = round(pop_data/10) * 10;
[~,pop_sort_idx] = sort(pop_data);
pop_data = pop_data(pop_sort_idx);

data = zeros(10,3);
idx_randperm = randperm(n_tot,30);
for i = 1:3
    data(:,i) = pop_data(idx_randperm(1+10*(i-1):10*i));
end

grp = ones(size(pop_data));
grp(idx_randperm(1:10)) = 2;
grp(idx_randperm(11:20)) = 3;
grp(idx_randperm(21:30)) = 4;

k_pop_data = unique(pop_data);

my_colors = [0.9, 0.9, 0.9; lines(3)];

figure('position',[680, 558, 560, 420]);
max_ylim = 1;
for i_data = 1:length(k_pop_data)
    idx = pop_data == k_pop_data(i_data);
    find_idx = find(idx);
    
    if length(find_idx) > max_ylim
        max_ylim = length(find_idx);
    end
    
    for j_data = 1:length(find_idx)
       plot(k_pop_data(i_data), j_data ,'o','markersize',10,'markeredgecolor','k','markerfacecolor',my_colors(grp(find_idx(j_data)),:));
       hold on;
    end
    xlabel('������ (kg)');
    ylabel('count')
    title('���� ����� ��ü�� ������')
end

grid on;
xlim([min(pop_data) max(pop_data)])
ylim([0, max_ylim])

place = {'���� A','���� B','���� C'};

figure('position',[680, 240, 560, 700]);
for i = 1:3
    subplot(3,1,i)
    fun_plot_discrete_hist(data(:,i),'mksize',10,'mkfcolor',my_colors(i+1,:));
    grid on;
    xlim([min(pop_data) max(pop_data)])
    ylim([0 max_ylim/3])
    title([place{i},'�� ���� �����']);
    xlabel('������ (kg)');
    ylabel('count')
end

for i_fig = 1:2
    figure(i_fig);
    saveas(gcf,['D:\angeloyeo.github.io\pics\2020-02-29_ANOVA\pic',num2str(i_fig),'.png']);
end
