import numpy as np
import os

def to_twos_complement(val, bits):
    if val < 0:
        val = (1 << bits) + val
    return format(val, '0' + str(bits // 4) + 'x')

def fft_dit_radix2(x):
    N = len(x)
    if N <= 1:
        return x
    even = fft_dit_radix2(x[0::2])
    odd = fft_dit_radix2(x[1::2])
    T = [np.exp(-2j*np.pi*k/N)*odd[k] for k in range(N//2)]
    return [even[k] + T[k] for k in range(N//2)] + [even[k] - T[k] for k in range(N//2)]

# Parameters
N = 32  # Number of samples
f = 5  # Frequency of the cosine wave

# Generate a cosine wave
t = np.arange(N)  # Time vector
x = np.cos(2 * np.pi * f * t / N)  # Cosine wave

# Normalize to -1 to 1 range
x = x / np.max(np.abs(x))

# Convert to fixed point
x_fixed = np.round(x * 2**31).astype(np.int64).astype(np.int32)

# Convert to two's complement hex
x_hex = [to_twos_complement(val, 32) for val in x_fixed]
x_hex = ['00000000' if val == '80000000' else val for val in x_hex]

# Parameters
output_dir = "output"
os.makedirs(output_dir, exist_ok=True)

# Write to file
with open(os.path.join(output_dir, "input.txt"), "w") as f:
    for val in x_hex:
        f.write(val + "\n")

# Perform FFT
x = fft_dit_radix2(x)

# Convert to fixed point and write to file
X_real = np.real(x)
X_imag = np.imag(x)

# Normalize to -1 to 1 range
X_real = X_real / np.max(np.abs(X_real))
X_imag = X_imag / np.max(np.abs(X_imag))

# Convert to fixed point
X_real_fixed = np.round(X_real * 2**31).astype(np.int64).astype(np.int32)
X_imag_fixed = np.round(X_imag * 2**31).astype(np.int64).astype(np.int32)

# Convert to two's complement hex
X_real_hex = [to_twos_complement(val, 32) for val in X_real_fixed]
X_imag_hex = [to_twos_complement(val, 32) for val in X_imag_fixed]
X_real_hex = ['00000000' if val == '80000000' else val for val in X_real_hex]
X_imag_hex = ['00000000' if val == '80000000' else val for val in X_imag_hex]

# Write to file
with open(os.path.join(output_dir, "final_real.txt"), "w") as f:
    for val in X_real_hex:
        f.write(val + "\n")
with open(os.path.join(output_dir, "final_imag.txt"), "w") as f:
    for val in X_imag_hex:
        f.write(val + "\n")

# Generate weights
weights_real = np.cos(2 * np.pi * np.arange(N) / N)
weights_imag = -np.sin(2 * np.pi * np.arange(N) / N)

# Normalize to -1 to 1 range
weights_real = weights_real / np.max(np.abs(weights_real))
weights_imag = weights_imag / np.max(np.abs(weights_imag))

# Convert to fixed point
weights_real_fixed = np.round(weights_real * 2**31).astype(np.int64).astype(np.int32)
weights_imag_fixed = np.round(weights_imag * 2**31).astype(np.int64).astype(np.int32)

# Convert to two's complement hex
weights_real_hex = [to_twos_complement(val, 32) for val in weights_real_fixed]
weights_imag_hex = [to_twos_complement(val, 32) for val in weights_imag_fixed]

# Write to file
with open(os.path.join(output_dir, "weights_real.txt"), "w") as f:
    for val in weights_real_hex:
        f.write(val + "\n")

with open(os.path.join(output_dir, "weights_imag.txt"), "w") as f:
    for val in weights_imag_hex:
        f.write(val + "\n")