% Sample data
x = 1:10;
y1 = rand(1, 10);
y2 = rand(1, 10);
y3 = rand(1, 10);
y4 = rand(1, 10);

% Create a single figure
figure;

% Plot 1
subplot(2, 2, 1);
plot(x, y1, '-r', x, y2, '--b');
title('Plot 1: Data 1 and Data 2');
xlabel('X-axis');
ylabel('Y-axis');
legend('Data 1', 'Data 2');

% Plot 2
subplot(2, 2, 2);
plot(x, y3, '-g', x, y4, ':k');
title('Plot 2: Data 3 and Data 4');
xlabel('X-axis');
ylabel('Y-axis');
legend('Data 3', 'Data 4');

% Repeat for additional plots if needed
