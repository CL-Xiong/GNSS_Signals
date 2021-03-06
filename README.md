### GNSS Signals:signal_strength:

![](https://img.shields.io/badge/build-passing-brightgreen.svg)
![](https://img.shields.io/badge/platform-windows-orange.svg)
![](https://img.shields.io/badge/compiler-matlab-yellow.svg)
![](https://img.shields.io/badge/author-Jason%20Ding-blue.svg) ![](https://img.shields.io/badge/license-MIT-ff69b4.svg)

### Subroutines

| NO.  | M FILES         | FUNCTION                                                     |
| :--: | --------------- | ------------------------------------------------------------ |
|  1   | CAcode.m        | Generate different PRN's C/A code and calculate the correlation function between two C/A codes. |
|  2   | AllanVariance.m | Calculate the Alan variance and Modified Alan variance of the clock difference(phase) sequence or frequency sequence. |



#### Several commonly used variances[1].

|             type              |                            symbol                            | description                                                  |
| :---------------------------: | :----------------------------------------------------------: | ------------------------------------------------------------ |
|       Standard Variance       | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn.gif) | Calculated based on the relative frequency deviation relative to the square of its mean. |
|        Allan Variance         | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn(11).gif) | Calculated based on the relative frequency deviation relative to the square of its mean. |
|  Overlapping Allan Variance   | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn(11).gif) | Calculating the Allan variance based on full overlap sampling. |
|        Total Variance         | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn%20(1).gif) | Calculate the Allan variance using the extended data.        |
|    Modified Allan Variance    | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn%20(2).gif) | Calculating the Allan variance based on the relative frequency deviation or the mean of the time difference data. |
|    Modified Total Variance    | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn%20(3).gif) | Calculate "Modified the Allen Variance" with the extended data. |
|         Time Variance         | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn%20(4).gif) | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn%20(5).gif) |
|      Time Total Variance      | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn%20(6).gif) | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn%20(7).gif) |
|       Hadamard Variance       | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn%20(8).gif) | Calculation based on the second difference of the relative frequency deviation or the cubic difference of the time difference data. |
| Overlapping Hadamard Variance | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn%20(9).gif) | The Hadamard variance is calculated based on full overlap sampling. |
|    Hadamard Total Variance    | ![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/CodeCogsEqn%20(10).gif) | Calculate the Hadamard variance using the extended data.     |

---

- **CAcode.m**

The purpose of the function is to generate a C/A code and calculate the correlation function between C/A codes.

```matlab
function C_A = generateC_A(PRN,CodeLength,Delay)
% Generate C/A code
% Given:
%     PRN             i      PRN number
%     CodeLength      i      C/A code length
%     Delay           i      C/A code delay
% Returned:
%     C_A             d      C/A code
```

```matlab
function Rkl = Relafunc(Rk,Rl,CodeLength,NUM)
% Generate two C/A code correlation functions
% Given:
%       Rk , Rl       i      First C/A code and Second C/A code
%       CodeLength    i      C/A code length
%       NUM           i      Number of chips  
% Returned:
%       Rkl           d      Correlation functions
```

------

- **AllanVariance.m**

  The purpose of the function is to calculate the Alan variance  and Modified Alan variance of the phase or frequency sequence.

```matlab
function AllanVariance = AVAR_Phase(PhaseSequence,tau)
% Calculate the Alan variance of the clock difference (phase) sequence.
% Given:
%       PhaseSequence        Phase sequence  
%       tau                  Sampling interval              
% Returned:
%       AllanVariance        Allan variance
```

```matlab
function AllanVariance = AVAR_Freq(FrequencySequence)
% Calculate the Alan variance of the frequency sequence.
% Given:
%       FrequencySequence    Frequency sequence                 
% Returned:
%       AllanVariance        Allan variance
```

~~~matlab
function Mod_AllanVariance = MAVAR_Phase(PhaseSequence,tau,m)
% Calculate the Modified Allan variance of the time difference (phase) sequence.
% Given:
%       PhaseSequence        Phase sequence  
%       tau                  Sampling interval  
%       m                    Smoothing factor       
% Returned:
%       Mod_AllanVariance    Modified Allan variance
~~~

~~~matlab
function Mod_AllanVariance = MAVAR_Freq(FrequencySequence,m)
% Calculate the Modified Allan variance of the frequency sequence.
% Given:
%       FrequencySequence    Frequency sequence         
%       m                    Smoothing factor
% Returned:
%       Mod_AllanVariance    Modified Allan variance
~~~



[1]Guo,H.R. . Study on the Analysis Theories and Algorithms of the Time and Frequency Characterization for Atomic Clocks of Navigation Satellites[D].Information Engineering University,2006.























