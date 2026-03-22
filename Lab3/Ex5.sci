function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    // xac dinh truc thoi gian cua tung tin hieu rieng biet
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    // xac dinh gioi han truc thoi gian chung cho ca hai tin hieu
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    ny = n_min:n_max;

    // khoi tao hai mang chua toan so khong de dong bo
    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));

    // anh xa du lieu tu mang goc sang mang chung
    y1( (n1(1) - n_min + 1) : (n1($) - n_min + 1) ) = x1n;
    y2( (n2(1) - n_min + 1) : (n2($) - n_min + 1) ) = x2n;

    // nhan tung phan tu cua hai mang da duoc dong bo
    yn = y1 .* y2;

    // tinh vi tri goc thoi gian moi
    yorigin = 1 - n_min;

    // tim gioi han chung de ve do thi
    v_min = min(min(yn), 0);
    v_max = max(max(yn), max(max(x1n), max(x2n)));
    my_bounds = [n_min - 1, v_min - 2.5; n_max + 1, v_max + 1.5];

    figure(); 
    
    // ve do thi tin hieu thu nhat
    subplot(3, 1, 1);
    plot2d3(n1, x1n); 
    e1 = gce(); e1.children.thickness = 2; 
    plot(n1, x1n, 'ro'); 
    a1 = gca(); a1.data_bounds = my_bounds; 
    
    for i = 1:length(n1)
        if x1n(i) >= 0 then
            xstring(n1(i) - 0.05, x1n(i) + 0.5, string(x1n(i)));
        else
            xstring(n1(i) - 0.1, x1n(i) - 1.9, string(x1n(i)));
        end
    end
    title('Signal x1(n)'); xlabel('n'); ylabel('Amplitude');

    // ve do thi tin hieu thu hai
    subplot(3, 1, 2);
    plot2d3(n2, x2n); 
    e2 = gce(); e2.children.thickness = 2;
    plot(n2, x2n, 'bo'); 
    a2 = gca(); a2.data_bounds = my_bounds; 
    
    for i = 1:length(n2)
        if x2n(i) >= 0 then
            xstring(n2(i) - 0.05, x2n(i) + 0.5, string(x2n(i)));
        else
            xstring(n2(i) - 0.1, x2n(i) - 1.9, string(x2n(i)));
        end
    end
    title('Signal x2(n)'); xlabel('n'); ylabel('Amplitude');

    // ve do thi tin hieu tich
    subplot(3, 1, 3);
    plot2d3(ny, yn); 
    e3 = gce(); e3.children.thickness = 2;
    plot(ny, yn, 'mo'); 
    a3 = gca(); a3.data_bounds = my_bounds; 
    
    for i = 1:length(ny)
        if yn(i) >= 0 then
            xstring(ny(i) - 0.05, yn(i) + 0.5, string(yn(i)));
        else
            xstring(ny(i) - 0.1, yn(i) - 1.9, string(yn(i)));
        end
    end
    title('Signal y(n) = x1(n) .* x2(n)'); xlabel('n'); ylabel('Amplitude');
endfunction
