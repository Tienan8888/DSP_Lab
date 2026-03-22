xn = [2, 3, 4, 5, 6];
xorigin = 3;
L = length(xn);
n = (1:L) - xorigin;

// tinh tin hieu dao thoi gian
x_fold = xn($:-1:1);
// tim thanh phan chan va le
x_even = 0.5 * (xn + x_fold);
x_odd = 0.5 * (xn - x_fold);

// tim gioi han chung de can deu do thi
n_min = min(n);
n_max = max(n);
v_min = min(x_odd); 
v_max = max(xn);
my_bounds = [n_min - 1, v_min - 1.5; n_max + 1, v_max + 1.5];

figure();
// --- Ve do thi x(n) ---
subplot(3,1,1); 
plot2d3(n, xn); e1 = gce(); e1.children.thickness = 2;
plot(n, xn, 'ro'); a1 = gca(); a1.data_bounds = my_bounds;
for i = 1:length(n)
    xstring(n(i) - 0.05, xn(i) + 0.5, string(xn(i)));
end
title('Signal x(n)'); xlabel('n'); ylabel('Amplitude');

// --- Ve do thi Even  ---
subplot(3,1,2); 
plot2d3(n, x_even); e2 = gce(); e2.children.thickness = 2;
plot(n, x_even, 'bo'); a2 = gca(); a2.data_bounds = my_bounds;
for i = 1:length(n)
    xstring(n(i) - 0.05, x_even(i) + 0.5, string(x_even(i)));
end
title('Even Component x_e(n)'); xlabel('n'); ylabel('Amplitude');

// --- Ve do thi Odd  ---
subplot(3,1,3); 
plot2d3(n, x_odd); e3 = gce(); e3.children.thickness = 2;
plot(n, x_odd, 'mo'); a3 = gca(); a3.data_bounds = my_bounds;
for i = 1:length(n)
    if x_odd(i) >= 0 then
        xstring(n(i) - 0.05, x_odd(i) + 0.5, string(x_odd(i)));
    else
        xstring(n(i) - 0.1, x_odd(i) - 1.5, string(x_odd(i)));
    end
end
title('Odd Component x_o(n)'); xlabel('n'); ylabel('Amplitude');
