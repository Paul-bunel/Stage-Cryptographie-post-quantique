def indMax(M, j):
    k = 0
    for i in range(1, M.nrows()):
        if abs(M[i, j]) > abs(M[k, j]):
            k = i
    return k

# def echelon_reduit(A):
#     r = -1
#     for j in range(A.ncols()):
#         k = indMax(A, j)
#         if A[k, j] != 0:
#             r += 1
#             print(k, r)
#             A[k] /= A[k, j]
#             if k != r:
#                 P = A[k]
#                 A[k] = A[r]
#                 A[r] = P
#             for i in range(A.nrows()):
#                 if i != r:
#                     A[i] -= A[r] * A[i, j]
def echelon_reduit(A):
    r = -1
    for j in range(A.ncols()):
        k = r+1
        if A[k, j] != 0:
            r += 1
            print(k, r)
            A[k] /= A[k, j]
            if k != r:
                P = A[k]
                A[k] = A[r]
                A[r] = P
            for i in range(A.nrows()):
                if i != r:
                    A[i] -= A[r] * A[i, j]

# def sol_sys(A):

m = 3
n = 4
A = Matrix(QQ, m, n, [[0, -1, 2, 13],
                      [1, -2, 3, 17],
                      [-1, 3, -3, -20]])
# A = Matrix(QQ, m, [[2, -1, 0],
#                    [-1, 2, -1],
#                    [0, -1, 2]])
print(A)
echelon_reduit(A)
print("")
print(A)