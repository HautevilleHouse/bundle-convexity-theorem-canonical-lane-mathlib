import BundleConvexityTheoremCanonicalLaneLean.BundleConvexityDefinitions

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure BundleConvexityPackage where
  baseConvex : Prop
  fiberConvex : Prop
  transitionConvex : Prop
  totalConvex : Prop

structure BundleConvexityEvidence (P : BundleConvexityPackage) where
  baseConvexClosed : P.baseConvex
  fiberConvexClosed : P.fiberConvex
  transitionConvexClosed : P.transitionConvex
  totalConvexClosed : P.totalConvex

def BundleConvexityClosed (P : BundleConvexityPackage) : Prop :=
  P.baseConvex ∧ P.fiberConvex ∧ P.transitionConvex ∧ P.totalConvex

theorem bundle_convexity_closed_from_evidence (P : BundleConvexityPackage) (E : BundleConvexityEvidence P) :
    BundleConvexityClosed P :=
  And.intro E.baseConvexClosed (And.intro E.fiberConvexClosed (And.intro E.transitionConvexClosed E.totalConvexClosed))

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse