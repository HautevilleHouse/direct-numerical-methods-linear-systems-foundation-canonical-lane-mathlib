import DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.LinearSystemSolver

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure GaussEliminationPackage {L : LinearSystemPackage} where
  augmentedMatrix : Type w
  rowOperations : Prop
  pivotSelection : Prop
  backSubstitution : Prop
  forwardEliminationClosed : Prop

def GaussEliminationClosed {L : LinearSystemPackage} (G : GaussEliminationPackage L) : Prop :=
  G.rowOperations ∧ G.pivotSelection ∧ G.backSubstitution ∧ G.forwardEliminationClosed

structure GaussEliminationEvidence {L : LinearSystemPackage} (G : GaussEliminationPackage L) where
  rowOperationsClosed : G.rowOperations
  pivotSelectionClosed : G.pivotSelection
  backSubstitutionClosed : G.backSubstitution
  forwardEliminationClosed : G.forwardEliminationClosed

theorem gauss_elimination_closed_from_evidence {L : LinearSystemPackage}
    (G : GaussEliminationPackage L) (E : GaussEliminationEvidence G) :
    GaussEliminationClosed G := by
  exact And.intro E.rowOperationsClosed (And.intro E.pivotSelectionClosed (And.intro E.backSubstitutionClosed E.forwardEliminationClosed))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse