/* ============================================================

Copyright (c) 2009-2010 Advanced Micro Devices, Inc.  All rights reserved.
 
Redistribution and use of this material is permitted under the following 
conditions:
 
Redistributions must retain the above copyright notice and all terms of this 
license.
 
In no event shall anyone redistributing or accessing or using this material 
commence or participate in any arbitration or legal action relating to this 
material against Advanced Micro Devices, Inc. or any copyright holders or 
contributors. The foregoing shall survive any expiration or termination of 
this license or any agreement or access or use related to this material. 

ANY BREACH OF ANY TERM OF THIS LICENSE SHALL RESULT IN THE IMMEDIATE REVOCATION 
OF ALL RIGHTS TO REDISTRIBUTE, ACCESS OR USE THIS MATERIAL.

THIS MATERIAL IS PROVIDED BY ADVANCED MICRO DEVICES, INC. AND ANY COPYRIGHT 
HOLDERS AND CONTRIBUTORS "AS IS" IN ITS CURRENT CONDITION AND WITHOUT ANY 
REPRESENTATIONS, GUARANTEE, OR WARRANTY OF ANY KIND OR IN ANY WAY RELATED TO 
SUPPORT, INDEMNITY, ERROR FREE OR UNINTERRUPTED OPERA TION, OR THAT IT IS FREE 
FROM DEFECTS OR VIRUSES.  ALL OBLIGATIONS ARE HEREBY DISCLAIMED - WHETHER 
EXPRESS, IMPLIED, OR STATUTORY - INCLUDING, BUT NOT LIMITED TO, ANY IMPLIED 
WARRANTIES OF TITLE, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, 
ACCURACY, COMPLETENESS, OPERABILITY, QUALITY OF SERVICE, OR NON-INFRINGEMENT. 
IN NO EVENT SHALL ADVANCED MICRO DEVICES, INC. OR ANY COPYRIGHT HOLDERS OR 
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, PUNITIVE,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, REVENUE, DATA, OR PROFITS; OR 
BUSINESS INTERRUPTION) HOWEVER CAUSED OR BASED ON ANY THEORY OF LIABILITY 
ARISING IN ANY WAY RELATED TO THIS MATERIAL, EVEN IF ADVISED OF THE POSSIBILITY 
OF SUCH DAMAGE. THE ENTIRE AND AGGREGATE LIABILITY OF ADVANCED MICRO DEVICES, 
INC. AND ANY COPYRIGHT HOLDERS AND CONTRIBUTORS SHALL NOT EXCEED TEN DOLLARS 
(US $10.00). ANYONE REDISTRIBUTING OR ACCESSING OR USING THIS MATERIAL ACCEPTS 
THIS ALLOCATION OF RISK AND AGREES TO RELEASE ADVANCED MICRO DEVICES, INC. AND 
ANY COPYRIGHT HOLDERS AND CONTRIBUTORS FROM ANY AND ALL LIABILITIES, 
OBLIGATIONS, CLAIMS, OR DEMANDS IN EXCESS OF TEN DOLLARS (US $10.00). THE 
FOREGOING ARE ESSENTIAL TERMS OF THIS LICENSE AND, IF ANY OF THESE TERMS ARE 
CONSTRUED AS UNENFORCEABLE, FAIL IN ESSENTIAL PURPOSE, OR BECOME VOID OR 
DETRIMENTAL TO ADVANCED MICRO DEVICES, INC. OR ANY COPYRIGHT HOLDERS OR 
CONTRIBUTORS FOR ANY REASON, THEN ALL RIGHTS TO REDISTRIBUTE, ACCESS OR USE 
THIS MATERIAL SHALL TERMINATE IMMEDIATELY. MOREOVER, THE FOREGOING SHALL 
SURVIVE ANY EXPIRATION OR TERMINATION OF THIS LICENSE OR ANY AGREEMENT OR 
ACCESS OR USE RELATED TO THIS MATERIAL.

NOTICE IS HEREBY PROVIDED, AND BY REDISTRIBUTING OR ACCESSING OR USING THIS 
MATERIAL SUCH NOTICE IS ACKNOWLEDGED, THAT THIS MATERIAL MAY BE SUBJECT TO 
RESTRICTIONS UNDER THE LAWS AND REGULATIONS OF THE UNITED STATES OR OTHER 
COUNTRIES, WHICH INCLUDE BUT ARE NOT LIMITED TO, U.S. EXPORT CONTROL LAWS SUCH 
AS THE EXPORT ADMINISTRATION REGULATIONS AND NATIONAL SECURITY CONTROLS AS 
DEFINED THEREUNDER, AS WELL AS STATE DEPARTMENT CONTROLS UNDER THE U.S. 
MUNITIONS LIST. THIS MATERIAL MAY NOT BE USED, RELEASED, TRANSFERRED, IMPORTED,
EXPORTED AND/OR RE-EXPORTED IN ANY MANNER PROHIBITED UNDER ANY APPLICABLE LAWS, 
INCLUDING U.S. EXPORT CONTROL LAWS REGARDING SPECIFICALLY DESIGNATED PERSONS, 
COUNTRIES AND NATIONALS OF COUNTRIES SUBJECT TO NATIONAL SECURITY CONTROLS. 
MOREOVER, THE FOREGOING SHALL SURVIVE ANY EXPIRATION OR TERMINATION OF ANY 
LICENSE OR AGREEMENT OR ACCESS OR USE RELATED TO THIS MATERIAL.

NOTICE REGARDING THE U.S. GOVERNMENT AND DOD AGENCIES: This material is 
provided with "RESTRICTED RIGHTS" and/or "LIMITED RIGHTS" as applicable to 
computer software and technical data, respectively. Use, duplication, 
distribution or disclosure by the U.S. Government and/or DOD agencies is 
subject to the full extent of restrictions in all applicable regulations, 
including those found at FAR52.227 and DFARS252.227 et seq. and any successor 
regulations thereof. Use of this material by the U.S. Government and/or DOD 
agencies is acknowledgment of the proprietary rights of any copyright holders 
and contributors, including those of Advanced Micro Devices, Inc., as well as 
the provisions of FAR52.227-14 through 23 regarding privately developed and/or 
commercial computer software.

This license forms the entire agreement regarding the subject matter hereof and 
supersedes all proposals and prior discussions and writings between the parties 
with respect thereto. This license does not affect any ownership, rights, title,
or interest in, or relating to, this material. No terms of this license can be 
modified or waived, and no breach of this license can be excused, unless done 
so in a writing signed by all affected parties. Each term of this license is 
separately enforceable. If any term of this license is determined to be or 
becomes unenforceable or illegal, such term shall be reformed to the minimum 
extent necessary in order for this license to remain in effect in accordance 
with its terms as modified by such reformation. This license shall be governed 
by and construed in accordance with the laws of the State of Texas without 
regard to rules on conflicts of law of any state or jurisdiction or the United 
Nations Convention on the International Sale of Goods. All disputes arising out 
of this license shall be subject to the jurisdiction of the federal and state 
courts in Austin, Texas, and all defenses are hereby waived concerning personal 
jurisdiction and venue of these courts.

============================================================ */

