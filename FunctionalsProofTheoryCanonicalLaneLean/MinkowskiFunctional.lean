import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure MinkowskiFunctionalPackage where
  absorbingSet : Type u → Prop
  gauge : (Type u → ℝ) → ℝ
  sublinear : Prop
  positivelyHomogeneous : Prop

structure MinkowskiFunctionalEvidence (M : MinkowskiFunctionalPackage) where
  sublinearClosed : M.sublinear
  positivelyHomogeneousClosed : M.positivelyHomogeneous

def MinkowskiFunctionalClosed (M : MinkowskiFunctionalPackage) : Prop :=
  M.sublinear ∧ M.positivelyHomogeneous

theorem minkowski_functional_closed_from_evidence (M : MinkowskiFunctionalPackage)
    (E : MinkowskiFunctionalEvidence M) : MinkowskiFunctionalClosed M := by
  exact And.intro E.sublinearClosed E.positivelyHomogeneousClosed

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse
