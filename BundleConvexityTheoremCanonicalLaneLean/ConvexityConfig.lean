import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure BundleConvexityPackage where
  baseSpace : Type u
  baseTopology : TopologicalSpace baseSpace
  totalSpace : Type v
  projection : totalSpace → baseSpace
  fiber : baseSpace → Type w
  fiberTopology : ∀ x : baseSpace, TopologicalSpace (fiber x)
  fiberBundle : Prop
  convexSubset : Set totalSpace
  convexInFiber : Prop
  parallelTransportInvariant : Prop

structure BundleConvexityEvidence (P : BundleConvexityPackage) where
  fiberBundleClosed : P.fiberBundle
  convexInFiberClosed : P.convexInFiber
  parallelTransportInvariantClosed : P.parallelTransportInvariant

def BundleConvexityClosed (P : BundleConvexityPackage) : Prop :=
  P.fiberBundle ∧ P.convexInFiber ∧ P.parallelTransportInvariant

theorem bundle_convexity_closed_from_evidence (P : BundleConvexityPackage)
    (E : BundleConvexityEvidence P) : BundleConvexityClosed P := by
  exact And.intro E.fiberBundleClosed (And.intro E.convexInFiberClosed E.parallelTransportInvariantClosed)

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse