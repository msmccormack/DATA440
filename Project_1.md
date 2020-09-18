# Project 1

The lower-middle income country I chose for project 1 is Senegal. Senegal had ample data available for me to analyze, ranging from adminstrative subdivisions 1-4 (Which I will denote throught the project as ADM1-4). The geospatial representation of Senegal and the barplot for the population distribution of Senegal is shown side by side, below.

![](senegal.png)

From both plots, it is apparent that the ADM1 Dakar is the most highly/densely populated area. This makes sense, because Dakar is the country's capital - usually the capital of a country is highly populated. Additionally, it is the most western point of the African mainland and it "has historically served as the gateway to West Africa", which makes it a vital location and a cultural epicenter for all of Africa.[^fn1] ADM1s close to Dakar also have a relatively higher population than some of the other administrative areas, which is logical because it is more desireable to be close to the capital. The least populous/dense area of Senegal is the ADM1 of Kedougou, which is the furthest area away from Dakar. Its population is a mere 178,464 people. 

The population density of Dakar and ADM1s close to it, particularly Thies and Diourbel, are substantially higher than most of the other areas. Dakar in particular has a very high density of about 6,479 people per kilometer squared. Meanwhile, Kedougou has a population density of about only 10 people per kilometer squared. Overall, it was very helpful to see the distribution of population across Senegal's ADM1s with the map and bar plot next to each other - it gave me a better idea of how Senegal is broken up and where people tend to live.

I then looked at the population levels of the ADM2s within each ADM1 with a second barplot. The ADM1 bars were sized accordingly to the ADM1 population levels. These bars were then internally broken up in the inside by the ADM2 population levels. This made it extremely easy to see both the ADM1 and ADM2 populations within the context of all of Senegal.

![](sen_adm2_bp.png)

Most of the ADM1s contain 3 or less ADM2s. Some ADM2s (particularly in Dakar and Thies) have substanstially higher populations than even some ADM1s, which makes sense.

The subdivisions of Senegal that I chose to be the base for my agent-based model of de facto settlements are Ndidy and Ndoulo, which are ADM3's that make up the entirety of the ADM2 Diourbel, which is inside of the ADM1 Diourbel. Ndoulo had a population of 219,298 people in 2019, while Ndidy had a population of 104,096 people. I chose to model these two areas because Diourbel's proximity to Dakar meant that there would be a decent amount of people to model, but at the same time it wouldn't be too urban of an area to model. The initial plot of Ndoulo and Ndidy showed me that Ndoulo has a large population in its south central area, but there are smaller towns and settlements. Ndidy was much less populated, and the settlements seemed like they would be sporadically scattered around. Thus, I figured this would be a good area to model and try to capture the smaller settlements in the north, as well as the larger city. I also figured that roads, health care facilities, and other features would help explain my models. The plot below shows the spread of population in Ndoulo and Ndidy (the southern half of the division is Ndoulo).

![](Diourbel_ADM23.png)

The population distribution for Ndoulo and Ndidy, shown via map/geometric bar plot, is as follows:

![](Ndoulo_Ndidy.png)

![](Ndoulo_Ndidy_ADM4.png) 

As you can see, the population is greatest in the ADM4 Patar. However, like the other plot showed, Patar's population was mostly concentrated in the southwestern portion of the area, which could be a little misleading. Most of the other ADM4's of Ndoulo have a relatively smaller population than Patar but still generally more than those ADM4's in Ndidy. However, Ndidy has enough population to the point that we should be able to identify some smaller settlements.

[^fn1] Source: https://eros.usgs.gov/westafrica/country/republic-senegal
