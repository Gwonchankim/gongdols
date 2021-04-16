clear; close all; clc;

measurements = [5, 6, 7, 9, 10];
motion = [1, 1, 2, 1, 1];
measurement_sig = 4;
motion_sig = 2;

mu = 0;
sig = 10;

xx = linspace(-2, 15, 1000);
yy1 = normpdf(xx, mu, sig);

my_color = lines(3);
clear h

figure;
h(1) = plot(xx, yy1,'color',my_color(1,:),'linewidth',2); hold on; % ù Prior
ylim([0, 0.35])
disp('ù Prior ����');
pause
for i = 1:length(measurements)
    yy2 = normpdf(xx, measurements(i), measurement_sig);
    
    if i>1
        delete(h(2));
    end
    
    h(2) = plot(xx, yy2,'color',my_color(2,:),'linewidth',2); % measurement ���� ��
    disp('measure��');
    pause;
    
    [mu, sig] = update(mu, sig, measurements(i), measurement_sig);
    yy1 = normpdf(xx, mu, sig);
    
    if i>1
        delete(h(3));
    end
    
    
    h(3) = plot(xx, yy1,'color',my_color(3,:),'linewidth',2); hold on; % Posterior�� ����.
    disp('measure�� ���� Prior�� Posterior�� ������Ʈ ��.');
    pause;
    
%     disp(['Update:',num2str(mu),'/',num2str(sig)]);
    
    [mu, sig] = predict(mu, sig, motion(i), motion_sig);
    yy1 = normpdf(xx, mu, sig);
    
    delete(h(1))
    h(1) = plot(xx, yy1,'color',my_color(1,:),'linewidth',2); hold on; % ���� Prior ������.
    disp('������ Prior�� �̵�');
    pause;
%     disp(['Predict:',num2str(mu),'/',num2str(sig)]);
end

function [new_mean, new_var] = predict(mean1, var1, mean2, var2)

new_mean = mean1 + mean2;
new_var = var1 + var2;
% new_var = var1;

end

function [new_mean, new_var] = update(mean1, var1, mean2, var2)

new_mean = (var2 * mean1 + var1 * mean2) / (var1 + var2);
new_var = 1/(1/var1 + 1/var2);

end
