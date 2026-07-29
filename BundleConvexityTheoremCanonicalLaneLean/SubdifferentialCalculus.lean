import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.ConvexBundle

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure Subdifferential {VB : VectorBundle B F} (f : ConvexFunctionOnBundle B F VB) (x : VB.totalSpace) where
  subgradientSet : Set (DualBundle VB)
  subgradientInequality : ∀ (g : DualBundle VB), g ∈ subgradientSet → ∀ (y : VB.totalSpace), (pairing (VB.projection x) y g) ≤ (f.f y - f.f x)
  nonemptyAtSubdifferentiable : Prop

structure SubdifferentialCalculusStatements {VB : VectorBundle B F} (f g : ConvexFunctionOnBundle B F VB) where
  sumRule : Subdifferential (f + g) = Subdifferential f + Subdifferential g
  scalingRule : ∀ (λ : ℝ), Subdifferential (λ • f) = λ • Subdifferential f
  chainRule : Prop

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse