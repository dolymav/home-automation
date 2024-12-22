## Motion Sensing FSM
### State Table
| Current State    | Inputs                | Next State         | Outputs         |
|------------------|-----------------------|--------------------|-----------------|
| Idle             | Motion_Sensor = High | Motion_Detected    | Lights_On       |
| Motion_Detected  | Motion_Sensor = Low  | Idle               | Lights_Off      |
| Any              | Manual_Override = On | Idle               | Lights_Off      |
