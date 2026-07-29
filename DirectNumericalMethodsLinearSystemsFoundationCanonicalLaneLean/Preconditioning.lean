import canonicalLaneMathlib.AdmissibleClass
import DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.LinearSystemPackage

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure PreconditioningPackage (L : LinearSystemPackage) where
  preconditioner : Type u
  transformedSystem : LinearSystemPackage
  conditionNumberImproved : Prop
  preconditionerInvertible : Prop
  preconditionerApplied : Prop

structure PreconditioningEvidence {L : LinearSystemPackage} (P : PreconditioningPackage L) where
  conditionNumberImprovedClosed : P.conditionNumberImproved
  preconditionerInvertibleClosed : P.preconditionerInvertible
  preconditionerAppliedClosed : P.preconditionerApplied

def PreconditioningClosed {L : LinearSystemPackage} (P : PreconditioningPackage L) : Prop :=
  P.conditionNumberImproved ∧ P.preconditionerInvertible ∧ P.preconditionerApplied

theorem preconditioning_closed_from_evidence
    {L : LinearSystemPackage} (P : PreconditioningPackage L)
    (E : PreconditioningEvidence P) : PreconditioningClosed P := by
  exact And.intro E.conditionNumberImprovedClosed
    (And.intro E.preconditionerInvertibleClosed E.preconditionerAppliedClosed)

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse