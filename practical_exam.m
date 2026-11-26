clc;
clear;
close all;

fs = 1000;
t = 0:1/fs:0.1;
x = sin(2*pi*100*t);

L = 3;

x_interp = interp(x,L);
fs_interp = L*fs;
t_interp = (0:length(x_interp)-1)/fs_interp;

M = 2;

x_dec = decimate(x,M);
fs_dec = fs/M;
t_dec = (0:length(x_dec)-1)/fs_dec;

x_new = resample(x,L,M);
fs_new = fs*L/M;
t_new = (0:length(x_new)-1)/fs_new;

fprintf("Original Sampling Frequency = %.2f Hz\n",fs);
fprintf("After Interpolation L = %.2f, fs = %.2f Hz\n",L,fs_interp);
fprintf("After Decimation M = %.2f, fs = %.2f Hz\n",M,fs_dec);
fprintf("After Resampling L/M, fs = %.2f Hz\n",fs_new);

figure;

subplot(4,1,1);
plot(t,x);
grid on;
title("Original Signal");
xlabel("Time(s)");
ylabel("Amplitude");

subplot(4,1,2);
plot(t_interp,x_interp);
grid on;
title("Interpolated Signal");
xlabel("Time(s)");
ylabel("Amplitude");

subplot(4,1,3);
plot(t_dec,x_dec);
grid on;
title("Decimated Signal");
xlabel("Time(s)");
ylabel("Amplitude");

subplot(4,1,4);
plot(t_new,x_new);
grid on;
title("Resampled Signal");
xlabel("Time(s)");
ylabel("Amplitude");
