# 05 Survival Analysis

## Required Definitions

- Time origin.
- Event definition.
- Censoring date and censoring reasons.
- Competing events.
- Follow-up truncation rules.
- Analysis population.

## Descriptive Outputs

- Number at risk.
- Events and censored counts.
- Median follow-up.
- Kaplan-Meier estimates at clinically relevant time points.
- Median survival if estimable.

## Modeling Choices

- Log-rank test for unadjusted group comparison.
- Cox proportional hazards model for adjusted hazard ratios.
- Restricted mean survival time when proportional hazards is doubtful or an absolute time difference is preferred.
- Competing risks methods when competing events preclude the event of interest.

## Checks

- Verify that event time is nonnegative and censoring follows the protocol.
- Check proportional hazards using Schoenfeld residuals when available.
- Inspect early curve separation and sparse tail risk sets.
