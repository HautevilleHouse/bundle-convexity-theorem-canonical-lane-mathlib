import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure VectorBundle (B : Type u) (F : Type v) where
  totalSpace : Type w
  projection : totalSpace → B
  fiber : B → Type v
  trivializationAtlas : Set (LocalHomeomorph (totalSpace) (B × F))
  vectorSpaceStructure : ∀ b : B, AddCommGroup (fiber b) ∧ Module ℝ (fiber b)
  smoothStructure : Prop

structure ConvexSetInBundle (B : Type u) (F : Type v) [AddCommGroup F] [Module ℝ F] (VB : VectorBundle B F) where
  fiberConvex : ∀ b : B, Convex ℝ (Set.range (λ x : VB.fiber b => x))
  totalConvexSet : Set VB.totalSpace
  fiberwiseConvex : ∀ b : B, Convex ℝ (totalConvexSet ∩ (VB.projection ⁻¹' {b}))

structure ConvexFunctionOnBundle (B : Type u) (F : Type v) [AddCommGroup F] [Module ℝ F] (VB : VectorBundle B F) where
  domain : Set VB.totalSpace
  f : VB.totalSpace → ℝ
  convexOnFibers : ∀ b : B, ConvexOn ℝ (domain ∩ (VB.projection ⁻¹' {b})) f
  lowerSemicontinuous : Prop

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse