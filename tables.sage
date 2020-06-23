Z7 =  Integers(7)
T7 = []
T7.append([i for i in range(7)])
for i in range(1, 7):
    T7.append([i])
    for y in range(1, 7):
        T7[i].append(i*y)

M7 = Matrix(Z7, 7, 7, T7)
print("Table de 7 : ")
print(M7)

Z12 =  Integers(12)
T12 = []
T12.append([i for i in range(12)])
for i in range(1, 12):
    T12.append([i])
    for y in range(1, 12):
        T12[i].append(i*y)

M12 = Matrix(Z12, 12, 12, T12)
print("Table de 12 : ")
print(M12)

with open("latex.txt", 'a') as file:
    file.write(latex(M12))