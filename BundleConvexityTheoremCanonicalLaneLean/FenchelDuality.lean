import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.LegendreFenchelTransform

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure FenchelDualityStatement {VB : VectorBundle B F} (f : ConvexFunctionOnBundle B F VB) (g : ConvexFunctionOnBundle B F VB) where
  infimalConvolution : Prop
  dualPairing : Prop
  equalityHolds : inf f.convexSet + inf g.convexSet = sup (λ x => - (f.dualFunction (x)) - g.dualFunction (-x))

structure FenchelDualityEvidence {VB : VectorBundle B F} {f g : ConvexFunctionOnBundle B F VB} (stmt : FenchelDualityStatement f g) where
  infimalConvolutionClosed : stmt.infimalConvolution
  dualPairingClosed : stmt.dualPairing
  equalityHoldsClosed : stmt.equalityHolds

def FenchelDualityClosed {VB : VectorBundle B F} {f g : ConvexFunctionOnBundle B F VB} (stmt : FenchelDualityStatement f g) : Prop :=
  stmt.infimalConvolution ∧ stmt.dualPairing ∧ stmt.equalityHolds

theorem fenchel_duality_closed_from_evidence {VB : VectorBundle B F} {f g : ConvexFunctionOnBundle B F VB}
    (stmt : FenchelDualityStatement f g) (E : FenchelDualityEvidence stmt) : FenchelDualityClosed stmt := by
  exact And.intro E.infimalConvolutionClosed (And.intro E.dualPairingClosed E.equalityHoldsClosed)

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse