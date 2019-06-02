clear; close all; clc;
% ���� ����: http://www.trex-game.skipser.com/
% ���콺 ���� ����: https://docs.oracle.com/javase/6/docs/api/java/awt/Robot.html
% Ű���� ��ư �̸� ����: https://docs.oracle.com/javase/6/docs/api/java/awt/event/KeyEvent.html
% ��ũ���� ����: https://kr.mathworks.com/matlabcentral/fileexchange/31383-screenshotrgb-make-a-screenshot-using-robot-java-class

import java.awt.Robot;
import java.awt.event.*;
robot = Robot;

% Restart
robot.mouseMove(483, 502);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.mouseRelease(InputEvent.BUTTON1_MASK);
% temp = [];
while(1)
    % ���� �տ� �����ؾ� �� �繰�� ��Ÿ���°�?
    img = screenShotRGB(226,528,24,27);
    %     temp = [temp sum(img(:))];
    if sum(img(:)) < 4e5
        % spacebar ������
        robot.keyPress(java.awt.event.KeyEvent.VK_SPACE)
    end
    
    % ���� �տ� ������ �� �繰�� ��Ÿ���°�?
    img = screenShotRGB(216,449,29,19);
    %     temp = [temp sum(img(:))];
    if sum(img(:)) < 4e5
        % spacebar ������
        robot.keyPress(java.awt.event.KeyEvent.VK_DOWN)
        robot.keyRelease(java.awt.event.KeyEvent.VK_DOWN)
    end
    
end