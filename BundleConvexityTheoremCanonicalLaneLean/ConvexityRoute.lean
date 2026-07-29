import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.FinalTheorem
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.ConvexityFoundation
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.ConvexityFunctional

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure ConvexityRouteObligations (C : ConvexityPackage) where
  convexFunctionalRoute : Prop
  curvatureControl : Prop
  convexityClassification : Prop
  endResult : Prop

structure ConvexityRouteEvidence (C : ConvexityPackage) (R : ConvexityRouteObligations C) where
  convexFunctionalRouteClosed : R.convexFunctionalRoute
  curvatureControlClosed : R.curvatureControl
  convexityClassificationClosed : R.convexityClassification
  endResultClosed : R.endResult

def ConvexityRouteClosed (C : ConvexityPackage) (R : ConvexityRouteObligations C) : Prop :=
  R.convexFunctionalRoute ∧ R.curvatureControl ∧ R.convexityClassification ∧ R.endResult

theorem convexity_route_closed_from_evidence
    (C : ConvexityPackage) (R : ConvexityRouteObligations C) (E : ConvexityRouteEvidence C R) :
    ConvexityRouteClosed C R := by
  exact And.intro E.convexFunctionalRouteClosed
    (And.intro E.curvatureControlClosed
      (And.intro E.convexityClassificationClosed E.endResultClosed))

structure ConvexityCanonicalLaneRoute (A : AdmissibleClass) where
  convexityPackage : ConvexityPackage
  functionalPackage : ConvexityFunctionalPackage convexityPackage
  obligations : ConvexityRouteObligations convexityPackage
  evidence : ConvexityRouteEvidence convexityPackage obligations
  bridgeClosedFromRoute : bridgeClosed A
  gateClosedFromRoute : gateClosed A

theorem convexity_route_yields_constrained_closure
    (A : AdmissibleClass) (R : ConvexityCanonicalLaneRoute A) :
    ConstrainedBundleConvexityClosure A := by
  exact And.intro R.bridgeClosedFromRoute R.gateClosedFromRoute

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse