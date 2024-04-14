from math import log, floor, ceil

block_size = 8192 # bytes
block_address_size = 10 # bytes
block_access_time = 15 # ms(micro seconds)
record_size = 200 # bytes
key_size = 8 # bytes
no_of_records = 10**10 # 10 billion



print("Minimum -- nodes are fully occupied")
print("----------------------------------------")
n = floor((block_size - block_address_size) / (block_address_size + key_size))
print("Order of the tree: %d" % n)
no_of_leaf_nodes = ceil(no_of_records / n)
print("Number of leaf nodes: %d" % no_of_leaf_nodes)
print("Maximum fanout: %d" % (n+1))
h = ceil(log(no_of_leaf_nodes, n+1))
print("Height of the tree: %d" % h)
print("Time to access a key: %d ms" % (h * block_access_time))
print("Time to insert record: %d ms" % ((h + 2 + 1) * block_access_time))
# print("Non-leaf node size: %d" % ((n+1) * block_address_size + n * key_size))
# print("leaf node size: %d" % ((n+1) * block_address_size + n * key_size))
# print("Root size: %d" % ((n+1) * block_address_size + n * key_size))

print()
print("===========================================")
print()
print("Maximum -- nodes are hafly occupied")
print("----------------------------------------")
n = floor((block_size - block_address_size) / (block_address_size + key_size))
n = ceil(n/2)
print("Order of the tree: %d" % n)
no_of_leaf_nodes = ceil(no_of_records / n)
print("Number of leaf nodes: %d" % no_of_leaf_nodes)
print("Maximum fanout: %d" % (n+1))
h = ceil(log(no_of_leaf_nodes/2, n/2))
print("Height of the tree: %d" % h)
print("Time to access a key: %d ms" % (h * block_access_time))
print("Time to insert record: %d ms" % ((h + 2 + 1) * block_access_time))

# print("Size of main memery")
# print("\t Size of main memeory for 2 levels: %d" % 0)