import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.BundleGeometryObjects

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure SectionConvexityPackage (B : BundleManifold) where
  globalSection : BundleSection B
  convexCombinationSections : Prop
  convexSectionPreserved : Prop
  convexCombinationContinuous : Prop

structure SectionConvexityEvidence {B : BundleManifold} (P : SectionConvexityPackage B) where
  convexCombinationSectionsClosed : P.convexCombinationSections
  convexSectionPreservedClosed : P.convexSectionPreserved
  convexCombinationContinuousClosed : P.convexCombinationContinuous

def SectionConvexityClosed {B : BundleManifold} (P : SectionConvexityPackage B) : Prop :=
  P.convexCombinationSections ∧ P.convexSectionPreserved ∧ P.convexCombinationContinuous

theorem section_convexity_closed_from_evidence
    {B : BundleManifold} (P : SectionConvexityPackage B)
    (E : SectionConvexityEvidence P) : SectionConvexityClosed P := by
  exact And.intro E.convexCombinationSectionsClosed
    (And.intro E.convexSectionPreservedClosed E.convexCombinationContinuousClosed)

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse