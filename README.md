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
 
Run EToKi "prepare" to perform read filtering. 
```
singularity exec $container /bin/sh EToKi_PathSafe_Singularity/EToKi_prepare.sh
```
The following files will be generated: 
- EToKi_prepare_L1_R1.fastq.gz - filtered forward reads
- EToKi_prepare_L1_R2.fastq.gz - filtered reverse reads
- PE.refstats - paired end stats
- SE.refstats - single end stats

If any singletons are identified these will be written to: 
- EToKi_prepare_L1_SE.fastq.gz

Run EToKi "assemble" to build assembly via SPAdes and perform polishing.
```
singularity exec $container /bin/sh EToKi_PathSafe_Singularity/EToKi_assemble.sh 
```
The following files will be outputted:
- EToKi_spades.result.fasta
- EToKi_spades.result.fastq

```
singularity exec $container /bin/sh EToKi_PathSafe_Singularity/run_quast.sh
```