/* 4x4 tile version = In each iteration of loop, data is loaded into 4 registers from matrixA, 4 registers from matrixB and their
   multiplication is computed - Fetches are cache friendly and increases the ALU/TEX ratio */
/* Requires global threads = (widthC / 4, heightC / 4) */
#define TILEX 4
#define TILEX_SHIFT 2
#define TILEY 4
#define TILEY_SHIFT 2

__constant sampler_t imageSampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP | CLK_FILTER_NEAREST; 

#if mykernel == 1

__kernel void mmmKernel(__read_only image2d_t matrixA,
            __read_only image2d_t matrixB,
            __write_only image2d_t matrixC,
            uint widthA, 
            uint widthB)
{
    int2 pos = (int2)(get_global_id(0), get_global_id(1));

    float4 sum0 = (float4)(0);
    float4 sum1 = (float4)(0);
    float4 sum2 = (float4)(0);
    float4 sum3 = (float4)(0);

    widthB /= 4; 

    for(int i = 0; i < widthA; i=i+4)
    {
        float4 tempA0 = read_imagef(matrixA, imageSampler, (int2)(i/4, pos.y << TILEY_SHIFT));
        float4 tempA1 = read_imagef(matrixA, imageSampler, (int2)(i/4, (pos.y << TILEY_SHIFT) + 1));
        float4 tempA2 = read_imagef(matrixA, imageSampler, (int2)(i/4, (pos.y << TILEY_SHIFT) + 2));
        float4 tempA3 = read_imagef(matrixA, imageSampler, (int2)(i/4, (pos.y << TILEY_SHIFT) + 3));

        float4 tempB0 = read_imagef(matrixB, imageSampler, (int2)(pos.x, i));
        float4 tempB1 = read_imagef(matrixB, imageSampler, (int2)(pos.x, i + 1));
        float4 tempB2 = read_imagef(matrixB, imageSampler, (int2)(pos.x, i + 2));
        float4 tempB3 = read_imagef(matrixB, imageSampler, (int2)(pos.x, i + 3));

        sum0.x += tempA0.x * tempB0.x + tempA0.y * tempB1.x + tempA0.z * tempB2.x + tempA0.w * tempB3.x;
        sum0.y += tempA0.x * tempB0.y + tempA0.y * tempB1.y + tempA0.z * tempB2.y + tempA0.w * tempB3.y;
        sum0.z += tempA0.x * tempB0.z + tempA0.y * tempB1.z + tempA0.z * tempB2.z + tempA0.w * tempB3.z;
        sum0.w += tempA0.x * tempB0.w + tempA0.y * tempB1.w + tempA0.z * tempB2.w + tempA0.w * tempB3.w;

        sum1.x += tempA1.x * tempB0.x + tempA1.y * tempB1.x + tempA1.z * tempB2.x + tempA1.w * tempB3.x;
        sum1.y += tempA1.x * tempB0.y + tempA1.y * tempB1.y + tempA1.z * tempB2.y + tempA1.w * tempB3.y;
        sum1.z += tempA1.x * tempB0.z + tempA1.y * tempB1.z + tempA1.z * tempB2.z + tempA1.w * tempB3.z;
        sum1.w += tempA1.x * tempB0.w + tempA1.y * tempB1.w + tempA1.z * tempB2.w + tempA1.w * tempB3.w;

        sum2.x += tempA2.x * tempB0.x + tempA2.y * tempB1.x + tempA2.z * tempB2.x + tempA2.w * tempB3.x;
        sum2.y += tempA2.x * tempB0.y + tempA2.y * tempB1.y + tempA2.z * tempB2.y + tempA2.w * tempB3.y;
        sum2.z += tempA2.x * tempB0.z + tempA2.y * tempB1.z + tempA2.z * tempB2.z + tempA2.w * tempB3.z;
        sum2.w += tempA2.x * tempB0.w + tempA2.y * tempB1.w + tempA2.z * tempB2.w + tempA2.w * tempB3.w;

        sum3.x += tempA3.x * tempB0.x + tempA3.y * tempB1.x + tempA3.z * tempB2.x + tempA3.w * tempB3.x;
        sum3.y += tempA3.x * tempB0.y + tempA3.y * tempB1.y + tempA3.z * tempB2.y + tempA3.w * tempB3.y;
        sum3.z += tempA3.x * tempB0.z + tempA3.y * tempB1.z + tempA3.z * tempB2.z + tempA3.w * tempB3.z;
        sum3.w += tempA3.x * tempB0.w + tempA3.y * tempB1.w + tempA3.z * tempB2.w + tempA3.w * tempB3.w;

    }

    write_imagef(matrixC, (int2)(pos.x, pos.y * 4), sum0);
    write_imagef(matrixC, (int2)(pos.x, pos.y * 4 + 1), sum1);
    write_imagef(matrixC, (int2)(pos.x, pos.y * 4 + 2), sum2);
    write_imagef(matrixC, (int2)(pos.x, pos.y * 4 + 3), sum3);
}
#endif


