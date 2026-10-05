# ============================================================
# Sensitivity analysis: F2 (interest burden) and F4 (asset turnover)
# under two alternative period partitions
#
# Data source: BYD Co. Ltd. audited annual reports (HKEx), 2018-2023
# ============================================================

# ---- 1. Raw data ----
years <- 2018:2023

f2 <- c(0.584, 0.411, 0.688, 0.703, 0.941, 0.953)  # Interest burden ratio
f4 <- c(0.626, 0.624, 0.774, 0.851, 1.074, 1.027)  # Asset turnover

names(f2) <- years
names(f4) <- years

# ---- 2. Define the two period partitions ----

# Published partition: subsidy 2018-2021, post-subsidy 2022-2023
published_subsidy      <- as.character(2018:2021)
published_post_subsidy <- as.character(2022:2023)

# Alternative partition: subsidy 2018-2020, post-subsidy 2021-2023
# (boundary moved one year earlier; produces equal n = 3 / n = 3 split)
alternative_subsidy      <- as.character(2018:2020)
alternative_post_subsidy <- as.character(2021:2023)

# ---- 3. Helper function: mean and sample SD (n - 1 denominator) ----

summarise_period <- function(x, period_years) {
  vals <- x[period_years]
  data.frame(
    n    = length(vals),
    mean = round(mean(vals), 3),
    sd   = round(sd(vals), 3)   # R's sd() uses the n - 1 (sample) denominator
  )
}

# ---- 4. Build the full results table ----

results <- rbind(
  cbind(factor = "F2", partition = "Published",   period = "Subsidy",      summarise_period(f2, published_subsidy)),
  cbind(factor = "F2", partition = "Published",   period = "Post-subsidy", summarise_period(f2, published_post_subsidy)),
  cbind(factor = "F2", partition = "Alternative",  period = "Subsidy",      summarise_period(f2, alternative_subsidy)),
  cbind(factor = "F2", partition = "Alternative",  period = "Post-subsidy", summarise_period(f2, alternative_post_subsidy)),

  cbind(factor = "F4", partition = "Published",   period = "Subsidy",      summarise_period(f4, published_subsidy)),
  cbind(factor = "F4", partition = "Published",   period = "Post-subsidy", summarise_period(f4, published_post_subsidy)),
  cbind(factor = "F4", partition = "Alternative",  period = "Subsidy",      summarise_period(f4, alternative_subsidy)),
  cbind(factor = "F4", partition = "Alternative",  period = "Post-subsidy", summarise_period(f4, alternative_post_subsidy))
)

print(results, row.names = FALSE)

# ---- 5. Quick check: variance collapse under each partition ----

cat("\nF2 SD change, published partition: ", results$sd[1], "->", results$sd[2], "\n")
cat("F2 SD change, alternative partition:", results$sd[3], "->", results$sd[4], "\n")
cat("F4 SD change, published partition: ", results$sd[5], "->", results$sd[6], "\n")
cat("F4 SD change, alternative partition:", results$sd[7], "->", results$sd[8], "\n")
