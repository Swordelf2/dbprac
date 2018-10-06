import random

for i in range(1, 23):
    print("    (", i, ", ",
            random.randint(1, 15), "),",
            sep = "")