/* Tile 4x8 = each thread computes 16 floats*/
/* Requires global threads = (widthC / 4, heightC / 8) */
#define TILEX 4
#define TILEX_SHIFT 2
#define TILEY 8
#define TILEY_SHIFT 3

#if mykernel == 2
__kernel void mmmKernel2(__read_only image2d_t matrixA,
            __read_only image2d_t matrixB,
            __write_only image2d_t matrixC,
            uint widthA, 
            uint widthB)
{
    int2 pos = (int2)(get_global_id(0), get_global_id(1));

    float4 sum0 = (float4)(0);
    float4 sum1 = (float4)(0);
    float4 sum2 = (float4)(0);
    float4 sum3 = (float4)(0);
    float4 sum4 = (float4)(0);
    float4 sum5 = (float4)(0);
    float4 sum6 = (float4)(0);
    float4 sum7 = (float4)(0);

    widthB = widthB >> 2;

    for(int i = 0; i < widthA; i=i+4)
    {
        float4 tempA0 = read_imagef(matrixA, imageSampler, (int2)(i >> 2, pos.y << TILEY_SHIFT));
        float4 tempA1 = read_imagef(matrixA, imageSampler, (int2)(i >> 2, (pos.y << TILEY_SHIFT) + 1));
        float4 tempA2 = read_imagef(matrixA, imageSampler, (int2)(i >> 2, (pos.y << TILEY_SHIFT) + 2));
        float4 tempA3 = read_imagef(matrixA, imageSampler, (int2)(i >> 2, (pos.y << TILEY_SHIFT) + 3));
        float4 tempA4 = read_imagef(matrixA, imageSampler, (int2)(i >> 2, (pos.y << TILEY_SHIFT) + 4));
        float4 tempA5 = read_imagef(matrixA, imageSampler, (int2)(i >> 2, (pos.y << TILEY_SHIFT) + 5));
        float4 tempA6 = read_imagef(matrixA, imageSampler, (int2)(i >> 2, (pos.y << TILEY_SHIFT) + 6));
        float4 tempA7 = read_imagef(matrixA, imageSampler, (int2)(i >> 2, (pos.y << TILEY_SHIFT) + 7));

        float4 tempB0 = read_imagef(matrixB, imageSampler, (int2)(pos.x, i));
        float4 tempB1 = read_imagef(matrixB, imageSampler, (int2)(pos.x, i + 1));
        float4 tempB2 = read_imagef(matrixB, imageSampler, (int2)(pos.x, i + 2));
        float4 tempB3 = read_imagef(matrixB, imageSampler, (int2)(pos.x, i + 3));

        sum0.x += tempA0.x * tempB0.x + tempA0.y * tempB1.x + tempA0.z * tempB2.x + tempA0.w * tempB3.x;
        sum0.y += tempA0.x * tempB0.y + tempA0.y * tempB1.y + tempA0.z * tempB2.y + tempA0.w * tempB3.y;
        sum0.z += tempA0.x * tempB0.z + tempA0.y * tempB1.z + tempA0.z * tempB2.z + tempA0.w * tempB3.z;
        sum0.w += tempA0.x * tempB0.w + tempA0.y * tempB1.w + tempA0.z * tempB2.w + tempA0.w * tempB3.w;

        sum1.x += tempA1.x * tempB0.x + tempA1.y * tempB1.x + tempA1.z * tempB2.x + tempA1.w * tempB3.x;
        sum1.y += tempA1.x * tempB0.y + tempA1.y * tempB1.y + tempA1.z * tempB2.y + tempA1.w * tempB3.y;
        sum1.z += tempA1.x * tempB0.z + tempA1.y * tempB1.z + tempA1.z * tempB2.z + tempA1.w * tempB3.z;
        sum1.w += tempA1.x * tempB0.w + tempA1.y * tempB1.w + tempA1.z * tempB2.w + tempA1.w * tempB3.w;

        sum2.x += tempA2.x * tempB0.x + tempA2.y * tempB1.x + tempA2.z * tempB2.x + tempA2.w * tempB3.x;
        sum2.y += tempA2.x * tempB0.y + tempA2.y * tempB1.y + tempA2.z * tempB2.y + tempA2.w * tempB3.y;
        sum2.z += tempA2.x * tempB0.z + tempA2.y * tempB1.z + tempA2.z * tempB2.z + tempA2.w * tempB3.z;
        sum2.w += tempA2.x * tempB0.w + tempA2.y * tempB1.w + tempA2.z * tempB2.w + tempA2.w * tempB3.w;

        sum3.x += tempA3.x * tempB0.x + tempA3.y * tempB1.x + tempA3.z * tempB2.x + tempA3.w * tempB3.x;
        sum3.y += tempA3.x * tempB0.y + tempA3.y * tempB1.y + tempA3.z * tempB2.y + tempA3.w * tempB3.y;
        sum3.z += tempA3.x * tempB0.z + tempA3.y * tempB1.z + tempA3.z * tempB2.z + tempA3.w * tempB3.z;
        sum3.w += tempA3.x * tempB0.w + tempA3.y * tempB1.w + tempA3.z * tempB2.w + tempA3.w * tempB3.w;

        sum4.x += tempA4.x * tempB0.x + tempA4.y * tempB1.x + tempA4.z * tempB2.x + tempA4.w * tempB3.x;
        sum4.y += tempA4.x * tempB0.y + tempA4.y * tempB1.y + tempA4.z * tempB2.y + tempA4.w * tempB3.y;
        sum4.z += tempA4.x * tempB0.z + tempA4.y * tempB1.z + tempA4.z * tempB2.z + tempA4.w * tempB3.z;
        sum4.w += tempA4.x * tempB0.w + tempA4.y * tempB1.w + tempA4.z * tempB2.w + tempA4.w * tempB3.w;

        sum5.x += tempA5.x * tempB0.x + tempA5.y * tempB1.x + tempA5.z * tempB2.x + tempA5.w * tempB3.x;
        sum5.y += tempA5.x * tempB0.y + tempA5.y * tempB1.y + tempA5.z * tempB2.y + tempA5.w * tempB3.y;
        sum5.z += tempA5.x * tempB0.z + tempA5.y * tempB1.z + tempA5.z * tempB2.z + tempA5.w * tempB3.z;
        sum5.w += tempA5.x * tempB0.w + tempA5.y * tempB1.w + tempA5.z * tempB2.w + tempA5.w * tempB3.w;

        sum6.x += tempA6.x * tempB0.x + tempA6.y * tempB1.x + tempA6.z * tempB2.x + tempA6.w * tempB3.x;
        sum6.y += tempA6.x * tempB0.y + tempA6.y * tempB1.y + tempA6.z * tempB2.y + tempA6.w * tempB3.y;
        sum6.z += tempA6.x * tempB0.z + tempA6.y * tempB1.z + tempA6.z * tempB2.z + tempA6.w * tempB3.z;
        sum6.w += tempA6.x * tempB0.w + tempA6.y * tempB1.w + tempA6.z * tempB2.w + tempA6.w * tempB3.w;

        sum7.x += tempA7.x * tempB0.x + tempA7.y * tempB1.x + tempA7.z * tempB2.x + tempA7.w * tempB3.x;
        sum7.y += tempA7.x * tempB0.y + tempA7.y * tempB1.y + tempA7.z * tempB2.y + tempA7.w * tempB3.y;
        sum7.z += tempA7.x * tempB0.z + tempA7.y * tempB1.z + tempA7.z * tempB2.z + tempA7.w * tempB3.z;
        sum7.w += tempA7.x * tempB0.w + tempA7.y * tempB1.w + tempA7.z * tempB2.w + tempA7.w * tempB3.w;

    }
    write_imagef(matrixC, (int2)(pos.x, pos.y * 8), sum0);
    write_imagef(matrixC, (int2)(pos.x, pos.y * 8 + 1), sum1);
    write_imagef(matrixC, (int2)(pos.x, pos.y * 8 + 2), sum2);
    write_imagef(matrixC, (int2)(pos.x, pos.y * 8 + 3), sum3);
    write_imagef(matrixC, (int2)(pos.x, pos.y * 8 + 4), sum4);
    write_imagef(matrixC, (int2)(pos.x, pos.y * 8 + 5), sum5);
    write_imagef(matrixC, (int2)(pos.x, pos.y * 8 + 6), sum6);
    write_imagef(matrixC, (int2)(pos.x, pos.y * 8 + 7), sum7);
}

