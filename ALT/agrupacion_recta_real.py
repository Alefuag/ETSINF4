
def grupos(N,alpha):
    F = {0:0}
    P = {0:None}
    for k in range(1,N+1):
        max = -2**31
        for j in range(k):
            if F[j] > max:
                F[k] = F[j]+alfa(j+1,k)
                P[k] = j
    start_index = []
    ind=N
    while P[ind] != None:
        ind=P[ind]
        start_index.append(ind+1)
    start_index.reverse()
    return P[N], start_index
