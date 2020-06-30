#A * s = b - e

# q = random_prime(2^99)
q = int(input("q = "))
m = int(input("m = "))
n = int(input("n = "))
borne = int(input("borne = "))

Zq = Integers(q)

a = Matrix(Zq, m, n, [[Zq.random_element() for i in range(n)] for y in range(m)])
print("a = ")
print(a)

s = Matrix(Zq, n, 1, [Zq.random_element() for i in range(n)])
print("s = ")
print(s)

e = Matrix(Zq, m, 1, [randrange(-borne, borne+1) for i in range(m)])
print("e = ")
print(e)

b = a*s + e
print("b = ")
print(b)

print("=====================")

for e2 in MatrixSpace(Integers(2*borne+1), m, 1):
    e2 = MatrixSpace(Integers(), m, 1)(e2)
    e2 = MatrixSpace(Integers(17), m, 1)(e2)
    try:
        print(a.solve_right(b-e2))
        print("--------")
        print(e2)
        print("================")
    except:
        pass

#Complexite boucle principale : O(((2B+1)^m)mn²)
#Complexite algo : prendre en compte complexite pour tirer une matrice + pour resoudre le systeme
