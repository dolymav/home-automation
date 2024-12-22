## Robot Vacuums FSM
### State Table
| Current State | Inputs                   | Next State  | Outputs        |
|---------------|--------------------------|-------------|----------------|
| Idle          | Schedule = Active        | Cleaning    | Vacuum_Start   |
| Cleaning      | Obstacle_Sensor = Hit    | Adjust_Path | Path_Adjust    |
| Cleaning      | Battery < Threshold      | Returning   | Return_To_Dock |
| Returning     | Dock_Proximity = True    | Idle        | None           |
