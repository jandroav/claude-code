Open tasks.md. Run "git status --porcelain" to list changed, added, or deleted files. For each change not represented in tasks.md, append a new task and mark it "[X]". Replace every remaining "[ ]" with "[X]". Save tasks.md.

Generate a commit message summarising actual changes:

- list each modified file with a short description
- group related files together

Execute: git add . git commit -m "<generated message>"

Report that all tasks (including newly added ones) are complete and the commit with an itemised summary has been created.
