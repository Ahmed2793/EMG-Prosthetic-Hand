

%% Generate a sample random signal X
fs = 1000;            % Sampling frequency 
Ts = 1 / fs;          % Period
t  = 0 : Ts : 0.25; 
X  = 0.01 * (cos(2 * pi * fs * t) + randn(1, length(t)));

% Plot sample signal
plot(t,X);  grid on
xlabel('Number of samples');
ylabel('Amplitude');
fs = 1000;            % Sampling frequency 
Ts = 1 / fs;          % Period
t  = 0 : Ts : 0.25; 
X  = 0.01 * (cos(2 * pi * fs * t) + randn(1, length(t)));

% Enhanced Mean Absolute Value
f1 = jfemg('emav', X); 
% Average Amplitude Change
f2 = jfemg('aac', X); 
% Waveform Length
f3 = jfemg('wl', X); 
% Maximum Fractal Length 
f4 = jfemg('mfl', X); 
% Root Mean Square
f5 = jfemg('rms', X); 

% Feature vector
feat = [f1, f2, f3, f4, f5];


