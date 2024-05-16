import numpy as np
import os

def write_to_file(filename, data):
    # Normalize data
    data = data / np.max(np.abs(data)) if np.max(np.abs(data)) != 0 else data
    with open(filename, 'w') as f:
        for d in data:
            # Separate real and imaginary parts
            real = np.float64(d.real)
            imag = np.float64(d.imag)
            # Convert to fixed point and round down
            real = np.floor(real * 2**31)
            imag = np.floor(imag * 2**31)
            # Check if real and imag are within the range of int32
            if real < np.iinfo(np.int32).min or real > np.iinfo(np.int32).max:
                print(f"Warning: value {real} out of range for int32")
                continue
            if imag < np.iinfo(np.int32).min or imag > np.iinfo(np.int32).max:
                print(f"Warning: value {imag} out of range for int32")
                continue
            real = real.astype(np.int32)
            imag = imag.astype(np.int32)
            # Convert to two's complement for negative numbers
            if real < 0:
                real = (1 << 32) + real
            if imag < 0:
                imag = (1 << 32) + imag
            # Write real and imag separately
            f.write(f"{real:08x} {imag:08x}\n")

def fft_32p_32bits(input_data):
    # Generate FFT weights
    N = len(input_data)
    n = np.arange(N)
    k = n.reshape((N, 1))
    weights = np.exp(-2j * np.pi * k * n / N)

    # Apply FFT
    stages = [input_data]
    for i in range(int(np.log2(N))):
        stages.append(np.dot(weights, stages[-1]))

    # Write input data to file
    write_to_file('input_data.txt', input_data)

    # Write each stage to a separate file
    for i, stage in enumerate(stages):
        write_to_file(f'stage_{i}_real.txt', np.real(stage))
        write_to_file(f'stage_{i}_imag.txt', np.imag(stage))

# Generate some input data
input_data = np.random.random(32)

# Run FFT
fft_32p_32bits(input_data)