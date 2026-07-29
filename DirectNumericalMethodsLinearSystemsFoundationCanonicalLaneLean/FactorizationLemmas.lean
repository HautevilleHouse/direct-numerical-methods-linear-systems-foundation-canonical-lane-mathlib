import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.MatrixStructure

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure FactorizationPackage (M : MatrixStructure) where
  LUExists : Prop
  CholeskyExists : M.symmetric → M.positiveDefinite → Prop
  QRExists : Prop
  LDLExists : M.symmetric → Prop

structure FactorizationEvidence (M : MatrixStructure) (F : FactorizationPackage M) where
  LUClosed : F.LUExists
  CholeskyClosed : F.CholeskyExists M.symmetric M.positiveDefinite
  QRClosed : F.QRExists
  LDLClosed : F.LDLExists M.symmetric

def FactorizationClosed (M : MatrixStructure) (F : FactorizationPackage M) : Prop :=
  F.LUExists ∧ F.CholeskyExists M.symmetric M.positiveDefinite ∧ F.QRExists ∧ F.LDLExists M.symmetric

theorem factorization_closed_from_evidence (M : MatrixStructure) (F : FactorizationPackage M)
    (E : FactorizationEvidence M F) : FactorizationClosed M F := by
  exact And.intro E.LUClosed (And.intro E.CholeskyClosed (And.intro E.QRClosed E.LDLClosed))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse