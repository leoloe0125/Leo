from fixedpoint import FixedPoint
import random

def butterfly(a, b, w):
    return a + w * b, a - w * b

def twos_complement(value, bits):
    if value < 0:
        value = (1 << bits) + value
    return value

# Generate 10 random fixed point numbers
data_in = [complex(FixedPoint(random.randint(-2**15, 2**15 - 1), 32), FixedPoint(random.randint(-2**15, 2**15 - 1), 32)) for _ in range(10)]

# Generate a random weight factor
w = complex(FixedPoint(random.randint(-2**15, 2**15 - 1), 32), FixedPoint(random.randint(-2**15, 2**15 - 1), 32))

# Perform butterfly operation on each pair of data points
results = [butterfly(data_in[i], data_in[i+1], w) for i in range(0, len(data_in), 2)]

def write_hex(file, value, bits):
    value = twos_complement(value, bits) & 0xFFFFFFFF  # Use bitwise AND to get an unsigned integer
    file.write(hex(value)[2:] + '\n')  # Use string slicing to remove the "0x" prefix

from fixedpoint import FixedPoint
import random

def butterfly(a, b, w):
    return a + w * b, a - w * b

def twos_complement(value, bits):
    if value < 0:
        value = (1 << bits) + value
    return value

# Generate 20 random fixed point numbers
data_in = [complex(FixedPoint(random.randint(-2**15, 2**15 - 1), 32), FixedPoint(random.randint(-2**15, 2**15 - 1), 32)) for _ in range(20)]

# Perform butterfly operation on each pair of data points
results = [butterfly(data_in[i], data_in[i+1], w) for i in range(0, len(data_in), 2)]

# Write the real and imaginary parts of each input data to separate files
with open('din0_real.txt', 'w') as f_real, open('din0_imag.txt', 'w') as f_imag:
    for i, data in enumerate(data_in[::2]):  # Select every other data point starting from index 0
        write_hex(f_real, int(data.real), 32)
        write_hex(f_imag, int(data.imag), 32)

with open('din1_real.txt', 'w') as f_real, open('din1_imag.txt', 'w') as f_imag:
    for i, data in enumerate(data_in[1::2]):  # Select every other data point starting from index 1
        write_hex(f_real, int(data.real), 32)
        write_hex(f_imag, int(data.imag), 32)

# Write the real and imaginary parts of the weight factor to files
with open('weight_real.txt', 'w') as f:
    write_hex(f, int(w.real), 32)

with open('weight_imag.txt', 'w') as f:
    write_hex(f, int(w.imag), 32)
    
# Write the output to files
with open('expected_y0_real.txt', 'w') as f_real, open('expected_y0_imag.txt', 'w') as f_imag:
    for i, (y0, y1) in enumerate(results):
        write_hex(f_real, int(y0.real), 32)
        write_hex(f_imag, int(y0.imag), 32)

with open('expected_y1_real.txt', 'w') as f_real, open('expected_y1_imag.txt', 'w') as f_imag:
    for i, (y0, y1) in enumerate(results):
        write_hex(f_real, int(y1.real), 32)
        write_hex(f_imag, int(y1.imag), 32)