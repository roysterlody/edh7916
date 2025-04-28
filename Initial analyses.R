## -----------------------------------------------------------------------------
library (tidyverse)
library(haven)

data_nolabels <- read_csv("data/hd2022.csv")
data_al <- read_csv("data/al2023.csv")

data_nolabels_al <- left_join(data_nolabels, data_al, by = "UNITID")

data_nolabels_al <- data_nolabels_al %>%
  # mutate(LTCRCLT = log10(LTCRCLT),
  #        LSLIBRN = log10(LSLIBRN)) %>%
  filter(!is.na(LTCRCLT) & !is.na(LSLIBRN))

data_nolabels_al  <- data_nolabels_al %>%
  drop_na(INSTSIZE)



## -----------------------------------------------------------------------------
data_nolabels_al %>%
  ggplot(aes(x =XLTCRCLT)) +
  geom_bar()






## -----------------------------------------------------------------------------
data_nolabels_al %>%
  ggplot(aes(x = LTCRCLT,
             y = LSLIBRN)) +
  geom_point(mapping = aes(color = factor ("INSTSIZE")), alpha = 0.5) +
  geom_smooth(method = "loess", se = FALSE) +
labs(title = "Academic Library Circulation",
     caption = "Source: IPEDS",
     x = "Library Circulation",
     y = "Librarians") +
  scale_x_continuous(trans='log10') +
  theme_minimal() 



## -----------------------------------------------------------------------------
data_nolabels_al %>%
  ggplot(aes(x = XLTCRCLT, y = XLEXMSTL)) +
  geom_point()



