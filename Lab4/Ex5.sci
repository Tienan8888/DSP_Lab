// 1. Cài đặt và tải thư viện IPCV
// atomsInstall('IPCV'); Chạy 1 lần để phần mềm được tải về Scilab
atomsLoad('IPCV');

// 2. Đọc ảnh RGB từ máy tính : Ví dụ em lấy ảnh logo HCMUT trường mình
img_rgb = imread('E:\Code\C++\DSPLab\Lab4\hcmut.png'); 

// 3. Chuyển đổi ảnh màu sang ảnh xám (Grayscale)
img_gray = rgb2gray(img_rgb);

// 4. Tạo bộ lọc làm mờ (Average filter kích thước 5x5)
// Tăng kích thước bộ lọc lên 35x35 để thấy rõ hiệu ứng làm mờ
h_blur = fspecial('average', 35);
img_blur = imfilter(img_gray, h_blur);

// 5. Hiển thị kết quả lên cùng một cửa sổ đồ họa
figure();

// Hàng 1: Hiển thị ảnh
subplot(2, 2, 1); 
imshow(img_rgb); 
title('1. Ảnh gốc (RGB Color)');

subplot(2, 2, 2); 
imshow(img_gray); 
title('2. Ảnh xám (Grayscale)');

// Hàng 2: Hiển thị Histogram và Ảnh đã làm mờ
subplot(2, 2, 3); 
// Lấy mảng dữ liệu đếm số lượng pixel (count) và các mức xám (cells)
[count, cells] = imhist(img_gray); 
// Vẽ đồ thị dạng cột (plot2d3) để ép nó hiện vào subplot
plot2d3(cells, count); 
title('3. Biểu đồ Histogram của Ảnh xám');

subplot(2, 2, 4); 
imshow(img_blur); 
title('4. Ảnh xám sau khi làm mờ (Blur)');
