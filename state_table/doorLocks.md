## Door Locks FSM
### State Table
| Current State | Inputs              | Next State  | Outputs       |
|---------------|---------------------|-------------|---------------|
| Locked        | Keypad_Input = Valid| Unlocked    | Door_Unlock   |
| Locked        | Remote_Control = On | Unlocked    | Door_Unlock   |
| Unlocked      | Timer = Expired     | Locked      | Door_Lock     |
