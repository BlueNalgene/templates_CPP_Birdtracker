# Alternate makefile for CPP frame extraction
# This file should replace the default makefile when you run on OU's OSCER supercomputer
# The changes here remove the reliance on pkg-config which does not accurately locate
# the custom OpenCV installation, since the libraries are written to a non-standard directory.

# On OU's OSCER, requires the command:
# module load binutils GCC FFmpeg

# Additionally, you must ensure that the LD_CONFIG_PATH correctly points to the custom install
# directory using ``export LD_LIBRARY_PATH=$HOME/OpenCV_shared/lib64:$LD_LIBRARY_PATH``


OBJS=frame_extractor.o
BIN=g++ frame_extraction.cpp

# CFLAGS+=-Wfatal-errors
# CFLAGS+=-Wall -g -O3
CFLAGS+=-std=c++17
LDFLAGS+=-L/opt/vc/lib/ -lpthread -lstdc++fs

INCLUDES+=-I/opt/vc/include/
INCLUDES+=-I/opt/vc/include/interface/vcos/pthreads
INCLUDES+=-I/opt/vc/include/interface/vmcs_host/linux

# Local installation of OpenCV includes
INCLUDES+=-I${HOME}/OpenCV_shared/include/
INCLUDES+=-I${HOME}/OpenCV_shared/include/opencv4/
LDFLAGS+=-L${HOME}/OpenCV_shared/lib64/ -lopencv_stitching -lopencv_superres -lopencv_videostab -lopencv_aruco -lopencv_bgsegm -lopencv_bioinspired -lopencv_ccalib -lopencv_dnn_objdetect -lopencv_dpm -lopencv_face -lopencv_photo -lopencv_freetype -lopencv_fuzzy -lopencv_hfs -lopencv_img_hash -lopencv_line_descriptor -lopencv_optflow -lopencv_reg -lopencv_rgbd -lopencv_saliency -lopencv_stereo -lopencv_structured_light -lopencv_phase_unwrapping -lopencv_surface_matching -lopencv_tracking -lopencv_datasets -lopencv_text -lopencv_dnn -lopencv_plot -lopencv_xfeatures2d -lopencv_shape -lopencv_video -lopencv_ml -lopencv_ximgproc -lopencv_calib3d -lopencv_features2d -lopencv_highgui -lopencv_videoio -lopencv_flann -lopencv_xobjdetect -lopencv_imgcodecs -lopencv_objdetect -lopencv_xphoto -lopencv_imgproc -lopencv_core -lopencv_ximgproc

all:
        @rm -f $(OBJS)
        $(BIN) $(CFLAGS) $(LDFLAGS) $(RPATH) $(INCLUDES) -o $(OBJS) 
