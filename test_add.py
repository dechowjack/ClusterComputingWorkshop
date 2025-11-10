#!/usr/bin/env python3
import sys
import os

def main():
    # Check arguments
    if len(sys.argv) != 3:
        print("Usage: python3 test_add.py <a> <b>")
        sys.exit(1)

    # Parse integers
    try:
        a = int(sys.argv[1])
        b = int(sys.argv[2])
    except ValueError:
        print("Error: both arguments must be integers.")
        sys.exit(1)

    result = a + b
    print(f"Adding {a} + {b} = {result}")

    # Ensure OUT directory exists
    os.makedirs("OUT", exist_ok=True)

    # Write result to file
    with open("OUT/result.txt", "w") as f:
        f.write(f"{a} + {b} = {result}\n")

if __name__ == "__main__":
    main()
