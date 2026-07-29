import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.BundleConvexityDefs

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : BundleConvexityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BundleConvexityWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse