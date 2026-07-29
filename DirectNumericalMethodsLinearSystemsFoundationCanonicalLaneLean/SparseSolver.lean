import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.MatrixStructure

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure SparseSolverPackage (M : MatrixStructure) where
  directSparseFactorization : Prop
  iterativeSparseConvergence : Prop
  reorderingExists : Prop
  fillInReduction : Prop

structure SparseSolverEvidence (M : MatrixStructure) (S : SparseSolverPackage M) where
  directClosed : S.directSparseFactorization
  iterativeClosed : S.iterativeSparseConvergence
  reorderingClosed : S.reorderingExists
  fillInClosed : S.fillInReduction

def SparseSolverClosed (M : MatrixStructure) (S : SparseSolverPackage M) : Prop :=
  S.directSparseFactorization ∧ S.iterativeSparseConvergence ∧ S.reorderingExists ∧ S.fillInReduction

theorem sparse_solver_closed_from_evidence (M : MatrixStructure) (S : SparseSolverPackage M)
    (E : SparseSolverEvidence M S) : SparseSolverClosed M S := by
  exact And.intro E.directClosed (And.intro E.iterativeClosed (And.intro E.reorderingClosed E.fillInClosed))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse