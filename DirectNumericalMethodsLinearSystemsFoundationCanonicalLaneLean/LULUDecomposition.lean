import DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.DirectMethodGauss

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure LUFactorizationPackage {L : LinearSystemPackage} where
  lowerTriangular : Type u
  upperTriangular : Type u
  permutationMatrix : Type v
  factorizationExists : Prop
  forwardSubstitution : Prop
  backwardSubstitution : Prop

def LUFactorizationClosed {L : LinearSystemPackage} (F : LUFactorizationPackage L) : Prop :=
  F.factorizationExists ∧ F.forwardSubstitution ∧ F.backwardSubstitution

structure LUFactorizationEvidence {L : LinearSystemPackage} (F : LUFactorizationPackage L) where
  factorizationExistsClosed : F.factorizationExists
  forwardSubstitutionClosed : F.forwardSubstitution
  backwardSubstitutionClosed : F.backwardSubstitution

theorem lu_factorization_closed_from_evidence {L : LinearSystemPackage}
    (F : LUFactorizationPackage L) (E : LUFactorizationEvidence F) :
    LUFactorizationClosed F := by
  exact And.intro E.factorizationExistsClosed (And.intro E.forwardSubstitutionClosed E.backwardSubstitutionClosed)

structure LDLTransposePackage {L : LinearSystemPackage} (F : LUFactorizationPackage L) where
  diagonalMatrix : Type w
  factorizationExists : Prop
  forwardSubstitution : Prop
  backwardSubstitution : Prop

def LDLTransposeClosed {L : LinearSystemPackage} {F : LUFactorizationPackage L}
    (D : LDLTransposePackage F) : Prop :=
  D.factorizationExists ∧ D.forwardSubstitution ∧ D.backwardSubstitution

structure LDLTransposeEvidence {L : LinearSystemPackage} {F : LUFactorizationPackage L}
    (D : LDLTransposePackage F) where
  factorizationExistsClosed : D.factorizationExists
  forwardSubstitutionClosed : D.forwardSubstitution
  backwardSubstitutionClosed : D.backwardSubstitution

theorem ldl_transpose_closed_from_evidence {L : LinearSystemPackage}
    {F : LUFactorizationPackage L} (D : LDLTransposePackage F)
    (E : LDLTransposeEvidence D) : LDLTransposeClosed D := by
  exact And.intro E.factorizationExistsClosed (And.intro E.forwardSubstitutionClosed E.backwardSubstitutionClosed)

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse