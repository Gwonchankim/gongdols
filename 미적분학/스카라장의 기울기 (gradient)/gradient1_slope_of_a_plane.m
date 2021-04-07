clear; close all; clc;

%%

% f(x,y)= x^2+xy+y^2 �׸���
x=-1:0.2:1;
y=-1:0.2:1;

for i_x=1:length(x)
    for i_y=1:length(y)
        f(i_x,i_y)=x(i_x)^2+x(i_x)*y(i_y)+y(i_y)^2;
    end
end

figure;
surf(x,y,f)
xlabel('x'); ylabel('y'); zlabel('f(x,y)')
hold on;

%% Gradient

% x���� ���� quiver �׸���

u_x=zeros(length(x),length(y));
v_x=zeros(length(x),length(y));
w_x=zeros(length(x),length(y));

for i_x=1:length(x)
    for i_y=1:length(y)
        u_x(i_x,i_y)=2*x(i_x)+y(i_y);
    end
end

quiver3(x,y,f,u_x,v_x,w_x)
view([-36, 80])
xlim([-1.5, 1.5])
ylim([-1.5, 1.5])

% y���� ���� quiver �׸���

u_y=zeros(length(x),length(y));
v_y=zeros(length(x),length(y));
w_y=zeros(length(x),length(y));

for i_x=1:length(x)
    for i_y=1:length(y)
        v_y(i_x,i_y)=x(i_x)+2*y(i_y);
    end
end

quiver3(x,y,f,u_y,v_y,w_y)
view([-36, 80])
xlim([-1.5, 1.5])
ylim([-1.5, 1.5])
% xy���� ���� quiver �׸���

u_xy=zeros(length(x),length(y));
v_xy=zeros(length(x),length(y));
w_xy=zeros(length(x),length(y));

for i_x=1:length(x)
    for i_y=1:length(y)
        u_xy(i_x,i_y)=2*x(i_x)+y(i_y);
        v_xy(i_x,i_y)=x(i_x)+2*y(i_y);
    end
end

quiver3(x,y,f,u_xy,v_xy,w_xy)
view([-36, 80])
xlim([-1.5, 1.5])
ylim([-1.5, 1.5])

