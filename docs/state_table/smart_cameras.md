## Smart Cameras FSM
### State Table
| Current State   | Inputs               | Next State      | Outputs         |
|------------------|---------------------|-----------------|-----------------|
| Monitoring       | Motion in Zone      | Motion_Detected | None            |
| Motion_Detected  | Timer = Expired     | Alert           | Send_Alert      |
| Alert            | User_Confirms_Clear | Monitoring      | Reset_Alert     |
