import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure ReflexivityPackage (P : DualityPairingPackage) where
  canonicalEmbedding : P.spaceX → (P.spaceY → ℝ)
  isIsometric : Prop
  isSurjective : Prop
  reflexive : Prop

structure ReflexivityEvidence {P : DualityPairingPackage} (R : ReflexivityPackage P) where
  isIsometricClosed : R.isIsometric
  isSurjectiveClosed : R.isSurjective
  reflexiveClosed : R.reflexive

def ReflexivityClosed {P : DualityPairingPackage} (R : ReflexivityPackage P) : Prop :=
  R.isIsometric ∧ R.isSurjective ∧ R.reflexive

theorem reflexivity_closed_from_evidence {P : DualityPairingPackage}
    (R : ReflexivityPackage P) (E : ReflexivityEvidence R) : ReflexivityClosed R := by
  exact And.intro E.isIsometricClosed (And.intro E.isSurjectiveClosed E.reflexiveClosed)

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse
