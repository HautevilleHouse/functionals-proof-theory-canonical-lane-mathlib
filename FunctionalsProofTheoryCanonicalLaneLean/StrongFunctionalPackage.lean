import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure FunctionalStateSpace where
  carrier : Type u
  /-- The norm inducing the Banach space structure -/
  norm : carrier → ℝ
  /-- The inner product for Hilbert space structure -/
  inner : carrier → carrier → ℝ
  banachCompleteness : Prop
  hilbertCompleteness : Prop
  
structure Functional (S : FunctionalStateSpace) where
  /-- The functional F: S → ℝ -/
  value : S.carrier → ℝ
  /-- The first variation (Gateaux derivative) -/
  derivative : S.carrier → (S.carrier → ℝ)
  /-- The second variation (Hessian) -/
  hessian : S.carrier → (S.carrier → S.carrier → ℝ)
  smoothness : Prop
  convexity : Prop
  coercivity : Prop

structure StrongConvexityCondition {S : FunctionalStateSpace} (F : Functional S) where
  lowerBound : ℝ
  strongConvexityInequality : ∀ x y : S.carrier, F.value y ≥ F.value x + F.derivative x (y - x) + (lowerBound/2) * (S.norm (y - x))^2
  coercivityGrowth : ∀ x : S.carrier, F.value x ≥ lowerBound * (S.norm x)^2

structure StrongConvexityEvidence {S : FunctionalStateSpace} {F : Functional S} (C : StrongConvexityCondition F) where
  lowerBoundClosed : C.lowerBound > 0
  strongConvexityInequalityClosed : C.strongConvexityInequality
  coercivityGrowthClosed : C.coercivityGrowth

def StrongConvexityClosed {S : FunctionalStateSpace} {F : Functional S} (C : StrongConvexityCondition F) : Prop :=
  C.lowerBound > 0 ∧ C.strongConvexityInequality ∧ C.coercivityGrowth

theorem strong_convexity_closed_from_evidence {S : FunctionalStateSpace} {F : Functional S} (C : StrongConvexityCondition F) (E : StrongConvexityEvidence C) : StrongConvexityClosed C := by
  exact And.intro E.lowerBoundClosed (And.intro E.strongConvexityInequalityClosed E.coercivityGrowthClosed)

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse