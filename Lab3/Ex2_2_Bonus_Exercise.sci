// dinh nghia ham ve do thi con
function draw_subplot(pos, n_val, x_val, t_str, c_str)
    // doi thanh ba hang mot cot cho do thi 
    subplot(3, 1, pos);
    plot2d3(n_val, x_val);
    e = gce(); e.children.thickness = 2;
    plot(n_val, x_val, c_str + 'o');
    // noi rong khung nhin: x tu tru 7 den 9, y tu tru 1.2 den 1.8 
    a = gca(); a.data_bounds = [-7, -1.2; 9, 1.8];
    title(t_str);
endfunction

// tao truc thoi gian rong de bao quat tat ca phep bien doi
n = -5:8;
L = length(n);
xn = zeros(1, L);

// tao tin hieu x goc theo hinh ve de bai
for i = 1:L
    if n(i) >= -1 & n(i) <= 2 then
        xn(i) = 1;
    elseif n(i) == 3 | n(i) == 4 then
        xn(i) = 0.5;
    end
end

// khoi tao cac mang chua ket qua
xa = zeros(1, L); 
xb = zeros(1, L); 
xc = zeros(1, L); 
xd = zeros(1, L); 
xe = zeros(1, L); 
xf = zeros(1, L); 
x_minus_n = zeros(1, L); 

// tinh toan tung gia tri tren mang
for i = 1:L
    // cau a dich tre hai mau
    k_a = n(i) - 2;
    idx_a = find(n == k_a);
    if ~isempty(idx_a) then xa(i) = xn(idx_a); end
    
    // cau b gap va dich bon mau
    k_b = 4 - n(i);
    idx_b = find(n == k_b);
    if ~isempty(idx_b) then xb(i) = xn(idx_b); end
    
    // cau c dich som hai mau
    k_c = n(i) + 2;
    idx_c = find(n == k_c);
    if ~isempty(idx_c) then xc(i) = xn(idx_c); end
    
    // cau d nhan voi ham buoc nhay lat
    if n(i) <= 2 then
        xd(i) = xn(i);
    end
    
    // cau e nhan voi xung luc tai vi tri n bang ba
    if n(i) == 3 then
        k_e = n(i) - 1;
        idx_e = find(n == k_e);
        if ~isempty(idx_e) then xe(i) = xn(idx_e); end
    end
    
    // cau f ham binh phuong thoi gian
    k_f = n(i)^2;
    idx_f = find(n == k_f);
    if ~isempty(idx_f) then xf(i) = xn(idx_f); end
    
    // chuan bi mang dao thoi gian de tinh chan le
    k_minus = -n(i);
    idx_minus = find(n == k_minus);
    if ~isempty(idx_minus) then x_minus_n(i) = xn(idx_minus); end
end

// cau g va h tinh thanh phan chan va le
xg = 0.5 * (xn + x_minus_n);
xh = 0.5 * (xn - x_minus_n);

// cua so mot
figure();
draw_subplot(1, n, xn, 'Original x(n)', 'k');
draw_subplot(2, n, xa, '(a) x(n-2)', 'r');
draw_subplot(3, n, xb, '(b) x(4-n)', 'g');

// cua so hai
figure();
draw_subplot(1, n, xc, '(c) x(n+2)', 'b');
draw_subplot(2, n, xd, '(d) x(n)u(2-n)', 'm');
draw_subplot(3, n, xe, '(e) x(n-1)delta(n-3)', 'c');

// cua so ba
figure();
draw_subplot(1, n, xf, '(f) x(n^2)', 'r');
draw_subplot(2, n, xg, '(g) Even part of x(n)', 'b');
draw_subplot(3, n, xh, '(h) Odd part of x(n)', 'g');
