## Sensors FSM
### State Table
| Current State | Inputs                 | Next State | Outputs         |
|---------------|------------------------|------------|-----------------|
| Idle          | Door/Window = Opened   | Alert      | Send_Alert      |
| Alert         | User_Disables_Alert    | Idle       | Reset_Alert     |
