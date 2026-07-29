import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.MatrixStructure

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure ErrorAnalysisPackage (M : MatrixStructure) where
  conditionNumber : ℝ
  roundingErrorBound : ℝ
  backwardError : ℝ
  forwardErrorBound : ℝ

structure ErrorAnalysisEvidence (M : MatrixStructure) (E : ErrorAnalysisPackage M) where
  conditionNumberClosed : E.conditionNumber > 0
  roundingErrorBoundClosed : E.roundingErrorBound ≥ 0
  backwardErrorClosed : E.backwardError ≤ E.roundingErrorBound
  forwardErrorBoundClosed : E.forwardErrorBound ≤ E.conditionNumber * E.roundingErrorBound

def ErrorAnalysisClosed (M : MatrixStructure) (E : ErrorAnalysisPackage M) : Prop :=
  E.conditionNumber > 0 ∧ E.roundingErrorBound ≥ 0 ∧ E.backwardError ≤ E.roundingErrorBound ∧ E.forwardErrorBound ≤ E.conditionNumber * E.roundingErrorBound

theorem error_analysis_closed_from_evidence (M : MatrixStructure) (E : ErrorAnalysisPackage M)
    (Ev : ErrorAnalysisEvidence M E) : ErrorAnalysisClosed M E := by
  exact And.intro Ev.conditionNumberClosed (And.intro Ev.roundingErrorBoundClosed
    (And.intro Ev.backwardErrorClosed Ev.forwardErrorBoundClosed))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse