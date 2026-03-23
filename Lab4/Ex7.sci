// khoi tao tin hieu
xn = [1, 2, -3, 2, 1];
hn = [1, 0, -1, -1, 1];
N = length(xn);

// 1. tinh chap vong bang phuong phap gap dich
yn_fold = zeros(1, N);
for n = 1:N
    sum_val = 0;
    for k = 1:N
        // tinh chi so dich vong bang ham pmodulo
        idx = pmodulo((n-1) - (k-1), N) + 1;
        sum_val = sum_val + hn(k) * xn(idx);
    end
    yn_fold(n) = sum_val;
end

// 2. tinh chap vong bang phuong phap ma tran
x_circ = zeros(N, N);
for n = 1:N
    for k = 1:N
        idx = pmodulo((n-1) - (k-1), N) + 1;
        x_circ(n, k) = xn(idx);
    end
end
yn_matrix = x_circ * hn';
yn_matrix = yn_matrix';

// tao truc thoi gian
n_axis = 0:N-1;

// tinh nang luong
ex = xn.^2;
ey = yn_matrix.^2;

// thiet lap gioi han cho do thi
bound_signal = [-1, -5; 5, 5];
bound_energy = [-1, -2; 5, 20];

// ve do thi tong hop
figure();

// ve tin hieu x
subplot(2, 2, 1);
plot2d3(n_axis, xn); e = gce(); e.children.thickness = 2;
plot(n_axis, xn, 'ro');
a1 = gca(); a1.data_bounds = bound_signal;
title('tin hieu x(n)');

// ve nang luong cua x
subplot(2, 2, 2);
plot2d3(n_axis, ex); e = gce(); e.children.thickness = 2;
plot(n_axis, ex, 'mo');
a2 = gca(); a2.data_bounds = bound_energy;
title('nang luong cua x(n)');

// ve tin hieu y
subplot(2, 2, 3);
plot2d3(n_axis, yn_matrix); e = gce(); e.children.thickness = 2;
plot(n_axis, yn_matrix, 'bo');
a3 = gca(); a3.data_bounds = bound_signal;
title('tin hieu y(n)');

// ve nang luong cua y
subplot(2, 2, 4);
plot2d3(n_axis, ey); e = gce(); e.children.thickness = 2;
plot(n_axis, ey, 'go');
a4 = gca(); a4.data_bounds = bound_energy;
title('nang luong cua y(n)');
