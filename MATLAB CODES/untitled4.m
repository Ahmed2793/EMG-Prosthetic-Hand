% Set up the serial port for data reception
serialPort = 'COM10'; % Change this to your COM port
baudRate = 115200; % Change this to your baud rate
s = serialport(serialPort, baudRate);

% Set up the figure for real-time data
figure;
h = animatedline('Color', 'r');
ax = gca;
ax.YGrid = 'on';
ax.YLim = [-1.5 1.5]; % Adjust based on your data range

% Set up the title and labels
title('Real-time Serial Data Plot');
xlabel('Time');
ylabel('Data');

% Set up the figure for FFT
figure;
fftPlot = animatedline('Color', 'r');
fftAx = gca;
fftAx.YGrid = 'on';
yticks(fftAx, 0:20:2500); % Set y-axis ticks at intervals of 10
fftAx.YLim = [0 10]; % Set y-axis range for FFT plot
title('FFT of Serial Data');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Set up the figure for Power
figure;
powerPlot = animatedline('Color', 'b');
powerAx = gca;
powerAx.YGrid = 'on';
powerAx.YLim = [0 5]; % Adjust based on your expected power range
title('Power of Buffer Data');
xlabel('Time');
ylabel('Power');
Fs = 5000; % Sampling frequency in Hz (change as necessary)
[b, a] = butter(1, [20 500]/(Fs/2), 'bandpass'); % 1st-order bandpass filter
Fs = 5000; % Sampling frequency
disp('Filter coefficients b:');
disp(b);
disp('Filter coefficients a:');
disp(a);

% Initialize variables
startTime = datetime('now');
bufferSize = 900; % Number of points to buffer before updating plot
buffer = nan(bufferSize, 2); % Pre-allocate buffer
bufferIndex = 1;

% Add a separate buffer with size 5000


% Continuously read and plot data
while ishandle(h)
    % Read data from the serial port
    if s.NumBytesAvailable > 0
        data = readline(s);
        data = str2double(data); % Convert string to double
       data = double(data); % Ensure data is numeric
        % Get current time
        t = datetime('now') - startTime;
        
        % Store data in buffer
        buffer(bufferIndex, :) = [datenum(t), data];
        bufferIndex = bufferIndex + 1;
        
      
        
        if bufferIndex > bufferSize
            dataToFilter=buffer(:, 2);
       if any(isnan(dataToFilter)) || any(isinf(dataToFilter))
    warning('dataToFilter contains NaNs or Infs.');
    dataToFilter = fillmissing(dataToFilter, 'constant', 0); % Replace NaNs with zeros, if needed
    dataToFilter = dataToFilter(isfinite(dataToFilter)); % Remove Infs
    % Ensure dataToFilter is a column vector
      dataToFilter = dataToFilter(:);

end
            % Apply bandpass filter
            filteredData = filter(b, a, dataToFilter);
            disp('Size of dataToFilter:');
disp(size(dataToFilter));
disp('Class of dataToFilter:');
disp(class(dataToFilter));
disp('First few values of dataToFilter:');
disp(dataToFilter(1:10)); % Display the first 10 values for inspection

            % Normalize data
            filteredData = 2 * ((filteredData- min(filteredData))) / (max(filteredData) - min(filteredData)) - 1;
            buffer(:, 2) = filteredData;
            addpoints(h, buffer(:, 1), buffer(:, 2));
            ax.XLim = datenum([t-seconds(5) t+seconds(1)]);
            datetick('x', 'keeplimits');
            drawnow;
            % Perform FFT
            writematrix(buffer(:, 2), 'F:\end11.csv');
            Y = fft(buffer(:, 2));
            L = length(Y);
            P2 = abs(Y/L);
            P1 = P2(1:L/2+1);
            P1(2:end-1) = 2*P1(2:end-1);
            f = (0:(L/2))/L * (1/seconds(t));
              % Check for NaNs or Infs
         dataToFilter=buffer(:, 2);

            % Update FFT plot
            clearpoints(fftPlot);
            addpoints(fftPlot, f, P1);
            drawnow;
            
            % Calculate and update power plot
            power = var(buffer(:, 2))*10; % Variance as a measure of power
            addpoints(powerPlot, datenum(t), power);
            powerAx.XLim = datenum([t-seconds(5) t+seconds(1)]);
            datetick('x', 'keeplimits');
            drawnow;
            
            % Reset buffer index
            bufferIndex = 1;
        end
        
        % If the new buffer is full, reset its index
      
    end
end

% Close serial port when done
clear s;
