// xac dinh truc thoi gian va gia tri cua tin hieu x
n = -3:5;
xn = zeros(1, length(n));
for i = 1:length(n)
    if n(i) >= -3 & n(i) <= -1 then
        xn(i) = 1 + n(i)/3;
    elseif n(i) >= 0 & n(i) <= 3 then
        xn(i) = 1;
    end
end

// cau c ve tin hieu x tru n cong 4
n_c = -2:8;
xc = zeros(1, length(n_c));
for i = 1:length(n_c)
    // lay chi so k la tru n cong 4
    k = -n_c(i) + 4;
    if k >= -3 & k <= 3 then
        // tim vi tri tuong ung trong mang xn ban dau
        idx = find(n == k);
        xc(i) = xn(idx);
    end
end

// tim gioi han chung de can deu do thi
n_min = min(min(n), min(n_c));
n_max = max(max(n), max(n_c));
v_min = 0; 
v_max = 1;
my_bounds = [n_min - 1, v_min - 0.5; n_max + 1, v_max + 0.5];

figure();
// --- Ve do thi x(n) ---
subplot(2,1,1);
plot2d3(n, xn); 
e1 = gce(); e1.children.thickness = 2;
plot(n, xn, 'ro'); 
a1 = gca(); a1.data_bounds = my_bounds;

for i = 1:length(n)
    if xn(i) > 0 then 
        // Lam tron 2 chu so thap phan cho gon (vi du: 0.33, 0.67)
        val = round(xn(i)*100)/100;
        xstring(n(i) - 0.15, xn(i) + 0.15, string(val));
    end
end
title('Signal x(n)'); xlabel('n'); ylabel('Amplitude');

// --- Ve do thi x(-n+4) ---
subplot(2,1,2);
plot2d3(n_c, xc); 
e2 = gce(); e2.children.thickness = 2;
plot(n_c, xc, 'bo'); 
a2 = gca(); a2.data_bounds = my_bounds;

for i = 1:length(n_c)
    if xc(i) > 0 then
        // Lam tron 2 chu so thap phan
        val = round(xc(i)*100)/100;
        xstring(n_c(i) - 0.15, xc(i) + 0.15, string(val));
    end
end
title('Signal x(-n+4)'); xlabel('n'); ylabel('Amplitude');
