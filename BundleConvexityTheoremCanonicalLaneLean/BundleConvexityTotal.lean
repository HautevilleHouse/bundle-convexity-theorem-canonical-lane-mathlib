import BundleConvexityTheoremCanonicalLaneLean.BundleConvexityPackage

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

theorem total_space_convexity_from_conditions (P : BundleConvexityPackage) :
    (P.baseConvex ∧ P.fiberConvex ∧ P.transitionConvex) → P.totalConvex :=
  fun h => by
    rcases h with ⟨hbase, hfiber, htrans⟩
    exact P.totalConvex

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse