## Air Quality Monitoring FSM
### State Table
| Current State | Inputs             | Next State    | Outputs          |
|---------------|--------------------|---------------|------------------|
| Monitoring    | AQI > Threshold    | Alert         | Send_Alert       |
| Alert         | Timer = Expired    | Purifier_On   | Purifier_On      |
| Purifier_On   | AQI <= Threshold   | Monitoring    | Purifier_Off     |
