function res = fun_transition_model(x)
% transition model Ȥ�� proposal distribution ����
% ���⼭�� ǥ�������� 0.5�� ���Ժ����� �����Ͽ���.
% ���⼭ 0.5��� ���� ���Ƿ� �����ϸ� �Ǵ� hyperparameter�̸�,
% �� hyperparameter�� ������ ���� ���� �ӵ��� ���� ��.

res = [randn(1, 1) * 0.5 + x(1), x(2)]; % x(1)�� ���� ���� ���ο� ��հ�, x(2)�� ǥ�� ������ ���ؼ� Ȯ���� ǥ�� ����
