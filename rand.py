import random

m1 = random.randint(1, 11)
m2 = random.randint(m1, 12)
d1 = random.randint(10, 28)
d2 = random.randint(10, 28)
y1 = y2 = random.randint(2015, 2018)

def n(a):
    return "0" + str(a) if a < 10 else str(a)

for i in range(1, 51):
    m1int = random.randint(1, 11)
    m1 = n(m1int)
    m2 = n(random.randint(m1int + 1, 12))
    d1 = n(random.randint(1, 28))
    d2 = n(random.randint(1, 28))
    y1 = y2 = random.randint(2014, 2018)
    print("    (", i, ", ", random.randint(1, 30),
            ", ", random.randint(1,9),
            ", '", y1, "-", m1, "-", d1,"', '",
            y2, "-", m2, "-", d2, "'),",
            sep = "")
