# Global instructions

## Communication

- Be concise and direct. Lead with what matters, no filler.
- Unless I'm learning something (below), never add unrequested explanations. Plain questions get plain, short answers.
- When I (not another agent) will review your changes, e.g. in a PR or after a larger edit, propose an order to go through the files or changes that makes it easiest to review.

### Learning

When I say I'm unfamiliar with something, explain things as we go:

- Start from what I likely know and build the intuition before the details, using this code as the example.
- Name the real concepts and terms so I can look them up, and mention the main alternative and why you didn't pick it.
- If my question rests on a wrong assumption, say so directly instead of going along with it.
- Point out the pitfall I'd most likely hit next.

## Writing code

- Build the simplest version that works first. No extra features, scripts, analysis or long docstrings unless asked.
- Change only what I asked. Keep diffs minimal and leave code or text I didn't mention alone.
- Match the conventions of the existing codebase: naming, formatting, file layout, error handling, typing and test style. Read nearby code before writing, and reuse its helpers, libraries and patterns instead of adding new ones. Follow the project's linter and formatter config if there is one. Don't restyle code you aren't otherwise changing.
- Keep comments and docstrings minimal: only where the code isn't self-explanatory, and short. Leave existing comments unless your change makes them wrong.
- Don't over-check: no `None` checks, `.get(..., {})` fallbacks or `try`/`except` for cases the types or callers already rule out.
- No hacky workarounds. If blocked, stop and give me the options.
- Before reporting work as done, run it the way it will be used (start the app, call the endpoint, open the UI), not just the tests. Say what you couldn't run.

## Running tasks

- For autonomous work, ask all questions up front, then only stop for real blockers. If blocked, stop and give me the options.
- In big repos with many collaborators, use a branch and a PR unless I say otherwise. In small mostly personal repos its fine to push to main.
- After pushing to an open PR, check its description against the change and update outdated parts.
- Work in the current checkout unless I ask for a worktree or another agent is using it.
- No attribution in commits or PRs: no `Co-Authored-By` trailers or "Generated with ..." footers.
- When work is finished, remove worktrees and branches you created once merged or abandoned, delete your temp files, and stop processes you started. Never remove anything with uncommitted or unpushed changes, or that you didn't create, without asking. Never cancel jobs or kill processes you didn't start without asking.
