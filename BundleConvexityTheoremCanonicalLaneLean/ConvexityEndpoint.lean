import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure ConvexityEndpointPackage where
  targetBase : Type u
  targetBaseTopology : TopologicalSpace targetBase
  convexSubsetEndpoint : Set targetBase
  endpointProperty : Prop

structure ConvexityEndpointEvidence (E : ConvexityEndpointPackage) where
  convexSubsetEndpointClosed : E.convexSubsetEndpoint
  endpointPropertyClosed : E.endpointProperty

def ConvexityEndpointClosed (E : ConvexityEndpointPackage) : Prop :=
  E.convexSubsetEndpoint ∧ E.endpointProperty

theorem convexity_endpoint_closed_from_evidence (E : ConvexityEndpointPackage)
    (Ev : ConvexityEndpointEvidence E) : ConvexityEndpointClosed E := by
  exact And.intro Ev.convexSubsetEndpointClosed Ev.endpointPropertyClosed

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse