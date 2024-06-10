-- There are 3 possible actions.
inductive Action where
  | MoveForward
  | RotateLeft
  | RotateRight

-- The world state is a structure with 3 fields.
structure WorldState where
  x : Int
  y : Int
  rot : Int

def world (ws : WorldState) : Action → WorldState
  | Action.MoveForward => match ws.rot with
     | 0 => { ws with y := ws.y + 1 }  -- go up
     | 1 => { ws with x := ws.x + 1 }  -- go right
     | 2 => { ws with y := ws.y - 1 }  -- go down
     | 3 => { ws with x := ws.x - 1 }  -- go left
     | _ => ws
  | Action.RotateLeft => { ws with rot := (ws.rot - 1) % 4 }
  | Action.RotateRight => { ws with rot := (ws.rot + 1) % 4 }

-- The "sense" function is here simply the identity function.
abbrev Observation := WorldState
def sense (ws : WorldState) : Observation := ws
