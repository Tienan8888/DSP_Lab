function [yn, yorigin] = fold(xn, xorigin)
    // 1. Dao nguoc mang va tinh vi tri goc moi
    yn = xn($:-1:1);
    L = length(xn);
    yorigin = L - xorigin + 1;

    // 2. Tao truc thoi gian n cho x(n) va y(n)
    nx = (1:L) - xorigin; 
    ny = (1:L) - yorigin; 

    // --- tim gioi han chung de can deu hai do thi ---
    n_min = min(min(nx), min(ny));
    n_max = max(max(nx), max(ny));
    v_min = min(min(xn), 0); 
    v_max = max(xn);
    my_bounds = [n_min - 1, v_min - 2.5; n_max + 1, v_max + 1.5];

    // 3. Ve do thi
    figure(); 
    
    // --- Ve do thi Signal x(n) ---
    subplot(2,1,1);
    plot2d3(nx, xn); 
    e1 = gce(); e1.children.thickness = 2; 
    plot(nx, xn, 'ro'); 
    a1 = gca(); a1.data_bounds = my_bounds; 
    
    for i = 1:length(nx)
        if xn(i) >= 0 then
            xstring(nx(i) - 0.05, xn(i) + 0.5, string(xn(i)));
        else
            xstring(nx(i) - 0.1, xn(i) - 1.9, string(xn(i)));
        end
    end
    title('Signal x(n)'); xlabel('n'); ylabel('Amplitude');

    // --- Ve do thi Signal y(n) = x(-n) ---
    subplot(2,1,2);
    plot2d3(ny, yn); 
    e2 = gce(); e2.children.thickness = 2;
    plot(ny, yn, 'bo'); 
    a2 = gca(); a2.data_bounds = my_bounds; 
    
    for i = 1:length(ny)
        if yn(i) >= 0 then
            xstring(ny(i) - 0.05, yn(i) + 0.5, string(yn(i)));
        else
            xstring(ny(i) - 0.1, yn(i) - 1.9, string(yn(i)));
        end
    end
    title('Signal y(n) = x(-n)'); xlabel('n'); ylabel('Amplitude');
endfunction
