# Final Project

## Analysis of gravity model for London/Introduction

Following "Dr. D's Idiots Guide to Spatial Interaction Modelling for Dummies", in which we create a gravity model for London, helped me understand what was going on in this project before really getting into the weeds of it all. It provided a comprehensive overview of what our own approach should look like. The guide began with showing us how to calculate a distance matrix for all combinations of origin/destination pairs of boroughs. Next, the guide went over how to create estimates of commuter flows by transportation type for the whole country (this part also included extra data on income, job numbers, and total population for the areas, which shows the relative desirability of these areas. These variables would prove useful when the gravity model is made). These commuter flows can be visualized with lines connecting each borough, with varying thickness - higher thickness represents higher commuting flows, and thinner lines represent lower commuting flows. After this, Dr. D's guide explained how to create the gravity model itself, providing some mathematic and descriptive elements about how the model works. It was incredibly helpful to see the formulas and their descriptions written out before actually implementing models ourselves. Finally, the guide went over how to estimate gravity model parameters and how to test/improve the model accuracy.

In addition to this guide, we were provided with Garcia's paper entitled "Modeling Internal Migration Flows in Sub-Saharan Africa Using Census Microdata". In the paper, the gravity model is described to “use population sizes at each location and the distance between them as the push-pull factors. The model can be expanded by adding the previously identified characteristics of the locations that are related to migration, resulting in a series of gravity-type spatial interaction models.” Thus, these models seem to be able to help interpret migration patterns by giving us a degree of importance that location characteristics can have toward migration, as opposed to simply using population to do so. In a migration context, the gravity model especially helps because it looks at how to minimize the costs while simultaneously optimizing the benefits with geographic, sociodemographic, economic, climatic, and environmental factors playing a role. 

Given what was covered in Dr. D's Idiots Guide and Garcia's paper, I decided to go through the process of constructing my own gravity model and set of voronoi polygons for Senegal. 

However, my position was unique because I was one of the only people with multiple centerpoints of migration flow data inside of multiple ADM1's, as shown below:

![](sen_cpts_adm1.png)

Because I didn't have an accurate simple feature object that described the administrative subdivisions, I instead used the center points provided by worldpop and approximated those boundaries with voronoi polygons. I got the following 34 voronoi polygons to use rather than the Senegalese administrative subdivisions, which are plotted below:

![](sen_voronoi.png)

And below are spatial plots that describe in/out migration by the voronoi polygons in Senegal:

![](inmigration_sen.png)

![](outmigration_sen.png)

## Origin-destination (OD) Matrix

The dataset I ended up with includes the origin point/polygon, destination point/polygon, the distance between the origin and destination center points, migration flows from the origin to the destination, the nighttime lights of the origin polygon, and finally the nighttime lights of the destination polygon. The reason I included the nighttime light data is because it can help us approximate how developed an area is, similarly to how we used income or population in the London example. The dataset is as follows:

![](od_ntl.png)

Then I created an origin-destination (OD) matrix for migration flows, which is shown below:

![](ODMatrix.png)

As you can see, there are 34 rows and 34 columns in our OD matrix. Each individual cell within the OD matrix represents a particular combination of the flow center points. The row number represents the center point that is the origin of the migration, and the column number represents the center point that is the destination of the migration (both numbers correspond to a voronoi polygon and its respective center point). So with that in mind, the number in each cell represents the predicted migration flow FROM the center point on the row index TO the center point at the column index. There are N/A values for the center diagonal, which symbolizes the number of people who migrated from that center point to itself; we did not need to take these into account.

## How the OD matrix is used to model migration across the voronoi subdivisions of Senegal

As described above, my OD matrix is a 34x34 matrix. Each entry is representative of the migration flow from one center point (the row index) to another (the column index). We also have information about distances between each pair of centerpoints, as well as nighttime light data.

The below plot shows how we are able to visualize our OD matrix; each centerpoint of migration is connected to all the others with lines.

![](lines_btwn_cpts.png)

It was at this point that I used my data to produce gravity models. The first type of gravity model I went with was a double demeaning model, which is also known as a DDM. The DDM is described in its R documentation to "estimate gravity models via double demeaning the left hand side and right hand side of the gravity equation." The summary of the DDM results is as follows, which can be used to test the goodness-of-fit of our DDM:

![](grav_ddm.png)

As you can see, our model had an R-squared of .07531, meaning our model accounts for around 7.531% of the variation of flows in the system. This is much lower than we would like. However, we observed a residual standard error of .5496, which is not too bad (the closer this is to zero, the better). Next, I used a poisson pseudo maximum likelihood model, which is also known as a PPML model. The summary of the PPML is as follows:

![](grav_ppml.png)

As you can see, this model seems to indicate that distance and nighttime lights of the origin are both statistically significant. However, both the null and the residual deviances are extremely high, which is indicative of a poorly fit model.

Given that both of our models are pretty poorly fitted, it is good to consider how we could improve these models in the future. I think that given the above description of gravity models, it would be good to add more geographic, sociodemographic, economic, climatic, and environmental factors to our model. While nighttime lights probably helped our models to a degree, adding these other factors would further benefit our models and give us a better analysis. I think that if I had found more data to include, I could've had a much better R^2 in the DDM and better deviances in the PPML model. I also think that something that may have introdcued a bit of uncertainty into my models is the fact that I had to use the voronoi polygons rather than ADMs of Senegal. Defining my own polygons to use for this inherently introduces more error than using ADMs, but unfortunately this wasn't possible because there were multiple center points in many ADMs.

## Animated migration

I then made an animated plot of migration, which shows the small points travelling between the center points as the migration from one area to another. The animated plot is displayed below:

![Alt Text](https://media.giphy.com/media/bmd4XdGA74Ve4yjFgX/giphy.gif)

If I were going to modify the number of points departing from each origin, I would look at the origin flows sums from the OD matrix and weigh the number of points departing from each origin accordingly. So for example, If the outmigration flows from origin one are substantially higher than origin two, I would have more points departing from origin one in the animation to represent higher migration flows than origin two. Likewise, if there origin three and origin 4 have virtually the same amount of outmigration flows, I would have the same number of points departing from these origins. I would also look into the general population statistics of each area, and I would weigh the number of departing points based off of this too. I would modify the time variable by stretching it out more, and looking into migration seasonality further to detect trends via the changing of seasons. I believe the data was collected with a gap of five years, meaning that each point travelling from an origin to a destination symbolizes a migration period of 5 years. If possible, in future studies it would be good to look at data every 3 or so months to ge the best feel on how seasonality may affect migration, while also still getting the overarching/long term data to look at. The gravity model would be able to update these attributes and it would produce a closer-to-reality simulation because it takes into account factors besides just migration numbers; for us these included, as specified before: nighttime lights and distance between points. Including these factors in our simulation will inherently make our simulation closer to reality because the more factors you include, the closer to reality it will be. However to further take our similation results closer to reality, I think using factors like geography, sociodemography, economics, climate, and the environment in our gravity model would be an improvement.

## Tesselation of voronoi polygons

Below is my Voronoi tesselation of my higher resolution administrative subdivision, which is Diourbel. I used the center points of each de facto settlement (which we generated in project 1) to produce the tesselation.

![](diourbel_voronoi.png)

In order to produce an OD matrix of these higher resolution entities, I would follow almost the exact same methods I used for the above process. Since I did the part of the project dealing with all of Senegal using voronoi polygons already, this would come naturally to me. The variables I would include are largely the same; however, I would certainly look into including other variables (like those in the DHS data we used in project 2) to see if including any additional variables would aid our model. For example, I think population data/population density levels, average education levels, and average salary for each polygon would provide valuable insight into our analysis at that higher level. Like I said (many, many times above), geographic, sociodemographic, economic, climatic, and environmental factors would all be good variables to consider including for better results. I would modify the number of points departing from each origin by once again looking at population sums of rasters in each voronoi polygon and weigh the departing points appropriately. I would determine each points destinations based on historical data of population changes in each area, by looking at trends in various population rasters in this area. When it comes to the time variable, I would make its scale monthly because at a higher level ADM, looking at a more spread out time variable would be able to provide us with more valuable insight. The gravity model would update these attributes to produce a different simulation of migration by once again using other variables than just population and migration numbers to further account for the desireability of living in certain areas. For example, I would expect the large settlement in the southwest portion of Diourbel to have a higher average income/education level than its surrounding smaller settlements; a gravity model would take this into consideration and probably provide us with more accurate predictions. To integrate migration and transport activities at differing geospatial and temporal scales, I would account for features such as primary, secondary, and tertiary roads and look at how a center points geospatial proximity to these would impact our model. Roads can also be observed temporally, by checking road layers from different years and seeing if there are any trends that come from that.

Overall, both this class and project taught me a lot about Agent-Based Modeling, and I'm glad to have taken it. I am certainly a better data scientist with this knowledge under my belt.
