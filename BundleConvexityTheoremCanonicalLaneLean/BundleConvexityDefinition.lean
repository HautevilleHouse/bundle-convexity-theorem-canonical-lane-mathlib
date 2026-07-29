import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure BundleConvexPackage where
  baseManifold : Type u
  baseTopology : TopologicalSpace baseManifold
  fiber : Type v
  fiberTopology : TopologicalSpace fiber
  projection : baseManifold × fiber → baseManifold
  bundleSmooth : Prop
  fiberwiseConvex : Prop

structure BundleConvexEvidence (B : BundleConvexPackage) where
  bundleSmoothClosed : B.bundleSmooth
  fiberwiseConvexClosed : B.fiberwiseConvex

def BundleConvexClosed (B : BundleConvexPackage) : Prop :=
  B.bundleSmooth ∧ B.fiberwiseConvex

theorem bundle_convex_closed_from_evidence (B : BundleConvexPackage)
    (E : BundleConvexEvidence B) : BundleConvexClosed B := by
  exact And.intro E.bundleSmoothClosed E.fiberwiseConvexClosed

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse