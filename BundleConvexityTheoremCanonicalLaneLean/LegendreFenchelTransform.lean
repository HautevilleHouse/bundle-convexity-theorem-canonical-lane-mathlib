import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.ConvexBundle

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure DualBundle (VB : VectorBundle B F) where
  dualFiber : B → Type v
  pairing : ∀ b : B, VB.fiber b → dualFiber b → ℝ
  weakTopology : Prop

structure LegendreFenchelTransform {VB : VectorBundle B F} (f : ConvexFunctionOnBundle B F VB) where
  dualFunction : (DualBundle VB) → ℝ
  transformFormula : ∀ (y : (DualBundle VB)), dualFunction y = sup (λ x : VB.totalSpace => (pairing (VB.projection x) x y) - f.f x)
  properness : Prop

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse