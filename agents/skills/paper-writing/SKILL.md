---
name: paper-writing
description: Write, rewrite or edit sections of a LaTeX paper, technical report or thesis meant for submission or publication - concise, natural academic prose, minimal edits to the user's text, and verified BibTeX. Use when the user asks to draft, polish, restructure or shorten such text, or to add references. Not for working notes shared with supervisors or collaborators.
---

# Paper writing

Use this for drafting or editing a paper, technical report or thesis that will be submitted or published. For working notes (structured notes shared with supervisors, e.g. in Overleaf), don't polish into paper prose: stay terse, use bullets and equations where they help, and keep the existing tone.

## Before writing

- Read the surrounding sections and sibling sections of the same kind, so length, depth, terminology and notation match.
- Keep the keywords and claims I give you. Do not add claims, results or numbers that are not in my notes, the code or the cited sources.
- Note which files and paragraphs I asked you to change. Everything else is off limits, including `main.tex`, preambles and other authors' sections.

## Style

- Concise: assume space is tight. Cut background the reader of this venue already knows.
- Natural academic prose. It should read like a careful human author, not AI-generated text: no filler openers, no stacked adjectives, no "delve", "crucial", "seamlessly", "it is worth noting", no em-dashes (`---` or `—`), no lists where prose belongs.
- Flow: each paragraph links to the previous one and fits the surrounding sections.

## Editing my text

- Change only what I pointed at. Keep my wording where it works; fix structure and flow rather than rewriting from scratch.
- If I ask for a comparison with my version, comment mine out and put yours next to it.
- Before finishing, check the diff against the last commit: it should only touch the parts I asked about.

## References

- Take BibTeX from DBLP, the publisher, or arXiv (in that order of preference). Never write an entry from memory.
- Check that each cited paper actually supports the sentence it is attached to.
- When I ask, say where each entry came from.
- Do not reformat the existing `.bib` file; add entries without touching the rest.
