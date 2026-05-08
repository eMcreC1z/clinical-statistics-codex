---
name: clinical-r-analysis
description: Build, review, or extend R analyses for clinical statistics including data checks, Table 1, regression, survival analysis, propensity scores, missing data, plots, Quarto reports, and testthat validation.
---

# Clinical R Analysis

## Workflow

1. Inspect the data dictionary, endpoint definitions, and current R scripts.
2. Source reusable helpers from `R/` before writing project-specific analysis code.
3. Validate required columns, ranges, missingness, duplicates, and endpoint derivations.
4. Produce structured outputs: data frames for tables, model objects for diagnostics, and Quarto reports for review.
5. Add or update `tests/testthat/` coverage for reusable behavior.

## Method Selection

- Use `R/table1.R` for baseline summaries.
- Use `R/regression_pipeline.R` for generalized linear models.
- Use `R/survival_pipeline.R` for Kaplan-Meier and Cox analyses.
- Use `R/propensity_score_pipeline.R` for weighting and balance checks.
- Use `R/missing_data_pipeline.R` for missingness profiles and simple sensitivity scaffolds.

## Safety

Do not print identifiers or row-level sensitive health data. Report aggregate checks and validation failures.
