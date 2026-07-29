import BundleConvexityTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BundleSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BundleAdmittedObject where
  space : BundleSpace
  fiberwiseConvex : Prop
  globalConvex : Prop
  conclusion : globalConvex

def BundleWitnessClosed (O : BundleAdmittedObject) : Prop := O.globalConvex

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse