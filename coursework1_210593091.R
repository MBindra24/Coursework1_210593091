#  For time series forecasting we need to install the prophet package and remotes package to be able to install packages from GitHub.

install.packages("prophet")  
install.packages("remotes")  

# Now we load the prophet library to perform time series forecasting using Meta's Prophet forecasting system.

library(prophet)  

# Access the times in the ts object 'co2'
ts_times <- time(co2)

# Convert times to a vector of dates using yearmon() from the zoo library
times_as_dates <- zoo::as.yearmon(ts_times)

# Create a dataframe with timestamps and values
co2_data <- data.frame(ds = times_as_dates, y = co2)

# We can now fit prophet model to our own data
prophet_model <- prophet(co2_data)

# Create future dates to help us forecast.
future_dates <- make_future_dataframe(prophet_model, periods = 8)

# Display the forecast
plot(prophet_model, predict(prophet_model, future_dates))





