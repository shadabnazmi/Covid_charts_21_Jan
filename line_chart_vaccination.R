pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png', 
               'grid', 'ggpubr', 'scales',
               'bbplot','bbplot2')
multiple_line_cases_df <- read.csv("vacc_daily.csv")%>%
  mutate(date= as.Date(date, format = "%d/%m/%y"))

  




cases_time_series <-  ggplot(multiple_line_cases_df, aes(x=date, y =total, group =1 ))+ 
  geom_line(colour = "#D1700E", size = 1) +
  theme(panel.grid.major.x = element_line(color="#cbcbcb"), 
        panel.grid.major.y=element_blank())+
  scale_y_continuous(expand = c(0, 0), labels = scales::comma)+
  scale_x_date(breaks = date_breaks("3 months"),
               labels = date_format("%b"))+
  geom_hline(yintercept = 0, colour = "black")+
  theme(panel.grid.major.y = element_line())+
  reith_style()+
  labs(title= "India's vaccine drive has seen several\nups and downs ",
       subtitle = "Daily vaccine doses administered since March 2021 ")

cases_time_series



finalise_plot(plot_name = cases_time_series,
              source = "Source: Cowin dashboard, data to 21 Jan",
              save_filepath = "vacc_daily_21_Jan-nc.png",
              width_pixels = 640,
              height_pixels = 460)


