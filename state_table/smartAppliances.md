## Smart Appliances FSM
### State Table
| Current State | Inputs                | Next State  | Outputs             |
|---------------|-----------------------|-------------|---------------------|
| Idle          | Schedule = Active     | Operating   | Appliance_On        |
| Operating     | Task = Complete       | Idle        | Appliance_Off       |
| Operating     | User_Override = Off   | Idle        | Appliance_Off       |
