import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure BundleConvexitySpace where
  carrier : Type
  topology : TopologicalSpace carrier
  convexStructure : Set (Set carrier)

structure BundleConvexityAdmittedObject where
  totalSpace : BundleConvexitySpace
  baseSpace : BundleConvexitySpace
  bundleProjection : totalSpace.carrier → baseSpace.carrier
  fiberConvex : ∀ b : baseSpace.carrier, convexStructure (bundleProjection⁻¹' {b})
  baseConvex : convexStructure baseSpace.carrier
  transitionConvex : ∀ (b b' : baseSpace.carrier), convexStructure (setOf (fun (x : totalSpace.carrier) => bundleProjection x = b ∨ bundleProjection x = b'))
  conclusion : convexStructure totalSpace.carrier

def BundleConvexityWitnessClosed (O : BundleConvexityAdmittedObject) : Prop :=
  O.conclusion

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse