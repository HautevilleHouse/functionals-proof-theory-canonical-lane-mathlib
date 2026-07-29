import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure BifurcationProblem (S : FunctionalStateSpace) where
  /-- The functional F(λ, u) -/
  functional : ℝ → S.carrier → ℝ
  /-- Trivial solution branch -/
  trivialBranch : ∀ λ : ℝ, functional λ (0 : S.carrier) = 0
  /-- Frechet derivative at trivial solution -/
  derivativeAtTrivial : ℝ → (S.carrier → ℝ)
  kernelDimension : ℕ
  kernelCondition : kernelDimension > 0

structure LyapunovSchmidtReduction {S : FunctionalStateSpace} (B : BifurcationProblem S) where
  /-- The reduced functional on the kernel -/
  reducedFunctional : ℝ → (Fin B.kernelDimension → ℝ) → ℝ
  /-- The splitting of the space into kernel and range -/
  projectionOntoKernel : S.carrier → (Fin B.kernelDimension → ℝ)
  projectionOntoRange : S.carrier → S.carrier
  /-- The reduced equation -/
  reducedEquation : ℝ → (Fin B.kernelDimension → ℝ) → Prop
  invertibilityRange : Prop

structure LyapunovSchmidtEvidence {S : FunctionalStateSpace} {B : BifurcationProblem S} (R : LyapunovSchmidtReduction B) where
  kernelConditionClosed : B.kernelCondition
  invertibilityRangeClosed : R.invertibilityRange
  reducedEquationClosed : ∀ λ : ℝ, ∀ a : (Fin B.kernelDimension → ℝ), R.reducedEquation λ a

def LyapunovSchmidtClosed {S : FunctionalStateSpace} {B : BifurcationProblem S} (R : LyapunovSchmidtReduction B) : Prop :=
  B.kernelCondition ∧ R.invertibilityRange ∧ ∀ λ : ℝ, ∀ a : (Fin B.kernelDimension → ℝ), R.reducedEquation λ a

theorem lyapunov_schmidt_closed_from_evidence {S : FunctionalStateSpace} {B : BifurcationProblem S} (R : LyapunovSchmidtReduction B) (E : LyapunovSchmidtEvidence R) : LyapunovSchmidtClosed R := by
  exact And.intro E.kernelConditionClosed (And.intro E.invertibilityRangeClosed E.reducedEquationClosed)

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse