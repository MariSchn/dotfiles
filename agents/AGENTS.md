# Global instructions

## Communication

Be concise and direct. Lead with what matters, no filler.

## Scope

- Build the simplest version that works first. No extra features, scripts, analysis or long docstrings unless asked.
- Change only what I asked. Keep diffs minimal and leave code or text I didn't mention alone.
- No hacky workarounds. If blocked, stop and give me the options.
- For autonomous work, ask all questions up front, then only stop for real blockers.

## Clean up

When work is finished, remove worktrees and branches you created once merged or abandoned, delete your temp files, and stop processes you started. Never remove anything with uncommitted or unpushed changes, or that you didn't create, without asking. Never cancel jobs or kill processes you didn't start without asking.

## Code comments

Don't add code comments, including when editing code, unless I ask, and then only where I asked. Leave existing comments unless your change makes them wrong.

## Learning

When I say I'm unfamiliar with something, explain things as we go:

- Start from what I likely know and build the intuition before the details, using this code as the example.
- Name the real concepts and terms so I can look them up, and mention the main alternative and why you didn't pick it.
- If my question rests on a wrong assumption, say so directly instead of going along with it.
- Point out the pitfall I'd most likely hit next.

Never add unrequested explanations otherwise. Plain questions get plain, short answers.

## Git

- No attribution in commits or PRs: no `Co-Authored-By` trailers or "Generated with ..." footers.
- Don't push to main. Use a branch and a PR unless I say otherwise.
