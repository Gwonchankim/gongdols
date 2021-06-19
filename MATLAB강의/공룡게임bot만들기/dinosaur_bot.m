clear; close all; clc;
% ���� ����: http://www.trex-game.skipser.com/
% ���콺 ���� ����: https://docs.oracle.com/javase/6/docs/api/java/awt/Robot.html
% Ű���� ��ư �̸� ����: https://docs.oracle.com/javase/6/docs/api/java/awt/event/KeyEvent.html
% ��ũ���� ����: https://kr.mathworks.com/matlabcentral/fileexchange/31383-screenshotrgb-make-a-screenshot-using-robot-java-class

import java.awt.Robot;
import java.awt.event.*;
robot = Robot;

% Restart
robot.mouseMove(630, 450);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.keyPress(java.awt.event.KeyEvent.VK_SPACE)

while(1)
    % ���� �տ� �����ؾ� �� �繰�� ��Ÿ���°�?
    img1 = screenShotRGB(500,460,24,27);
    % ���� �տ� ������ �� �繰�� ��Ÿ���°�?
    img2 = screenShotRGB(550,430,24,27);
    
%     montage({img1, img2})
    %     temp = [temp sum(img(:))];
    if sum(img1(:)) < 4e5
        % spacebar ������
         robot.keyPress(java.awt.event.KeyEvent.VK_SPACE)
    elseif sum(img2(:)) < 4e5
        robot.keyPress(java.awt.event.KeyEvent.VK_DOWN)
        robot.keyRelease(java.awt.event.KeyEvent.VK_DOWN)
    end
    
end