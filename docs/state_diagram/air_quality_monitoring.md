
---

### **Air Quality Monitoring**
```markdown
# Air Quality Monitoring State Diagram

```mermaid
stateDiagram
    [*] --> Idle
    Idle --> Monitoring: Air Quality Sensor Active
    Monitoring --> Purifying: Air Quality Below Threshold
    Purifying --> Monitoring: Air Quality Restored
