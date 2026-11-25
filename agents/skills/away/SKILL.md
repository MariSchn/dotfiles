---
name: away
description: Run an experiment while the user is away from their computer and checks in from their phone, in small steps that each end with a phone-sized update. Use only when the user runs /away or says they're away and will check in from their phone.
---

# Away

Use this for `/away` or `$away`. I'm away from my computer and check in from my phone. Run the task with the `autonomous-experiment` skill, plus:

- Finish each step with a message I can read on my phone in a minute: the answer and how sure you are in two or three lines, the key plot attached, a link to the runs, any changes to tracked files, and two or three numbered next steps with their cost, so I can reply with a number.
- Send the one-line answer as a push notification if you can.
- Append that message to `LOG.md` next to the report, and read the log first when I follow up.
- In a cloud session, commit the report folder with `LOG.md` and the plots to your branch with each update (force-add it if it's gitignored), push, and link the plot there instead of attaching it.
- Treat each reply in this session as one more step under these rules, until I say I'm back.
