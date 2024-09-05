% Convert rows to variables
s = rows2vars(combined50HZfiles);

% Define number of features and columns
numFeatures = 35; % Total number of features to compute
numColumns = 44; % Number of columns from Var2 to Var45

% Initialize matrix to store features for each feature type
featureMatrix = zeros(numColumns, numFeatures);
% Loop through each column from Var2 to Var45
for i = 2:45
    X = s.(sprintf('Var%d', i));
    
    % Compute EMG features
    f1 = jfemg('wa', X);     % Willison Amplitude
    f2 = jfemg('card', X);   % Cardinality
    f3 = jfemg('emav', X);    % Enhanced Mean Absolute Value
    f4 = jfemg('aac', X);     % Average Amplitude Change
    f5 = jfemg('wl', X);      % Waveform Length
    f6 = jfemg('mfl', X);     % Maximum Fractal Length 
    f7 = jfemg('rms', X);     % Root Mean Square
    f8 = jfemg('ewl', X);     % Enhanced Waveform Length
    f9 = jfemg('asm', X);     % Absolute Sum of the Mean
    f10 = jfemg('ass', X);     % Absolute Sum of the Squares
    f11 = jfemg('msr', X);    % Mean Value of the Square Root
    f12 = jfemg('ltkeo', X);  % Log Teager-Kaiser Energy Operator
    f13 = jfemg('lcov', X);   % Log Coefficient of Variation
    f14 = jfemg('ldasdv', X); % Log Difference Absolute Standard Deviation Value
    f15 = jfemg('ldamv', X);  % Log Difference Absolute Mean Value
    f16 = jfemg('dvarv', X);  % Difference Variance Value
    f17 = jfemg('ssi', X);    % Simple Square Integral
    f18 = jfemg('vo', X);     % V-Order
    opts.order = 3;
    f19 = jfemg('tm', X, opts);     % Temporal Moment
    % Compute new features
    f20 = jfemg('mmav', X);   % Modified Mean Absolute Value
    f21 = jfemg('mmav2', X);  % Modified Mean Absolute Value 2
    f22 = jfemg('iemg', X);   % Integrated EMG
    f23 = jfemg('dasdv', X);  % Difference Absolute Standard Deviation Value
    f24 = jfemg('damv', X);   % Difference Absolute Mean Value
    f25 = jfemg('vare', X);   % Variance of EMG
    f26 = jfemg('ld', X);     % Log Detector
    f27 = jfemg('mav', X);    % Mean Absolute Value
    opts.thres = 0.01;
    f28 = jfemg('zc', X, opts);     % Zero Crossing
    opts.thres = 0.01;
    f29 = jfemg('ssc', X, opts);    % Slope Sign Change
    f30 = jfemg('mad', X);    % Mean Absolute Deviation
    f31 = jfemg('iqr', X);    % Interquartile Range
    f32 = jfemg('cov', X);    % Coefficient of Variation
    f33 = jfemg('sd', X);     % Standard Deviation
    f34 = jfemg('var', X);    % Variance
    f35 = jfemg('ae', X);     % Average Energy

    % Store features in respective columns
    featureMatrix(i-1, 1) = f1;
    featureMatrix(i-1, 2) = f2; 
    featureMatrix(i-1, 3) = f3;   
    featureMatrix(i-1, 4) = f4;   
    featureMatrix(i-1, 5) = f5; 
    featureMatrix(i-1, 6) = f6;   
    featureMatrix(i-1, 7) = f7;   
    featureMatrix(i-1, 8) = f8;   
    featureMatrix(i-1, 9) = f9;   
    featureMatrix(i-1, 10) = f10; 
    featureMatrix(i-1, 11) = f11; 
    featureMatrix(i-1, 12) = f12; 
    featureMatrix(i-1, 13) = f13; 
    featureMatrix(i-1, 14) = f14; 
    featureMatrix(i-1, 15) = f15;
    featureMatrix(i-1, 16) = f16; 
    featureMatrix(i-1, 17) = f17; 
    featureMatrix(i-1, 18) = f18;
    featureMatrix(i-1, 19) = f19;
    featureMatrix(i-1, 20) = f20; 
    featureMatrix(i-1, 21) = f21;
    featureMatrix(i-1, 22) = f22; 
    featureMatrix(i-1, 23) = f23; 
    featureMatrix(i-1, 24) = f24; 
    featureMatrix(i-1, 25) = f25; 
    featureMatrix(i-1, 26) = f26;
    featureMatrix(i-1, 27) = f27; 
    featureMatrix(i-1, 28) = f28; 
    featureMatrix(i-1, 29) = f29; 
    featureMatrix(i-1, 30) = f30;
    featureMatrix(i-1, 31) = f31;
    featureMatrix(i-1, 32) = f32; 
    featureMatrix(i-1, 33) = f33; 
    featureMatrix(i-1, 34) = f34;
    featureMatrix(i-1, 35) = f35; 

 
    

end
% Define the filename for the CSV
filename = 'F:\ahmed\650hz.csv';

% Save the feature matrix to a CSV file
writematrix(featureMatrix, filename);
% Display the size of the feature matrix
disp(size(featureMatrix));
