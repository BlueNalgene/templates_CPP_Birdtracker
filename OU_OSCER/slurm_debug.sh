#!/bin/bash

#SBATCH --partition=debug_5min
#SBATCH --ntasks=1
#SBATCH --mem=4000
#SBATCH --output=jobname_%J_stdout.txt
#SBATCH --error=jobname_%J_stderr.txt
#SBATCH --time=00:05:00
#SBATCH --job-name=debug_CPP_Birdtracker
#SBATCH --mail-user=test@ou.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/whoneyc
#
################################################

#### Enable strict mode for bash to handle errors properly
set -eou pipefail

#### Create a new output directory based on this script
mkdir birdtracker_$SLURM_JOB_ID
cd birdtracker_$SLURM_JOB_ID

#### Assign variables for the program, video, etc
VIDEO_FILE=/scratch/whoneyc/1524943548outA_cut_cut.mp4
PROG=${HOME}/CPP_Birdtracker/frame_extractor.o
CONFIG_PATH=$HOME/CPP_Birdtracker/settings.cfg

#### Print info about this job for the log
echo "called $(date +%s.%3N -u)"
echo "This job ID is $SLURM_JOB_ID"

#### Load Modules
# Requires ffmpeg and libpng at minimum
# may require binutils and GCC for linking.  Loading just in case
module load FFmpeg binutils GCC libpng

#### Custom LD_LIBRARY_PATH for local OpenCV build
export LD_LIBRARY_PATH=$HOME/OpenCV_shared/lib64:$LD_LIBRARY_PATH

#### Run Program
echo "started script: $(date +%s.%3N -u)"
$PROG -i $VIDEO_FILE -c $CONFIG_PATH
echo "completed job: $(date +%s.%3N -u)" 
