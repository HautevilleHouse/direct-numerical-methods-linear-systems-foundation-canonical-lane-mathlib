import canonicalLaneMathlib.AdmissibleClass
import DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.LinearSystemPackage

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure IterativeMethodPackage (L : LinearSystemPackage) where
  iterationMatrix : Type u
  initialGuess : Type u
  convergenceCriterion : Prop
  iterationStep : Prop
  limitApproachesSolution : Prop

structure IterativeMethodEvidence {L : LinearSystemPackage} (I : IterativeMethodPackage L) where
  convergenceCriterionClosed : I.convergenceCriterion
  limitApproachesSolutionClosed : I.limitApproachesSolution

def IterativeMethodClosed {L : LinearSystemPackage} (I : IterativeMethodPackage L) : Prop :=
  I.convergenceCriterion ∧ I.limitApproachesSolution

theorem iterative_method_closed_from_evidence
    {L : LinearSystemPackage} (I : IterativeMethodPackage L)
    (E : IterativeMethodEvidence I) : IterativeMethodClosed I := by
  exact And.intro E.convergenceCriterionClosed E.limitApproachesSolutionClosed

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse