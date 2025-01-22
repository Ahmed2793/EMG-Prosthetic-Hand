% Sample data
x = 1:6000;
% Assuming the EMG signal is in the first column
emg_signal =Book1.values;

% Sampling frequency (Hz) - you need to specify the correct sampling frequency
fs = 1700; % Example value, change to your actual sampling frequency
fs1=5750;

% Butterworth filter design
[b0, a0] = butter(4, [20, 100] / (fs / 2), 'bandpass');
[b1, a1] = butter(4, [100, 200] / (fs / 2), 'bandpass');
[b2, a2] = butter(4, [20, 100] / (fs1 / 2), 'bandpass');
[b3, a3] = butter(4, [100, 200] / (fs1 / 2), 'bandpass');


% Apply the filter to the EMG signal
filtered_emg_signal0 = filtfilt(b0, a0, emg_signal);
filtered_emg_signal1 = filtfilt(b1, a1, emg_signal);
filtered_emg_signal2 = filtfilt(b2, a2, emg_signal);
filtered_emg_signal3 = filtfilt(b3, a3, emg_signal);
analytic_signal = hilbert(filtered_emg_signal);
magnitude = abs(analytic_signal);

% Plot in Figure 1
figure;

% Plot 1
subplot(2, 2, 1);
plot(x, emg_signal, x, filtered_emg_signal0);
title('Plot 1: Data and Data 0');
xlabel('X-axis');
ylabel('Y-axis');
legend('Data ', 'Data 0');

% Plot 2
subplot(2, 2, 2);
plot(x, emg_signal, x, filtered_emg_signal1);
title('Plot 2: Data  and Data 1');
xlabel('X-axis');
ylabel('Y-axis');
legend('Data ', 'Data 1');


% Plot 1
subplot(2, 2, 3);
plot(x, emg_signal, x, filtered_emg_signal2);
title('Plot 1: Data  and Data 2');
xlabel('X-axis');
ylabel('Y-axis');
legend('Data ', 'Data 2');

% Plot 2
subplot(2, 2, 4);
plot(x, emg_signal, x, filtered_emg_signal3);
title('Plot 2: Data and Data 3');
xlabel('X-axis');
ylabel('Y-axis');
legend('Data ', 'Data 4');


% Repeat for additional figures if needed
