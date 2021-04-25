# fun_auto_arima
I created a file to conduct your own auto.arima, finding the model that gives the lowest AIC value.
The inputs are your data series, and the maximum p and q values for the loop.
The loop stores the AIC values and their corresponding p and q values, and at the end of the loop chooses the values that correspond to the lowest AIC.
The arima model is then run with these parameters and the stats calculated.
