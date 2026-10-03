---
name: paper-writing
description: Write, rewrite or edit sections of a LaTeX paper or technical report - concise, natural academic prose, minimal edits to the user's text, and verified BibTeX. Use when the user asks to draft, polish, restructure or shorten paper or report text, or to add references.
---

# Paper writing

Use this for any drafting or editing of a paper, technical report or thesis.

## Before writing

- Read the surrounding sections and sibling sections of the same kind, so length, depth, terminology and notation match.
- Keep the keywords and claims I give you. Do not add claims, results or numbers that are not in my notes, the code or the cited sources.
- Note which files and paragraphs I asked you to change. Everything else is off limits, including `main.tex`, preambles and other authors' sections.

## Style

- Concise: assume space is tight. Cut background the reader of this venue already knows.
- Natural academic prose. It should read like a careful human author, not AI-generated text: no filler openers, no stacked adjectives, no "delve", "crucial", "seamlessly", "it is worth noting", no em-dash chains, no lists where prose belongs.
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
