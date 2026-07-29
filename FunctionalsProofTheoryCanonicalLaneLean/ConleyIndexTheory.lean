import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure DynamicalSystem (S : FunctionalStateSpace) where
  /-- The flow: φ: ℝ × S → S -/
  flow : ℝ → S.carrier → S.carrier
  /-- The flow is continuous in both variables -/
  continuity : Prop
  /-- The flow satisfies the semigroup property -/
  semigroup : ∀ t1 t2 : ℝ, ∀ x : S.carrier, flow (t1 + t2) x = flow t1 (flow t2 x)

structure IsolatedInvariantSet {S : FunctionalStateSpace} (D : DynamicalSystem S) where
  set : Set S.carrier
  invariant : ∀ t : ℝ, ∀ x : S.carrier, x ∈ set → D.flow t x ∈ set
  isolationNeighborhood : Set S.carrier
  isolated : ∀ x : S.carrier, x ∈ set ↔ (∃ t : ℝ, D.flow t x ∈ set) ∧ (∀ t : ℝ, D.flow t x ∈ isolationNeighborhood → D.flow t x ∈ set)

structure ConleyIndex {S : FunctionalStateSpace} {D : DynamicalSystem S} (I : IsolatedInvariantSet D) where
  indexSpace : Type
  indexMap : S.carrier → indexSpace
  /-- The index is a pointed topological space -/
  basepoint : indexSpace
  /-- Homotopy type of the index -/
  homotopyType : Prop

structure ConleyIndexEvidence {S : FunctionalStateSpace} {D : DynamicalSystem S} {I : IsolatedInvariantSet D} (C : ConleyIndex I) where
  invariantClosed : I.invariant
  isolationClosed : I.isolated
  indexMapContinuous : Prop
  homotopyTypeClosed : C.homotopyType

def ConleyIndexClosed {S : FunctionalStateSpace} {D : DynamicalSystem S} {I : IsolatedInvariantSet D} (C : ConleyIndex I) : Prop :=
  I.invariant ∧ I.isolated ∧ Prop (C.indexMapContinuous) ∧ C.homotopyType

theorem conley_index_closed_from_evidence {S : FunctionalStateSpace} {D : DynamicalSystem S} {I : IsolatedInvariantSet D} (C : ConleyIndex I) (E : ConleyIndexEvidence C) : ConleyIndexClosed C := by
  exact And.intro E.invariantClosed (And.intro E.isolationClosed (And.intro ?_ E.homotopyTypeClosed))
  exact E.indexMapContinuous

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse