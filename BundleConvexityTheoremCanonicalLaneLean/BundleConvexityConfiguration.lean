import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityCanonicalLaneLean

structure BundleConvexitySpace where
  baseSpace : Type u
  baseTopology : TopologicalSpace baseSpace
  totalSpace : Type v
  projection : totalSpace → baseSpace
  fiber : baseSpace → Type w
  fiberTopology : (x : baseSpace) → TopologicalSpace (fiber x)

structure BundleConvexityAdmittedObject where
  bundle : BundleConvexitySpace
  convexFiber : Prop
  convexSection : Prop
  sectionExists : Prop
  conclusion : sectionExists

structure BundleConvexityEndgameState where
  object : BundleConvexityAdmittedObject

def BundleConvexityWitnessClosed (O : BundleConvexityAdmittedObject) : Prop :=
  O.sectionExists

end BundleConvexityCanonicalLaneLean
end HautevilleHouse