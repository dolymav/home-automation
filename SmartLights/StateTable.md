## Smart Lights FSM
### State Table
| Current State    | Inputs                | Next State         | Outputs         |
|------------------|-----------------------|--------------------|-----------------|
| Idle             | Motion_Sensor = High | Motion_Detected    | Lights_On       |
| Idle             | Switch = Toggle       | Manual_Control     | Lights_On/Off   |
| Motion_Detected  | Motion_Sensor = Low  | Idle               | Lights_Off      |
| Manual_Control   | Switch = Toggle       | Idle               | Lights_Off      |
