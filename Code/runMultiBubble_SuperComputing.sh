#!/bin/bash
#SBATCH -p amd_1T
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 64
python -u DNN_MultiBubble.py
python -u BubbleNet_MultiBubble.py
