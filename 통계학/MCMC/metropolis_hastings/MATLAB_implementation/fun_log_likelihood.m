function res = fun_log_likelihood(x, data)
% likelihood�� ����ϴ� �Լ��� ���Ժ����� ����� likelihood ���

res = sum(-log(x(2) * sqrt(2*pi)) - ((data-x(1)).^2/(2*x(2)^2)));