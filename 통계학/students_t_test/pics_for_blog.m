clear; close all; clc;

%% Fig. 1
xx1_1 = linspace(-2, 6, 500);

xx1_2 = linspace(1, 9, 500);

yy1_1 = pdf('Normal',xx1_1, 2, 1.25);
yy1_2 = pdf('Normal',xx1_2, 5, 1.25);

figure('position',[374, 433, 560, 219]);
plot(xx1_1, yy1_1,'linewidth',2)
hold on;
plot(xx1_2, yy1_2,'linewidth',2);
xlabel('x');
ylabel('f(x)');
ylim([0, 0.4])
grid on
set(gca,'fontsize',12)

line([2 2] - 1.25, ylim,'color','k','linestyle','--')
line([2 2], ylim,'color','k','linestyle','--')
line([2 2] + 1.25, ylim,'color','k','linestyle','--')

% line([5 5] - 1.25, ylim,'color','k','linestyle','--')
line([5 5], ylim,'color','k','linestyle','--')
% line([5 5] + 1.25, ylim,'color','k','linestyle','--')
%% Fig. 2

xx2_1 = linspace(-4, 4, 500);
xx2_2 = xx1_2;

yy2_1 = pdf('Normal',xx2_1, 0, 1.25);
yy2_2 = yy1_2;

figure('position',[374, 433, 560, 219]);
plot(xx2_1, yy2_1,'linewidth',2);
hold on;
plot(xx2_2, yy2_2,'linewidth',2);
xlabel('x');
ylabel('f(x)');
ylim([0, 0.4])
grid on
set(gca,'fontsize',12)

%% Fig. 3

xx3_1 = xx1_1;
xx3_2 = xx1_2;

yy3_1 = pdf('Normal',xx3_1, 2, 0.25);
yy3_2 = pdf('Normal',xx3_2, 5, 0.25);

figure('position',[374, 433, 560, 219]);
plot(xx3_1, yy3_1,'linewidth',2);
hold on;
plot(xx3_2, yy3_2,'linewidth',2);
xlabel('x');
ylabel('f(x)');
ylim([0, 1.7])
grid on
set(gca,'fontsize',12)

%% t-������ dof�� Ŀ�� ���� normal distribution�� ���������.
figure;
dofs = 5:5:50;
xx = linspace(-10, 10, 500);

my_colors = jet(length(dofs));

for i_dof = 1:length(dofs)
    
    yy = pdf('T',xx, dofs(i_dof));
    
    plot(xx, yy,'color',my_colors(i_dof,:))
    hold on;
end

yy_normal = pdf('Normal', xx, 0, 1);
plot(xx, yy_normal,'color','k','linewidth',3)

