import numpy as np
from math import cos, pi
from numpy.linalg import inv
import matplotlib.pyplot as plt

# SPEC
N = 17
delta = 0.0001
w = ((0, 0.2, 10), (0.25, 0.5, 6))
h_pass = (0, 0.225)
f = [0, 0.05, 0.1, 0.15, 0.18, 0.27, 0.3, 0.35, 0.4, 0.45]
k = (N - 1) // 2
print(f"k = {k}")
n_exp = k + 2
print(f"N = {n_exp}")

#function
def w_function(x):
    if w[0][0] <= x <= w[0][1]: 
        return w[0][2]  
    elif w[1][0] <= x <= w[1][1]: 
        return w[1][2]  
    else: 
        return 0

def h_d_function(x):
    if h_pass[0] <= x <= h_pass[1]: 
        return 1  
    else: 
        return 0  

def response_function(F, S):
    result = 0
    for n in range(k + 1):
        result += S[n] * cos(2 * pi * n * F)
    return result

cnt = 0
max_error_last = float('inf')
#main loop
while True:
    cnt += 1
    A = np.zeros((k + 2, k + 2))
    for m in range(k + 2):
        for n in range(k + 2):
            if n == 0:
                A[m, n] = 1
            elif n == k + 1: 
                A[m, n] = (-1) ** m / w_function(f[m])
            else:
                A[m, n] = cos(2 * n * pi * f[m])
    A_inv = inv(A)

    b = np.array([h_d_function(f[m]) for m in range(k + 2)])
    S = np.matmul(A_inv, b)

    new_extreme = []
    max_error = 0
    F1 = 0
    F0 = 0

    for i in range(int(0.5 / delta) + 2):
        if i == 0:
            continue
        if i == 1:
            F1 = 0
            F0 = (response_function(0 * delta, S) - h_d_function(0 * delta)) * w_function(0 * delta)
        if i == int(0.5 / delta) + 1:
            F = 0
        else:
            F = (response_function(i * delta, S) - h_d_function(i * delta)) * w_function(i * delta)
        
        if (F0 - F > 0 and F0 - F1 > 0) or (F0 - F < 0 and F0 - F1 < 0): 
            new_extreme.append((i - 1) * delta)
            max_error = max(max_error, abs(F0))
        
        F1 = F0
        F0 = F

    print(f"{cnt}  max_error = {max_error}")
    
    if 0 <= max_error_last - max_error <= delta:
        print(f" final_max_error = {max_error}")
        print(f"final_S = {S}")
        break

    max_error_last = max_error
    f = new_extreme[:k + 2]

h = [(S[k - i] / 2) if i < k else S[0] if i == k else (S[i - k] / 2) for i in range(N)]
print(f"h = {h}")

plt.figure(figsize=(15, 5))

# Frequency Response
plt.subplot(1, 2, 1)
t = np.arange(0.0, 0.5, delta)
plt.plot(t, [response_function(t[i], S) for i in range(len(t))], lw=2, color='blue', linestyle='-')
plt.plot(t, [h_d_function(t[i]) for i in range(len(t))], lw=2, color='red', linestyle='--')
plt.legend(['FIR Filter', 'Desire Filter']) 
plt.title("Frequency Response")

# Impulse Response
plt.subplot(1, 2, 2)
t = np.arange(0, N)
plt.stem(t, h, linefmt='b-', markerfmt='bo', basefmt='r-')
plt.legend(['h[n]']) 
plt.title("Impulse Response")

plt.show()
