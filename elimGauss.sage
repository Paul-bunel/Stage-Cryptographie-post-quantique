def indMax(M, j, r):
    k = r+1
    for i in range(r+1, M.nrows()):
        if M[i, j] > M[k, j]:
            k = i
    return k

def echanger_ligne(M, i1, i2):
    P = M[i1]
    M[i1] = M[i2]
    M[i2] = P

#A commenter
#Complexite : mn^2
def echelon_reduit(A, b):
    r = -1 #Variable servant a definir notre prochaine ligne de pivot
    for j in range(A.ncols()): #On boucle sur les colonnes de A
        k = indMax(A, j, r) #On choisit pour pivot A[k, j] le max de la colonne
        if r < A.nrows()-1:
            if A[k, j] != 0: #Si notre pivot est non nul...
                r += 1
                b[k] /= A[k, j]
                A[k] /= A[k, j] #On divise la ligne du pivot par le pivot, pour que ce dernier soit egal a 1
                if k != r: #Si la ligne sur laquelle on a fait le pivot est differente de r, on les echange
                    echanger_ligne(A, k, r)
                    echanger_ligne(b, k, r)
                for i in range(A.nrows()): #On boucle sur les lignes de A
                    if i != r: #On se sert du pivot pour ramener tous les autres elements de la colonne a zero
                        b[i] -= b[r] * A[i, j]
                        A[i] -= A[r] * A[i, j]

def solutions(A, b):
    var('x', 'y', 'z', 't', 'u')
    T = [x, y, z, t, u]
    echelon_reduit(A, b)
    s = Matrix(SR, A.ncols(), 1)
    b = MatrixSpace(QQ, b.nrows(), 1)(b)
    A = MatrixSpace(QQ, A.nrows(), A.ncols())(A)
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
n = 5
# A = Matrix(QQ, m, n, [[0, -1, 2, 13],
#                       [1, -2, 3, 17],
#                       [-1, 3, -3, -20]])
Z17 = Integers(17)
A = Matrix(Z17, m, n, [[2, 13, 7, 3, 1],
                      [4, 7, 9, 1, 13],
                      [6, 14, 5, 11, 1]])
b = Matrix(Z17, 3, 1, [5, 78, 5])
# A = Matrix(QQ, m, [[2, -1, 0],
#                    [-1, 2, -1],
#                    [0, -1, 2]])
print(A)
print("")
print(b)
echelon_reduit(A, b)
solutions(A, b)
# inverse(A)
