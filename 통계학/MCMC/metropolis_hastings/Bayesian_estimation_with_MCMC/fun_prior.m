function res = fun_prior(x)
% observation�� ���� �� ��հ��� ����� �� �̶�� ���� ������ �� ����.
% ���� prior�� ��հ��� ����̴� ��� ������ ������ ���������� ������ ������� ��.
1
if x(1) <= 0
    res = eps; % ���� Log-likelihood�� ���� ���̱� ������ Log(0)�� ���ǵ��� �����Ƿ� epsilon ���� �־���.
else
    res = 1;
end
