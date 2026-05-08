# 06 Propensity Score

## Purpose

Propensity score methods help control measured confounding in observational comparisons. They do not address unmeasured confounding without additional assumptions or sensitivity analysis.

## Workflow

1. Define exposure, index date, outcome, follow-up, and eligible population.
2. Choose baseline covariates measured before exposure.
3. Estimate propensity scores.
4. Apply matching, weighting, stratification, or covariate adjustment.
5. Assess balance using standardized mean differences.
6. Estimate treatment or exposure effect using a model compatible with the design.
7. Run sensitivity analyses.

## Balance Target

A common practical threshold is absolute standardized mean difference below 0.1, but clinical context and distributional overlap matter.

## Common Risks

- Including post-exposure variables.
- Poor overlap and extreme weights.
- Evaluating balance only with p values.
- Using the same data-driven selection process for both design and outcome modeling without documentation.
