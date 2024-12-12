
---

### **Motion Sensing**
```markdown
# Motion Sensing State Diagram

```mermaid
stateDiagram
    [*] --> Idle
    Idle --> MotionDetected: Motion Detected
    MotionDetected --> TimerActive: Timer Started
    TimerActive --> Idle: Timer Expired
