## Smart Speakers FSM
### State Table
| Current State | Inputs                     | Next State      | Outputs        |
|---------------|----------------------------|-----------------|----------------|
| Idle          | Voice_Command = Recognized | Action_Performed| Execute_Action |
| Idle          | Timer = Expired            | Idle            | None           |
