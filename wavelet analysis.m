clear;

[hdr,records]= edfread('ST7101J0-PSG.edf'); %opening EDF EEG files
recordsT = transpose(records);
EEG = recordsT(1:length(recordsT),1);%column 1 corresponds to EEG data using electrodes FpzCz

waveletFunction = 'db4';

% 5 level decomposition of signal to produce 1-D detail coefficients
[C,L] = wavedec(EEG,5,waveletFunction);
cD1 = detcoef(C,L,1);                   %NOISY
cD2 = detcoef(C,L,2);                   %Gamma
cD3 = detcoef(C,L,3);                   %Beta
cD4 = detcoef(C,L,4);                   %Alpha
cD5 = detcoef(C,L,5);                   %Delta
cA5 = appcoef(C,L,EEG,5);               %Theta

% reconstruction of signal from 1-D wavelet coefficients
 D1 = wrcoef('d',C,L,waveletFunction,1); %NOISY 
 D2 = wrcoef('d',C,L,waveletFunction,2); %GAMMA 
 D3 = wrcoef('d',C,L,waveletFunction,3); %BETA 
 D4 = wrcoef('d',C,L,waveletFunction,4); %ALPHA 
 D5 = wrcoef('d',C,L,waveletFunction,5); %THETA 
 A5 = wrcoef('a',C,L,waveletFunction,5); %DELTA

%finding the mean value of the absolute signal for delta waves
mean = mean(abs(D5))

% comparing reconstructed signal from wavelet transform to original signal
total = D1+D2+D3+D4+D5+A5;
cor = corrcoef(total,EEG)


data = importdata('Delta_Avg.xlsx');
placebo = data(:,1);
temazepam = data(:,2);

%test for normal distribution
JBp=jbtest(placebo);
JBt=jbtest(temazepam);

Kp=kurtosis(placebo);
Kt=kurtosis(temazepam);

Sp=skewness(placebo);
St=skewness(temazepam);

anova2(data);

%LSD calculations
R = reshape(data,5,[]);
M = sum(R);
Means = [M(1)+M(5) M(2)+M(6) M(3)+M(7) M(4)+M(8)];
lsd = 2.0369 * sqrt(0.59097*2/20)
Means = Means/10;
BCDEA = circshift(Means',-1);
Diff1 = Means - BCDEA';

CDEAB = circshift(Means',-2);
Diff2 = Means - CDEAB';
