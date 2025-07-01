```markdown
# Digital Image Processing and Analysis - Assignment 2

## Overview
This repository contains solutions for **Assignment 2** of the *CSC478: Digital Image Processing and Analysis* course (2nd Semester 1446). The assignment focuses on three main tasks:

1. **Noise Identification and Denoising**
2. **Gaussian Low-Pass Filtering**
3. **Periodic Noise Removal using a Band-Reject Filter**

All code is implemented in MATLAB, and results (figures and observations) are included where applicable.

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Repository Structure](#repository-structure)
- [How to Run](#how-to-run)
- [Tasks and Results](#tasks-and-results)
  - [Task 1: Noise Identification and Denoising](#task-1-noise-identification-and-denoising)
  - [Task 2: Gaussian Low-Pass Filtering](#task-2-gaussian-low-pass-filtering)
  - [Task 3: Periodic Noise Removal](#task-3-periodic-noise-removal-using-band-reject-filter)
- [Author](#author)
- [License](#license)

## Prerequisites
- MATLAB R2023a or later
- Image Processing Toolbox

## Repository Structure
```

├── noisy\_images/             % Contains NoisyIm1.png and NoisyIm2.png
├── scripts/                  % MATLAB scripts for each task
│   ├── task1\_noise\_denoise.m
│   ├── task2\_gaussian\_filter.m
│   └── task3\_band\_reject.m
├── results/                  % Generated figures and output images
└── README.md                 % Project overview and instructions

````

## How to Run
```bash
# Clone this repository:
git clone https://github.com/<username>/CSC478-Assignment2.git
cd CSC478-Assignment2

# Open MATLAB and set current folder:
matlab
# In MATLAB:
run('scripts/task1_noise_denoise.m');
run('scripts/task2_gaussian_filter.m');
run('scripts/task3_band_reject.m');
````

## Tasks and Results

### Task 1: Noise Identification and Denoising

* **Noise Types**:

  * *Noisy Image 1*: Gaussian noise (identified via strip profile analysis)
  * *Noisy Image 2*: Salt & Pepper noise (identified via strip profile analysis)
* **Denoising Methods**:

  * Gaussian noise: Geometric Mean Filter vs. Alpha-Trimmed Mean Filter
  * Salt & Pepper noise: Standard Median Filter vs. Adaptive Median Filter
* **Observations**:

  * Geometric Mean preserves detail better; Alpha-Trimmed is more aggressive.
  * Adaptive Median outperforms the standard Median in heavy-noise regions.

### Task 2: Gaussian Low-Pass Filtering

* Implemented a `lpGaussianFilter` function to generate Gaussian low-pass filters with varying cutoff frequencies (D0 = 10, 30, 60, 160, 460).
* **Effects of Cutoff Frequencies**:

  * Low D0 (10, 30): High blurring, strong noise removal but loss of fine details.
  * Moderate D0 (60, 160): Balanced noise removal and detail preservation.
  * High D0 (460): Minimal change; retains details and most noise.

### Task 3: Periodic Noise Removal using Band-Reject Filter

1. Computed the FFT and identified periodic noise as bright, symmetric spikes in the frequency spectrum.
2. Designed a Band-Reject Gaussian filter by subtracting two low-pass filters (D1 = 30, D2 = 50).
3. Applied the band-reject filter in the frequency domain and inverse-transformed to obtain a denoised image.
4. **Result**: Significant reduction of ripple-like periodic noise while preserving main structures and edges.

## Author

**Lama Alotibie** 

```
