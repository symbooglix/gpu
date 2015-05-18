# GPU benchmarks

These [Boogie][1] programs were generated using [GPUVerify][2]
as a front end for the CUDA and OpenCL kernels in this suite.

The generated Boogie programs assert that the kernel is free from data races
and barrier divergence bugs.

Note there were 579 kernels in the FIXME study but 61 are derived from
proprietary kernels so they are not provided here.

We provide two versions of the benchmarks

## ``others`` directory

These do not contain candidate loop invariants.

The GPUVerify frontend generates candidiate loop invariants in the Boogie
programs it emits by default. These invariants would cause other Boogie
backends to emit false errors so they are removed. The following additional
command line arguments were passed to GPUVerify to generate the Boogie programs:

- ``--no-infer``. Disable generation of candidate loop invariants
- ``--only-requires``. Only use manual annotations at kernel entry points
- ``stop-at-bpl``. Do not invoke GPUVerify's back-end

## ``gpuverify`` directory

This version contains candidate loop invariants.

The following additional command line arguments were passed GPUVerify
to generate the Boogie programs:

- ``--only-requires``. Only use manual annotations at kernel entry points
- ``stop-at-bpl``. Do not invoke GPUVerify's back-end

[1]: http://research.microsoft.com/en-us/projects/boogie/
[2]: http://multicore.doc.ic.ac.uk/tools/GPUVerify/
