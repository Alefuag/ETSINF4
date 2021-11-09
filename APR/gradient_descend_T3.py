#!usr/bin/env python

import fractions
# g(z) = (z1-1)^1 + (z2-2)*2 + z1*z2
# g'(z) = ( 1 + z2 , 2*z2 - 4 + z1 )

def descend(z1, z2, k):
    pk = fractions.Fraction(1,2*k)
    return (fractions.Fraction( z1 - pk*(1 + z2) ) , fractions.Fraction( z2 - pk*(2*z2 - 4 + z1) ) )

z1=int(input("z1: "))
z2=int(input("z2: "))
iteration=int(input("Nº iterations: "))
l = []
t = ( fractions.Fraction(z1) , fractions.Fraction(z2) )

for i in range(1,iteration+1):
    t = descend(t[0], t[1], i)
    l.append(t)
    # print("Iteration {} (pk=1/{}): ({} , {})".format(i, 2*i, t[0], t[1]) )
for z1,z2 in l:
    print("( {} , {} )".format(z1,z2))

input()
