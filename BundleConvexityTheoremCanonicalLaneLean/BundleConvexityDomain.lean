import BundleConvexityTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

def constructedBundleClosed (A : AdmissibleClass) : Prop := BundleWitnessClosed A.object

theorem constructed_bundle_closed_from_admissible_class (A : AdmissibleClass) : constructedBundleClosed A := by
  exact A.object.conclusion

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse