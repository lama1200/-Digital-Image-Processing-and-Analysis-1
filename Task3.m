%lama alotibie 443201044
%% Task 3: Periodic Noise Removal using Band-Reject Gaussian Filter

% Step 1: Load the noisy image
img3 = imread('PnoiseIm3.png');
if size(img3, 3) == 3
    img3 = rgb2gray(img3);
end
img3 = im2double(img3);

% Step 2: Get size and center
[rows, cols] = size(img3);
cx = rows / 2;
cy = cols / 2;

% Step 3: Perform FFT and shift
F_img3 = fft2(img3);
F_shift = fftshift(F_img3);
F_magnitude = log(1 + abs(F_shift));

% Step 4: Create Band-Reject Gaussian Filter
[x, y] = meshgrid(1:cols, 1:rows);
D = sqrt((x - cy).^2 + (y - cx).^2);

D1 = 30;  % Lower bound
D2 = 50;  % Upper bound

% Construct Gaussian LPFs
LPF_D1 = exp(-(D.^2) / (2 * D1^2));
LPF_D2 = exp(-(D.^2) / (2 * D2^2));

% Band-Reject Filter: difference of two LPFs
BR_filter = LPF_D2 - LPF_D1;

% Step 5: Apply the filter in frequency domain
F_filtered = F_shift .* BR_filter;

% Step 6: Inverse FFT
F_ifft = ifft2(ifftshift(F_filtered));
img3_denoised = real(F_ifft);

%% Step 7: Display results in 3 separate figures

% Figure 1: Noisy image + its FFT
figure;
subplot(2,1,1), imshow(img3, []), title('Original Noisy Image 3', 'FontWeight', 'bold');
subplot(2,1,2), imshow(F_magnitude, []), title('FFT Magnitude Spectrum', 'FontWeight', 'bold');

% Figure 2: The Band-Reject Filter only
figure;
imshow(BR_filter, []), title('Band-Reject Gaussian Filter', 'FontWeight', 'bold');

% Figure 3: The final filtered image only
figure;
 imshow(img3_denoised, []), title('Filtered Image 3', 'FontWeight', 'bold');
