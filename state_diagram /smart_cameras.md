
---

### **Smart Cameras**
```markdown
# Smart Cameras State Diagram

```mermaid
stateDiagram
    [*] --> Idle
    Idle --> Monitoring: Motion Detected
    Monitoring --> Alert: Intrusion Confirmed
    Alert --> Idle: Alert Cleared
