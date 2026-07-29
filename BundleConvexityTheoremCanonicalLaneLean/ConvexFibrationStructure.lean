import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.BundleGeometryObjects

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure ConvexFibrationPackage (B : BundleManifold) where
  totalSpace : Type u
  totalTopology : TopologicalSpace totalSpace
  fibration : totalSpace → B.base
  continuousFibration : Continuous fibration
  fiberConvexity : ∀ x : B.base, ConvexityStructure B
  convexFiberwise : Prop
  fiberConvexityContinuous : Prop

structure ConvexFibrationEvidence {B : BundleManifold} (P : ConvexFibrationPackage B) where
  convexFiberwiseClosed : P.convexFiberwise
  fiberConvexityContinuousClosed : P.fiberConvexityContinuous

def ConvexFibrationClosed {B : BundleManifold} (P : ConvexFibrationPackage B) : Prop :=
  P.convexFiberwise ∧ P.fiberConvexityContinuous

theorem convex_fibration_closed_from_evidence
    {B : BundleManifold} (P : ConvexFibrationPackage B)
    (E : ConvexFibrationEvidence P) : ConvexFibrationClosed P := by
  exact And.intro E.convexFiberwiseClosed E.fiberConvexityContinuousClosed

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse