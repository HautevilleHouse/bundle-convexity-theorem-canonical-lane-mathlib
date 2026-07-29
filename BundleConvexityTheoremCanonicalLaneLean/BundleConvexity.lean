import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

/-- A bundle structure with a projection and fiber. -/
structure BundlePackage where
  totalSpace : Type u
  baseSpace : Type v
  projection : totalSpace → baseSpace
  fiber : baseSpace → Type w
  trivialization : Type x
  trivializationCompatible : Prop
  fiberVectorSpace : Prop

def BundleClosed (B : BundlePackage) : Prop :=
  B.trivializationCompatible ∧ B.fiberVectorSpace

structure BundleEvidence (B : BundlePackage) where
  trivializationCompatibleClosed : B.trivializationCompatible
  fiberVectorSpaceClosed : B.fiberVectorSpace

theorem bundle_closed_from_evidence (B : BundlePackage) (E : BundleEvidence B) :
    BundleClosed B := by
  exact And.intro E.trivializationCompatibleClosed E.fiberVectorSpaceClosed

/-- A convexity structure on a bundle expressing geodesic convexity in fibers. -/
structure ConvexityPackage (B : BundlePackage) where
  fiberConvexSet : (x : B.baseSpace) → Set (B.fiber x)
  convexCombination : (x : B.baseSpace) → (a b : B.fiber x) → (t : ℝ) → B.fiber x
  convexCombinationInSet : (x : B.baseSpace) → (a b : B.fiber x) → (t : ℝ) →
    a ∈ fiberConvexSet x → b ∈ fiberConvexSet x → t ∈ Set.Ioo (0 : ℝ) 1 →
    convexCombination x a b t ∈ fiberConvexSet x
  convexCombinationAxiom : (x : B.baseSpace) → (a b : B.fiber x) → (t : ℝ) →
    convexCombination x (convexCombination x a b t) b (1 - t) = convexCombination x a b (t * (1 - t))
  fiberConvexSetNonempty : (x : B.baseSpace) → Nonempty (fiberConvexSet x)

def ConvexityClosed {B : BundlePackage} (C : ConvexityPackage B) : Prop :=
  ∀ (x : B.baseSpace), Set.Nonempty (C.fiberConvexSet x)

structure ConvexityEvidence {B : BundlePackage} (C : ConvexityPackage B) where
  fiberConvexSetNonemptyClosed : ∀ (x : B.baseSpace), Set.Nonempty (C.fiberConvexSet x)

theorem convexity_closed_from_evidence {B : BundlePackage} (C : ConvexityPackage B)
    (E : ConvexityEvidence C) : ConvexityClosed C :=
  E.fiberConvexSetNonemptyClosed

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse