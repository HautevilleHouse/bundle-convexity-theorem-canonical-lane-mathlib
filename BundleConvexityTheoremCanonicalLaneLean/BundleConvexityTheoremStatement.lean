import BundleConvexityTheoremCanonicalLaneLean.FiberwiseConvexStructure

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure BundleConvexityTheoremStatement where
  totalSpace : Type u
  baseSpace : Type v
  projection : totalSpace → baseSpace
  fiberwiseConvexPackage : FiberwiseConvexPackage
  globalConvexSet : Set totalSpace
  convexityPreservedUnderProjection : Prop
  projectionImageConvex : Prop
  convexityPreservedUnderProjectionTerm : convexityPreservedUnderProjection
  projectionImageConvexTerm : projectionImageConvex

structure BundleConvexityTheoremEvidence (B : BundleConvexityTheoremStatement) where
  convexityPreservedUnderProjectionClosed : B.convexityPreservedUnderProjection
  projectionImageConvexClosed : B.projectionImageConvex

def BundleConvexityTheoremClosed (B : BundleConvexityTheoremStatement) : Prop :=
  B.convexityPreservedUnderProjection ∧ B.projectionImageConvex

theorem bundle_convexity_theorem_closed_from_evidence (B : BundleConvexityTheoremStatement) (E : BundleConvexityTheoremEvidence B) : BundleConvexityTheoremClosed B :=
  And.intro E.convexityPreservedUnderProjectionClosed E.projectionImageConvexClosed

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse