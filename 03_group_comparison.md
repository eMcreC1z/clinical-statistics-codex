# 03 Group Comparison

## Choose the Comparison by Endpoint

- Continuous endpoint: mean difference, median difference, t test, Wilcoxon test, ANCOVA, or robust regression.
- Binary endpoint: risk difference, risk ratio, odds ratio, chi-square test, Fisher exact test, or logistic regression.
- Count endpoint: rate ratio, Poisson regression, negative binomial regression, or exact methods.
- Ordinal endpoint: proportional odds model, nonparametric trend test, or category-specific estimates.
- Time-to-event endpoint: Kaplan-Meier estimates, log-rank test, Cox regression, or restricted mean survival time.

## Prefer Effect Estimates

Always report effect estimates with confidence intervals. P values can support inference but should not replace clinical interpretation.

## Adjustment

- Randomized trials: adjust for pre-specified baseline covariates or stratification factors when planned.
- Observational studies: use pre-specified confounders based on design knowledge, not purely stepwise selection.
- Matched designs: account for matching in standard errors or model structure.

## Assumption Checks

- Normality and variance assumptions for parametric tests.
- Sparse-cell warnings for categorical tests.
- Overdispersion for count outcomes.
- Proportional hazards for Cox models.
