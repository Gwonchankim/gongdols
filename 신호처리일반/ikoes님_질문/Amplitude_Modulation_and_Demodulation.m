clear; close all; clc;

load('data_baseband.mat')

%% (1) �ð� ��ȣ �� ���ļ� ����
Fs = 32.8*10^6;
L = length(data);
t = 0:1/Fs:(L-1)/Fs;
Y = fft(data, L);
f = Fs*(-L/2:(L-1)/2)/L;

Freq = abs(fftshift(Y));
Freq_dB = 20*log10(Freq);

figure('position',[680, 638, 1200, 340]);
subplot(1,2,1);
plot(t,data); xlabel('time (s)');
subplot(1,2,2);
plot(f,Freq); xlabel('freq (Hz)');

%% (2) 
Omega_0 = 3.2*10^6;
carrier = 2 * cos(2*pi*Omega_0*t);
Y = fft(carrier, L);
f = Fs*(-L/2:(L-1)/2)/L;

Carrier_FFT = abs(fftshift(Y));
Carrier_FFT_dB = 20*log10(Carrier_FFT);

figure('position',[680, 638, 1200, 340]);
subplot(1,2,1);
plot(t,carrier); xlabel('time (s)');
xlim([0, 1.5*10^(-6)])
subplot(1,2,2);
plot(f,Carrier_FFT_dB); xlabel('freq (Hz)');

%% (3) Amplitude Modulation ����

data_AM = data.*carrier;
Y2 = 20 * log10(abs(fftshift(fft(data_AM, L))));


figure;
subplot(2,2,1);
plot(t,data); xlabel('time (s)');
xlim([0, 1.5*10^(-5)])
title('Amplitude Modulation ��')
subplot(2,2,2);
plot(f, Freq_dB); xlabel('freq (Hz)');
title('AM �� ���� ��ȣ�� ���ļ� ����')

subplot(2,2,3);
plot(t,data_AM); xlabel('time (s)');
xlim([0, 1.5*10^(-5)])
title('Amplitude Modulation ��')
subplot(2,2,4);
plot(f, Y2); xlabel('freq (Hz)');
title('AM �� ��ȣ�� ���ļ� ����')

%% (4) AM Demodulation
data_AM_demod = data_AM .* cos(2*pi*Omega_0*t);
Y3 = 20 * log10(abs(fftshift(fft(data_AM_demod, L))));

figure;
subplot(2,2,1);
plot(t,data); xlabel('time (s)');
xlim([0, 1.5*10^(-5)])
title('AM ��ȣ')
subplot(2,2,2);
plot(f, Freq_dB); xlabel('freq (Hz)');
title('AM �� ��ȣ�� ���ļ� ����')

subplot(2,2,3);
plot(t,data_AM_demod); xlabel('time (s)');
xlim([0, 1.5*10^(-5)])
title('AM + �ݼ���')
subplot(2,2,4);
plot(f, Y3); xlabel('freq (Hz)');
title('AM + �ݼ����� ���ļ� ����')

%% (5) Lowpass filter ����

load('LPF_1.mat')
LPF1 = LPF;
load('LPF_2.mat')
LPF2 = LPF;
load('LPF_3.mat')
LPF3 = LPF;

data_AM_demod_LPF1 = conv(data_AM_demod, LPF1, 'same');
data_AM_demod_LPF2 = conv(data_AM_demod, LPF2, 'same');
data_AM_demod_LPF3 = conv(data_AM_demod, LPF3, 'same');

freq_data_AM_demod_LPF1= 20 * log10(abs(fftshift(fft(data_AM_demod_LPF1, L))));
freq_data_AM_demod_LPF2= 20 * log10(abs(fftshift(fft(data_AM_demod_LPF2, L))));
freq_data_AM_demod_LPF3= 20 * log10(abs(fftshift(fft(data_AM_demod_LPF3, L))));

% ����ȣ�� ������ ��ȣ ��

figure('position',[680, 96, 907, 882]);
% ���� ��ȣ
subplot(4,2,1);
plot(t,data);
xlim([0, 1.5*10^(-5)])
xlabel('time(s)');
title('���� ��ȣ ����')
subplot(4,2,2);
plot(f, Freq_dB);
xlabel('freq (Hz)');
title('���� ��ȣ�� ���ļ� ����')

% ������ȣ with LPF1
subplot(4,2,3);
plot(t,data_AM_demod_LPF1);
xlim([0, 1.5*10^(-5)])
xlabel('time(s)');
title('LPF 1 �̿��Ͽ� ������ ��ȣ ����')
subplot(4,2,4);
plot(f, freq_data_AM_demod_LPF1);
xlabel('freq (Hz)');
title('LPF 1 �̿��Ͽ� ������ ��ȣ�� ���ļ� ����')

% ������ȣ with LPF2
subplot(4,2,5);
plot(t,data_AM_demod_LPF2);
xlim([0, 1.5*10^(-5)])
xlabel('time(s)');
title('LPF 2 �̿��Ͽ� ������ ��ȣ ����')
subplot(4,2,6);
plot(f, freq_data_AM_demod_LPF2);
xlabel('freq (Hz)');
title('LPF 2 �̿��Ͽ� ������ ��ȣ ���ļ� ����')

% ������ȣ with LPF3
subplot(4,2,7);
plot(t,data_AM_demod_LPF3);
xlim([0, 1.5*10^(-5)])
xlabel('time(s)');
title('LPF 3 �̿��Ͽ� ������ ��ȣ ����')
subplot(4,2,8);
plot(f, freq_data_AM_demod_LPF3);
xlabel('freq (Hz)');
title('LPF 3 �̿��Ͽ� ������ ��ȣ�� ���ļ� ����')