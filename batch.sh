#! /bin/bash

# An example Slurm batch file

#SBATCH -p debugq
#SBATCH -t 5:00
#SBATCH -N 1

echo "batch.sh running on $(hostname)"

module load singularity
module load mpich

mpirun -n 20 singularity run myproject.sif python3 /demo/sampler.py --mpi

echo "All done!"
