// Dinh nghia truc thoi gian n va tin hieu x(n)
n = -1:1;
x = [1, 3, -2];

// Tao tin hieu dao thoi gian x(-n) bang cach lat nguoc mang x
x_fold = x($:-1:1); // x(-n) = [-1, -3, 2]

// Tinh toan thanh phan chan xe(n) va thanh phan le xo(n)
xe = 0.5 * (x + x_fold);
xo = 0.5 * (x - x_fold);

// --- Ve do thi Original Signal x(n) ---
subplot(3, 1, 1);
plot2d3(n, x);
a = gca(); 
a.data_bounds = [-2, -3; 2, 4]; // Mo rong truc: X tu -2 den 2, Y tu -3 den 4
e1 = gce(); e1.children.thickness = 2; // Lam day coc len muc 2
plot(n, x, 'ko', 'MarkerFaceColor', 'k'); // Dong cham tron den len dinh
title('Original Signal x(n)');
xlabel('n');
ylabel('Amplitude');

// --- Ve do thi Even Component xe(n) ---
subplot(3, 1, 2);
plot2d3(n, xe);
a = gca(); 
a.data_bounds = [-2, -3; 2, 4]; // Dong bo truc toa do de de so sanh
e2 = gce(); e2.children.thickness = 2;
plot(n, xe, 'bo', 'MarkerFaceColor', 'b'); // Dong cham tron xanh bien
title('Even Component x_e(n)');
xlabel('n');
ylabel('Amplitude');

// --- Ve do thi Odd Component xo(n) ---
subplot(3, 1, 3);
plot2d3(n, xo);
a = gca(); 
a.data_bounds = [-2, -3; 2, 4]; // Dong bo truc toa do de de so sanh
e3 = gce(); e3.children.thickness = 2;
plot(n, xo, 'mo', 'MarkerFaceColor', 'm'); // Dong cham tron mau tim
title('Odd Component x_o(n)');
xlabel('n');
ylabel('Amplitude');
