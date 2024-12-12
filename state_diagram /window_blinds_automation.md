
---

### **Window Blinds Automation**
```markdown
# Window Blinds Automation State Diagram

```mermaid
stateDiagram
    [*] --> Closed
    Closed --> Open: Remote Command / Sunrise
    Open --> Closed: Remote Command / Sunset
