import numpy as np

def fft_8_point(x):
    N = len(x)
    if N <= 1: return x
    even = fft_8_point(x[0::2])
    odd =  fft_8_point(x[1::2])
    T= [np.exp(-2j*np.pi*k/N)*odd[k] for k in range(N//2)]
    return [even[k] + T[k] for k in range(N//2)] + [even[k] - T[k] for k in range(N//2)]

# Test the function
x = np.array([0,2,3,-1,4,5,7,9])  # Use a list or numpy array, not a set
print('Input: ', x)
print('FFT: ', fft_8_point(x))