import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure SaddlePointProblem {S : FunctionalStateSpace} (F : Functional S) where
  /-- The Lagrangian L: S × S → ℝ -/
  lagrangian : S.carrier → S.carrier → ℝ
  /-- The primal variable space -/
  primalSpace : S
  /-- The dual variable space -/
  dualSpace : S
  convexityPrimal : ∀ y : S.carrier, (λ x : S.carrier => lagrangian x y) = (λ x : S.carrier => F.value x) ?+? 
  -- We need a simpler formulation
  saddleValue : ℝ
  primalOptimal : S.carrier
  dualOptimal : S.carrier

structure SaddlePointExistence {S : FunctionalStateSpace} {F : Functional S} (P : SaddlePointProblem F) where
  lowerBoundWeakDuality : ∀ (x : S.carrier) (y : S.carrier), P.lagrangian x y ≤ P.saddleValue
  existencePrimal : ∃ (x* : S.carrier), ∀ (x : S.carrier), F.value x* ≤ F.value x
  existenceDual : ∃ (y* : S.carrier), ∀ (y : S.carrier), P.lagrangian ?_ y ≥ P.lagrangian ?_ y*

structure SaddlePointUniqueness {S : FunctionalStateSpace} {F : Functional S} (P : SaddlePointProblem F) where
  strictConvexityPrimal : ∀ x1 x2 : S.carrier, x1 ≠ x2 → F.value ((x1 + x2)/2) < (F.value x1 + F.value x2)/2
  strictConcavityDual : Prop
  uniqueness : (∀ x* : S.carrier, (∀ x : S.carrier, F.value x* ≤ F.value x) → x* = P.primalOptimal) ∧ (∀ y* : S.carrier, (∀ y : S.carrier, P.lagrangian ?_ y* ≥ P.lagrangian ?_ y) → y* = P.dualOptimal)

def SaddlePointClosed {S : FunctionalStateSpace} {F : Functional S} (P : SaddlePointProblem F) : Prop :=
  SaddlePointExistence P ∧ SaddlePointUniqueness P

theorem saddle_point_closed {S : FunctionalStateSpace} {F : Functional S} (P : SaddlePointProblem F) (Ex : SaddlePointExistence P) (Un : SaddlePointUniqueness P) : SaddlePointClosed P := by
  exact And.intro Ex Un

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse