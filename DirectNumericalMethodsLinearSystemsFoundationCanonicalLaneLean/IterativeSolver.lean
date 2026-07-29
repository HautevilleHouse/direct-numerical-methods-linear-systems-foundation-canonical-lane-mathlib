import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.MatrixStructure

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure IterativeSolverPackage (M : MatrixStructure) where
  CGConverges : M.symmetric ∧ M.positiveDefinite → Prop
  GMRESConverges : Prop
  preconditionerExists : Prop
  convergenceRate : ℝ

structure IterativeSolverEvidence (M : MatrixStructure) (I : IterativeSolverPackage M) where
  CGClosed : I.CGConverges (And.intro M.symmetric M.positiveDefinite)
  GMRESClosed : I.GMRESConverges
  preconditionerClosed : I.preconditionerExists

def IterativeSolverClosed (M : MatrixStructure) (I : IterativeSolverPackage M) : Prop :=
  I.CGConverges (And.intro M.symmetric M.positiveDefinite) ∧ I.GMRESConverges ∧ I.preconditionerExists

theorem iterative_solver_closed_from_evidence (M : MatrixStructure) (I : IterativeSolverPackage M)
    (E : IterativeSolverEvidence M I) : IterativeSolverClosed M I := by
  exact And.intro E.CGClosed (And.intro E.GMRESClosed E.preconditionerClosed)

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse