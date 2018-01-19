// CUDA libraries.
#include <cuda.h>
#include <cuda_runtime.h>

// Include associated header file.
#include "../include/cuda_kernel.cuh"





/**
 * Sample CUDA device function which adds an element from array A and array B.
 *
 */
__global__ void cuda_kernel(double *A, double *B, double *C, int arraySize){
    // Get thread ID.
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if thread is within array bounds.
    if ( tid < arraySize ) {
        // Add a and b.
        C[tid] = A[tid] + B[tid];
    }
}



/**
 * Wrapper function for the CUDA kernel function.
 * @param A Array A.
 * @param B Array B.
 * @param C Sum of array elements A and B directly across.
 * @param arraySize Size of arrays A, B, and C.
 */
void kernel(double *A, double *B, double *C, int arraySize) {

    // Initialize device pointers.
    double *d_A, *d_B, *d_C;

    // Allocate device memory.
    cudaMalloc((void**) &d_A, arraySize * sizeof(double));
    cudaMalloc((void**) &d_B, arraySize * sizeof(double));
    cudaMalloc((void**) &d_C, arraySize * sizeof(double));

    // Transfer arrays a and b to device.
    cudaMemcpy(d_A, A, arraySize * sizeof(double), cudaMemcpyHostToDevice);
    cudaMemcpy(d_B, B, arraySize * sizeof(double), cudaMemcpyHostToDevice);

    // Calculate blocksize and gridsize.
    dim3 blockSize(512, 1, 1);
    dim3 gridSize(512 / arraySize + 1, 1);

    // Launch CUDA kernel.
    cuda_kernel<<<gridSize, blockSize>>>(d_A, d_B, d_C, arraySize);

    // Copy result array c back to host memory.
    cudaMemcpy(C, d_C, arraySize * sizeof(double), cudaMemcpyDeviceToHost);
}











