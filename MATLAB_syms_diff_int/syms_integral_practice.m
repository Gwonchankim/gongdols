% MATLAB�� �̿��� ���� ����
% ���� ��ó: http://mathpool.tistory.com/entry/%EC%A0%81%EB%B6%84-%EC%97%B0%EC%8A%B5-%EB%B6%80%EC%A0%95%EC%A0%81%EB%B6%84%EA%B3%BC-%EC%A0%95%EC%A0%81%EB%B6%84-%EC%97%B0%EC%8A%B5%EB%AC%B8%EC%A0%9C%EA%B8%B0%EB%B3%B8

%% ����
syms x

%% 1) ���� �������� ���� ���Ͽ��� int 2x when x: from 1 to 2

int(2*x,x,1,2)

%% 2) ��������~

ans2 = int(2*x^3-3*x+1);

collect(ans2) % collect: ���Լ��� ��� ����
expand(ans2)