#endif



/* Optimized version over 4x8 tiled version */
#define TILEX 4
#define TILEX_SHIFT 2
#define TILEY 8
#define TILEY_SHIFT 3


static __attribute__((always_inline))
float4 mat_mult_mini(float4 a, float4 b0, float4 b1, float4 b2, float4 b3, float4 c)
{
    float4 tmp = mad((float4)a.x, b0, c);
    tmp = mad((float4)a.y, b1, tmp);
    tmp = mad((float4)a.z, b2, tmp);
    tmp = mad((float4)a.w, b3, tmp);
    return tmp;
}
static __attribute__((always_inline))
float4 mat_mult_pre(float4 a, float4 b0, float4 b1, float4 b2, float4 b3)
{
    float4 tmp = (float4)a.x * b0;
    tmp = mad((float4)a.y, b1, tmp);
    tmp = mad((float4)a.z, b2, tmp);
    tmp = mad((float4)a.w, b3, tmp);
    return tmp;
}

#if mykernel == 3

__kernel void mmmKernel3(__read_only image2d_t matrixA,
            __read_only image2d_t matrixB,
            __write_only image2d_t matrixC,
            uint widthA, 
            uint widthB)
{
    int2 pos = (int2)(get_global_id(0), get_global_id(1));

    float4 sum0;
    float4 sum1;
    float4 sum2;
    float4 sum3;
    float4 sum4;
    float4 sum5;
    float4 sum6;
    float4 sum7;

    widthB = widthB >> 2;

    int8 offsety = (int8)(0, 1, 2, 3, 4, 5, 6, 7);
    int4 offsetx = (int4)(0, 1, 2, 3);
    int xpos = pos.x;
    int ypos = pos.y;
    int8 ybs = (int8)(ypos << TILEY_SHIFT) + offsety;
    int j = 0;
    int ib4 = 0;
    int4 ioff = offsetx;
    // by pulling the first iteration out of the loop, we don't need to
    // worry about zero'ing out our accumulation variables, saving 8 cycles.
    float4 tempA0 = read_imagef(matrixA, imageSampler, (int2)(0, ybs.s0));
    float4 tempA1 = read_imagef(matrixA, imageSampler, (int2)(0, ybs.s1));
    float4 tempA2 = read_imagef(matrixA, imageSampler, (int2)(0, ybs.s2));
    float4 tempA3 = read_imagef(matrixA, imageSampler, (int2)(0, ybs.s3));
    float4 tempA4 = read_imagef(matrixA, imageSampler, (int2)(0, ybs.s4));
    float4 tempA5 = read_imagef(matrixA, imageSampler, (int2)(0, ybs.s5));
    float4 tempA6 = read_imagef(matrixA, imageSampler, (int2)(0, ybs.s6));
    float4 tempA7 = read_imagef(matrixA, imageSampler, (int2)(0, ybs.s7));
    float4 tempB0 = read_imagef(matrixB, imageSampler, (int2)(pos.x, 0));
    float4 tempB1 = read_imagef(matrixB, imageSampler, (int2)(pos.x, 1));
    float4 tempB2 = read_imagef(matrixB, imageSampler, (int2)(pos.x, 2));
    float4 tempB3 = read_imagef(matrixB, imageSampler, (int2)(pos.x, 3));

    sum0 = mat_mult_pre(tempA0, tempB0, tempB1, tempB2, tempB3);
    sum1 = mat_mult_pre(tempA1, tempB0, tempB1, tempB2, tempB3);
    sum2 = mat_mult_pre(tempA2, tempB0, tempB1, tempB2, tempB3);
    sum3 = mat_mult_pre(tempA3, tempB0, tempB1, tempB2, tempB3);
    sum4 = mat_mult_pre(tempA4, tempB0, tempB1, tempB2, tempB3);
    sum5 = mat_mult_pre(tempA5, tempB0, tempB1, tempB2, tempB3);
    sum6 = mat_mult_pre(tempA6, tempB0, tempB1, tempB2, tempB3);
    sum7 = mat_mult_pre(tempA7, tempB0, tempB1, tempB2, tempB3);
    for(int i = 4; i < widthA; i=i+4)
    {
        int ib4 = i >> 2;
        int4 ioff = (int4)(i) + offsetx;
        tempA0 = read_imagef(matrixA, imageSampler, (int2)(ib4, ybs.s0));
        tempA1 = read_imagef(matrixA, imageSampler, (int2)(ib4, ybs.s1));
        tempA2 = read_imagef(matrixA, imageSampler, (int2)(ib4, ybs.s2));
        tempA3 = read_imagef(matrixA, imageSampler, (int2)(ib4, ybs.s3));
        tempB0 = read_imagef(matrixB, imageSampler, (int2)(pos.x, ioff.s0));
        tempB1 = read_imagef(matrixB, imageSampler, (int2)(pos.x, ioff.s1));
        tempB2 = read_imagef(matrixB, imageSampler, (int2)(pos.x, ioff.s2));
        tempB3 = read_imagef(matrixB, imageSampler, (int2)(pos.x, ioff.s3));
        tempA4 = read_imagef(matrixA, imageSampler, (int2)(ib4, ybs.s4));
        tempA5 = read_imagef(matrixA, imageSampler, (int2)(ib4, ybs.s5));
        tempA6 = read_imagef(matrixA, imageSampler, (int2)(ib4, ybs.s6));
        tempA7 = read_imagef(matrixA, imageSampler, (int2)(ib4, ybs.s7));
        sum0 = mat_mult_mini(tempA0, tempB0, tempB1, tempB2, tempB3, sum0);
        sum1 = mat_mult_mini(tempA1, tempB0, tempB1, tempB2, tempB3, sum1);
        sum2 = mat_mult_mini(tempA2, tempB0, tempB1, tempB2, tempB3, sum2);
        sum3 = mat_mult_mini(tempA3, tempB0, tempB1, tempB2, tempB3, sum3);
        sum4 = mat_mult_mini(tempA4, tempB0, tempB1, tempB2, tempB3, sum4);
        sum5 = mat_mult_mini(tempA5, tempB0, tempB1, tempB2, tempB3, sum5);
        sum6 = mat_mult_mini(tempA6, tempB0, tempB1, tempB2, tempB3, sum6);
        sum7 = mat_mult_mini(tempA7, tempB0, tempB1, tempB2, tempB3, sum7);
    }
    ypos = pos.y * 8;
    int8 ypos8 = (int8)(ypos) + offsety;
    write_imagef(matrixC, (int2)(pos.x, ypos8.s0), sum0);
    write_imagef(matrixC, (int2)(pos.x, ypos8.s1), sum1);
    write_imagef(matrixC, (int2)(pos.x, ypos8.s2), sum2);
    write_imagef(matrixC, (int2)(pos.x, ypos8.s3), sum3);
    write_imagef(matrixC, (int2)(pos.x, ypos8.s4), sum4);
    write_imagef(matrixC, (int2)(pos.x, ypos8.s5), sum5);
    write_imagef(matrixC, (int2)(pos.x, ypos8.s6), sum6);
    write_imagef(matrixC, (int2)(pos.x, ypos8.s7), sum7);
}
#endif
