#!/bin/bash

#### Startup for fog_removal.py on OSCER

## Path to video file
VID_FILE=/scratch/whoneyc/1524943548outA_cut.mp4
## Starting frame number
FRAME_NO=100


## Check Python version and update module if necessary
PYTHON_VERSION=$(python3 -c "import sys; print(sys.version_info[1])")

if [[ $(($PYTHON_VERSION+0)) -lt 8 ]]
then
        module load Python
fi

## Check for imutils and install if necessary
python3 -c "import imutils" > /dev/null 2>&1
STATUS=$?

if [[ $STATUS -ne 0 ]]
then
        pip3 install imutils --user
fi

python3 $HOME/CPP_Birdtracker/fog_removal.py -a -f $VID_FILE -n $FRAME_NO 
