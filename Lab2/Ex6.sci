clf(); // Xoa sach do thi cu

// Dinh nghia truc thoi gian chung n tu -2 den 4
n = -2:4;

// Dong bo x1(n) va x2(n)
x1 = [0, 0, 0, 1, 3, -2, 0];
x2 = [0, 0, 1, 2, 3, 0, 0];
y = x1 + x2;

// Cai dat gioi han truc chung de de so sanh (X: -2.5 den 4.5, Y: -3.5 den 7.5)
my_bounds = [-2.5, -3.5; 4.5, 7.5];

// --- Ve do thi Signal x1(n) ---
subplot(3, 1, 1);
plot2d3(n, x1);
e1 = gce(); e1.children.thickness = 2;
plot(n, x1, 'ko', 'MarkerFaceColor', 'k');
a = gca(); a.data_bounds = my_bounds; // Mo rong truc X, Y
for i = 1:length(n)
    if x1(i) >= 0 then
        xstring(n(i) - 0.05, x1(i) + 0.5, string(x1(i))); // So duong: day len tren
    else
        xstring(n(i) - 0.1, x1(i) - 1.9, string(x1(i))); // So am: day xuong duoi
    end
end
title('Signal x_1(n)'); xlabel('n'); ylabel('Amplitude');

// --- Ve do thi Signal x2(n) ---
subplot(3, 1, 2);
plot2d3(n, x2);
e2 = gce(); e2.children.thickness = 2;
plot(n, x2, 'bo', 'MarkerFaceColor', 'b');
a = gca(); a.data_bounds = my_bounds; 
for i = 1:length(n)
    if x2(i) >= 0 then
        xstring(n(i) - 0.05, x2(i) + 0.5, string(x2(i)));
    else
        xstring(n(i) - 0.1, x2(i) - 1.9, string(x2(i)));
    end
end
title('Signal x_2(n)'); xlabel('n'); ylabel('Amplitude');

// --- Ve do thi Output Signal y(n) ---
subplot(3, 1, 3);
plot2d3(n, y);
e3 = gce(); e3.children.thickness = 2;
plot(n, y, 'ro', 'MarkerFaceColor', 'r');
a = gca(); a.data_bounds = my_bounds; 
for i = 1:length(n)
    if y(i) >= 0 then
        xstring(n(i) - 0.05, y(i) + 0.5, string(y(i)));
    else
        xstring(n(i) - 0.1, y(i) - 1.9, string(y(i)));
    end
end
title('Output Signal y(n) = x_1(n) + x_2(n)'); xlabel('n'); ylabel('Amplitude');
