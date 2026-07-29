import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.ConvexFibrationStructure

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure EndpointClassificationPackage {B : BundleManifold}
    (P : ConvexFibrationPackage B) (S : SectionConvexityPackage B) where
  endpointCondition : Prop
  convexSectionExists : Prop
  classificationComplete : Prop

structure EndpointClassificationEvidence {B : BundleManifold}
    {P : ConvexFibrationPackage B} {S : SectionConvexityPackage B}
    (Epkg : EndpointClassificationPackage P S) where
  endpointConditionClosed : Epkg.endpointCondition
  convexSectionExistsClosed : Epkg.convexSectionExists
  classificationCompleteClosed : Epkg.classificationComplete

def EndpointClassificationClosed {B : BundleManifold}
    {P : ConvexFibrationPackage B} {S : SectionConvexityPackage B}
    (Epkg : EndpointClassificationPackage P S) : Prop :=
  Epkg.endpointCondition ∧ Epkg.convexSectionExists ∧ Epkg.classificationComplete

theorem endpoint_classification_closed_from_evidence
    {B : BundleManifold} {P : ConvexFibrationPackage B} {S : SectionConvexityPackage B}
    (Epkg : EndpointClassificationPackage P S) (E : EndpointClassificationEvidence Epkg) :
    EndpointClassificationClosed Epkg := by
  exact And.intro E.endpointConditionClosed
    (And.intro E.convexSectionExistsClosed E.classificationCompleteClosed)

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse