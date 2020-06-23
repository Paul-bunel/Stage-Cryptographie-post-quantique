#e = b - a*s

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

for s2 in MatrixSpace(Zq, n, 1):
    e2 = b - a * s2
    small = True
    for i in e2:
        if not(i[0] <= borne or i[0] >= q-borne):
            small = False
    if small:
        print(s2)
        print("--------")
        print(e2)
        print("================")

#Complexité boucle principale : O(q^m)
#Complexité algo : prendre en compte complexité pour tirer une matrice