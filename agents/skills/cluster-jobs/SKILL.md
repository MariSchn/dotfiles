---
name: cluster-jobs
description: Launch and monitor SLURM jobs on an HPC cluster (training runs, eval sweeps, model or judge servers) - submit, watch until running, diagnose and relaunch crashes, stay within the node budget. Use when the user asks to launch, monitor, resubmit or check on cluster jobs.
---

# Cluster jobs

Use this for launching, monitoring and fixing SLURM jobs. Project-specific scripts, paths and quirks live in the project's `AGENTS.md`/`CLAUDE.md`; read it first and follow it over this skill.

## Launch

- Use the project's own launch scripts. Check the config before submitting: model and checkpoint paths, hyperparameters, output directory, node count.
- Start the services the jobs depend on (e.g. inference servers) first, wait until they serve requests, and size them for the load: several instances for a large sweep. Keep them alive for as long as the jobs need them.
- Stay within the node budget I gave you. Use extra idle nodes only when I allow it.

## Monitor

- After submitting, watch with `squeue -u $USER` and the job logs until each job is actually running and producing output (first steps logged, loss reasonable), not just queued.
- Then check at intervals that fit the job length. Report state briefly when I ask: running, pending, done, failed, with the reason.

## Fix

- On a failure, read the logs and find the cause before resubmitting. Fix the cause, then resubmit only the failed jobs.
- A one-off node failure needs only a resubmit. Exclude nodes only if the same node fails repeatedly.
- Never cancel jobs you did not start or that I did not ask you to cancel. If jobs must be cancelled to free resources, ask first.

## Files

- Prefer symlinks over copies for large checkpoints, unless the fix requires a modified copy.
