import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.DirectMethodsBase

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure LUDecompositionPackage where
  pivotStrategy : Prop
  forwardSubstitution : Prop
  backwardSubstitution : Prop
  numericalStability : Prop

structure LUDecompositionEvidence (P : LUDecompositionPackage) where
  pivotStrategyClosed : P.pivotStrategy
  forwardSubstitutionClosed : P.forwardSubstitution
  backwardSubstitutionClosed : P.backwardSubstitution
  numericalStabilityClosed : P.numericalStability

def LUDecompositionClosed (P : LUDecompositionPackage) : Prop :=
  P.pivotStrategy ∧ P.forwardSubstitution ∧ P.backwardSubstitution ∧ P.numericalStability

theorem lu_decomposition_closed_from_evidence (P : LUDecompositionPackage) (E : LUDecompositionEvidence P) : LUDecompositionClosed P := by
  exact And.intro E.pivotStrategyClosed (And.intro E.forwardSubstitutionClosed (And.intro E.backwardSubstitutionClosed E.numericalStabilityClosed))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse