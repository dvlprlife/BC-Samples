---
name: commit
description: Stage and commit changes with a generated commit message
---

## Instructions

1. Check for staged files using `git diff --cached --name-only`.
2. If no files are staged, stage all modified/untracked files using `git add -A`, then re-check staged files.
3. Review the staged diff using `git diff --cached` to understand what changed.
4. Generate a clear, concise commit message following Conventional Commits format:
   - Use a type prefix: `feat`, `fix`, `refactor`, `docs`, `chore`, `test`, `style`, `perf`, `build`, `ci`
   - Include a scope in parentheses when applicable (e.g., `feat(data-bridge):`)
   - Write a short summary line (max 72 characters)
   - Add a blank line followed by bullet-point details if multiple changes are included
5. Commit the staged changes using `git commit -m "<message>"`.
6. Confirm the commit was successful by showing `git log --oneline -1`.