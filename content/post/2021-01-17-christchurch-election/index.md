---
title: Christchurch Election
author: Ezekiel Haggart
date: '2017-09-21'
slug: christchurch-election
categories:
  - R
tags:
  - Analysis
  - highcharter
  - NZ Election 2017
---

###<i>THIS WILL BE UPDATED WITH 2017 RESULTS ONCE SPECIAL VOTES HAVE BEEN COUNTED EXPECTED 8TH OCT</i>

Christchurch is New Zealand's second largest city and in the 2017 election cycle it was a key prize for any of the political parties. I produced a series of interactive graphics to examine the outcome of Christchurch's current and past three election cycles. The analysis was built using data sourced from [data.govt.nz](https://data.govt.nz/)  and [elections.org.nz](http://www.elections.org.nz/research-statistics). The boundries of some of the Christchurch electorates reach beyond the city limits but for the sake of this assessment the electorates were kept as a whole. 


A bit of quick background - New Zealand has 120(most of the time) sitting members of parliment with 64 general electorate seats (63 in 2008 and 2011) and 7 Maori electorate seats. This leaves a total of 49 seats to be allocated proportionally by the party vote once the allocation of electorate seats is accounted for. A good breakdown of the New Zealand electoral seats can be found in [Spinoffs Article](https://thespinoff.co.nz/politics/14-09-2017/mmp-maths-how-party-vote-percentages-become-seats-in-parliament/) here. 


Within Christchurch there are 7 electorates so the residents elect 7 MP's. Christchurch's enrolled population within these electoral districts represents roughly 10.5% of the NZ enrolled population. Bluntly speaking this means Christchurch in affect elects another 5 MP's from the party list. In reality it's not that simple but the real affect is so minor it will not be elaborated on here (yet).


All the graphs are interactive and you can take off any of the parties/year by using clicking the relevant parties/year. 


***


##Election Graphs





<iframe class="chart" src="https://ezekiel.nz/Widgets/ChchElection/chchelection_chart1/" width="750"   height="550" style="border: none;"></iframe>




Looking at the party vote in Christchurch grouping the dataset by year and party. This graph shows Christchurch is a land of the major parties with National, Labour, Greens and NZ First taking up the lions share of the vote. Between 2008 and 2011 we see the most dramatic shift from Labour to National while Greens and NZF continue to make ground into 2014. The minor parties show Act has become all but irrelavant since 2008's high.


  <iframe class="chart" src="https://ezekiel.nz/Widgets/ChchElection/chchelection_chart3/" width="750" height="550" style="border: none;"></iframe>


Grouped by year and electorate this graph shows the winning candidate of each electorate along with the margin of victory by votes. Notice Selywn and Christchurch East are pretty safe seats while the Waimakariri, Christchuch Central and Port Hills are all up for grabs. In 2011 Christchurch Central was decided by only 47 votes.

<hr>


##Christchurch Region Shiny App
Two shapefiles [stats.nz's](stats.govt.nz) NZ electorate maps and [LINZ's](LINZ.govt.nz) urban area maps were combined using ARC before being read into R. The Shiny app displays an interactive visualisation for Electorate and Party votes over the previous three elections. 




<iframe class="chart" src="https://ezekiel-h.shinyapps.io/christchurchelection2/" width="750" height="550" style="border: none;"></iframe>


<hr>


##Christchurch Demographics


All these assessments seem pretty straight forward but what about the 5% party vote threshold affecting the relevent party vote? And does New Zealand's younger demographic and better enrollment impact the outcome?


Maybe. I ran out of time to get this put together before the election so below you can see Christchurch vs NZ age distribution for both enrolled and represented voters. It shows Christchurch has a higher electorate turnout and a younger distribution than the general NZ population. This graph also demonstrates how impactful the unenrolled 18-24 group has on distorting the age demographic in New Zealand.



<iframe class="chart" src="https://ezekiel.nz/Widgets/ChchElection/chchelection_chart2/" width="750" height="550" style="border: none;"></iframe>


