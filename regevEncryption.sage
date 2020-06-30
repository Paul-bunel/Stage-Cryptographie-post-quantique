q = 50 #int(input("q = "))
m = 15 #int(input("m = "))
n = 7 #int(input("n = "))
borne = 2 #int(input("borne = "))

Zq = Integers(q)

a = Matrix(Zq, m, n, [[Zq.random_element() for i in range(n)] for y in range(m)])

s = Matrix(Zq, n, 1, [Zq.random_element() for i in range(n)])

e = Matrix(Zq, m, 1, [randrange(-borne, borne+1) for i in range(m)])

b = a*s + e

r = Matrix(Zq, 1, m, [randrange(0,2) for i in range(m)])

msg = 1

u = r*a
v = (r*b) + int(q/2) * msg

dec = v - u*s

if dec[0,0] < 10 or dec[0,0] > 40:
    print("msg = 0")
    print(dec)
else:
    print("msg = 1")
    print(dec)
