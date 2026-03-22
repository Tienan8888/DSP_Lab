// thiet lap truc thoi gian tu tru hai den sau
n = -2:6;
L = length(n);
xn = zeros(1, L);

// tao tin hieu x ban dau
for i = 1:L
    if n(i) >= 0 & n(i) <= 3 then
        xn(i) = 1;
    end
end

// tinh ngo ra y bang x cua n binh phuong
yn = zeros(1, L);
for i = 1:L
    k = n(i)^2;
    idx = find(n == k);
    if ~isempty(idx) then 
        yn(i) = xn(idx); 
    end
end

// tinh y dich tre hai mau
y_delay2 = zeros(1, L);
for i = 1:L
    k = n(i) - 2;
    idx = find(n == k);
    if ~isempty(idx) then 
        y_delay2(i) = yn(idx); 
    end
end

// tinh x dich tre hai mau
x_delay2 = zeros(1, L);
for i = 1:L
    k = n(i) - 2;
    idx = find(n == k);
    if ~isempty(idx) then 
        x_delay2(i) = xn(idx); 
    end
end

// tinh ngo ra y2 tu x dich tre hai mau
y2 = zeros(1, L);
for i = 1:L
    k = n(i)^2;
    idx = find(n == k);
    if ~isempty(idx) then 
        y2(i) = x_delay2(idx); 
    end
end

// ham ho tro ve do thi can le chuan
function drawPlot(pos, n_val, x_val, t_str, c_str)
    subplot(3, 1, pos);
    plot2d3(n_val, x_val);
    e = gce(); e.children.thickness = 2;
    plot(n_val, x_val, c_str + 'o');
    // ep khung nhin thoang dang
    a = gca(); a.data_bounds = [-3, -0.5; 7, 1.5];
    for i = 1:length(n_val)
        if x_val(i) > 0 then
            xstring(n_val(i) - 0.1, x_val(i) + 0.2, string(x_val(i)));
        end
    end
    title(t_str);
endfunction

// cua so mot the hien x va y cung y dich tre
figure();
drawPlot(1, n, xn, '(1) Signal x(n)', 'k');
drawPlot(2, n, yn, '(2) Signal y(n) = x(n^2)', 'b');
drawPlot(3, n, y_delay2, '(3) Signal y(n-2)', 'r');

// cua so hai the hien x dich tre va y2
figure();
drawPlot(1, n, x_delay2, '(4) Signal x2(n) = x(n-2)', 'k');
drawPlot(2, n, y2, '(5) Signal y2(n) = x2(n^2)', 'm');

