import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean

structure SparseMatrixFormat where
  n : Nat
  nnz : Nat
  rowPtr : List Nat
  colInd : List Nat
  values : List Float

structure SparseMatrixFormatEvidence (S : SparseMatrixFormat) where
  rowPtrLengthClosed : S.rowPtr.length = S.n + 1
  colIndLengthClosed : S.colInd.length = S.nnz
  valuesLengthClosed : S.values.length = S.nnz
  rowPtrSortedClosed : ∀ i : Nat, i < S.n → S.rowPtr.get? i ≤ S.rowPtr.get? (i+1)
  colIndBoundClosed : ∀ idx : Nat, idx < S.nnz → (S.colInd.get? idx).getD 0 < S.n

def SparseMatrixFormatClosed (S : SparseMatrixFormat) : Prop :=
  S.rowPtr.length = S.n + 1 ∧
  S.colInd.length = S.nnz ∧
  S.values.length = S.nnz ∧
  (∀ i : Nat, i < S.n → S.rowPtr.get? i ≤ S.rowPtr.get? (i+1)) ∧
  (∀ idx : Nat, idx < S.nnz → (S.colInd.get? idx).getD 0 < S.n)

theorem sparse_matrix_format_closed_from_evidence
    (S : SparseMatrixFormat) (E : SparseMatrixFormatEvidence S) :
    SparseMatrixFormatClosed S := by
  exact And.intro E.rowPtrLengthClosed
    (And.intro E.colIndLengthClosed
      (And.intro E.valuesLengthClosed
        (And.intro E.rowPtrSortedClosed E.colIndBoundClosed)))

end DirectNumericalMethodsLinearSystemsFoundationCanonicalLaneLean
end HautevilleHouse