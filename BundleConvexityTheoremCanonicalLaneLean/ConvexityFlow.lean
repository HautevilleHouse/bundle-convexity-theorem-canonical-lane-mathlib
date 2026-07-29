import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure ConvexityFlowPackage where
  timeDomain : Type u
  flowMap : timeDomain → Set totalSpace
  convexityPreservation : Prop
  monotonicityProperty : Prop

structure ConvexityFlowEvidence (F : ConvexityFlowPackage) where
  convexityPreservationClosed : F.convexityPreservation
  monotonicityPropertyClosed : F.monotonicityProperty

def ConvexityFlowClosed (F : ConvexityFlowPackage) : Prop :=
  F.convexityPreservation ∧ F.monotonicityProperty

theorem convexity_flow_closed_from_evidence (F : ConvexityFlowPackage)
    (E : ConvexityFlowEvidence F) : ConvexityFlowClosed F := by
  exact And.intro E.convexityPreservationClosed E.monotonicityPropertyClosed

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse