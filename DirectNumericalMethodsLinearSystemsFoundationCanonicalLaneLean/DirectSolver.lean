import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.MatrixRepresentation

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure DirectSolverPackage {M : MatrixRepresentationPackage} where
  decompositionType : Type u
  forwardSubstitution : M.matrixType → M.vectorType → M.vectorType
  backwardSubstitution : M.matrixType → M.vectorType → M.vectorType
  decomposition : M.matrixType → decompositionType
  solve : decompositionType → M.vectorType → M.vectorType
  forwardSubstitutionCorrect : Prop
  backwardSubstitutionCorrect : Prop
  decompositionCorrect : Prop
  solveCorrect : Prop
  forwardSubstitutionCorrectTerm : forwardSubstitutionCorrect
  backwardSubstitutionCorrectTerm : backwardSubstitutionCorrect
  decompositionCorrectTerm : decompositionCorrect
  solveCorrectTerm : solveCorrect

structure DirectSolverEvidence {M : MatrixRepresentationPackage}
    (S : DirectSolverPackage M) where
  forwardSubstitutionCorrectClosed : S.forwardSubstitutionCorrect
  backwardSubstitutionCorrectClosed : S.backwardSubstitutionCorrect
  decompositionCorrectClosed : S.decompositionCorrect
  solveCorrectClosed : S.solveCorrect

def DirectSolverClosed {M : MatrixRepresentationPackage}
    (S : DirectSolverPackage M) : Prop :=
  S.forwardSubstitutionCorrect ∧ S.backwardSubstitutionCorrect ∧
  S.decompositionCorrect ∧ S.solveCorrect

theorem direct_solver_closed_from_evidence
    {M : MatrixRepresentationPackage} (S : DirectSolverPackage M)
    (E : DirectSolverEvidence S) : DirectSolverClosed S := by
  exact And.intro E.forwardSubstitutionCorrectClosed
    (And.intro E.backwardSubstitutionCorrectClosed
      (And.intro E.decompositionCorrectClosed E.solveCorrectClosed))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse