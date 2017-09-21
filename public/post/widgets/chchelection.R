
library(highcharter)
library(scales)
library(reshape2)
library(tidyverse)

# data -------------------------------

###-------------------------------Setup-----------------------------###

options(stringsasfactors = FALSE)

getwd()


###-------------------------------Data-------------------------------###

totalvotes <- readRDS("data\\totalvotes.RDS")
Enrollment <- readRDS("data\\Enrollment.RDS")
votes <- readRDS("data\\Votes.RDS")

#chart 1


melt <- votes %>%
  group_by(Year) %>%
  summarise(`NATIONAL PARTY` = sum(`NATIONAL PARTY`),
            `LABOUR PARTY` = sum(`LABOUR PARTY`),
            `GREEN PARTY`= sum(`GREEN PARTY`),
            `ACT NEW ZEALAND`=sum(`ACT NEW ZEALAND`),
            `NEW ZEALAND FIRST PARTY` = sum(`NEW ZEALAND FIRST PARTY`),
            `MAORI PARTY` = sum(`MAORI PARTY`))


VoteRef <- totalvotes %>% filter(Group == "Cant") %>%
  select(Year, TotalVotes)

melt <- merge(melt, VoteRef, by = "Year")



melt <- melt %>% group_by(Year) %>% summarise(`NATIONAL PARTY` = round((`NATIONAL PARTY`/TotalVotes)*100,2), `LABOUR PARTY` = round((`LABOUR PARTY`/TotalVotes)*100,2), `GREEN PARTY` = round((`GREEN PARTY`/TotalVotes)*100, 2), `ACT NEW ZEALAND` = round((`ACT NEW ZEALAND`/TotalVotes)*100,2), `NEW ZEALAND FIRST PARTY` = round((`NEW ZEALAND FIRST PARTY`/TotalVotes)*100,2), `MAORI PARTY` = round((`MAORI PARTY`/TotalVotes)*100,2))

melt <- melt(melt, Party = c(`NATIONAL PARTY`, `LABOUR PARTY`, `GREEN PARTY`, `ACT NEW ZEALAND`, `NEW ZEALAND FIRST PARTY`, `MAORI PARTY`)) 

cols <- c('#00529F', '#d82a20', '#098137', '#FDE401','#000000','#EF4A42')

chart1 <- hchart(melt, "column", hcaes(x = Year, y = value, group = variable)) %>% 
  hc_plotOptions(column = list(
    dataLabels = list(enabled = FALSE),
    #stacking = "normal",
    enableMouseTracking = TRUE,
    #stacking = "dodge",
    pointPadding = 0,
    groupPadding = 0,
    borderWidth = 0.2)) %>%
  hc_tooltip(
    useHTML = TRUE,
    crosshairs = TRUE,
    shared = TRUE,
    pointFormat = " <br><strong>{series.name}</strong><br> {point.y}%")%>%
  hc_colors(cols) %>%
  hc_title(text ="Party Vote Breakdown by Year")

htmlwidgets::saveWidget(chart1, file = "chchelection_chart1.html", selfcontained = TRUE)



#chart2
x <- as.data.frame(Enrollment)

x <- x %>% filter(Age != "Total")
x$AgeEligable <-  round(x$AgeEligable, 3)*100
x$AgeEnrolled <-  round(x$AgeEnrolled, 3)*100

x1 <- x %>% select(Age, AgeEligable, Area)
x1$Area[x1$Area=="Chch"] <- "Christchurch Enrolled"
x1$Area[x1$Area=="NZ"] <- "NZ Enrolled"

x2 <- x %>% select(Age, AgeEnrolled, Area)
x2$Area[x2$Area=="Chch"] <- "Christchurch Eligable"
x2$Area[x2$Area=="NZ"] <- "NZ Eligable"

cols <- c('#A9CCE3', '#212F3D', '#A9CCE3', '#212F3D')

chart2 <- hchart(x1, "column", hcaes(x = Age, y =AgeEligable, group = Area)) %>%
              hc_add_series(x2, "line" ,hcaes(x = Age, y =AgeEnrolled, group = Area)) %>%
              hc_tooltip(
                useHTML = TRUE,
                crosshairs = TRUE,
                shared = TRUE,
                pointFormat = " <br><strong>{series.name}</strong><br> {point.y}%"
                #pointFormat = "{this.series.name}<br/>{this.point.y}%"
              ) %>%
              hc_colors(cols) %>%
              hc_title(text = "Age Breakdown Eligable and Enrolled") %>%
              hc_yAxis(title = list(text = "% of Total Voters"))

htmlwidgets::saveWidget(chart2, file = "chchelection_chart2.html", selfcontained = TRUE)


#chart3

x <- votes %>% select(District, Year, `Electorate Candidate`, `Electoral Winner`, `Electoral Majority`)

x <- mutate(x, coloract = ifelse(`Electoral Winner` == "NATIONAL PARTY", "#00529F", ifelse(`Electoral Winner` == "LABOUR PARTY", '#d82a20', "#D3D3D3")))

cols <-  c('#A9CCE3', '#5499C7', '#000000')
      
chart3 <- hchart(x, "column", hcaes(x = District, y =`Electoral Majority`, fill = `Electorate Candidate`, group = Year, color = coloract)) %>% 
            # hc_add_series(x, "line" ,hcaes(x = District, y =`Electoral Majority`, group = )) %>%
            hc_plotOptions(column = list(
              dataLabels = list(enabled = FALSE),
              #stacking = "normal",
              enableMouseTracking = TRUE)
            )  %>%
            hc_tooltip(
              useHTML = TRUE,
              crosshairs = TRUE,
              #shared = TRUE,
              pointFormat = " <br><strong>{series.name}</strong><br> {point.y} Votes<br><strong>{point.fill}</strong>") %>%
            hc_colors(cols)%>%
            hc_title(text ="Winning Electoral Candidate Vote Margin")


htmlwidgets::saveWidget(chart1, file = "chchelection_chart3.html", selfcontained = TRUE)
