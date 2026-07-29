import BundleConvexityCanonicalLaneLean.BundleConvexityConfiguration

namespace HautevilleHouse
namespace BundleConvexityCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BundleConvexityWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BundleConvexityCanonicalLaneLean
end HautevilleHouse