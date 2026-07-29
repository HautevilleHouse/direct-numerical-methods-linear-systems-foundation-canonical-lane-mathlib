import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure ComplexityPackage where
  floatingPointOps : Nat
  memoryBytes : Nat
  scalability : Prop
  parallelizable : Prop

structure ComplexityEvidence (C : ComplexityPackage) where
  scalabilityClosed : C.scalability
  parallelizableClosed : C.parallelizable

def ComplexityClosed (C : ComplexityPackage) : Prop :=
  C.scalability ∧ C.parallelizable

theorem complexity_closed_from_evidence
    (C : ComplexityPackage) (E : ComplexityEvidence C) :
    ComplexityClosed C := by
  exact And.intro E.scalabilityClosed E.parallelizableClosed

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse