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

def solutions(A, b):
    var('x', 'y', 'z', 't', 'u')
    T = [x, y, z, t, u]
    echelon_reduit(A, b)
    s = Matrix(SR, A.ncols(), 1)
    for k in range(s.nrows()):
        if k < b.nrows():
            s[k] = b[k]
        else:
            s[k] = T[k]
    for i in range(A.nrows()):
        for j in range(i+1, A.ncols()):
            if A[i, j] != 0:
                s[i, 0] -= A[i, j]*T[j]
    print("")
    print(A)
    print("")
    print(b)
    print("")
    print(s)



m = 3
n = 4
A = Matrix(QQ, m, n, [[2, 13, 7, 3],
                      [4, 7, 9, 1],
                      [6, 14, 5, 11]])
b = Matrix(QQ, 3, 1, [1, 13, 1])
# A = Matrix(QQ, m, [[2, -1, 0],
#                    [-1, 2, -1],
#                    [0, -1, 2]])
print(A)
print("")
print(b)
solutions(A, b)