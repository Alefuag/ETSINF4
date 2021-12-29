

def largersubsec(nums):
    if not nums: return 0 # if there are no elements, return length
    maxsec = [None]*(len(nums)) # maximum secuence lenght finishing at element ith
    for i in range(len(nums)):
        leftpart = [maxsec[j] for j in range(i) if nums[j]<nums[i]]
        if not leftpart:
            maxsec[i]=1
        else:
            maxsec[i]=max(leftpart)+1
    print(maxsec)
    return max(maxsec)

# nlist = [5,2,3,4,7,10]
# nlist = (-2**31,4,1,1,2,6,3,5,8)
nlist = list(map(int, input().split()))
print(largersubsec(nlist))
