import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure IterativeMethodPackage where
  iterationCount : Nat
  residualTolerance : Float
  initialGuess : List Float
  convergenceCondition : Prop
  convergenceRate : Prop

structure IterativeMethodEvidence (I : IterativeMethodPackage) where
  convergenceConditionClosed : I.convergenceCondition
  convergenceRateClosed : I.convergenceRate

def IterativeMethodClosed (I : IterativeMethodPackage) : Prop :=
  I.convergenceCondition ∧ I.convergenceRate

theorem iterative_method_closed_from_evidence
    (I : IterativeMethodPackage) (E : IterativeMethodEvidence I) :
    IterativeMethodClosed I := by
  exact And.intro E.convergenceConditionClosed E.convergenceRateClosed

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse