# 07 Missing Data

## First Steps

- Quantify missingness by variable, group, visit, site, and outcome status.
- Distinguish structural missingness, not collected, lost to follow-up, and invalid values.
- Identify whether missingness occurs in exposure, covariates, endpoint, or follow-up time.

## Common Strategies

- Complete-case analysis: simple but can be biased if missingness is related to exposure or outcome.
- Single imputation: useful for descriptive work, usually not sufficient for primary inference.
- Multiple imputation: appropriate when missing at random is plausible and variables support the imputation model.
- Sensitivity analysis: required when missing not at random is plausible.

## Reporting

State the amount of missing data, assumptions, imputation model variables, number of imputations, pooling method, and sensitivity analyses.

## Practical Checks

- Do not impute identifiers or post-outcome variables as ordinary predictors.
- Ensure categorical levels and bounds are preserved.
- Align imputation and analysis populations.
