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
