import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.DirectSolver

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure LUSolverPackage {M : MatrixRepresentationPackage}
    (S : DirectSolverPackage M) where
  luDecomposition : M.matrixType → (M.matrixType × M.matrixType)
  lowerTriangular : Prop
  upperTriangular : Prop
  luDecompositionCorrect : Prop
  lowerTriangularTerm : lowerTriangular
  upperTriangularTerm : upperTriangular
  luDecompositionCorrectTerm : luDecompositionCorrect

structure LUSolverEvidence {M : MatrixRepresentationPackage}
    {S : DirectSolverPackage M} (L : LUSolverPackage S) where
  lowerTriangularClosed : L.lowerTriangular
  upperTriangularClosed : L.upperTriangular
  luDecompositionCorrectClosed : L.luDecompositionCorrect

def LUSolverClosed {M : MatrixRepresentationPackage}
    {S : DirectSolverPackage M} (L : LUSolverPackage S) : Prop :=
  L.lowerTriangular ∧ L.upperTriangular ∧ L.luDecompositionCorrect

theorem lu_solver_closed_from_evidence
    {M : MatrixRepresentationPackage} {S : DirectSolverPackage M}
    (L : LUSolverPackage S) (E : LUSolverEvidence L) : LUSolverClosed L := by
  exact And.intro E.lowerTriangularClosed
    (And.intro E.upperTriangularClosed E.luDecompositionCorrectClosed)

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse