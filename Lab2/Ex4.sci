// Declare the time axis n from -5 to 5
n = -5:5;

// Create a unit ramp signal ur(n)
// bool2s(n >= 0) returns 1 when n >= 0 and 0 when n < 0
// .* is the multiplication of each corresponding element of the two arrays
ur = n .* bool2s(n >= 0);

// Plot the discrete signal
plot2d3(n, ur);

// Add titles and labels to the axes for a clearer plot
title('Unit Ramp Signal u_r(n)');

xlabel('n');

ylabel('Amplitude');  
