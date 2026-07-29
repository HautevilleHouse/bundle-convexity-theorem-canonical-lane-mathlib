import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure ConnectionCurvaturePackage where
  manifold : Type u
  vectorBundle : Type v
  connection : Type w
  curvatureForm : Type x
  connectionCompatibleWithMetric : Prop
  curvatureSatisfiesBianchi : Prop
  curvatureFlatnessCondition : Prop

structure ConnectionCurvatureEvidence (C : ConnectionCurvaturePackage) where
  connectionCompatibleWithMetricClosed : C.connectionCompatibleWithMetric
  curvatureSatisfiesBianchiClosed : C.curvatureSatisfiesBianchi
  curvatureFlatnessConditionClosed : C.curvatureFlatnessCondition

def ConnectionCurvatureClosed (C : ConnectionCurvaturePackage) : Prop :=
  C.connectionCompatibleWithMetric ∧ C.curvatureSatisfiesBianchi ∧ C.curvatureFlatnessCondition

theorem connection_curvature_closed_from_evidence (C : ConnectionCurvaturePackage)
    (E : ConnectionCurvatureEvidence C) : ConnectionCurvatureClosed C := by
  exact And.intro E.connectionCompatibleWithMetricClosed
    (And.intro E.curvatureSatisfiesBianchiClosed E.curvatureFlatnessConditionClosed)

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse