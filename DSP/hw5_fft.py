import numpy as np

def fftreal(x, y):
    # 確保 x 和 y 的長度相同
    N = len(x)
    if len(y) != N:
        raise ValueError('x and y must have the same length')
    
    # 合併 x 和 y 成一個複數信號
    z = np.array(x) + 1j * np.array(y)
    
    # 計算 z 的 FFT
    Z = np.fft.fft(z)
    
    # 提取 Fx 和 Fy
    Fx = (Z + np.conj(np.flip(Z))) / 2
    Fy = (Z - np.conj(np.flip(Z))) / (2j)
    
    return Fx, Fy


# 定義兩個示例信號
x = np.array([1, 2, 3, 4])
y = np.array([5, 6, 7, 8])

# 計算 x 和 y 的 FFT
Fx, Fy = fftreal(x, y)

# 輸出結果
print("Fx:", Fx)
print("Fy:", Fy)