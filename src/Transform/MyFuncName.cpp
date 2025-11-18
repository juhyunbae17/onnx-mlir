#include "mlir/Transforms/Passes.h"

#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/Operation.h"

#include "src/Pass/Passes.hpp"

#include "llvm/Support/raw_ostream.h"

using namespace mlir;

namespace mlir {
#define GEN_PASS_DEF_MYFUNCNAMEPASS
#include "src/Transform/Passes.h.inc"
} // namespace mlir

using namespace mlir;

namespace {
struct MyFuncNamePass : public mlir::PassWrapper<MyFuncNamePass, mlir::OperationPass<mlir::func::FuncOp>> {

  void runOnOperation() override {
    mlir::func::FuncOp funcOp = getOperation();
    llvm::outs() << "Function name: " << funcOp.getName() << "\n";
  }
};
} // namespace


namespace onnx_mlir {
std::unique_ptr<Pass> createMyFuncName() {
  return std::make_unique<MyFuncNamePass>();
};
}//namespace onnx_mlir
