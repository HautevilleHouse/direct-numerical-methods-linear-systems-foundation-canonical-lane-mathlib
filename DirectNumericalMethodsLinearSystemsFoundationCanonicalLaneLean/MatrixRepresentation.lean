import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure MatrixRepresentationPackage where
  matrixType : Type u
  vectorType : Type v
  scalarType : Type w
  addition : matrixType → matrixType → matrixType
  multiplication : matrixType → matrixType → matrixType
  scalarMultiplication : scalarType → matrixType → matrixType
  transpose : matrixType → matrixType
  identity : matrixType
  zero : matrixType
  additionAssociative : Prop
  additionCommutative : Prop
  additionIdentity : Prop
  multiplicationAssociative : Prop
  distributivity : Prop
  additionAssociativeTerm : additionAssociative
  additionCommutativeTerm : additionCommutative
  additionIdentityTerm : additionIdentity
  multiplicationAssociativeTerm : multiplicationAssociative
  distributivityTerm : distributivity

structure MatrixRepresentationEvidence (M : MatrixRepresentationPackage) where
  additionAssociativeClosed : M.additionAssociative
  additionCommutativeClosed : M.additionCommutative
  additionIdentityClosed : M.additionIdentity
  multiplicationAssociativeClosed : M.multiplicationAssociative
  distributivityClosed : M.distributivity

def MatrixRepresentationClosed (M : MatrixRepresentationPackage) : Prop :=
  M.additionAssociative ∧ M.additionCommutative ∧ M.additionIdentity ∧
  M.multiplicationAssociative ∧ M.distributivity

theorem matrix_representation_closed_from_evidence
    (M : MatrixRepresentationPackage) (E : MatrixRepresentationEvidence M) :
    MatrixRepresentationClosed M := by
  exact And.intro E.additionAssociativeClosed
    (And.intro E.additionCommutativeClosed
      (And.intro E.additionIdentityClosed
        (And.intro E.multiplicationAssociativeClosed
          E.distributivityClosed)))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse