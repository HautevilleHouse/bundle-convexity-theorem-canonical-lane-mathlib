import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.BundleConvexityDefs

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure ConvexFiberData (B : BundleSpace) where
  convexSets : Set (ConvexSet B)
  intersectionClosed : ∀ (s t : ConvexSet B), s ∈ convexSets → t ∈ convexSets →
    let interBase := s.baseSet ∩ t.baseSet
    in ∀ b ∈ interBase, Convex ℝ (s.fiberSet b ∩ t.fiberSet b)

theorem intersection_of_convex_fibers_is_convex (B : BundleSpace) (D : ConvexFiberData B) :
  ∀ (s t : ConvexSet B), s ∈ D.convexSets → t ∈ D.convexSets →
  let inter : ConvexSet B := {
    baseSet := s.baseSet ∩ t.baseSet,
    fiberSet := λ b => s.fiberSet b ∩ t.fiberSet b,
    fiberConvex := by
      intro b hb
      have hs := s.fiberConvex b hb.1
      have ht := t.fiberConvex b hb.2
      exact D.intersectionClosed s t hs ht b hb
  }
  in Convex ℝ (inter.totalSet) := by
  intro s t hs ht
  intro p hp
  have hp1 : p.1 ∈ s.baseSet := hp.1.1
  have hp2 : p.1 ∈ t.baseSet := hp.1.2
  have hp3 : p.2 ∈ s.fiberSet p.1 := hp.2.1
  have hp4 : p.2 ∈ t.fiberSet p.1 := hp.2.2
  exact (And.intro hp1 hp3, And.intro hp2 hp4)

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse