# AGENTS.md

## Mission

This repository is a reusable clinical statistics knowledge base and analysis scaffold for Codex agents working on clinical trials, observational studies, real-world evidence, diagnostic prediction, and manuscript statistical review.

## Working Rules

- Prefer reproducible scripts over ad hoc calculations.
- Keep study design, estimands, endpoints, populations, covariates, missing-data handling, and multiplicity choices explicit.
- Do not invent clinical context. Ask for protocol, SAP, CRF, data dictionary, or manuscript text when needed.
- Treat all health data as sensitive. Do not print identifiers or export row-level data unless the user explicitly requests it.
- Use validated statistical methods for the design and outcome type.
- Report assumptions, exclusions, model convergence problems, and sensitivity analyses.
- Keep code readable for statisticians and clinical reviewers.

## Repository Map

- `knowledge_base/`: concise method notes and decision checklists.
- `templates/`: SAP, methods text, Quarto reports, and reviewer-response templates.
- `R/`: reusable R helpers and analysis pipelines.
- `examples/`: study-type folders for runnable examples and mock data.
- `tests/`: testthat tests and validation cases.
- `skills/`: Codex skills for SAP drafting, clinical R analysis, and statistical review.

## Coding Style

- Use base R where practical; add dependencies only when they materially improve reliability.
- Validate inputs at function boundaries.
- Return structured data frames from pipeline functions.
- Keep plotting functions separate from modeling functions.
- Add tests for new reusable behavior.

## Review Checklist

- Is the analysis population defined?
- Are endpoints and time windows unambiguous?
- Are covariates pre-specified or justified?
- Are missing data assumptions stated?
- Are multiple comparisons controlled or clearly exploratory?
- Are effect estimates reported with uncertainty intervals?
- Are model diagnostics and sensitivity analyses documented?
