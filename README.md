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
First set path to the singularity container we just built
```
container=/path/to/EToKi_singularity.sif
```
 
Next, create symbolic links to raw illumina read files (paired reads are expected!). Note: the pipeline expects the read files to be called "raw_forward.fastq.gz" and "raw_reverse.fastq.gz"
```
ln -s /path/to/raw/forward/read raw_forward.fastq.gz
ln -s /path/to/raw/reverse/read raw_reverse.fastq.gz
```
 
Run EToKi "prepare" to perform read filtering. The following files will be generated: EToKi_prepare_L1_R1.fastq.gz, and EToKi_prepare_L1_R2.fastq.gz. If any singletons are identified these will be written to: EToKi_prepare_L1_SE.fastq.gz
```
singularity exec $container /bin/sh EToKi_PathSafe_Singularity/EToKi_prepare.sh
```

Run 
```
singularity exec $container /bin/sh EToKi_PathSafe_Singularity/EToKi_assemble.sh 
```
```
singularity exec $container /bin/sh EToKi_PathSafe_Singularity/run_quast.sh
```



