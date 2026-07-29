import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure AdmissibleClass where
  object : FunctionalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FunctionalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse
