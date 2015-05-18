#!/bin/bash
# vim: set sw=2 ts=2 softtabstop=2 expandtab:

function cleanup()
{
  echo "Giving up"
  find . -iname '*__known_bug__*' -print -delete
  find . -iname '*__injected_bug__*' -print -delete
  exit 1
}

trap cleanup SIGINT SIGTERM

function runGV()
{
  FILE_OR_DIR="$1"

  if [ ! -e "${FILE_OR_DIR}" ]; then
    echo "${FILE_OR_DIR} does not exist"
    exit 1
  fi

  if [ -n "$2" ]; then
    EXTRA_GV_OPT="--gvopt=${2}"
  fi

  # --only-requires - We want manually loop invariants to be removed but we want any requires on kernel parameters to remain
  # --stop-at-bpl - We want to work on program that has been instrumented but before houdini runs
  set -x
  python2 `which gvtester.py` \
              --gvopt=--only-requires \
              --gvopt=--stop-at-bpl \
              --kernel-regex="[^_].*\.(cu|cl)" \
              ${EXTRA_GV_OPT} \
              $1
  set +x
}

function getBuggyKernelName()
{
  if [ ! -f "${1}" ]; then
    echo "${1} does not exist"
  fi

  filename="${1}"
  extension=$( echo "${filename}" | sed 's/^.\+\(\.c[ul]\)$/\1/g')
  basename=$( echo "${filename}" | sed 's/^\(.\+\)\.c[ul]$/\1/g')
  echo "${basename}__known_bug__${extension}"
}

function green_msg()
{
  echo -e "\033[32m${1}\033[0m"
}

function red_msg()
{
  echo -e "\033[31m${1}\033[0m"
}

function getInjectedBugKernelName()
{
  if [ ! -f "${1}" ]; then
    echo "${1} does not exist"
  fi

  filename="${1}"
  extension=$( echo "${filename}" | sed 's/^.\+\(\.c[ul]\)$/\1/g')
  basename=$( echo "${filename}" | sed 's/^\(.\+\)\.c[ul]$/\1/g')
  echo "${basename}__injected_bug__${extension}"
}

# Run over regular kernels
green_msg "**** GENERATING NORMAL KERNELS ****"
runGV .

green_msg "**** GENERATING BUGGY KERNELS ****"
# Array of kernels that have KERNEL_BUG
# macro that we want to activate
#
# Apparently needs 4-thread abstraction "CUDA50/2_Graphics/Mandelbrot/_Mandelbrot0.cu" \
#
# DwtHaar1D buggy version manually exists in testsuite so it does not need to be in array
# AMD_SDK/DwtHaar1D/buggy_version.cl
#
# These need the KERNEL_BUG macro defined
KERNEL_BUGS=( "shoc/sort/top_scan/kernel.cl" \
              "parboil/tpacf/gen_hists/kernel.cl" \
              "rodinia_2.4/myocyte/kernel/kernel.cl" \
              "CUDA50/3_Imaging/convolutionFFT2D/spPostprocess2D_kernel.cu" \
            )


# Run over bugs
for k in ${KERNEL_BUGS[*]}; do
  echo "Looking at ${k}"

  if [ ! -f "${k}" ]; then
    echo "${k} does not exist"
    exit 1
  fi

  buggy_name=$(getBuggyKernelName "${k}")
  red_msg "buggy name:${buggy_name}"
  if [ -f "${buggy_name}" ]; then
    echo "${buggy_name} already exists"
    exit 1
  fi

  cp "${k}" "${buggy_name}"
  runGV "${buggy_name}" "-D=KERNEL_BUG"
  rm "${buggy_name}"
done

green_msg "**** GENERATING BUG INJECTED KERNELS ****"
INJECTED_BUGS=( "C++AMP/3000.imgblur_grid_6662C876/imgblur_Beta/kernel.cu" \
                "C++AMP/3000.imgblur_grid_6662C876/imgblur_grid/kernel.cu" \
                "C++AMP/BinomialOptions/kernel.cu" \
                "C++AMP/BitonicSort/bitonic_sort_kernel/kernel.cu" \
                "C++AMP/Convolution/convolution_simple/kernel.cu" \
                "C++AMP/Convolution/convolution_tiling/kernel.cu" \
                "C++AMP/DxInterOp/kernel.cu" \
                "C++AMP/HelloWorldCSharp/kernel.cu" \
                "C++AMP/Histogram/histo_merge_kernel/kernel.cu" \
                "C++AMP/MatrixMultiplication/mxm_amp_simple/kernel.cu" \
                "C++AMP/MatrixMultiplication/mxm_amp_tiled/kernel.cu" \
                "C++AMP/MersenneTwister/box_muller_kernel/kernel.cu" \
                "C++AMP/MersenneTwister/rand_MT_kernel/kernel.cu" \
                "C++AMP/NBody_Simulation/simple_implementation/kernel.cu" \
                "C++AMP/NBody_Simulation/tiling_implementation/kernel.cu" \
                "C++AMP/OceanCS/kernel.cu" \
                "C++AMP/TransitiveClosure/stage1/kernel.cu" \
                "C++AMP/TransitiveClosure/stage2/kernel.cu" \
                "C++AMP/TransitiveClosure/stage3/kernel.cu" \
                "CUDA20/bitonicsort/kernel.cu" \
                "CUDA20/histogram64/histogram64Kernel/kernel.cu" \
                "CUDA20/histogram64/mergeHistogram64Kernel/kernel.cu" \
                "CUDA20/scan/best/kernel.cu" \
                "CUDA20/scan/naive/kernel.cu" \
                "CUDA20/scan/workefficient/kernel.cu" \
                "CUDA20/scanlarge/inline/kernel.cu" \
                "CUDA20/scanlarge/uniformAdd/kernel.cu" \
              )

# Run over injected bugs
for k in ${INJECTED_BUGS[*]}; do
  echo "Looking at ${k}"

  if [ ! -f "${k}" ]; then
    echo "${k} does not exist"
    exit 1
  fi

  ib_name=$(getInjectedBugKernelName "${k}")
  red_msg "injected name:${ib_name}"
  if [ -f "${ib_name}" ]; then
    echo "${ib_name} already exists"
    exit 1
  fi

  cp "${k}" "${ib_name}"
  runGV "${ib_name}" "-D=MUTATION"
  rm "${ib_name}"
done
