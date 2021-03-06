---
title: Using BTC exchange to find currency arbitrage
author: ''
date: '2017-11-16'
slug: using-btc-exchange-to-find-currency-arbitrage
categories:
  - R
tags:
  - Analysis
  - BTC
  - Exchange
  - Bitcoin
  - Arbitrage
header-includes:
   - \usepackage{amsmath}
---

Bitcoin cryptocurrency is treated as both a currency and more and more an asset that is exchanged across multiple FX across the globe. This presents an interesting question does the market balance the FX across currencies in real time? If not there would be room for arbitrage and a real ability to make money transferring between currencies using BTC markets. 

This quick analysis will look to see if it is theoretically possible to make money changing NZD for BTC then to GBP and back to NZD via a BTC exchange. Firstly lets look at the price of bitcoin relative to GBP and NZD over its recent history.

<iframe class="chart" src="https://ezekiel.nz/Widgets/BTC/BTCPrices/" width="750"   height="550" style="border: none;"></iframe>


Well two things are very quickly apparent


+  There is a significant number of gaps in the data provided to [quandl](https://www.quandl.com) by BitcoinLocal that may influence the significance of the result.


+  The price movements are not one for one for the two currencies creating in theory arbitrage opportunities.



This means in theory we could buy use NZD to buy BTC transfer into GBP wallet then use a service like [coinbase](https://support.coinbase.com/customer/en/portal/articles/1963534-payment-methods-for-uk-customers) to "cash out" and use a regular currency transfer service like Azamo to then transfer back into NZD.


***


<iframe class="chart" src="https://ezekiel.nz/Widgets/BTC/BTCExchange/" width="750"   height="550" style="border: none;"></iframe>


Here we can see the historic NZD/GBP exchange sourced from the BOE dataset on quandl against the daily BTCExchange understood as the price in BTC GBP vs BTC NZD. 


***



<iframe class="chart" src="https://ezekiel.nz/Widgets/BTC/BTCArbitrage/index.html" width="750"   height="550" style="border: none;"></iframe>


## The Details

So about now you realize that if it was this easy to do it the arbitrage opportunities would shut the door and fees decimate your returns. Well that is true but not entirely assuming the formula below. 




$$
\Pi = \frac{X}{(XE - F_t)} (XE_{BTC}-F_{BTC}) (XE_{MT}) - X
$$

Where profit is the amount invested X divided by the exchange less fees where the fees $F_t$ and $F_{ETC}$ are the unknown. The above chart is a visual representation of when you have the opportunity for arbitrage by trading NZD. 

Taking a practical approach assuming fees are no more than 1% per transaction how much could have been made on the 8th of November per transaction completed transaction. Using the current Azimo transfer as $XE_{MT}$  


$$
$39.88 = \frac{$100}{((1.8925)  (.99))} ((1.3083)(.99))(1.982) - $100
$$


This shows with a $100 investment each completed move from NZD to NZD via currency exchange in BTC would have returned a 39.88% return.

## So what now?

How much are fees? How many trades can I make? How much can I make? All goood questions I don't know the answer to. This requires a better dataset than I currently have access to. The point remains that in theory day trading currencies using BTC could be very lucrative. 



