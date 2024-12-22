
---

### **Robot Vacuums**
```markdown
# Robot Vacuums State Diagram

```mermaid
stateDiagram
    [*] --> Docked
    Docked --> Cleaning: Task Scheduled / Start Command
    Cleaning --> Docked: Task Completed / Battery Low
