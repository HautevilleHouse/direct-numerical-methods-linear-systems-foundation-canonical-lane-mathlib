import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

def ConstrainedDirectMethodsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_direct_methods_endgame (A : AdmissibleClass) :
    ConstrainedDirectMethodsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse