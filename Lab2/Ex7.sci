clf(); // Xoa sach do thi cu truoc khi ve

// Dinh nghia truc thoi gian chung n tu -2 den 4
n = -2:4;

// Dong bo x1(n) va x2(n) ve cung truc n bang cach chen them so 0
x1 = [0, 0, 0, 1, 3, -2, 0];
x2 = [0, 0, 1, 2, 3, 0, 0];

// Thuc hien phep nhan hai tin hieu (chu y dung toan tu .*)
y = x1 .* x2;

// Cai dat gioi han truc chung (X: -2.5 den 4.5, Y: -3.5 den 11) de so 9 hien thi ro
my_bounds = [-2.5, -3.5; 4.5, 11];

// --- Ve do thi Signal x1(n) ---
subplot(3, 1, 1);
plot2d3(n, x1);
e1 = gce(); e1.children.thickness = 2;
plot(n, x1, 'ko', 'MarkerFaceColor', 'k');
a = gca(); a.data_bounds = my_bounds;
for i = 1:length(n)
    if x1(i) >= 0 then
        xstring(n(i) - 0.05, x1(i) + 0.5, string(x1(i)));
    else
        xstring(n(i) - 0.1, x1(i) - 2.5, string(x1(i)));
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
title('Output Signal y(n) = x_1(n) .* x_2(n)'); xlabel('n'); ylabel('Amplitude');
