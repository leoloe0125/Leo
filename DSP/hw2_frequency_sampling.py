import numpy as np
from math import ceil, floor, pi
import matplotlib.pyplot as plt
import cmath

k = 10
N = 2 * k + 1
points = 100000

def hilbert_fun(x):
    if x == 0:
        return 0
    elif 0 <= x <= 0.5: 
        return -1j
    elif 0.5 < x <= 1:
        return 1j

# sample the ideal filter with transition band
samples = [hilbert_fun(i) for i in np.arange(0, 1, 1/N)]

samples[1]   = -0.8j
samples[k]   = -0.6j
samples[k+1] =  0.6j
samples[2*k]  = 0.8j

samples_time_temp = np.fft.ifft(samples)

#-----------------concatenate-----------------
# Calculate the middle index of the array
middle_index = ceil(N/2)
# Split the array into two halves around the middle index
first_half = samples_time_temp[middle_index:]
second_half = samples_time_temp[:floor(N/2)+1]
# Concatenate the two halves in reverse order
R_n = np.concatenate((first_half, second_half), axis=None)

#DTFT
R_F = [sum(R_n[n+k]*cmath.exp(-1j*2*pi*F_i*n) for n in range(-k, k+1)).imag for F_i in np.arange(0.0, 1.0, 1/points)]

# Create a figure
plt.figure(figsize=(10,10))

# Create first subplot for Frequency Response
plt.subplot(2, 1, 1)
plt.plot(np.arange(0.0, 1.0, 1/points), R_F)
plt.plot(np.arange(0.0, 1.0, 1/points), [hilbert_fun(i).imag for i in np.arange(0.0, 1.0, 1/points)])
plt.title("Frequency Response")
plt.legend(['R(F)', 'H_d(F)'])

# Create second subplot for Impulse Response
plt.subplot(2, 1, 2)
plt.stem(np.array(range(-k, k+1)), R_n)
plt.title("Impulse Response r[n]")
plt.legend(['r[n]'])

# Display the figure with subplots
plt.tight_layout()
plt.show()