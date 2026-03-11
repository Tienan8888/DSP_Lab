clf (); // Xoa do thi cu
// 1. Tin hieu tuong tu xa(t) trong 5 chu ky
t = 0:0.0001:0.1;
xa = 3 ∗ sin(100 ∗ %pi ∗ t);
subplot(3 , 1, 1);
plot(t , xa);
xtitle ("Tin hieu tuong tu xa(t)", "Thoi gian t (s)", "Bien do");
// 2. Tin hieu roi rac x(n) trong 5 chu ky
n = 0:29;
xn = 3 ∗ sin(%pi ∗ n / 3);
subplot(3 , 1, 2);
plot2d3(n, xn);
xtitle ("Tin hieu roi rac x(n)", "Mau n", "Bien do");
// 3. Tin hieu luong tu hoa xq(n) theo phuong phap cat cut
delta = 0.1;
xq = delta ∗ floor(xn / delta );
subplot(3 , 1, 3);
plot2d3(n, xq);
xtitle ("Tin hieu luong tu hoa xq(n) (Delta = 0.1)" , "Mau n", "Bien do");
