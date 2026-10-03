---
name: audit-codebase
description: Deep dive into a whole codebase (or one area of it) for bugs, design flaws and improvement ideas, then report a numbered, prioritized list and wait for the user to pick what to fix. Use when the user asks for a deep dive, audit, bug hunt or "anything that looks off", not for reviewing a single diff.
---

# Audit a codebase

Use this for `/audit-codebase`, `$audit-codebase`, or requests like "do a deep dive for bugs". The scope is what I named (a module, plugin, feature); with none, the whole repository. For a single diff, branch or PR, use the `review-changes` skill instead.

## 1. Map it

- Read the project's `AGENTS.md`/`CLAUDE.md`, the README and the build/test setup.
- Build a picture of the architecture: entry points, main components, data flow, external integrations, concurrency model, persistence.
- Run the build and tests once and note anything failing or flaky.

## 2. Dig

Go through every component in scope. Do not stop at the first few findings; an audit that only skims will miss what I asked for. Look for:

1. Bugs: wrong logic, unhandled errors and edge cases, race conditions, leaks, state that can get out of sync.
2. Design flaws: wrong abstractions, tight coupling, duplicated logic, things that will make the next features hard.
3. Robustness: missing timeouts, retries, validation, partial failure handling; security issues.
4. Tests: important behaviour without tests, tests that would not catch a regression.
5. Improvements: simplifications, better use of the platform or libraries, and, if I asked for it, product or feature ideas.

For areas with many findings or high risk, spawn fresh-context subagents to review one component each, and verify what they report yourself.

## 3. Verify

Try to disprove every finding before reporting it: trace the code path, reproduce it with a test or scratch script when cheap. Drop what you cannot back up, or mark it as uncertain.

## 4. Report and stop

A numbered list grouped by category, ordered by severity within each group. Each item: severity, `path:line`, the problem in one sentence, a concrete failure scenario or cost, and the fix in one sentence. End with the three items you would do first.

Then stop and let me pick ("fix all except 5 and 8"). Do not change code before that.
