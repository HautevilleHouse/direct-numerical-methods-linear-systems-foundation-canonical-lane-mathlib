import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure PreconditionerPackage where
  preconditionerType : Type
  spectralConditionNumberBound : Float
  positiveDefinite : Prop
  symmetry : Prop

structure PreconditionerEvidence (P : PreconditionerPackage) where
  positiveDefiniteClosed : P.positiveDefinite
  symmetryClosed : P.symmetry

def PreconditionerClosed (P : PreconditionerPackage) : Prop :=
  P.positiveDefinite ∧ P.symmetry

theorem preconditioner_closed_from_evidence
    (P : PreconditionerPackage) (E : PreconditionerEvidence P) :
    PreconditionerClosed P := by
  exact And.intro E.positiveDefiniteClosed E.symmetryClosed

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse