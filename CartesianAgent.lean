opaque WorldState : Type
opaque Observation : Type
opaque Action : Type
opaque AgentState : Type

def Agent := AgentState → Observation → AgentState × Action
def World := WorldState → Action → WorldState
def Sense := WorldState → Observation

def update (agent : Agent) (world : World) (sense : Sense)
  (currentWorldState : WorldState) (currentAgentState : AgentState)
  : WorldState × AgentState
:=
  let observation := sense currentWorldState
  let (newAgentState, action) := agent currentAgentState observation
  let newWorldState := world currentWorldState action
  (newWorldState, newAgentState)
