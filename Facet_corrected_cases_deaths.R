library(ggplot2)
library(dplyr)
library(bbplot2)
library(lubridate)
library(rio)
library(scales)


facet <- read.csv("cases_deaths_20.csv")%>%
  mutate(Date= as.Date(Date, format = "%d/%m/%y"))



#Make plot
facet_plot <- ggplot() +
  geom_area(data = facet, aes(x = Date, y = av, fill = Status)) +
  scale_fill_manual(values = c( "#1380A1","#BB1919")) + 
  facet_wrap( ~ Status, ncol = 1, scales = "free") + 
  scale_y_continuous(expand = c(0, 0), labels = scales::comma)+
  scale_x_date(breaks = date_breaks("years"),
               labels = date_format("20%y"))+
  theme(legend.title = element_blank())+
  labs(title = "India's ongoing third wave is fuelled by\nOmicron",
       subtitle = "Daily new cases since 2020, seven-day averages")+
  reith_style()
 

facet_plot_without_label <- facet_plot+theme(legend.position="none")


finalise_plot(plot_name = facet_plot_without_label,
              source = "Source: covid19bharat.org, data to 21 Jan",
              save_filepath = "cases_daily_daily_01-nc.png",
              width_pixels = 690,
              height_pixels = 500)