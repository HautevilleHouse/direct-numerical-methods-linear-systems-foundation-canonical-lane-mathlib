import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.LUSolver

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure CholeskySolverPackage {M : MatrixRepresentationPackage}
    {S : DirectSolverPackage M} (L : LUSolverPackage S) where
  choleskyDecomposition : M.matrixType → M.matrixType
  symmetricPositiveDefinite : Prop
  choleskyFactorLowerTriangular : Prop
  choleskyDecompositionCorrect : Prop
  symmetricPositiveDefiniteTerm : symmetricPositiveDefinite
  choleskyFactorLowerTriangularTerm : choleskyFactorLowerTriangular
  choleskyDecompositionCorrectTerm : choleskyDecompositionCorrect

structure CholeskySolverEvidence {M : MatrixRepresentationPackage}
    {S : DirectSolverPackage M} {L : LUSolverPackage S}
    (C : CholeskySolverPackage L) where
  symmetricPositiveDefiniteClosed : C.symmetricPositiveDefinite
  choleskyFactorLowerTriangularClosed : C.choleskyFactorLowerTriangular
  choleskyDecompositionCorrectClosed : C.choleskyDecompositionCorrect

def CholeskySolverClosed {M : MatrixRepresentationPackage}
    {S : DirectSolverPackage M} {L : LUSolverPackage S}
    (C : CholeskySolverPackage L) : Prop :=
  C.symmetricPositiveDefinite ∧ C.choleskyFactorLowerTriangular ∧
  C.choleskyDecompositionCorrect

theorem cholesky_solver_closed_from_evidence
    {M : MatrixRepresentationPackage} {S : DirectSolverPackage M}
    {L : LUSolverPackage S} (C : CholeskySolverPackage L)
    (E : CholeskySolverEvidence C) : CholeskySolverClosed C := by
  exact And.intro E.symmetricPositiveDefiniteClosed
    (And.intro E.choleskyFactorLowerTriangularClosed
      E.choleskyDecompositionCorrectClosed)

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse