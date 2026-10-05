# policy-resilience-reanalysis

Sensitivity analysis replication code for a paper examining how feature-attribution methods construct an appearance of algorithmic objectivity in financial and policy narratives.

**Paper title:** Where the Break Comes From: Period Boundaries, Feature Attribution, and the Construction of "Policy Resilience" in Algorithmic Financial Narratives
**Target journal:** Internet Policy Review

## About

This repository reproduces the sensitivity analysis from the paper above, using the same six-year panel of financial data (BYD Co. Ltd., 2018–2023). It tests whether the reported "structural break" in F2 (interest burden ratio) still appears once the subsidy/post-subsidy period boundary is moved by a single year.

## Files

`sensitivity_analysis.R` — contains the analysis code only (no manuscript text). Computes the mean and sample standard deviation of F2 and F4 under both the published and the alternative period partition.
