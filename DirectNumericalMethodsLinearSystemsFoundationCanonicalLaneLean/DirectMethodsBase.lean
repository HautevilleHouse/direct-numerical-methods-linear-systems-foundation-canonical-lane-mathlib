import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure LinearSystem where
  n : Nat
  A : Matrix (Fin n) (Fin n) Float
  b : Vector (Fin n) Float

structure DirectMethod where
  factorize : LinearSystem → (Matrix (Fin n) (Fin n) Float × Vector (Fin n) Float)
  solve : (Matrix (Fin n) (Fin n) Float × Vector (Fin n) Float) → Vector (Fin n) Float
  correctness : ∀ (ls : LinearSystem), solve (factorize ls) = solution ls

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse