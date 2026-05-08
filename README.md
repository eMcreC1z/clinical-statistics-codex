# clinical-statistics-codex

A starter repository for clinical statistics work with Codex: method notes, SAP templates, reusable R analysis helpers, reporting templates, validation tests, and domain-specific Codex skills.

## What This Contains

- Knowledge base pages for study design, descriptive statistics, group comparisons, regression, survival analysis, propensity scores, missing data, multiplicity, diagnostic prediction, longitudinal models, and reporting guidance.
- SAP and manuscript methods templates for clinical trials, observational studies, and real-world studies.
- R functions for data checks, Table 1 summaries, model selection, regression, survival analysis, propensity scores, missing data, plotting, and report rendering.
- Skill definitions that guide Codex through clinical SAP drafting, clinical R analysis, and journal statistical review.

## Suggested Workflow

1. Add protocol, data dictionary, and analysis requirements to the relevant example folder.
2. Start with `R/data_check.R` and `R/table1.R` to inspect the dataset.
3. Choose a template from `templates/` and adapt it to the study design.
4. Use the relevant pipeline script in `R/`.
5. Add validation cases and tests before reusing analyses across projects.

## Repository Structure

```text
clinical-statistics-codex/
├── AGENTS.md
├── README.md
├── knowledge_base/
├── templates/
├── R/
├── examples/
├── tests/
└── skills/
```

## Notes

This repository is a scaffold, not a substitute for clinical or statistical judgment. Confirm all analyses against the protocol, SAP, applicable regulations, journal requirements, and domain expert review.
