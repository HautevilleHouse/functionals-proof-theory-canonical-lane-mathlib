import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalsProofTheoryCanonicalLaneLean

structure MountainPassGeometry where
  /-- The base point -/
  x0 : Type
  /-- The mountain ridge point -/
  x1 : Type
  /-- The path space -/
  pathSpace : Type
  continuousPath : pathSpace → (ℝ → x0 ?+? x1)

structure MountainPassFunctional (G : MountainPassGeometry) where
  functional : (G.x0 ?+? G.x1) → ℝ
  palaisSmaleCondition : Prop
  satisfiesGeometricCondition : Prop

structure MountainPassCriticalPoint {G : MountainPassGeometry} (F : MountainPassFunctional G) where
  criticalPoint : G.x0 ?+? G.x1
  criticalValue : ℝ
  localMinimaAtEndpoints : Prop
  saddlePointCharacterization : Prop

structure MountainPassEvidence {G : MountainPassGeometry} {F : MountainPassFunctional G} (C : MountainPassCriticalPoint F) where
  palaisSmaleClosed : F.palaisSmaleCondition
  geometricConditionClosed : F.satisfiesGeometricCondition
  criticalPointClosed : C.criticalValue = F.functional C.criticalPoint
  localMinimaClosed : C.localMinimaAtEndpoints
  saddleClosed : C.saddlePointCharacterization

def MountainPassClosed {G : MountainPassGeometry} {F : MountainPassFunctional G} (C : MountainPassCriticalPoint F) : Prop :=
  F.palaisSmaleCondition ∧ F.satisfiesGeometricCondition ∧ C.criticalValue = F.functional C.criticalPoint ∧ C.localMinimaAtEndpoints ∧ C.saddlePointCharacterization

theorem mountain_pass_closed_from_evidence {G : MountainPassGeometry} {F : MountainPassFunctional G} (C : MountainPassCriticalPoint F) (E : MountainPassEvidence C) : MountainPassClosed C := by
  exact And.intro E.palaisSmaleClosed (And.intro E.geometricConditionClosed (And.intro E.criticalPointClosed (And.intro E.localMinimaClosed E.saddleClosed)))

end FunctionalsProofTheoryCanonicalLaneLean
end HautevilleHouse