import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure FunctionalsAdmittedObject where
  carrier : Type
  functionalSpace : Prop
  dualSpace : Prop
  dualityPairing : Prop
  conclusion : functionalSpace ∧ dualSpace ∧ dualityPairing

def FunctionalsWitnessClosed (O : FunctionalsAdmittedObject) : Prop :=
  O.conclusion

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse
