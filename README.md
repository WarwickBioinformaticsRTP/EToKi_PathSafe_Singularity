# EToKi_PathSafe_Singularity

## PART 1: Clone the repository 
```
git clone https://github.com/WarwickBioinformaticsRTP/EToKi_PathSafe_Singularity
```

## PART 2: Build the container
A singularity container containing EToKi, SPAdes, and QUAST can be built using the following command. Note, this will require sudo privileges. 
```
sudo singularity build EToKi_singularity.sif EToKi_PathSafe_Singularity/EToKi_singularity.def
```

## PART 3: Running the pipeline via the container
1. First set path to the singularity container we just built
```
container=/path/to/EToKi_singularity.sif
```








## STEP 1: Set container path
container=

## STEP 2: Prepare input files
The following command runs the EToKi 'prepare' script, which conducts pre-filtering of raw read files

singularity exec $container /bin/sh EToKi_PathSafe_Singularity/EToKi_prepare.sh


singularity exec $container /bin/sh EToKi_PathSafe_Singularity/EToKi_assemble.sh 


singularity exec $container /bin/sh EToKi_PathSafe_Singularity/run_quast.sh





