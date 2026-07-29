import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure DirectSolverPackage where
  matrixType : Type
  factorization : Type
  forwardSolve : Type
  backwardSolve : Type
  solutionExists : Prop
  solutionUnique : Prop

structure DirectSolverEvidence (D : DirectSolverPackage) where
  solutionExistsClosed : D.solutionExists
  solutionUniqueClosed : D.solutionUnique

def DirectSolverClosed (D : DirectSolverPackage) : Prop :=
  D.solutionExists ∧ D.solutionUnique

theorem direct_solver_closed_from_evidence
    (D : DirectSolverPackage) (E : DirectSolverEvidence D) :
    DirectSolverClosed D := by
  exact And.intro E.solutionExistsClosed E.solutionUniqueClosed

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse