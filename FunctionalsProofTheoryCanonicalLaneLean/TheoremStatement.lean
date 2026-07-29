import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure FunctionalAdmittedObject where
  carrier : Type
  topology : TopologicalSpace carrier
  functionalComplete : Prop
  conclusion : functionalComplete

def FunctionalWitnessClosed (O : FunctionalAdmittedObject) : Prop :=
  O.functionalComplete

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse
