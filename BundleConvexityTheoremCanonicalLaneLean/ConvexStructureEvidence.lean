import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

structure ConvexStructurePackage where
  convexCombination : Type u
  combinationLawful : Prop
  closureUnderLimits : Prop

def ConvexStructureClosed (C : ConvexStructurePackage) : Prop :=
  C.combinationLawful ∧ C.closureUnderLimits

theorem convex_structure_closed (C : ConvexStructurePackage) : ConvexStructureClosed C :=
  ⟨by
    exact C.combinationLawful,
    by
    exact C.closureUnderLimits⟩

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse