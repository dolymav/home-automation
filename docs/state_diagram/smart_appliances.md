
---

### **Smart Appliances**
```markdown
# Smart Appliances State Diagram

```mermaid
stateDiagram
    [*] --> Idle
    Idle --> Active: Task Scheduled / User Command
    Active --> Idle: Task Completed
