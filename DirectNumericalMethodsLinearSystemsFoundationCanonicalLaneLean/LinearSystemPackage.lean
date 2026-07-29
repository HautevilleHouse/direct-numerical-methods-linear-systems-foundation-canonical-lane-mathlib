import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure LinearSystemPackage where
  matrixType : Type u
  rightHandSideType : Type v
  solutionType : Type w
  matrix : matrixType
  rightHandSide : rightHandSideType
  solution : solutionType
  systemDefined : Prop
  solutionSatisfies : matrixType → rightHandSideType → solutionType → Prop

structure LinearSystemEvidence (L : LinearSystemPackage) where
  systemDefinedClosed : L.systemDefined
  solutionSatisfiesClosed : L.solutionSatisfies L.matrix L.rightHandSide L.solution

def LinearSystemClosed (L : LinearSystemPackage) : Prop :=
  L.systemDefined ∧ L.solutionSatisfies L.matrix L.rightHandSide L.solution

theorem linear_system_closed_from_evidence (L : LinearSystemPackage) (E : LinearSystemEvidence L) :
    LinearSystemClosed L := by
  exact And.intro E.systemDefinedClosed E.solutionSatisfiesClosed

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse