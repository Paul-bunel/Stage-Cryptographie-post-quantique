Z17 = Integers(17)

a = Matrix(Z17, 4, 3, [[2, 13, 7],
                        [4, 7, 9],
                        [6, 14, 5],
                        [3, 8, 1]])
# a = Matrix(ZZ, 3, 3, [[1, 1, 7],
#                         [2, -1, 5],
#                         [-1, -3, -9]])

s = Matrix(Z17, 3, 1, [8, 3, 12])

e = Matrix(Z17, 4, 1, [1, -1, 2, 1])

b = a*s + e

print(b)
print("==============")
for e in MatrixSpace(Z17, 4, 1):
    small = True
    for i in e:
        if not(i[0] < 3 or i[0] > 14):
            small = False
    if small:
        try:
            print(a.solve_right(b-e))
            print("--------")
            print(e)
            print("================")
        except Exception as e:
            pass
# r = Matrix(ZZ, 3, 1, [25, 16, 1])

# print(a.echelon_form())
# print('\n')
# print(a.solve_right(a*s))