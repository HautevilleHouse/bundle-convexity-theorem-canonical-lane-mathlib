import BundleConvexityCanonicalLaneLean.BundleConvexityGate

namespace HautevilleHouse
namespace BundleConvexityCanonicalLaneLean

def ConstrainedBundleConvexityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bundle_convexity_endgame (A : AdmissibleClass) :
    ConstrainedBundleConvexityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BundleConvexityCanonicalLaneLean
end HautevilleHouse