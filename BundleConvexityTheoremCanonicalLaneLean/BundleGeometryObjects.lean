import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure BundleManifold where
  base : Type u
  fiber : Type v
  projection : base → fiber
  topologyBase : TopologicalSpace base
  topologyFiber : TopologicalSpace fiber
  continuousProjection : Continuous projection

structure BundleSection where
  bundle : BundleManifold
  sectionMap : bundle.base → bundle.fiber
  continuousSection : Continuous sectionMap
  sectionProjection : ∀ x, bundle.projection (sectionMap x) = x

structure ConvexityStructure (B : BundleManifold) where
  convexCombination : B.base → B.base → ℝ → B.base
  convexityAxiom : Prop
  convexCombinationContinuous : Continuous (fun (p : B.base × B.base × ℝ) => convexCombination p.1 p.2.1 p.2.2)

structure BundleConvexAdmittedObject where
  bundle : BundleManifold
  section : BundleSection bundle
  convexity : ConvexityStructure bundle
  convexSectionProperty : Prop
  conclusion : convexSectionProperty

def BundleConvexWitnessClosed (O : BundleConvexAdmittedObject) : Prop :=
  O.convexSectionProperty

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse