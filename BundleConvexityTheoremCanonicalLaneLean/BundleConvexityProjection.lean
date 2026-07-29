import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

def bundleConvexityProjection : Projection BundleConvexityEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem bundle_convexity_projection_idempotent (x : BundleConvexityEndgameState) :
    bundleConvexityProjection.toFun (bundleConvexityProjection.toFun x) = bundleConvexityProjection.toFun x := by
  exact bundleConvexityProjection.idempotent x

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse