#!/usr/bin/env python3
import sys
import os

# Read input arguments 
try:
    a = int(sys.argv[1])
    b = int(sys.argv[2])
except ValueError:
    print("Error: both arguments must be integers.")
    sys.exit(1)

result = a + b
print(f"Adding {a} + {b} = {result}")