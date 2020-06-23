def indMax(M, j, r):
    k = r+1
    for i in range(r+1, M.nrows()):
        if abs(M[i, j]) > abs(M[k, j]):
            k = i
    return k

def echelon_reduit(A, b):
    r = -1
    for j in range(A.ncols()):
        k = indMax(A, j, r)
        if r < A.nrows()-1:
            if A[k, j] != 0:
                r += 1
                b[k] /= A[k, j]
                A[k] /= A[k, j]
                if k != r:
                    P = A[k]
                    A[k] = A[r]
                    A[r] = P
                    P = b[k]
                    b[k] = b[r]
                    b[r] = P
                for i in range(A.nrows()):
                    if i != r:
                        b[i] -= b[r] * A[i, j]
                        A[i] -= A[r] * A[i, j]

m = 3
n = 4
A = Matrix(QQ, m, n, [[0, -1, 2, 13],
                      [1, -2, 3, 17],
                      [-1, 3, -3, -20]])
b = Matrix(QQ, 3, 1, [5, 4, -1])
# A = Matrix(QQ, m, [[2, -1, 0],
#                    [-1, 2, -1],
#                    [0, -1, 2]])
print(A)
echelon_reduit(A, b)
print("")
print(A)
print(b)