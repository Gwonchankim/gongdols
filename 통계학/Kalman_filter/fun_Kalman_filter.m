function [volt, Px, K, x_prior, P_prior, x_posterior, P_posterior] = fun_Kalman_filter(z)
%
%
persistent A H Q R 
persistent x P
persistent firstRun


if isempty(firstRun)
  A = 1;
  H = 1;
  
  Q = 0;
  R = 4;

  x = 14;
  P =  6;
  
  firstRun = 1;  
end

  
xp = A*x; % ���º��� ������ (predicted value for state vector, Prior)
Pp = A*P*A' + Q; % ���� ���л� ������ (Prior)

K = Pp*H'*inv(H*Pp*H' + R); % Į�� �̵�

x = xp + K*(z - H*xp); % ���� ���� ������ (Posterior)
P = Pp - K*H*Pp; % ���� ���л� ��� �� (Posterior)

x_prior = xp;
P_prior = Pp;

x_posterior = x;
P_posterior = P;

volt = x;
Px   = P;