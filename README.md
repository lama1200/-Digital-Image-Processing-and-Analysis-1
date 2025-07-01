````markdown
# Digital-Image-Processing-Assignment

## Project Overview
This repository contains solutions for  *Digital Image Processing and Analysis* course (CSC478, 2nd Semester 1446). It covers noise identification, Gaussian low-pass filtering, and periodic noise removal techniques implemented in MATLAB.

## Objective
Design and implement image processing methods to:
- Identify and classify noise types in given images.
- Apply appropriate denoising filters.
- Demonstrate frequency-domain filtering for periodic noise removal.

## System Features
The assignment includes three main workflows:

1. **Noise Identification & Denoising**
   - Analyze noisy images to determine noise type.
   - Compare Geometric Mean, Alpha-Trimmed, Standard Median, and Adaptive Median filters.

2. **Gaussian Low-Pass Filtering**
   - Implement a function to create Gaussian low-pass filters with configurable cutoff frequencies.
   - Evaluate effects at multiple cutoff values (D0 = 10, 30, 60, 160, 460).

3. **Periodic Noise Removal (Band-Reject Filter)**
   - Compute the FFT of the noisy image and locate periodic noise spikes.
   - Design a Gaussian Band-Reject filter by subtracting two low-pass filters.
   - Apply the filter in the frequency domain and reconstruct the denoised result.

## Dataset Design
- **Input Images**: Two provided noisy images (`NoisyIm1.png`, `NoisyIm2.png`).
- **Scripts**:
  - `task1.m`
  - `task2.m`
  - `task3.m`
- **Results**: Outputs and figures saved in the `results/` directory.

# Open MATLAB and run scripts
matlab -batch "run('scripts/task1_noise_denoise.m')"
matlab -batch "run('scripts/task2_gaussian_filter.m')"
matlab -batch "run('scripts/task3_band_reject.m')"
````

## Challenges

* Precisely identifying noise types via spatial and frequency domain analysis.
* Balancing detail preservation against noise removal for different filters.
* Designing an effective band-reject filter to target periodic noise spikes.

## Tools and Technologies

* **MATLAB R2023a**
* **Image Processing Toolbox**
* **FFT-based frequency analysis**

## Authors

* **Lama Alotibie** 

```
```
