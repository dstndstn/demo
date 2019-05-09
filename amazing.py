import sys
for x in sys.argv[1:]:
    f = open(x)
    txt = f.read().strip()
    print(txt)
    print(''.join([chr(ord(c) + 3) for c in txt]))
