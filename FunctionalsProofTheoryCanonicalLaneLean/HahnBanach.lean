import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure HahnBanachPackage (P : DualityPairingPackage) where
  subspace : P.spaceX → Prop
  boundedLinearFunctional : (P.spaceX → ℝ) → Prop
  extension : Prop
  normPreservation : Prop

structure HahnBanachEvidence {P : DualityPairingPackage} (H : HahnBanachPackage P) where
  extensionClosed : H.extension
  normPreservationClosed : H.normPreservation

def HahnBanachClosed {P : DualityPairingPackage} (H : HahnBanachPackage P) : Prop :=
  H.extension ∧ H.normPreservation

theorem hahn_banach_closed_from_evidence {P : DualityPairingPackage}
    (H : HahnBanachPackage P) (E : HahnBanachEvidence H) : HahnBanachClosed H := by
  exact And.intro E.extensionClosed E.normPreservationClosed

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse
