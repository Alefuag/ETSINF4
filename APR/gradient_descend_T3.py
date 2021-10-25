import fractions
# g(z) = (z1-1)^1 + (z2-2)*2 + z1*z2
# g'(z) = ( 1 + z2 , 2*z2 - 4 + z1 )

def descend(z1, z2, k):
    pk = 1/(2*k)
    return (fractions.Fraction( z1 - pk*(1 + z2) ) , fractions.Fraction( z2 - pk*(2*z2 - 4 + z1) ) )

l = []
t = ( fractions.Fraction(-1), fractions.Fraction(1) )
for i in range(1,4):
    t = descend(t[0], t[1], i)
    print("Iteration {} (pk=1/{}): ({} , {})".format(i, 2*i, t[0], t[1]) )
