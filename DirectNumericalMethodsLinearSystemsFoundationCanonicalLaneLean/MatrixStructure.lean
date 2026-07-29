import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure MatrixStructure where
  matrixType : Type
  rows : Nat
  cols : Nat
  entries : matrixType
  sparse : Prop
  banded : Prop
  symmetric : Prop
  positiveDefinite : Prop

def MatrixStructureClosed (M : MatrixStructure) : Prop :=
  M.rows = M.cols ∧ M.symmetric ∧ M.positiveDefinite

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse