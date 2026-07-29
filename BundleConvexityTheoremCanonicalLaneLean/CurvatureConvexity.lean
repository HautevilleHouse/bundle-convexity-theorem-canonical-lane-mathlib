import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure CurvatureConvexityPackage where
  curvatureTensor : Type u
  curvatureSignCondition : Prop
  convexityPreserved : Prop

structure CurvatureConvexityEvidence (C : CurvatureConvexityPackage) where
  curvatureSignConditionClosed : C.curvatureSignCondition
  convexityPreservedClosed : C.convexityPreserved

def CurvatureConvexityClosed (C : CurvatureConvexityPackage) : Prop :=
  C.curvatureSignCondition ∧ C.convexityPreserved

theorem curvature_convexity_closed_from_evidence (C : CurvatureConvexityPackage)
    (E : CurvatureConvexityEvidence C) : CurvatureConvexityClosed C := by
  exact And.intro E.curvatureSignConditionClosed E.convexityPreservedClosed

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse