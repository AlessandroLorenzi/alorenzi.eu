---
title: "Redid db sizes"
description: "Come capire quale database sta occupando un botto di spazio"
---

Ho un redis, che sta sempre con l'utilizzo della memoria a tappo. Ogni servizio ha il suo DB dedicato e sto tentando di capire quale servizio sta occupando tanto tanto spazio.

Non ho trovato il modo di farmelo dire direttamente da redis, quindi mi sono fatto lo script io.


```python
#!/usr/bin/env python3

import redis
import concurrent.futures

def calculate_memory_usage(db=0):
    redis_conn = redis.Redis(  
        host="127.0.0.1", # Rimpiazza con l'indirizzo del tuo redis
        port=6379,
        db=db,
        )

    keys = redis_conn.keys("*")


    def get_memory_usage(key):
        usage = redis_conn.memory_usage(key)
        return usage if usage is not None else 0

    total_memory_usage = 0
    with concurrent.futures.ThreadPoolExecutor(max_workers=30) as executor:
        results = list(executor.map(get_memory_usage, keys))
        total_memory_usage = sum(results)

    return total_memory_usage

def bytes_to_human_readable(size_in_bytes):
    for unit in ['B', 'KB', 'MB', 'GB', 'TB', 'PB']:
        if size_in_bytes < 1024:
            return f"{size_in_bytes:.2f} {unit}"
        size_in_bytes /= 1024
    return f"{size_in_bytes:.2f} PB"

if __name__ == "__main__":
    for db in range(16):
        mem_usage = calculate_memory_usage(db)
        mem_usage_human = bytes_to_human_readable(mem_usage)
        print(f"Total memory usage for database {db}: {mem_usage_human}")


```

L'ho parallelizzato perché stavo diventando vecchio.

E niente, il colpevole era chi pensavamo che fosse, ma abbiamo la prova provata.

```
Total memory usage for database 0: 1.01 GB <-- eccolo!
Total memory usage for database 1: 2.23 KB
Total memory usage for database 2: 148.51 KB
Total memory usage for database 3: 150.20 KB
Total memory usage for database 4: 20.15 KB
Total memory usage for database 5: 504.94 KB
Total memory usage for database 6: 5.76 KB
Total memory usage for database 7: 110.75 KB
Total memory usage for database 8: 0.00 B
Total memory usage for database 9: 120.00 B
Total memory usage for database 10: 5.28 KB
Total memory usage for database 11: 707.13 KB
Total memory usage for database 12: 1.77 MB
Total memory usage for database 13: 0.00 B
Total memory usage for database 14: 0.00 B
Total memory usage for database 15: 0.00 B
```
