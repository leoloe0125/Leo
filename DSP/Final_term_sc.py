def non_scaled_stochastic_adder(S_A, M_A, S_B, M_B):
    N = len(S_A)  # 假設 S_A 和 S_B 的長度相同
    Counter = [0] * (N + 1)
    C = [0] * N

    for i in range(N):
        A = (1 - 2 * S_A[i]) * M_A[i]
        B = (1 - 2 * S_B[i]) * M_B[i]
        C[i] = A + B

        if A + B + Counter[i] > 1:
            C[i] = 1
            Counter[i + 1] = 1
        elif A + B + Counter[i] < -1:
            C[i] = -1
            Counter[i + 1] = -1
        elif A + B + Counter[i] == 1:
            C[i] = 1
            Counter[i + 1] = 0
        elif A + B + Counter[i] == -1:
            C[i] = 0
            Counter[i + 1] = 1
        elif A + B + Counter[i] == 0:
            C[i] = 0
            Counter[i + 1] = 0

    return C

S_A = [1, 0, 1, 0]
M_A = [0.7, 0.3, 0.6, 0.4]
S_B = [0, 1, 0, 1]
M_B = [0.2, 0.8, 0.4, 0.6]

result = non_scaled_stochastic_adder(S_A, M_A, S_B, M_B)

print(result)