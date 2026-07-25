#!/bin/bash
#SBATCH -J lammps
#SBATCH -N 1
#SBATCH -n 28
#SBATCH -t 240:00:00
#SBATCH -w node03

cd $SLURM_SUBMIT_DIR
srun hostname | sort > slurm.nodefile

# --------------- Do NOT Change the code in the box --------------- #
echo "# ----------------- Job log ----------------- #" >> slurm.log #
echo ""                                                >> slurm.log #
echo "Job dir    is: `pwd`"                            >> slurm.log #
echo "Job starts at: `date`"                           >> slurm.log #
echo "Job works  at: `srun hostname | sort| uniq`"     >> slurm.log #
# ----------------------------------------------------------------- #

source /home/public/software_install/intel/bin/compilervars.sh intel64

(time mpirun -hostfile slurm.nodefile -np $SLURM_NTASKS lammps-20200303-icc_kokkos_omp -sf intel -in re_05system1M.in  > slurm.out) 2>>slurm.log

find . -name "slurm-*" -type f -size 0c | xargs -n 1 rm -f

python python-syn.py

# --------------- Do NOT Change the code in the box --------------- #
echo ""                                                >> slurm.log #
echo "Job finishes at: `date`"                         >> slurm.log #
echo ""                                                >> slurm.log #
# ----------------------------------------------------------------- #
