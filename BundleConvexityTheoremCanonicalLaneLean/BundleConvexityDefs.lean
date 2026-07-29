import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure BundleSpace where
  base : Type u
  fiber : Type v
  projection : base × fiber → base
  topologyBase : TopologicalSpace base
  topologyFiber : TopologicalSpace fiber

def continuousProjection (B : BundleSpace) : Prop :=
  ∀ (U : Set B.base), IsOpen U → IsOpen (B.projection⁻¹' U)

structure ConvexSet (B : BundleSpace) where
  baseSet : Set B.base
  fiberSet : B.base → Set B.fiber
  fiberConvex : ∀ b ∈ baseSet, Convex ℝ (fiberSet b)
  totalSet : Set (B.base × B.fiber) :=
    { p | p.1 ∈ baseSet ∧ p.2 ∈ fiberSet p.1 }

structure BundleConvexityAdmittedObject where
  bundle : BundleSpace
  convexBundle : ConvexSet bundle
  conclusion : continuousProjection bundle ∧ ∀ b ∈ convexBundle.baseSet, Set.Nonempty (convexBundle.fiberSet b)

def BundleConvexityWitnessClosed (O : BundleConvexityAdmittedObject) : Prop :=
  O.conclusion

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse