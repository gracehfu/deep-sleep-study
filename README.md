# Deep Sleep Study
A statistical study on the effects of the drug Temazepam on sleep using spectral analysis and wavelet decomposition. 

## Introduction
In order to study the effects of sleeping pills on sleep quality, data for our project was taken from a 1994 paper on the effects of temazepam on sleep titled [1].

The study focuses on NREM stage 3 and 4 sleep also known as deep sleep which can be determined by measuring delta activity. Insufficient sleep particularly deep sleep is associated with a wide range of adverse health effects including cardiovascular disease, obesity and depression. By determining if sleep medication like temazepam has a significant effect on increasing deep sleep, we can determine whether pharmacotherapy is a reliable and effective method to treat insomnia. 

## Method
To determine the amount of deep sleep subjects experienced per night, a wavelet transform was used to decompose and reconstruct the EEG signal into its different brain wave components (beta, alpha, theta, delta, gamma and noise). Daubechies wavelet ‘db4’ was chosen as the mother wavelet, because of its orthogonality property and its smoothing features which are useful for detecting the changes in EEG signals. In order to validate the wavelet decomposition and reconstruction of the different brain waves, a visual comparison between the frequency components of the original signal via a spectrogram was performed.

The average amplitudes of the delta wave component was tested with a randomized complete block design (RCBD) ANOVA and least significant difference (LSD) in order to determine whether age or sex are a source of variance on the data. A Paired T-test was completed to determine whether the temazepam decreases the average amplitude of the delta wave component and therefore decreases user’s amount of deep sleep. A power sample size calculation, was also performed on the data set to determine the precision of the t-test result.


## References 
[1] B. Kemp, A. H. Zwinderman, B. Tuk, H. A. C. Kamphuisen and J. J. L. Oberye, "Analysis of a sleep-dependent neuronal feedback loop: the slow-wave microcontinuity of the EEG," in IEEE Transactions on Biomedical Engineering, vol. 47, no. 9, pp. 1185-1194, Sept. 2000.
