
---

### **Door Locks**
```markdown
# Door Locks State Diagram

```mermaid
stateDiagram
    [*] --> Locked
    Locked --> Unlocked: Keyless Entry / Remote Unlock
    Unlocked --> Locked: Auto-Lock Timer / Remote Lock
