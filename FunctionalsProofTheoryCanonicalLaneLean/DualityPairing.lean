import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure DualityPairingPackage where
  spaceX : Type u
  spaceY : Type v
  pairing : spaceX → spaceY → ℝ
  nondegenerate : Prop
  bilinear : Prop
  continuous : Prop

structure DualityPairingEvidence (P : DualityPairingPackage) where
  nondegenerateClosed : P.nondegenerate
  bilinearClosed : P.bilinear
  continuousClosed : P.continuous

def DualityPairingClosed (P : DualityPairingPackage) : Prop :=
  P.nondegenerate ∧ P.bilinear ∧ P.continuous

theorem duality_pairing_closed_from_evidence (P : DualityPairingPackage)
    (E : DualityPairingEvidence P) : DualityPairingClosed P := by
  exact And.intro E.nondegenerateClosed (And.intro E.bilinearClosed E.continuousClosed)

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse
