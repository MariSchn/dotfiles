---
name: ship
description: Take finished, approved work from the working tree to main - commit, open a PR, run a fresh-context review, fix what's real, wait for CI, merge, clean up and run the project's post-merge steps. Use when the user runs /ship or says things like "looks good, open the PR and merge", "review, merge and clean up".
---

# Ship

Use this for `/ship`, `$ship` or "looks good, get it on main". Do every step without asking unless I said to stop earlier (e.g. "open the PR, I'll merge" or "don't merge yet").

## 1. Commit and open the PR

- Branch from up-to-date main if the work is not on a branch yet. Commit with a short imperative subject.
- Push and open the PR with `gh`. The description is self-contained: what changed, why, and how to try it. No roadmap, spec or tracker references, no "next PR".

## 2. Review

- Spawn one fresh-context subagent that reviews the branch against its base with the `review-changes` skill.
- Triage every finding yourself: fix the real defects, skip the rest with a one-line reason. Rerun the tests, push, and update the PR description if it is outdated.

## 3. Merge

- Wait for CI. On a failure, find the cause: rerun only if it is clearly flaky, otherwise fix and push.
- Merge with the repo's usual merge method. If several of my PRs for this work are open, merge all of them; don't leave orphaned PRs.

## 4. Clean up and post-merge steps

- Update local main. Delete the local and remote branch and any worktree you created.
- Run the project's post-merge steps from its `AGENTS.md`/`CLAUDE.md`, e.g. updating the tracker or rebuilding and installing the app.

## 5. Report

First line: `Done: #<n> merged` or what blocked you. Then one line per review finding (fixed or skipped and why) and anything left for me.
