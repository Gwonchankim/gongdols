function res = fun_acceptance(x, x_new)
% Likelihood * Prior�� ��
% x�� x_new�� ��� Likelihood  * Prior�� ����.
% x�� ������ x�� ���� L * P �̰� x_new�� ���Ӱ� ���ȵ� x�� ���� L * P ��.

if x_new > x
    res = true;
    
else
    accept = rand(1);
    
    if accept < exp(x_new-x) % log-likelihood �� �̿��� ���� ����̹Ƿ� exponential�� �̿��� �ٽ� ������ �쵵�� �����־�� ��.
        res = true;
    else
        res= false;
    end
end
