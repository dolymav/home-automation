## Smart Thermostat FSM
### State Table
| Current State | Inputs                            | Next State | Outputs   |
|---------------|-----------------------------------|------------|-----------|
| Idle          | Current_Temp < Set_Temp - Margin | Heating    | Heater_On |
| Idle          | Current_Temp > Set_Temp + Margin | Cooling    | AC_On     |
| Heating       | Current_Temp = Set_Temp          | Idle       | Heater_Off|
| Cooling       | Current_Temp = Set_Temp          | Idle       | AC_Off    |
