import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.MatrixStructure

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure EigenSolverPackage (M : MatrixStructure) where
  eigenvaluesComputed : Prop
  eigenvectorsComputed : Prop
  QRAlgorithmConverges : Prop
  powerMethodConverges : Prop

structure EigenSolverEvidence (M : MatrixStructure) (E : EigenSolverPackage M) where
  eigenvaluesClosed : E.eigenvaluesComputed
  eigenvectorsClosed : E.eigenvectorsComputed
  QRClosed : E.QRAlgorithmConverges
  powerClosed : E.powerMethodConverges

def EigenSolverClosed (M : MatrixStructure) (E : EigenSolverPackage M) : Prop :=
  E.eigenvaluesComputed ∧ E.eigenvectorsComputed ∧ E.QRAlgorithmConverges ∧ E.powerMethodConverges

theorem eigen_solver_closed_from_evidence (M : MatrixStructure) (E : EigenSolverPackage M)
    (Ev : EigenSolverEvidence M E) : EigenSolverClosed M E := by
  exact And.intro Ev.eigenvaluesClosed (And.intro Ev.eigenvectorsClosed (And.intro Ev.QRClosed Ev.powerClosed))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse