// khoi tao tin hieu dau vao
xn = [1, 2, -3, 2, 1];
hn = [1, 0, -1];
lx = length(xn);
lh = length(hn);
ly = lx + lh - 1;

// tinh tich chap bang phuong phap ma tran
x_matrix = zeros(ly, lh);
for i = 1:lh
    x_matrix(i:i+lx-1, i) = xn';
end
yn_matrix = x_matrix * hn';
yn_matrix = yn_matrix'; 

// tao truc thoi gian
nx = 0:lx-1;
ny = 0:ly-1;

// tinh nang luong tung phan tu cua tin hieu
ex = xn.^2;
ey = yn_matrix.^2;

// thiet lap gioi han cho do thi
bound_signal = [-1, -5; 7, 5];
bound_energy = [-1, -2; 7, 18];

// ve do thi tong hop
figure();

// ve tin hieu x
subplot(2, 2, 1);
plot2d3(nx, xn); e = gce(); e.children.thickness = 2;
plot(nx, xn, 'ro');
a1 = gca(); a1.data_bounds = bound_signal;
title('tin hieu x(n)');

// ve nang luong cua x
subplot(2, 2, 2);
plot2d3(nx, ex); e = gce(); e.children.thickness = 2;
plot(nx, ex, 'mo');
a2 = gca(); a2.data_bounds = bound_energy;
title('nang luong cua x(n)');

// ve tin hieu y
subplot(2, 2, 3);
plot2d3(ny, yn_matrix); e = gce(); e.children.thickness = 2;
plot(ny, yn_matrix, 'bo');
a3 = gca(); a3.data_bounds = bound_signal;
title('tin hieu y(n)');

// ve nang luong cua y
subplot(2, 2, 4);
plot2d3(ny, ey); e = gce(); e.children.thickness = 2;
plot(ny, ey, 'go');
a4 = gca(); a4.data_bounds = bound_energy;
title('nang luong cua y(n)');
