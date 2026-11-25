---
name: autonomous-experiment
description: Plan, implement, run and analyze an ML or benchmarking experiment autonomously, ending with a report the user can read later. Use when the user asks you to run an experiment, sweep, ablation or benchmark on your own.
---

# Run an experiment autonomously

Use this when I hand you an experiment to run end to end.

## 1. Up front

- Read the code, configs and any results that already exist. Restate the question the experiment answers, the decision it informs, and the smallest result that settles it (e.g. one plot or table).
- Clarify any unclear points up front with me. The goal is for you to own the experiment and only get back to me when you're done, stuck, or believe there is something genuinely note worthy for me to take a look that shapes the rest of the experiment.
- Write a short plan: runs, the one variable each compares, metrics, compute budget. Keep it minimal: one seed, the smallest sweep that answers the question, unless I asked for more. Unless I set a budget, stay within the size of my own experiment scripts in the repo; if the question needs more, ask first and say what it would cost.

## 2. Implement

- The simplest implementation that answers the question. No extra analysis tooling or scripts beyond what the report needs.
- Run experiments the way the repo already does (its scripts, configs and logging), so I can inspect the runs myself. Build a separate harness only for a sweep I asked for.
- Keep all hyperparameters identical across runs except whats under study, so runs are comparable. Write the full config of every run to its output directory.
- Give every run a unique name and output directory; never let runs overwrite each other.

## 3. Run

- Sanity-check on a tiny run first (loss goes down, metrics are logged, checkpoints save).
- Monitor the runs. On a crash, find the cause, fix it and relaunch. On a cluster, follow the `cluster-jobs` skill.
- If results look surprisingly bad or good, suspect a bug first: have a fresh-context subagent check the implementation before drawing conclusions.
- Stop when the question is answered. Put further ideas in the report as next steps instead of running them.

## 4. Analyze

Do not just present numbers. Give your best explanation of the main result and test it with a cheap follow-up only if the conclusion depends on it. Say which conclusions are solid and which are speculative. Prefer a rule of thumb I can check in the plots over a precise formula.

## 5. Report and clean up

- Write a report (Markdown): question, setup, results table and plots, interpretation, limitations, recommended next steps. Write it to be read cold, hours later. However, be concise and to the point, I do not want to read a novel. Lead with the answer in plain words, and use the names from the code and configs instead of new terms or notation.
- Do not commit the report, plots or result files unless I ask.
- Delete downloaded models, datasets and intermediate artifacts you no longer need, and stop the processes and jobs you started.
