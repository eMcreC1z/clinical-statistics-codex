# 10 Longitudinal and Repeated Measures

## Data Structure

Confirm subject identifier, visit or time variable, treatment or exposure group, baseline value, outcome, and visit windows.

## Common Models

- MMRM for continuous repeated outcomes in randomized trials.
- Linear mixed models for subject-specific trajectories.
- GEE for population-averaged effects.
- Mixed logistic or Poisson models for repeated binary or count outcomes.

## Design Choices

- Fixed effects: group, visit, group-by-visit interaction, baseline value, stratification factors.
- Random effects: subject intercept or slope when appropriate.
- Covariance structure: unstructured, compound symmetry, AR(1), or simpler alternatives based on data support.

## Missing Data

Longitudinal models often rely on missing-at-random assumptions. Report the assumption, missingness by visit, and sensitivity analyses when dropout is outcome-related.

## Reporting

Report estimated marginal means, contrasts at key visits, confidence intervals, covariance structure, estimation method, and convergence warnings.
