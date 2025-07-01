%lama alotibie 443201044
%% Task 1: Noise Identification and Denoising

% Step 1: Read Noisy Images
NoisyIm1 = imread('NoisyIm1.png');  % Presumed Gaussian Noise
NoisyIm2 = imread('NoisyIm2.png');  % Presumed Salt & Pepper Noise

% Convert to grayscale if needed
if size(NoisyIm1, 3) == 3
    NoisyIm1 = rgb2gray(NoisyIm1);
end
if size(NoisyIm2, 3) == 3
    NoisyIm2 = rgb2gray(NoisyIm2);
end

% Convert to double
NoisyIm1 = double(NoisyIm1);
NoisyIm2 = double(NoisyIm2);

%% Step 2: Strip Profile - Row 50
stripRow = 50;
strip1 = NoisyIm1(stripRow, :);
strip2 = NoisyIm2(stripRow, :);

figure;
subplot(2,2,1), imshow(NoisyIm1, []), title('Noisy Image 1');
subplot(2,2,2), plot(strip1), title(['Strip Profile - Row ' num2str(stripRow) ' (NoisyIm1)']);
xlabel('Pixel Index'), ylabel('Intensity');

subplot(2,2,3), imshow(NoisyIm2, []), title('Noisy Image 2');
subplot(2,2,4), plot(strip2), title(['Strip Profile - Row ' num2str(stripRow) ' (NoisyIm2)']);
xlabel('Pixel Index'), ylabel('Intensity');

%% Step 3: Denoising

% For Noisy Image 1 (Gaussian Noise)
% 1. Geometric Mean Filter
filter_size = 5;
Denoised1_GeometricMean = nlfilter(NoisyIm1, [filter_size filter_size], @(x) exp(mean(log(x(:) + eps))));

% 2. Alpha-Trimmed Mean Filter
d = 2; 
Denoised1_AlphaTrim = ordfilt2(NoisyIm1, (9 - d / 2), ones(5,5)); 

% For Noisy Image 2 (Salt & Pepper Noise)
% 1. Median Filter 
Denoised2_Median = medfilt2(NoisyIm2, [3 3]);

% 2. Adaptive Median Filter (simulated using larger median filter)
Denoised2_Adaptive = medfilt2(NoisyIm2, [5 5]);

%% Step 4: Display Filtered Results
figure;
subplot(2,2,1), imshow(Denoised1_GeometricMean, []), title('Geometric Mean Filter (NoisyIm1)');
subplot(2,2,2), imshow(Denoised1_AlphaTrim, []), title('Alpha-Trimmed Mean (NoisyIm1)');
subplot(2,2,3), imshow(Denoised2_Median, []), title('Median Filter (NoisyIm2)');
subplot(2,2,4), imshow(Denoised2_Adaptive, []), title('Adaptive Median Filter (NoisyIm2)');
