def indMax(M, j, r):
    k = r+1
    for i in range(r+1, M.nrows()):
        if abs(M[i, j]) > abs(M[k, j]):
            k = i
    return k

def echanger_ligne(M, i1, i2):
    P = M[i1]
    M[i1] = M[i2]
    M[i2] = P

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
                    echanger_ligne(A, k, r)
                    echanger_ligne(b, k, r)
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

def inverse(A):
    I = matrix.identity(3)
    I = MatrixSpace(QQ, 3)(I)
    echelon_reduit(A, I)
    print("")
    print(A)
    print("")
    print(I)


m = 3
n = 4
# A = Matrix(QQ, m, n, [[0, -1, 2, 13],
#                       [1, -2, 3, 17],
#                       [-1, 3, -3, -20]])

# A = Matrix(QQ, m, n, [[2, 13, 7, 3],
                    #   [4, 7, 9, 1],
                    #   [6, 14, 5, 11]])
b = Matrix(QQ, 3, 1, [1, 13, 1])
A = Matrix(QQ, m, [[2, -1, 0],
                   [-1, 2, -1],
                   [0, -1, 2]])
print(A)
print("")
print(b)
# solutions(A, b)
inverse(A)