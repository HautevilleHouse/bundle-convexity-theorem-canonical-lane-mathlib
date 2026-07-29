import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure GeodesicConvexityPackage where
  manifold : Type u
  riemannianMetric : Type v
  geodesicSegment : manifold → manifold → ℝ → manifold
  geodesicCompleteness : Prop
  convexNeighborhoodsExist : Prop
  convexFunction : Type w

structure GeodesicConvexityEvidence (G : GeodesicConvexityPackage) where
  geodesicCompletenessClosed : G.geodesicCompleteness
  convexNeighborhoodsExistClosed : G.convexNeighborhoodsExist
  convexFunctionDefined : Prop

def GeodesicConvexityClosed (G : GeodesicConvexityPackage) : Prop :=
  G.geodesicCompleteness ∧ G.convexNeighborhoodsExist

theorem geodesic_convexity_closed_from_evidence (G : GeodesicConvexityPackage)
    (E : GeodesicConvexityEvidence G) : GeodesicConvexityClosed G := by
  exact And.intro E.geodesicCompletenessClosed E.convexNeighborhoodsExistClosed

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse