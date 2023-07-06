# EToKi_PathSafe_Singularity

## Build the container
singularity build EToKi_container.sif 



## STEP 1: Set container path
container=

## STEP 2: Prepare input files
The following command runs the EToKi 'prepare' script, which conducts pre-filtering of raw read files

singularity exec $container /bin/sh EToKi_PathSafe_Singularity/EToKi_prepare.sh


singularity exec $container /bin/sh EToKi_PathSafe_Singularity/EToKi_assemble.sh 


singularity exec $container /bin/sh EToKi_PathSafe_Singularity/run_quast.sh





