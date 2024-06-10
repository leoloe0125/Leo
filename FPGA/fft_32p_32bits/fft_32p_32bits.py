import numpy as np
import os
import matplotlib.pyplot as plt
print(os.path.realpath(__file__))

def bit_reverse(n, num_bits):
    result = 0
    for i in range(num_bits):
        if (n >> i) & 1: result |= 1 << (num_bits - 1 - i)
    return result

def fft_stages(input_array):
    n = len(input_array)
    num_bits = int(np.log2(n))
    output_array = np.zeros(n, dtype=complex)

    # Bit-reversal of the input array
    for i in range(n):
        output_array[bit_reverse(i, num_bits)] = input_array[i]

    stages_output = []
    for s in range(1, num_bits + 1):
        m = 2**s
        omega_m = np.exp(-2j * np.pi / m)

        for k in range(0, n, m):
            omega = 1
            for j in range(m // 2):
                t = omega * output_array[k + j + m // 2]
                u = output_array[k + j]
                output_array[k + j] = u + t
                output_array[k + j + m // 2] = u - t
                #print(f"In stage {s}, performing butterfly operation on elements {k + j}  and {k + j + m // 2} with weight {omega}")
                omega *= omega_m

        stages_output.append(np.copy(output_array))

    return stages_output

def round_like_verilog(x):
    frac, whole = np.modf(x)
    return np.where(frac >= 0.5, np.ceil(x).astype(np.int32), np.floor(x).astype(np.int32))

def hex_to_float(hex_str, frac_bits=16):
    # Convert hexadecimal to integer
    int_val = int(hex_str, 16)
    # Check if the number is negative (sign bit is set)
    if int_val & (1 << (len(hex_str)*4-1)):
        # If negative, subtract 2^N to get the correct negative integer
        int_val -= 1 << (len(hex_str)*4)
    # Convert to floating-point
    return int_val / (1 << frac_bits)

def hex_to_signed_fixed_point(hex_str, total_bits, fractional_bits):
    value = int(hex_str, 16)
    if value & (1 << (total_bits - 1)):
        value -= 1 << total_bits
    return value / 2**fractional_bits

#---------------------------------------------input---------------------------------------------
# 使用cosine函數生成輸入數據
x = np.linspace(0, 2 * np.pi, 32)
cos1 = np.cos(2 * np.pi * 5 * x)
cos2 = np.cos(2 * np.pi * 10 * x)
cos3 = np.cos(2 * np.pi * 20 * x)
input_array = cos1 + cos2 + cos3
#input_array = np.arange(32)
print("input_array = ",input_array)
# 將輸入數據轉換為32位定點數並寫入文件
input_fixed_point = round_like_verilog(input_array * 2**16)
input_twos_complement = np.where(input_fixed_point < 0, input_fixed_point + 2**32, input_fixed_point)
input_hex = np.array([np.base_repr(num, base=16) for num in input_twos_complement])

with open('input.hex', 'w') as f:
    for num in input_hex:
        f.write(num + '\n')
print("input_fixed_point = ", [f"{num:x}" for num in input_fixed_point])

#---------------------------------------------fft---------------------------------------------
# 使用您的FFT函數
stages_output = fft_stages(input_array)
print("final_output = ",stages_output[-1][-32:])

# 將每個階段的FFT輸出轉換為32位定點數並寫入文件
for i, output in enumerate(stages_output):
    real_part = np.real(output)
    imag_part = np.imag(output)

    # 將實部和虛部轉換為定點數
    real_fixed_point = round_like_verilog(real_part * 2**16)
    imag_fixed_point = round_like_verilog(imag_part * 2**16)


    # 將定點數轉換為二補數形式
    real_twos_complement = np.where(real_fixed_point < 0, real_fixed_point + 2**32, real_fixed_point)
    imag_twos_complement = np.where(imag_fixed_point < 0, imag_fixed_point + 2**32, imag_fixed_point)

    # 將二補數形式轉換為十六進制
    real_hex = np.array([np.base_repr(num, base=16) for num in real_twos_complement])
    imag_hex = np.array([np.base_repr(num, base=16) for num in imag_twos_complement])

    # 寫入文件
    with open(f'stage_{i+1}_real.hex', 'w') as f:
        for num in real_hex:
            f.write(num + '\n')

    with open(f'stage_{i+1}_imag.hex', 'w') as f:
        for num in imag_hex:
            f.write(num + '\n')

real_fixed_point = np.real(stages_output[-1][-32:])
imag_fixed_point = np.imag(stages_output[-1][-32:])

my_fft_output_complex = [complex(real / 2**16, imag / 2**16) for real, imag in zip(real_fixed_point, imag_fixed_point)]

#---------------------------------------------numpy fft---------------------------------------------
# 執行 FFT
numpy_fft_output = np.fft.fft(input_array)


#------------------------------------------Testbench fft------------------------------------------
# 讀取 tb_dout_real.txt 檔案
with open('C:\\Users\\leolo\\Project\\FPGA_projects\\fft_32p_32bits_v2\\tb_output_real.txt', 'r') as f:
    tb_output_real = [hex_to_signed_fixed_point(line, 32, 16) for line in f.readlines()]

# 讀取 tb_dout_imag.txt 檔案
with open('C:\\Users\\leolo\\Project\\FPGA_projects\\fft_32p_32bits_v2\\tb_output_imag.txt', 'r') as f:
    tb_output_imag = [hex_to_signed_fixed_point(line, 32, 16) for line in f.readlines()]

# 將 tb FFT 輸出轉換為複數
tb_output_complex = [complex(real, imag) for real, imag in zip(tb_output_real, tb_output_imag)]


# 計算 tb FFT 輸出需要移位的數量
shift_amount_tb = np.argmax(np.correlate(tb_output_complex, numpy_fft_output, mode='full')) - len(tb_output_complex) // 2

# 進行移位
tb_output_complex_shifted = np.roll(tb_output_complex, shift_amount_tb)

# 正規化 numpy FFT 輸出
max_abs_value_np = max(abs(num) for num in numpy_fft_output)
numpy_fft_output_normalized = [num / max_abs_value_np for num in numpy_fft_output]

# 正規化 tb FFT 輸出
max_abs_value_tb = max(abs(num) for num in tb_output_complex)
tb_output_complex_normalized = [num / max_abs_value_tb for num in tb_output_complex]


#---------------------------------------------weight---------------------------------------------
# 假设您的权重数据存储在变量weight_array中，并且它是一个复数数组
weight_array = np.exp(-2j * np.pi * np.arange(32) / 32)  # 仅作为示例，您需要使用实际的权重数据

# 将权重数据的实部转换为32位定点数并写入文件
weight_real_fixed_point = round_like_verilog(np.real(weight_array) * 2**16)
weight_real_twos_complement = np.where(weight_real_fixed_point < 0, weight_real_fixed_point + 2**32, weight_real_fixed_point)
weight_real_hex = np.array([np.base_repr(num, base=16) for num in weight_real_twos_complement])

with open('weight_real.hex', 'w') as f:
    for num in weight_real_hex:
        f.write(num + '\n')
print("weight_real_fixed_point = ", [f"{num:x}" for num in weight_real_fixed_point])

# 将权重数据的虚部转换为32位定点数并写入文件
weight_imag_fixed_point = round_like_verilog(np.imag(weight_array) * 2**16)
weight_imag_twos_complement = np.where(weight_imag_fixed_point < 0, weight_imag_fixed_point + 2**32, weight_imag_fixed_point)
weight_imag_hex = np.array([np.base_repr(num, base=16) for num in weight_imag_twos_complement])

with open('weight_imag.hex', 'w') as f:
    for num in weight_imag_hex:
        f.write(num + '\n')
print("weight_imag_fixed_point = ", [f"{num:x}" for num in weight_imag_fixed_point])

#------------------------------------------Plotting------------------------------------------
# Calculate the absolute values of the FFT outputs
abs_tb_output_complex = [abs(num) for num in tb_output_complex_normalized]
abs_numpy_fft_output_complex = [abs(num) for num in numpy_fft_output_normalized]

# 比較 tb FFT 輸出與 numpy FFT 輸出
is_close_tb_np = np.allclose(abs_tb_output_complex, abs_numpy_fft_output_complex, atol=1e-2, rtol=1e-2)
print("tb_fft ", abs_tb_output_complex)
print("numpy_fft ", abs_numpy_fft_output_complex)

print("Are numpy FFT and tb FFT close? ", is_close_tb_np)

# 計算每個對應的FFT輸出值的差的絕對值
diffs = [abs(a - b) for a, b in zip(abs_tb_output_complex, abs_numpy_fft_output_complex)]

# 計算平均誤差
average_error = sum(diffs) / len(diffs)

# Plot the absolute values
plt.figure(figsize=(12, 6))

# Add average error to the plot
plt.text(0.5, 0.5, f'Average error: {average_error:.2e}', horizontalalignment='center', verticalalignment='center', transform=plt.gca().transAxes)

# Other plot settings...
# Plot the numpy FFT output first, with a dashed line and a higher zorder
plt.plot(abs_numpy_fft_output_complex, label='Numpy FFT Output', linestyle='--', zorder=2)

# Then plot the tb FFT output with a lower zorder
plt.plot(abs_tb_output_complex, label='Testbench FFT Output', zorder=1)

plt.legend()
plt.show()