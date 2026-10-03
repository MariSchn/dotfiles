---
name: reflect
description: End-of-session reflection - review how the session went and suggest changes to the global or project instructions and skills, including removals. Says nothing if nothing is worth changing. Use when the user runs /reflect or asks what to change in their agent setup based on this session.
---

# Reflect on the session

Use this for `/reflect` or `$reflect` at the end of a session. The goal is a better setup, not a list of observations. Saying "Nothing to change." is perfectly acceptable if you believe there is nothing to change.

## 1. Gather

- Read the current global instructions (`~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`), the project's `AGENTS.md` or `CLAUDE.md`, and the names and descriptions of the installed skills (`~/.agents/skills/`, plus the project's skills).
- Go through this session and note:
  - Corrections: places where I told you that you did something wrong, too much, too little or differently than I wanted.
  - Repetition: instructions or multi-step requests I had to type more than once.
  - Conflicts: things I said or did that contradict an existing instruction or skill.
  - Ignored rules: existing instructions you broke anyway.

## 2. Filter hard

Keep a candidate only if all of these hold:

- It would have prevented a real correction or saved real repeated typing in this session.
- It is likely to come up again in future sessions, not just this task.
- It is not already covered. If it is covered and you broke it anyway, only suggest a change if the wording was actually unclear; otherwise drop it.
- It is worth the tokens: every global line is loaded in every session, so prefer tightening an existing line over adding a new one.

Drop one-off task details, and anything you are unsure I would agree with.

## 3. Decide the target

- Global instructions: preferences that apply across all projects.
- Project `AGENTS.md`/`CLAUDE.md`: anything tied to this repo's tools, paths, conventions or infrastructure.
- A new or changed skill: a multi-step workflow I triggered by hand, or a skill that did the wrong thing.
- A removal: an instruction or skill that contradicts what I asked for, or that is obsolete. Removing is as valuable as adding.

## 4. Report

If nothing survives, reply only with `Nothing to change.`

Otherwise list at most three suggestions, most valuable first. For each:

- The action: add, edit or remove, and the file.
- The exact text to add, or a minimal before/after for an edit or removal.
- One line of evidence: a short quote or concrete moment from this session.

Do not apply anything until I approve. Then make exactly the approved changes. Global instructions and skills are installed as copies from the dotfiles repo (`~/projects/dotfiles/agents/`). Ask whether a change is for this host only (edit the installed copies) or for all hosts (edit the repo, then run `./install-agents.sh --force` there).
