function [yn, yorigin] = delay(xn, xorigin, k)
    // 1. Tính toán ngõ ra
    yn = xn; // Đây là tín hiệu gốc y(n) = x(n)
    yorigin = xorigin - k; // Delay gốc tọa độ đi k đơn vị của tín hiệu x(n - k)

    // 2. Tạo trục thời gian
    L = length(xn); // Tạo độ dài L bằng dộ dài của mảng x(n) cũng như x(n-k)
    nx = (1:L) - xorigin; // (1:L) là khai báo mảng [1,2,3,4,..L] sau đó trừ xorign đơn vị để ép tọa độ 0 về vị trí của gốc tọa độ theo đề bài [1 - xorigin,2 - xorigin,3 - xorigin,4 - xorigin,..L - xorigin]
    ny = (1:L) - yorigin; //  mảng x(n - k) thì ép gốc tọa độ 0 về đúng vị trí và delay k đơn vị 

    // Tìm giới hạn chung của 2 dồ thị
    n_min = min(min(nx), min(ny));// Tìm min của giá trị trục hoành của x(n) và y(n-k)
    n_max = max(max(nx), max(ny));// Tìm max của giá trị trục hoành của x(n) và y(n-k)
    v_min = min(min(xn), 0); // Tìm min của giá trị trục tung của x(n) và y(n-k)
    v_max = max(xn);// Tìm max của giá trị trục tung của x(n) và y(n-k)
    
    // Tạo my_bounds chung: nới rộng trên/dưới để có khoảng trống in chữ xstring
    my_bounds = [n_min - 1, v_min - 2.5; n_max + 1, v_max + 1.5];

    // 3. Vẽ đồ thị
    figure(); 
    
    // --- Vẽ đồ thị Signal x(n) ---
    subplot(2,1,1);
    plot2d3(nx, xn); 
    e1 = gce(); e1.children.thickness = 2; // Tăng độ dày cột
    plot(nx, xn, 'ro'); // Dùng màu đỏ cho tín hiệu gốc
    a1 = gca(); a1.data_bounds = my_bounds; // Ép khung để hiện thị rõ các giá trị trong khung
    
    for i = 1:length(nx)
        if xn(i) >= 0 then
            xstring(nx(i) - 0.05, xn(i) + 0.5, string(xn(i)));
        else
            xstring(nx(i) - 0.1, xn(i) - 1.9, string(xn(i)));
        end
    end
    title('Signal x(n)'); xlabel('n'); ylabel('Amplitude');

    // --- Vẽ đồ thị Signal y(n) ---
    subplot(2,1,2);
    plot2d3(ny, yn); 
    e2 = gce(); e2.children.thickness = 2;
    plot(ny, yn, 'bo'); // Dùng màu xanh cho tín hiệu trễ
    a2 = gca(); a2.data_bounds = my_bounds; // Ép khung
    
    for i = 1:length(ny)
        if yn(i) >= 0 then
            xstring(ny(i) - 0.05, yn(i) + 0.5, string(yn(i)));
        else
            xstring(ny(i) - 0.1, yn(i) - 1.9, string(yn(i)));
        end
    end
    title('Signal y(n) = x(n - ' + string(k) + ')'); xlabel('n'); ylabel('Amplitude');
endfunction
