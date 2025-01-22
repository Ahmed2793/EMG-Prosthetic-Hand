x=fist.values;
y=fist.VarName2;
sampling_rate = 1000; % in Hz
% Plotting the EMG signal
figure;
plot(y, x);
title('EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Optional: Add some basic signal processing (e.g., filtering)
% Define a low-pass filter to remove high-frequency noise
cutoff_freq = 150; % in Hz
[b, a] = butter(4, cutoff_freq/(sampling_rate/2), 'low');
filtered_emg = filtfilt(b, a, x);

% Plot the filtered EMG signal
figure;
plot(y, filtered_emg);
title('Filtered EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;