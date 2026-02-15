# Copilot Instructions for BC-Samples Repository

## Repository Overview

This is a multi-project workspace containing Business Central AL development extension samples. Each project is a separate folder at the repository root containing an `app.json` and one or more `.al` files.

## Task: Update README.md When a New Project Is Added

When a new sample project folder is added to the repository, update the root `README.md` file's **## Contents** table to include the new project.

### Steps

1. **Identify new projects** — List all top-level directories that contain an `app.json` file. Compare against the projects already listed in the `## Contents` table in `README.md`. Any folder with an `app.json` that is not in the table is a new project.

2. **Gather project details** for each new project:
   - **Project folder name** — The directory name (e.g., `myproject1`).
   - **Object ID range** — Read `app.json` and extract the `idRanges[0].from` and `idRanges[0].to` values. Format as `from–to` using an en-dash.
   - **Description** — Read the `.al` source files (and `README.md` if present) in the project folder to write a concise one-line description of what the sample demonstrates.

3. **Add a new row** to the Contents table in `README.md` following this exact format:

   ```
   | [foldername](foldername/) | One-line description of what the sample demonstrates | 50XXX–50XXX |
   ```

4. **Maintain table order** — Insert new rows in alphabetical order by project folder name to keep the table organized.

5. **Do not modify** any other section of the `README.md` unless explicitly asked.

### Contents Table Format Reference

The table in `README.md` uses this structure:

```markdown
| Project | Description | Object Range |
|---------|-------------|--------------|
| [foldername](foldername/) | Brief description | 50XXX–50XXX |
```

### What Counts as a Project

- A top-level folder containing an `app.json` file.
- Exclude `supporting-files/` and any folder that does not have an `app.json`.

### Description Guidelines

- Keep descriptions to a single sentence.
- Focus on the AL language feature or Business Central concept being demonstrated.
- Use inline code formatting (backticks) for AL keywords, property names, or method names.
- Do not start every description with "Demonstrates" — vary the phrasing.
