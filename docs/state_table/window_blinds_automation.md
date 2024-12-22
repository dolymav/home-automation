## Window Blinds Automation FSM
### State Table
| Current State | Inputs                          | Next State   | Outputs       |
|---------------|---------------------------------|--------------|---------------|
| Closed        | Light_Sensor > Threshold       | Open         | Blinds_Open   |
| Open          | Light_Sensor < Threshold       | Closed       | Blinds_Close  |
| Any           | User_Control = Adjust_Position | Adjusting    | Blinds_Adjust |
