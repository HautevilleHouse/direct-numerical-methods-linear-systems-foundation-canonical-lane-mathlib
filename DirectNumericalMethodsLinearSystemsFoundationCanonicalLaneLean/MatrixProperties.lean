import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure MatrixProperties where
  n : Nat
  diagonalDominance : Prop
  symmetricPositiveDefinite : Prop
  conditionNumber : Float
  sparsityPatternKnown : Prop

structure MatrixPropertiesEvidence (M : MatrixProperties) where
  diagonalDominanceClosed : M.diagonalDominance
  symmetricPositiveDefiniteClosed : M.symmetricPositiveDefinite
  sparsityPatternKnownClosed : M.sparsityPatternKnown

def MatrixPropertiesClosed (M : MatrixProperties) : Prop :=
  M.diagonalDominance ∧ M.symmetricPositiveDefinite ∧ M.sparsityPatternKnown

theorem matrix_properties_closed_from_evidence
    (M : MatrixProperties) (E : MatrixPropertiesEvidence M) :
    MatrixPropertiesClosed M := by
  exact And.intro E.diagonalDominanceClosed
    (And.intro E.symmetricPositiveDefiniteClosed E.sparsityPatternKnownClosed)

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse