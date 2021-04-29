#!/bin/bash
#SBATCH -p amd_1T
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 64
python -u DNN_SingleBubble.py # CUDA / MPI
python -u BubbleNet_SingleBubble.py
