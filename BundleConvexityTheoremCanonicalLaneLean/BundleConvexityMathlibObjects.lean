import HautevilleHouse.BundleConvexityTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BundleConvexityTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BundleConvexitySpace where
  base : Type u
  baseTopology : TopologicalSpace base
  fiber : Type u
  fiberTopology : TopologicalSpace fiber
  bundle : Type u
  bundleTopology : TopologicalSpace bundle
  projection : bundle → base
  isFiberBundle : Prop
  convexStructure : Prop

structure BundleConvexityAdmittedObject where
  space : BundleConvexitySpace
  convexSubset : Prop
  convexInBundle : Prop
  conclusion : convexInBundle

structure BundleConvexityEndgameState where
  object : BundleConvexityAdmittedObject

def BundleConvexityWitnessClosed (O : BundleConvexityAdmittedObject) : Prop :=
  O.convexInBundle

end BundleConvexityTheoremCanonicalLaneLean
end HautevilleHouse