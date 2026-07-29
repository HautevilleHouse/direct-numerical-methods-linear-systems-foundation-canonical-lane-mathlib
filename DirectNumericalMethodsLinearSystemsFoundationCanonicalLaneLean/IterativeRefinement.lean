import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.DirectMethodsBase

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure IterativeRefinementPackage where
  residualCorrection : Prop
  convergenceRate : Prop
  stoppingCriterion : Prop
  backwardError : Prop

structure IterativeRefinementEvidence (P : IterativeRefinementPackage) where
  residualCorrectionClosed : P.residualCorrection
  convergenceRateClosed : P.convergenceRate
  stoppingCriterionClosed : P.stoppingCriterion
  backwardErrorClosed : P.backwardError

def IterativeRefinementClosed (P : IterativeRefinementPackage) : Prop :=
  P.residualCorrection ∧ P.convergenceRate ∧ P.stoppingCriterion ∧ P.backwardError

theorem iterative_refinement_closed_from_evidence (P : IterativeRefinementPackage) (E : IterativeRefinementEvidence P) : IterativeRefinementClosed P := by
  exact And.intro E.residualCorrectionClosed (And.intro E.convergenceRateClosed (And.intro E.stoppingCriterionClosed E.backwardErrorClosed))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse