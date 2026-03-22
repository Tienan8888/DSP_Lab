function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    // thuc hien phep tich chap hai mang bang ham co san
    yn = convol(xn, hn);

    // tinh vi tri goc thoi gian moi cho tin hieu ngo ra
    yorigin = xorigin + horigin - 1;

    // tao truc thoi gian cho cac tin hieu de ve do thi
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;

    // tim gioi han chung de can deu do thi
    n_min = min(min(nx), min(nh), min(ny));
    n_max = max(max(nx), max(nh), max(ny));
    v_min = min(min(yn), min(xn), min(hn), 0);
    v_max = max(max(yn), max(xn), max(hn));
    my_bounds = [n_min - 1, v_min - 2.5; n_max + 1, v_max + 1.5];

    figure();

    // ve do thi input signal
    subplot(3, 1, 1);
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
    title('Input Signal x(n)'); xlabel('n'); ylabel('Amplitude');

    // ve do thi impulse response
    subplot(3, 1, 2);
    plot2d3(nh, hn);
    e2 = gce(); e2.children.thickness = 2;
    plot(nh, hn, 'bo');
    a2 = gca(); a2.data_bounds = my_bounds;
    for i = 1:length(nh)
        if hn(i) >= 0 then
            xstring(nh(i) - 0.05, hn(i) + 0.5, string(hn(i)));
        else
            xstring(nh(i) - 0.1, hn(i) - 1.9, string(hn(i)));
        end
    end
    title('Impulse Response h(n)'); xlabel('n'); ylabel('Amplitude');

    // ve do thi output signal
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
    title('Output Signal y(n) = x(n) * h(n)'); xlabel('n'); ylabel('Amplitude');
endfunction
