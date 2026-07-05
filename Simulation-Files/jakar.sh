# Default values
nprocs=40

module load compiler-rt/2024.0.0 ifort/2024.0.0 mpi/2021.13

mkdir -p ./log ./output

fnames=(
    "test-3_xyz_raw_dom-s_pml-2km_fd-u6"
    "test-2_xyz_raw_dom-s_pml-2km_fd-v6"
)

for fname in "${fnames[@]}"; do
    mpirun -np $nprocs ../../bin/./waveqlab3d ./input/${fname}.in | tee ./log/${fname}.log
done

# "test-1_xyz_raw_dom-s_pml-0km_fd-t6"
#   "test-1_xyz_raw_dom-s_pml-2km_fd-t6"
#   "test-1_xyz_raw_dom-r_pml-0km_fd-t6"
#   "test-2_xyz_raw_dom-s_pml-0km_fd-t6"
#   "test-2_xyz_raw_dom-s_pml-2km_fd-t6"
#   "test-2_xyz_raw_dom-r_pml-0km_fd-t6"