
import matplotlib.pyplot as plt
import math

def section_convolution_time_complexity(N, L, M):
    P = L + M - 1
    S = N / L
    value = (N / L) * 3 * (L + M - 1) * (math.log2(L + M - 1) + 1)
    
    return value

# Assuming the function section_convolution_time_complexity is already defined as in the provided code snippet.

N = 1200  # Example value for N
M = 30   # Example value for M

# Lists to store the results
computation_amounts = []
theoretical_values = []
L_values = range(1, N + 1)  # L from 1 to N to avoid division by zero

for L in L_values:
    value = section_convolution_time_complexity(N, L, M)
    computation_amounts.append(value)
    print(f'L={L}, Value={value}')

print('smallest L:', L_values[computation_amounts.index(min(computation_amounts))])
print('smallest value:', min(computation_amounts))
# Plotting
plt.figure(figsize=(10, 5))
plt.plot(L_values, computation_amounts, label='Computation Amount')
plt.xlabel('L')
plt.ylabel('Value')
plt.legend()
plt.grid(True)
plt.show()
