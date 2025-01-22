% Define the y values
a = Y;

% Create an x vector that matches the length of y
x = 1:length(a);

% Create a plot for y vs. Index
figure; % Open a new figure window
plot(x, a);
title('Plot of y vs. Index');
xlabel('Index');
ylabel('y');
grid on;

% Create a plot for the power of the data
figure; % Open a new figure window
powerPlot = animatedline('Color', 'b');
powerAx = gca;
powerAx.YGrid = 'on';
powerAx.YLim = [0 5000]; % Adjust based on your expected power range
title('Power of Data');
xlabel('Index');
ylabel('Power');

% Calculate the power of the data
power = var(a); % Variance as a measure of power

% Update the power plot
addpoints(powerPlot, x(end), power); % Add the power value at the current index
powerAx.XLim = [0 length(a)];
drawnow;
