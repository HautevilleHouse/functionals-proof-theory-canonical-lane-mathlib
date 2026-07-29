import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

def ConstrainedFunctionalsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_functionals_endgame (A : AdmissibleClass) :
    ConstrainedFunctionalsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse
