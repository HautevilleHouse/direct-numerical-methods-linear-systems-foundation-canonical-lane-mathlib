import DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.LULUDecomposition

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure CholeskyFactorizationPackage {L : LinearSystemPackage} where
  symmetricPositiveDefinite : Prop
  lowerTriangularFactor : Type u
  factorizationExists : Prop
  forwardSubstitution : Prop
  backwardSubstitution : Prop

def CholeskyFactorizationClosed {L : LinearSystemPackage} (C : CholeskyFactorizationPackage L) : Prop :=
  C.symmetricPositiveDefinite ∧ C.factorizationExists ∧ C.forwardSubstitution ∧ C.backwardSubstitution

structure CholeskyFactorizationEvidence {L : LinearSystemPackage} (C : CholeskyFactorizationPackage L) where
  symmetricPositiveDefiniteClosed : C.symmetricPositiveDefinite
  factorizationExistsClosed : C.factorizationExists
  forwardSubstitutionClosed : C.forwardSubstitution
  backwardSubstitutionClosed : C.backwardSubstitution

theorem cholesky_factorization_closed_from_evidence {L : LinearSystemPackage}
    (C : CholeskyFactorizationPackage L) (E : CholeskyFactorizationEvidence C) :
    CholeskyFactorizationClosed C := by
  exact And.intro E.symmetricPositiveDefiniteClosed (And.intro E.factorizationExistsClosed (And.intro E.forwardSubstitutionClosed E.backwardSubstitutionClosed))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse