---
name: review-changes
description: Review code changes for bugs before they are merged - the working tree diff, a branch against main, or a GitHub PR. Reports verified findings with severity and a concrete failure scenario, and edits nothing unless asked. Use when the user asks to review changes, a branch or a PR.
---

# Review changes

Use this for `/review-changes`, `$review-changes` or "review my changes / this branch / PR #12". The target is whatever the user named; with none, review the uncommitted changes, or the current branch against the default branch if the working tree is clean.

## 1. Collect the change

- Uncommitted: `git diff HEAD` plus untracked files from `git status --short`.
- Branch: `git diff $(git merge-base origin/main HEAD)...HEAD` and `git log --oneline origin/main..HEAD`. Use the repository's real default branch if it is not `main`.
- PR: `gh pr view <n>` for the description and `gh pr diff <n>` for the change.
- Work out the intent from the PR description, commit messages or the user's request. A change is only correct relative to what it is supposed to do.
- Read the project's `AGENTS.md` or `CLAUDE.md` for its conventions and test commands.

## 2. Read beyond the diff

For every changed function, read the whole function and its callers, plus the types and tests it touches. Most real bugs come from how new code interacts with existing code, not from the changed lines alone.

## 3. Look for problems, most important first

1. Correctness: wrong logic, off-by-one errors, unhandled `null`/empty/error cases, broken invariants, behaviour that no longer matches the intent.
2. Robustness: race conditions, resource leaks, missing timeouts, partial failures, unsafe input handling, security issues.
3. Compatibility: changed public APIs, schemas, config or CLI flags that break existing callers or data.
4. Tests: new behaviour without tests, tests that would still pass if the code were wrong, flaky tests.
5. Simplicity: duplicated logic that already exists in the codebase, needless complexity, dead code.

Skip pure style nits that a formatter or linter would catch.

## 4. Verify every finding

Before reporting anything, try to prove it wrong: trace the actual code path, check whether a caller or type already rules it out, and run the relevant test or a quick scratch script when that is cheap. Drop findings you cannot back up. If something is uncertain but important, keep it and label it as uncertain.

## 5. Report

Reply with a numbered list ordered by severity. Each finding has:

- Severity: `critical`, `high`, `medium` or `low`.
- Location as `path:line`.
- What is wrong, in one sentence.
- A concrete failure scenario: the input or state, and the wrong result or crash it causes.
- A suggested fix, briefly.

End with a one-line overall verdict. If nothing survives verification, say so plainly instead of padding the list.

Do not edit files, commit or post comments unless the user asks. If they ask you to fix the findings, fix only those, then rerun the tests.
