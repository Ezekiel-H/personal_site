---
title: Bars per capita in NZ
author: Ezekiel Haggart
date: '2017-09-23'
slug: looking-at-the-density-of-bars-accross-nz-lla-s
categories:
  - Leaflet
  - R
tags:
  - NZ
  - Bars
  - Analysis
  - Shiny
---

In New Zealand to distribute alcohol you need to apply to your regional  Liqour Licence Authority (LLA) for a permit. The NZ Justice Department produces a list of all liqour licences distributed in a single year. 


I made this shiny app using a data set from NZ Justice Department and a shapefile/population statistics from Statistics to show for each LLA how many persons per bar, club or liqour retailer. This can be understood as bars per capita for NZ grouped by LLA's. 

<iframe class="chart" src="https://ezekiel-h.shinyapps.io/Bars/" width="900" height="550" style="border: none;"></iframe>


Further work planned on this app is to add a drill down function, regional statistics and to account for age with the R18 drinking age. 
