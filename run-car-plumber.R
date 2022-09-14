library(tidymodels)
library(vetiver)
library(plumber)


# create tidymodels workflow 
car_mod <-
    workflow(mpg ~ ., linear_reg()) %>%
    fit(mtcars)
# store as vetiver model
v <- vetiver_model(car_mod, "cars_mpg")
# initialize plumber API serving the model
pr() %>% vetiver_api(v) %>% pr_run(port = 8080)
