#!/bin/bash
# Script to run and profile LV1.py and LV2.py

# Running and profiling LV1.py
echo "Profiling LV1.py"
python3 -m cProfile -s time LV1.py

# Running and profiling LV2.py with example parameters
echo "Profiling LV2.py with parameters r=1, a=0.1, z=1.5, e=0.75, K=50"
python3 -m cProfile -s time LV2.py 1 0.1 1.5 0.75 50

