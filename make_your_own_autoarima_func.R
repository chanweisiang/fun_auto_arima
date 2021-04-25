
fun_auto_arima <- function(data_series, max_p, max_q){
  ## loop for calculating AIC for various combinations of p and q
  aic_store <- data.frame(p = numeric(), q = numeric(), AIC = numeric())
  for(p in 0:max_p) {
    for(q in 0:max_q){
      x <- Arima(data_series, order = c(p, 1, q), method = "ML")
      row_add <- c(p, q, AIC(x))
      aic_store[nrow(aic_store) + 1, ] <- row_add
    }
  }
  
  ### Extracting the p and q that correspond to the lowest AIC
  aic_min <- aic_store %>% filter(aic_store$AIC %in% min(aic_store$AIC))
  
  ### Running the arima model using the p and q identified
  arima_model <- Arima(data_series, order = c(aic_min$p[1], 1, aic_min$q[1]),
                       method = "ML")
  
  ## Creating the list of outputs
  coef <- coeftest(arima_model)
  output_list <- c(coefficients = coef,
                   model = arima_model)
}
