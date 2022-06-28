library(readr)

bugs <- read_csv(
  "SLE-Bugs-SP1-4 - Holidays.csv",col_types = cols(
    Opened = col_datetime(format = "%d/%m/%Y %H:%M:%S"),
    Date = col_date(format = "%d/%m/%Y"),
    Christmas = col_factor(levels = c("YES","NO")),
    `Chinese NY` = col_factor(levels = c("YES","NO")),
    Weeknum = col_integer()
  )
)
View(bugs) 

library(ggplot2)

ggplot(bugs, aes(x = Weeknum, fill = Product)) +
  geom_histogram(position = 'identity', alpha = 0.3)


bugs$Product <- as.factor(bugs$Product)

bugs$cnt <- 1

# https://r-coder.com/aggregate-r/

wb <- aggregate( cnt ~ Weeknum  + Product, data = bugs, FUN = length)
wb

