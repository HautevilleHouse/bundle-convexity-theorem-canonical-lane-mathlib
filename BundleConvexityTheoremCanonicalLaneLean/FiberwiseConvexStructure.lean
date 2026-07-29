import BundleConvexityTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure FiberwiseConvexPackage where
  totalSpace : Type u
  baseSpace : Type v
  projection : totalSpace → baseSpace
  fiberConvex : ∀ b : baseSpace, Set (totalSpace) → Prop
  fiberConvexSubspace : ∀ b, Set (totalSpace)
  fiberConvexSubspaceClosed : ∀ b, fiberConvex b (fiberConvexSubspace b)
  convexCombinationProperty : Prop
  convexCombinationPropertyTerm : convexCombinationProperty

structure FiberwiseConvexEvidence (F : FiberwiseConvexPackage) where
  fiberConvexSubspaceClosed : ∀ b, F.fiberConvex b (F.fiberConvexSubspace b)
  convexCombinationPropertyClosed : F.convexCombinationProperty

def FiberwiseConvexClosed (F : FiberwiseConvexPackage) : Prop :=
  (∀ b, F.fiberConvex b (F.fiberConvexSubspace b)) ∧ F.convexCombinationProperty

theorem fiberwise_convex_closed_from_evidence (F : FiberwiseConvexPackage) (E : FiberwiseConvexEvidence F) : FiberwiseConvexClosed F :=
  And.intro E.fiberConvexSubspaceClosed E.convexCombinationPropertyClosed

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse