# 04 Regression

## Model Selection by Outcome

- Continuous: linear regression or robust alternatives.
- Binary: logistic regression, log-binomial model, or modified Poisson model for risk ratios.
- Count: Poisson or negative binomial regression.
- Ordinal: proportional odds model.
- Repeated measures: mixed model, GEE, or MMRM.
- Time-to-event: Cox proportional hazards model or parametric survival model.

## Covariate Strategy

- Define covariates before modeling when possible.
- Include clinically important confounders even if univariate p values are not significant.
- Avoid adjusting for mediators unless mediation is the target.
- Check events-per-parameter and sparse categories.

## Reporting

- State model family, link function, covariates, interaction terms, and handling of missing data.
- Report estimates on interpretable scales: mean difference, odds ratio, risk ratio, hazard ratio, or predicted probability.
- Include uncertainty intervals and diagnostics.

## Diagnostics

- Continuous models: residuals, influence, nonlinearity, heteroscedasticity.
- Logistic models: separation, calibration, discrimination when prediction is intended.
- Count models: overdispersion and zero inflation.
- Cox models: proportional hazards and influential observations.
