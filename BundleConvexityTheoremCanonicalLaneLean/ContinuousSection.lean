import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.BundleConvexityDefs

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure ContinuousSection (B : BundleSpace) where
  sectionMap : B.base → B.fiber
  continuous : Continuous sectionMap

def sectionGraph (B : BundleSpace) (s : ContinuousSection B) : Set (B.base × B.fiber) :=
  { p | p.2 = s.sectionMap p.1 }

theorem section_graph_closed (B : BundleSpace) (s : ContinuousSection B) :
  IsClosed (sectionGraph B s) := by
  have h_eq : sectionGraph B s = { p | p.2 = s.sectionMap p.1 } := rfl
  have h_cont : Continuous (λ p : B.base × B.fiber => (p.2, s.sectionMap p.1)) := by
    refine Continuous.prod_mk ?_ ?_
    · exact continuous_snd
    · exact continuous_fst.comp s.continuous
  have h_eq' : { p | p.2 = s.sectionMap p.1 } = (λ p => (p.2, s.sectionMap p.1))⁻¹' { (x, x) | x ∈ B.fiber } := by
    ext p; simp
  rw [h_eq']
  apply IsClosed.preimage h_cont
  exact isClosed_diagonal

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse