namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure ConvexityPackage where
  baseManifold : Type u
  vectorBundle : Type v
  connection : Type w
  curvatureTensor : Type x
  convexFunctional : Type y
  smoothManifold : Prop
  metricDefined : Prop
  curvatureLawful : Prop
  convexFunctionalDefined : Prop

structure ConvexityEvidence (C : ConvexityPackage) where
  smoothManifoldClosed : C.smoothManifold
  metricDefinedClosed : C.metricDefined
  curvatureLawfulClosed : C.curvatureLawful
  convexFunctionalDefinedClosed : C.convexFunctionalDefined

def ConvexityClosed (C : ConvexityPackage) : Prop :=
  C.smoothManifold ∧ C.metricDefined ∧ C.curvatureLawful ∧ C.convexFunctionalDefined

theorem convexity_closed_from_evidence (C : ConvexityPackage) (E : ConvexityEvidence C) :
    ConvexityClosed C := by
  exact And.intro E.smoothManifoldClosed
    (And.intro E.metricDefinedClosed
      (And.intro E.curvatureLawfulClosed E.convexFunctionalDefinedClosed))

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse