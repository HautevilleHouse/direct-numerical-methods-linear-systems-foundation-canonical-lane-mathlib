import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.LUSolver

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure GaussianEliminationPackage {M : MatrixRepresentationPackage}
    {S : DirectSolverPackage M} (L : LUSolverPackage S) where
  forwardElimination : M.matrixType → M.vectorType → (M.matrixType × M.vectorType)
  backSubstitution : M.matrixType → M.vectorType → M.vectorType
  pivotStrategy : Prop
  forwardEliminationCorrect : Prop
  backSubstitutionCorrect : Prop
  pivotStrategyTerm : pivotStrategy
  forwardEliminationCorrectTerm : forwardEliminationCorrect
  backSubstitutionCorrectTerm : backSubstitutionCorrect

structure GaussianEliminationEvidence {M : MatrixRepresentationPackage}
    {S : DirectSolverPackage M} {L : LUSolverPackage S}
    (G : GaussianEliminationPackage L) where
  pivotStrategyClosed : G.pivotStrategy
  forwardEliminationCorrectClosed : G.forwardEliminationCorrect
  backSubstitutionCorrectClosed : G.backSubstitutionCorrect

def GaussianEliminationClosed {M : MatrixRepresentationPackage}
    {S : DirectSolverPackage M} {L : LUSolverPackage S}
    (G : GaussianEliminationPackage L) : Prop :=
  G.pivotStrategy ∧ G.forwardEliminationCorrect ∧ G.backSubstitutionCorrect

theorem gaussian_elimination_closed_from_evidence
    {M : MatrixRepresentationPackage} {S : DirectSolverPackage M}
    {L : LUSolverPackage S} (G : GaussianEliminationPackage L)
    (E : GaussianEliminationEvidence G) : GaussianEliminationClosed G := by
  exact And.intro E.pivotStrategyClosed
    (And.intro E.forwardEliminationCorrectClosed
      E.backSubstitutionCorrectClosed)

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse