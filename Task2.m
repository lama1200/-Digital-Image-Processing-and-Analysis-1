%lama alotibie 443201044
%% Task 2: Gaussian Low-Pass Filter Implementation

% --- (a) Define Gaussian Low-Pass Filter Function ---
function H = lpGaussianFilter(M, N, D0, center)
    [U, V] = meshgrid(1:N, 1:M);
    D = sqrt((U - center(2)).^2 + (V - center(1)).^2);
    H = exp(-(D.^2) / (2 * D0^2));
end

% --- (b) Use NoisyIm1 for testing filter ---
I = imread('NoisyIm1.png'); 
if size(I, 3) == 3
    I = rgb2gray(I);
end
I = im2double(I);

[M, N] = size(I);
center = [M/2, N/2];

D0_values = [10, 30, 60, 160, 460];

% Display Filters
figure('Name', 'Gaussian Low-Pass Filters');
for i = 1:length(D0_values)
    H = lpGaussianFilter(M, N, D0_values(i), center);
    subplot(2, 3, i);
    imshow(H, []);
    title(['D0 = ', num2str(D0_values(i))]);
end

% Apply filters to the image
figure('Name', 'Filtered Images using Gaussian LPF');
for i = 1:length(D0_values)
    H = lpGaussianFilter(M, N, D0_values(i), center);
    
    % FFT
    F = fft2(I);
    F_shifted = fftshift(F);
    
    % Apply filter in frequency domain
    G = F_shifted .* H;
    
    % Inverse FFT
    I_filtered = real(ifft2(ifftshift(G)));
    
    % Show result
    subplot(2, 3, i);
    imshow(I_filtered, []);
    title(['Filtered, D0 = ', num2str(D0_values(i))]);
end
