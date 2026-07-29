import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.FenchelDuality
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.SubdifferentialCalculus

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

def ConstrainedBundleConvexityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bundle_convexity_endgame (A : AdmissibleClass) : ConstrainedBundleConvexityClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse