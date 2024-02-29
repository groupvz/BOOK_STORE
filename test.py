from queue import Queue
q = Queue()
for num in range(3):
    q.put(num)
q.get()
total = 0
while q.empty() is False:
    total += q.get()
print(total)