import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FunctionalsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse
