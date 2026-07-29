import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure SubmanifoldConvexityPackage where
  ambientManifold : Type u
  submanifold : Type v
  embedding : submanifold → ambientManifold
  submanifoldConvexInTotalSpace : Prop
  secondFundamentalFormPositiveSemidefinite : Prop
  convexHullPreserved : Prop

structure SubmanifoldConvexityEvidence (S : SubmanifoldConvexityPackage) where
  submanifoldConvexInTotalSpaceClosed : S.submanifoldConvexInTotalSpace
  secondFundamentalFormPositiveSemidefiniteClosed : S.secondFundamentalFormPositiveSemidefinite
  convexHullPreservedClosed : S.convexHullPreserved

def SubmanifoldConvexityClosed (S : SubmanifoldConvexityPackage) : Prop :=
  S.submanifoldConvexInTotalSpace ∧ S.secondFundamentalFormPositiveSemidefinite ∧ S.convexHullPreserved

theorem submanifold_convexity_closed_from_evidence (S : SubmanifoldConvexityPackage)
    (E : SubmanifoldConvexityEvidence S) : SubmanifoldConvexityClosed S := by
  exact And.intro E.submanifoldConvexInTotalSpaceClosed
    (And.intro E.secondFundamentalFormPositiveSemidefiniteClosed E.convexHullPreservedClosed)

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse