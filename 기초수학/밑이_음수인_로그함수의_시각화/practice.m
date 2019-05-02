% --------------- ���: ���� ��̰� ���� �� ����. --------------------- %

clear; close all; clc;

x = linspace(eps,3,10000);

%% ���� ����� ���
y = log(x);
figure;
plot(x, y);
grid on;
%% ���� ������ ���
y = log(x)/log(-2);

figure;
plot(x,real(y))
hold on;
plot(x,imag(y))

figure;
my_color = jet(length(x));
scatter(real(y), imag(y),10,my_color);
xlim([min(real(y)) max(real(y))])
ylim([min(imag(y)), max(imag(y))])
cbar = colorbar;
colormap(my_color)