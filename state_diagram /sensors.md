
---

### **Sensors**
```markdown
# Sensors State Diagram

```mermaid
stateDiagram
    [*] --> Inactive
    Inactive --> Active: Sensor Triggered
    Active --> Inactive: Reset / No Trigger Detected
