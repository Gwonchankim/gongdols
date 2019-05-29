function ani_pushbutton
% clear; close all; clc;

% pushbutton�� �̿��� graph�� ������ �ٲ㺸��.
% ��, slider�� �Բ� �̿��ؼ� graph�� linewidth�� �ٲ㺸��.


fs = 200;
t = 0:1/fs:5-1/fs;
x = sin(2*pi*1*t);

h = plot(t,x,'color','r','linewidth',1);
set(gca,'position',[0.0883 0.11 0.7576 0.815]);
ButtonH = uicontrol('style','pushbutton','Position',[488 366 60 60],'callback',@callbackfcn);
set(ButtonH, 'string',sprintf('color change'));

% addlistener(ButtonH, 'Value','PostSet',@callbackfcn

    function callbackfcn(src, event)
        if isequal(h.Color,[1,0,0])
            gca;
            cla;
            h = plot(t,x,'color','b','linewidth',1);
        elseif isequal(h.Color,[0 0 1])
            gca;
            cla;
            h = plot(t,x,'color','r','linewidth',1);
        end
        
    end

end