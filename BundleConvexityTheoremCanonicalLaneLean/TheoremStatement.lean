import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  bundleConvexityConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

data BundleConvexityWitnessClosed (O : BundleAdmittedObject) : Prop :=
| conclusion : O.bundleConvexityConclusion

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse
