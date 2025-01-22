% Set up the serial port for data reception
serialPort = 'COM10'; % Change this to your COM port
baudRate = 115200; % Change this to your baud rate
s = serialport(serialPort, baudRate);
 serialPortSend = 'COM9'; % Change this to your second COM port
 sSend = serialport(serialPortSend, 9600);

% Set up the figure for real-time data
figure;
h = animatedline('Color', 'r');
ax = gca;
ax.YGrid = 'on';
ax.YLim = [0 5024]; % Adjust based on your data range

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
fftAx.YLim = [0 2500]; % Set y-axis range for FFT plot
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

% Initialize variables
startTime = datetime('now');
bufferSize = 900; % Number of points to buffer before updating plot
buffer = nan(bufferSize, 2); % Pre-allocate buffer
bufferIndex = 1;
power2 = 0;
prevPower = NaN;
% Continuously read and plot data
while ishandle(h)
    % Read data from the serial port
    if s.NumBytesAvailable > 0
        data = readline(s);
        data = str2double(data); % Convert string to double
        
        % Get current time
        t = datetime('now') - startTime;
        
        % Store data in buffer
        buffer(bufferIndex, :) = [datenum(t), data];
        bufferIndex = bufferIndex + 1;
        
        % If buffer is full, update plot and reset buffer
        if bufferIndex > bufferSize
            % Update real-time plot
            
            addpoints(h, buffer(:, 1), buffer(:, 2));
            ax.XLim = datenum([t-seconds(5) t+seconds(1)]);
            datetick('x', 'keeplimits');
            drawnow;
            
            % Perform FFT
            Y = fft(buffer(:, 2));
            L = length(Y);
            P2 = abs(Y/L);
            P1 = P2(1:L/2+1);
            P1(2:end-1) = 2*P1(2:end-1);
            f = (0:(L/2))/L * (1/seconds(t));
            
            % Update FFT plot
            clearpoints(fftPlot);
            addpoints(fftPlot, f, P1);
            drawnow;
            
            % Calculate and update power plot
            power = var(buffer(:, 2))/1000000; % Variance as a measure of power
 if ~isnan(prevPower) % Ensure prevPower is valid
                % Check conditions for power2
                if prevPower >= 0 && prevPower <= 1.5
                    if power >= 1.5 && power <= 2.3
                    power2 = 3;
                    elseif power >= 2.3 && power <= 3.5
                    power2 = 6;

                     else 
     power2 = 0;
                    end
                
             elseif prevPower >= 1.5 && prevPower <= 2.3
                   if power >= 2.3 && power <= 3.5
                    power2 = 6;
                     else 
     power2 = 0;
                   end     



                    elseif prevPower >= 2.4 && prevPower <= 3.0
                
     power2 = 0;
                    end   
                end
                 
              
                
          
            addpoints(powerPlot, datenum(t), power);
            powerAx.XLim = datenum([t-seconds(5) t+seconds(1)]);
            datetick('x', 'keeplimits');
            drawnow;
            
            
             writeline(sSend, num2str(power2));
            prevPower = power;
            % Reset buffer index
            bufferIndex = 1;
       
        end

    end
end
 Close the serial ports
clear s sSend;