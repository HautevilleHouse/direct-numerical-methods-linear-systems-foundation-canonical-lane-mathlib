import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure RoundingErrorAnalysis where
  machineEpsilon : Float
  forwardErrorBound : Float
  backwardErrorBound : Float
  numericalStability : Prop
  residualBound : Float

structure RoundingErrorEvidence (R : RoundingErrorAnalysis) where
  forwardErrorBoundClosed : R.forwardErrorBound < R.machineEpsilon
  backwardErrorBoundClosed : R.backwardErrorBound < R.machineEpsilon
  numericalStabilityClosed : R.numericalStability
  residualBoundClosed : R.residualBound < R.machineEpsilon * 10.0

def RoundingErrorClosed (R : RoundingErrorAnalysis) : Prop :=
  R.forwardErrorBound < R.machineEpsilon ∧
  R.backwardErrorBound < R.machineEpsilon ∧
  R.numericalStability ∧
  R.residualBound < R.machineEpsilon * 10.0

theorem rounding_error_closed_from_evidence
    (R : RoundingErrorAnalysis) (E : RoundingErrorEvidence R) :
    RoundingErrorClosed R := by
  exact And.intro E.forwardErrorBoundClosed
    (And.intro E.backwardErrorBoundClosed
      (And.intro E.numericalStabilityClosed E.residualBoundClosed))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse