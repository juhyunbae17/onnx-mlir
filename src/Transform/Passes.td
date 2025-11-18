#ifndef ONNX_MLIR_TRANSFORMS_PASSES
#define ONNX_MLIR_TRANSFORMS_PASSES

include "mlir/Pass/PassBase.td"
include "mlir/Rewrite/PassUtil.td"

def BufferOMPLoopHoisting : Pass<"buffer-omploop-hoisting", "func::FuncOp"> {
  let summary = "Hoist buffer(alloc and dealloc) for omp loops";
  let description = [{
    This pass hoists buffer alloc/dealloc from omp worksharing loop
    to the omp.parallel, so that the buffer is created for the 
    parallel struct only once.
    This function is similar to the BufferLoopHoistingPass, but for 
    omp loops.
    It is assumed that bufferization::buildBufferDeallocationPipeline
    and createConvertBufferizationToMemRefPass() have been called.
  }];
}

def MyFuncName : Pass<"my-func-name", "func::FuncOp"> {
  let summary = "A pass that prints the name of the function being processed.";
  let description = [{
    This pass demonstrates how to define a pass that operates on func.func
    operations and prints the function's symbolic name.
  }];
}

#endif
