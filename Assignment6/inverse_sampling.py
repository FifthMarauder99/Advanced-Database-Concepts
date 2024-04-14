from random import random
U = [random() for i in range(1000)]
P = [[1, 0.4], [2, 0.3], [3, 0.2], [4, 0.1]]
CDF = [0]*len(P)
for i in range(len(P)):
  CDF[i] = (P[i][0], sum([p[1] for p in P if p[0] < P[i][0]]),sum([p[1] for p in P if p[0] <= P[i][0]]))
print(CDF)
distribution = [c[0] for u in U for c in CDF if c[1] < u and u <= c[2]]
for i in range(1, 5):
  print(i, distribution.count(i))