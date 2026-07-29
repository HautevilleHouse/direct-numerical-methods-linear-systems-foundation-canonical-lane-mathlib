import DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure LinearSystemPackage where
  matrixSpace : Type u
  vectorSpace : Type v
  coefficientMatrix : matrixSpace
  rightHandSide : vectorSpace
  solutionExists : Prop
  solutionUnique : Prop

structure LinearSystemEvidence (L : LinearSystemPackage) where
  solutionExistsClosed : L.solutionExists
  solutionUniqueClosed : L.solutionUnique

def LinearSystemClosed (L : LinearSystemPackage) : Prop :=
  L.solutionExists ∧ L.solutionUnique

theorem linear_system_closed_from_evidence (L : LinearSystemPackage) (E : LinearSystemEvidence L) :
    LinearSystemClosed L := by
  exact And.intro E.solutionExistsClosed E.solutionUniqueClosed

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse