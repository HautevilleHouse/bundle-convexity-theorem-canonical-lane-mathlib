import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.ConvexityFoundation

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure ConvexityFunctionalPackage (C : ConvexityPackage) where
  functional : Type u
  monotonicityProperty : Prop
  lowerBound : Prop
  inputForConvexity : Prop

structure ConvexityFunctionalEvidence (C : ConvexityPackage) (F : ConvexityFunctionalPackage C) where
  monotonicityPropertyClosed : F.monotonicityProperty
  lowerBoundClosed : F.lowerBound
  inputForConvexityClosed : F.inputForConvexity

def ConvexityFunctionalClosed (C : ConvexityPackage) (F : ConvexityFunctionalPackage C) : Prop :=
  F.monotonicityProperty ∧ F.lowerBound ∧ F.inputForConvexity

theorem convexity_functional_closed_from_evidence
    (C : ConvexityPackage) (F : ConvexityFunctionalPackage C) (E : ConvexityFunctionalEvidence C F) :
    ConvexityFunctionalClosed C F := by
  exact And.intro E.monotonicityPropertyClosed
    (And.intro E.lowerBoundClosed E.inputForConvexityClosed)

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse