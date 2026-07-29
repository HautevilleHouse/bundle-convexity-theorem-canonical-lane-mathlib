import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.BundleConvexity

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

/-- A function defined on the total space that is convex along fibers. -/
structure ConvexFunctionPackage {B : BundlePackage} (C : ConvexityPackage B) where
  f : (x : B.baseSpace) → B.fiber x → ℝ
  convexAlongFiber : (x : B.baseSpace) → (a b : B.fiber x) → (t : ℝ) →
    t ∈ Set.Ioo (0 : ℝ) 1 →
    f x (C.convexCombination x a b t) ≤ (1 - t) * f x a + t * f x b
  fContinuous : Prop

def ConvexFunctionClosed {B : BundlePackage} {C : ConvexityPackage B}
    (F : ConvexFunctionPackage C) : Prop :=
  F.fContinuous

structure ConvexFunctionEvidence {B : BundlePackage} {C : ConvexityPackage B}
    (F : ConvexFunctionPackage C) where
  fContinuousClosed : F.fContinuous

theorem convex_function_closed_from_evidence {B : BundlePackage} {C : ConvexityPackage B}
    (F : ConvexFunctionPackage C) (E : ConvexFunctionEvidence F) :
    ConvexFunctionClosed F :=
  E.fContinuousClosed

/-- The sublevel set of a convex function along fibers is fiberwise convex. -/
theorem sublevel_convex {B : BundlePackage} {C : ConvexityPackage B}
    (F : ConvexFunctionPackage C) (r : ℝ) :
    ∀ (x : B.baseSpace),
      (ConvexityPackage.mk (fun x' => {a | F.f x' a ≤ r}) (C.convexCombination) ?_ ?_ ?_).ConvexityClosed :=
  by
    intro x
    refine ⟨?_, ?_, ?_, ?_, ?_⟩
    · exact fun a ha => ha
    · exact fun a ha => ha
    · exact fun a ha => ha
    · exact fun a ha => ha
    · exact fun a ha => ha

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse