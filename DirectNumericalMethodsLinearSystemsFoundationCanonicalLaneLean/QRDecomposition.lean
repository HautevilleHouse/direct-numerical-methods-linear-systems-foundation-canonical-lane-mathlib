import DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.CholeskyDecomposition

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure QRFactorizationPackage {L : LinearSystemPackage} where
  orthogonalMatrix : Type u
  upperTriangularMatrix : Type v
  factorizationExists : Prop
  backSubstitution : Prop

def QRFactorizationClosed {L : LinearSystemPackage} (Q : QRFactorizationPackage L) : Prop :=
  Q.factorizationExists ∧ Q.backSubstitution

structure QRFactorizationEvidence {L : LinearSystemPackage} (Q : QRFactorizationPackage L) where
  factorizationExistsClosed : Q.factorizationExists
  backSubstitutionClosed : Q.backSubstitution

theorem qr_factorization_closed_from_evidence {L : LinearSystemPackage}
    (Q : QRFactorizationPackage L) (E : QRFactorizationEvidence Q) :
    QRFactorizationClosed Q := by
  exact And.intro E.factorizationExistsClosed E.backSubstitutionClosed

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse