This repo is a sample Makefile for building a project that has both C++ (.cpp and .h) and CUDA (.cu and .cuh) source files. This Makefile assumes a project file structure as the following:

```
|--> Project/
       |--> Makefile
       |--> src/ (source files)
       |--> include/ (header files)
       |--> bin/
```

For example, you could have multiple .cpp and .cu files in the source directory (src/), multiple .h and .cuh header files in the header directory (include/), and the file with the main() function (titled main.cpp in this example) in the base directory. An example of this could be the following:

```
|--> Project/
       |--> Makefile
       |--> main.cpp
       |--> src/
              |--> file1.cpp
              |--> file2.cpp
              |--> file_cuda1.cu
              |--> file_cuda2.cu
       |--> include/
              |--> file1.h
              |--> file2.h
              |--> file1.cuh
              |--> file2.cuh
       |--> bin/
```

The Makefile in this repo compiles a .cu and .cuh file called cuda_kernel.cu and cuda_kernel.cuh, which contains a simple CUDA device function. The cuda_kernel.cuh header file is included in the main.cpp file and called in the main() function. The Makefile will compile all the CUDA and C++ source files in src/ first, then compile the main.cpp file, and finally link them together.

To use this Makefile in your own projects, a few parameters may need to be changed. First, the CUDA root directory should be specified for your machine.

```
###########################################################

## USER SPECIFIC DIRECTORIES ##

# CUDA directory:
CUDA_ROOT_DIR=/usr/local/cuda

##########################################################
```

In addition, any changes to compiler options, flags, or alias should be made.

```
##########################################################

## CC COMPILER OPTIONS ##

# CC compiler options:
CC=g++
CC_FLAGS=
CC_LIBS=

##########################################################

## NVCC COMPILER OPTIONS ##

# NVCC compiler options:
NVCC=nvcc
NVCC_FLAGS=
NVCC_LIBS=

##########################################################
```

The project's file structure can be changed if necessary.

```
##########################################################

## Project file structure ##

# Source file directory:
SRC_DIR = src

# Object file directory:
OBJ_DIR = bin

# Include header file diretory:
INC_DIR = include

##########################################################
```

Finally, and most important, all of the object files that will be created should be listed in the OBJS variable with a space between each entry. Each source file in your project should be listed here as $(OBJ_DIR)/yourfile.o , these are all of the compiled source files (object files) that will be linked together to create the executable file.

```
##########################################################

## Make variables ##

# Target executable name:
EXE = run_test

# Object files:
OBJS = $(OBJ_DIR)/main.o $(OBJ_DIR)/cuda_kernel.o

##########################################################
```

Two final notes:

1. This Makefile was created on an Linux system and may not work for non-Linux OS.

2. You may clone this repository or copy and paste any component of this repository into your projects. I hope it helps.





