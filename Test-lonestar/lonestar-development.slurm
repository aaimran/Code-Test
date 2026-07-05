#!/bin/bash
#SBATCH -J WaveQLab3D        # Job name
#SBATCH -o waveqlab3d.%j.out # Output file (%j is job ID)
#SBATCH -e waveqlab3d.%j.err # Error file
#SBATCH -t 02:00:00          # Time limit
#SBATCH -N 8                # Number of nodes
#SBATCH -n 1024              # Number of tasks (MPI processes)
#SBATCH -p development            # Queue (partition)
#SBATCH --mail-type=ALL      # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=@miners.utep.edu   # Email notifications



# Load necessary modules
module purge
module load intel/19.1.1
module load impi/19.0.9

mkdir -p ./log ./output-1 ./output-2 ./output-3

#-------------------- 

fnames=(
    "test-3_xyz_raw_dom-s_pml-2km_fd-t6_res-40m_nb-2"
    "test-5_xyz_raw_dom-s_pml-2km_fd-t6_res-40m_nb-2"
)

for fname in "${fnames[@]}"; do
    mpirun -np $nprocs ./bin/./waveqlab3d ./input-3/${fname}.in | tee ./log/${fname}.log
done



