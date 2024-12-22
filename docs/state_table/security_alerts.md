## Security Alerts FSM
### State Table
| Current State   | Inputs                      | Next State      | Outputs        |
|------------------|----------------------------|-----------------|----------------|
| Monitoring       | Intrusion_Detected = True  | Alert           | Send_Alert     |
| Alert            | User_Disables_Alert        | Monitoring      | Reset_Alert    |
