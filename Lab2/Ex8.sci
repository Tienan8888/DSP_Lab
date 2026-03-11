// -----------------------------------------------------------------
// FIGURE 1: Original signal and y1(n) = x(-n)
// -----------------------------------------------------------------
scf(1); clf();

// Define the original time vector and signal x(n)
nx = -2:1; 
x = [1, -2, 3, 6];

// Calculate y1(n) = x(-n) (Folding)
ny1 = -nx($:-1:1);
y1 = x($:-1:1);

// Plot original signal x(n)
subplot(2, 1, 1);
plot2d3(nx, x); 
e = gce(); e.children.thickness = 2; 
plot(nx, x, 'ko', 'MarkerFaceColor', 'k');
a = gca(); a.data_bounds = [-3, -3; 3, 8];
for i = 1:length(nx)
    if x(i) >= 0 then xstring(nx(i) - 0.1, x(i) + 0.8, string(x(i))); else xstring(nx(i) - 0.1, x(i) - 1.5, string(x(i))); end
end
title('Original Signal x(n)'); xlabel('n'); ylabel('Amplitude');

// Plot y1(n)
subplot(2, 1, 2);
plot2d3(ny1, y1); 
e = gce(); e.children.thickness = 2; 
plot(ny1, y1, 'ro', 'MarkerFaceColor', 'r');
a = gca(); a.data_bounds = [-3, -3; 3, 8];
for i = 1:length(ny1)
    if y1(i) >= 0 then xstring(ny1(i) - 0.1, y1(i) + 0.8, string(y1(i))); else xstring(ny1(i) - 0.1, y1(i) - 1.5, string(y1(i))); end
end
title('y_1(n) = x(-n)'); xlabel('n'); ylabel('Amplitude');

// -----------------------------------------------------------------
// FIGURE 2: Original signal and y2(n) = x(n+3)
// -----------------------------------------------------------------
scf(2); clf();

// Calculate y2(n) = x(n+3) (Advance by 3)
ny2 = nx - 3;
y2 = x;

// Plot original signal x(n)
subplot(2, 1, 1);
plot2d3(nx, x); 
e = gce(); e.children.thickness = 2; 
plot(nx, x, 'ko', 'MarkerFaceColor', 'k');
a = gca(); a.data_bounds = [-6, -3; 2, 8];
for i = 1:length(nx)
    if x(i) >= 0 then xstring(nx(i) - 0.1, x(i) + 0.8, string(x(i))); else xstring(nx(i) - 0.1, x(i) - 1.5, string(x(i))); end
end
title('Original Signal x(n)'); xlabel('n'); ylabel('Amplitude');

// Plot y2(n)
subplot(2, 1, 2);
plot2d3(ny2, y2); 
e = gce(); e.children.thickness = 2; 
plot(ny2, y2, 'bo', 'MarkerFaceColor', 'b');
a = gca(); a.data_bounds = [-6, -3; 2, 8];
for i = 1:length(ny2)
    if y2(i) >= 0 then xstring(ny2(i) - 0.1, y2(i) + 0.8, string(y2(i))); else xstring(ny2(i) - 0.1, y2(i) - 1.5, string(y2(i))); end
end
title('y_2(n) = x(n+3)'); xlabel('n'); ylabel('Amplitude');

// -----------------------------------------------------------------
// FIGURE 3: Original signal and y3(n) = 2x(-n-2)
// -----------------------------------------------------------------
scf(3); clf();

// Calculate y3(n) = 2x(-n-2) (Folding, delay by 2, amplitude scaling by 2)
ny3 = -nx($:-1:1) - 2;
y3 = 2 * x($:-1:1);

// Plot original signal x(n)
subplot(2, 1, 1);
plot2d3(nx, x); 
e = gce(); e.children.thickness = 2; 
plot(nx, x, 'ko', 'MarkerFaceColor', 'k');
a = gca(); a.data_bounds = [-4, -5; 3, 14];
for i = 1:length(nx)
    if x(i) >= 0 then xstring(nx(i) - 0.1, x(i) + 1.2, string(x(i))); else xstring(nx(i) - 0.05, x(i) - 2.4, string(x(i))); end
end
title('Original Signal x(n)'); xlabel('n'); ylabel('Amplitude');

// Plot y3(n)
subplot(2, 1, 2);
plot2d3(ny3, y3); 
e = gce(); e.children.thickness = 2; 
plot(ny3, y3, 'mo', 'MarkerFaceColor', 'm');
a = gca(); a.data_bounds = [-4, -5; 3, 14];
for i = 1:length(ny3)
    if y3(i) >= 0 then xstring(ny3(i) - 0.1, y3(i) + 0.3, string(y3(i))); else xstring(ny3(i) - 0.05, y3(i) - 2, string(y3(i))); end
end
title('y_3(n) = 2x(-n-2)'); xlabel('n'); ylabel('Amplitude');
