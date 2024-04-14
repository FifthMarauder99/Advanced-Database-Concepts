from math import log, ceil

# Number of blocks to sort
N = 108

# No of buffer blocks
B = 5

print("N: %d" % N)
print("B: %d" % B)
print("Number of blocks in main memory: %s" % (B+1)) # 1 to store output run
print("Total number of passes: %d" % (ceil(log(N/B, B-1)) + 1))

run_size = B
no_of_runs = ceil(N/run_size)
last_run_size =run_size - ((run_size * no_of_runs) - N)
print('\tPass 0: Run size: %d, No of runs: %d, Last run size: %d' % (run_size, no_of_runs, last_run_size))
p = 0
while run_size < N:
  p += 1
  run_size = run_size * (B-1)
  no_of_runs = ceil(N/run_size)
  last_run_size =run_size - ((run_size * no_of_runs) - N)
  print('\tPass %d: Run size: %d, No of runs: %d, Last run size: %d' % (p, run_size, no_of_runs, last_run_size))

print("Time complexity: 2NlogB(N) -> %f" % (2 * N * log(N, B)))