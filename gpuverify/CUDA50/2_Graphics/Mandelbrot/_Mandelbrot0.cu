//pass
//--gridDim=14 --blockDim=[32,32] --only-intra-group

template<class T>
__global__ void Mandelbrot0(uchar4 *dst, const int imageW, const int imageH, const int crunch, const T xOff, const T yOff,
                            const T xJP, const T yJP, const T scale, const uchar4 colors, const int frame,
                            const int animationFrame, const int gridWidth, const int numBlocks, const bool isJ);
template
__global__ void Mandelbrot0<float>(uchar4 *dst, const int imageW, const int imageH, const int crunch, const float xOff, const float yOff,
                            const float xJP, const float yJP, const float scale, const uchar4 colors, const int frame,
                            const int animationFrame, const int gridWidth, const int numBlocks, const bool isJ);

#include "common.h"

template<class T>
__global__ void Mandelbrot0(uchar4 *dst, const int imageW, const int imageH, const int crunch, const T xOff, const T yOff,
                            const T xJP, const T yJP, const T scale, const uchar4 colors, const int frame,
                            const int animationFrame, const int gridWidth, const int numBlocks, const bool isJ)
{
    __requires(imageW == 800);
    __requires(imageH == 600);
    __requires(gridWidth == 25);
    __requires(numBlocks == 475);

    __shared__ unsigned int blockIndex;
    __shared__ unsigned int blockX, blockY;

    // loop until all blocks completed
    while (1)
    {
#ifndef KERNEL_BUG
        __syncthreads();
#endif
        
        if ((threadIdx.x==0) && (threadIdx.y==0))
        {
            // get block to process
            blockIndex = atomicAdd(&blockCounter, 1);
            blockX = blockIndex % gridWidth;            // note: this is slow, but only called once per block here
            blockY = blockIndex / gridWidth;
        }

        __syncthreads();
        
        if (blockIndex >= numBlocks)
        {
            break;    // finish
        }

        // process this block
        const int ix = blockDim.x * blockX + threadIdx.x;
        const int iy = blockDim.y * blockY + threadIdx.y;
        
        if ((ix < imageW) && (iy < imageH))
        {
            // Calculate the location
            const T xPos = (T)ix * scale + xOff;
            const T yPos = (T)iy * scale + yOff;

            // Calculate the Mandelbrot index for the current location
            int m = CalcMandelbrot<T>(xPos, yPos, xJP, yJP, crunch, isJ);
            //            int m = blockIdx.x;         // uncomment to see scheduling order
            m = m > 0 ? crunch - m : 0;

            // Convert the Mandelbrot index into a color
            uchar4 color;

            if (m)
            {
                m += animationFrame;
                color.x = m * colors.x;
                color.y = m * colors.y;
                color.z = m * colors.z;
            }
            else
            {
                color.x = 0;
                color.y = 0;
                color.z = 0;
            }

            // Output the pixel
            int pixel = imageW * iy + ix;

            if (frame == 0)
            {
                color.w = 0;
                dst[pixel] = color;
            }
            else
            {
                int frame1 = frame + 1;
                int frame2 = frame1 / 2;
                dst[pixel].x = (dst[pixel].x * frame + color.x + frame2) / frame1;
                dst[pixel].y = (dst[pixel].y * frame + color.y + frame2) / frame1;
                dst[pixel].z = (dst[pixel].z * frame + color.z + frame2) / frame1;
            }
        }

    }

} // Mandelbrot0
