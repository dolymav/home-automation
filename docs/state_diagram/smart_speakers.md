
---

### **Smart Speakers**
```markdown
# Smart Speakers State Diagram

```mermaid
stateDiagram
    [*] --> Idle
    Idle --> Listening: Wake Word Detected
    Listening --> Processing: Command Recognized
    Processing --> Executing: Action Triggered
    Executing --> Idle: Command Completed
