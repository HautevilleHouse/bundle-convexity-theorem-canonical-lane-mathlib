import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

def bundleProjection : Projection AdmissibleClass := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem bundle_projection_idempotent (x : AdmissibleClass) :
    bundleProjection.toFun (bundleProjection.toFun x) = bundleProjection.toFun x := by
  exact bundleProjection.idempotent x

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse