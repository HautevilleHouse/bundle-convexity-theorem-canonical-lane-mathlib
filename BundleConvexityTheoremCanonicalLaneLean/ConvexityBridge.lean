import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BundleConvexityClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse