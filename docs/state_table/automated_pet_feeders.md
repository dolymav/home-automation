## Automated Pet Feeders FSM
### State Table
| Current State | Inputs                 | Next State   | Outputs      |
|---------------|------------------------|--------------|--------------|
| Idle          | Schedule = FeedingTime | Feeding      | Dispense_Food|
| Feeding       | Food_Dispensed = True  | Idle         | None         |
