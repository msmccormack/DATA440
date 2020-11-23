# Final Project

## Analysis of gravity model for London/Introduction

Following "Dr. D's Idiots Guide to Spatial Interaction Modelling for Dummies", in which we create a gravity model for London, helped me understand what was going on in this project before really getting into the weeds of it all. It provided a comprehensive overview of what our own approach should look like. The guide began with showing us how to calculate a distance matrix for all combinations of origin/destination pairs of boroughs. Next, the guide went over how to create estimates of commuter flows by transportation type for the whole country (this part also included extra data on income, job numbers, and total population for the areas, which shows the relative desirability of these areas). These commuter flows can be visualized with lines connecting each borough, with varying thickness - higher thickness represents higher commuting flows, and thinner lines represent lower commuting flows. After this, Dr. D's guide explained how to create the gravity model itself, providing some mathematic and descriptive elements about how the model works. It was incredibly helpful to see the formulas and their descriptions written out before actually implementing the model. Finally, the guide went over how to estimate model parameters, and test/improve the model accuracy.

In addition to this guide, we were provided with Garcia's paper entitled "Modeling Internal Migration Flows in Sub-Saharan Africa Using Census Microdata". In the paper, the gravity model is described to “use population sizes at each location and the distance between them as the push-pull factors. The model can be expanded by adding the previously identified characteristics of the locations that are related to migration, resulting in a series of gravity-type spatial interaction models.” These models seem to be able to help interpret migration patterns by giving us a degree of importance that location characteristics can have toward migration, as opposed to simply using population to do so. In a migration context, the gravity model especially helps because it looks at how to minimize the costs while simultaneously optimizing the benefits with geographic, sociodemographic, economic, climatic, and environmental factors playing a role. 

Given what was covered in Dr. D's Idiots Guide and Garcia's paper, I decided to go through the process of constructing my own gravity model and set of voronoi polygons for Senegal. Below are spatial plots that describe in/out migration by the voronoi polygons in Senegal (Please note: I did this project using the voronoi polygons rather than the Senegalese administrative subdivisions because there were multiple flow centerpoints in a few of the administrative subdivisions that prevented me from using them, making me use the voronoi polygons instead.):

![](inmigration_sen.png)

![](outmigration_sen.png)

## Origin-destination (OD) Matrix

The origin-destination (OD) matrix that I got is shown below:

![](ODMatrix.png)

As you can see, there are 34 rows and 34 columns in our OD matrix. Each individual cell within the OD matrix represents a particular combination of the flow centerpoints (of which there were 34). The row number on the left side represents the centerpoint that is the origin, and the column number at the top represents the destination centerpoint. So, the number is each cell represents the predicted migration flow FROM the centerpoint on the row index TO the centerpoint at the column index. There are N/A values for the center diagonal, which symbolizes the number of people who migrated from that centerpoint to itself; we did not need to take these into account. 

## How the OD matrix is used to model migration across the administrative subdivisions of Senegal

As described above, my OD matrix is a 34x34 matrix. Each entry is representative of the migration flow from one centerpoint (the row index) to another (the column index). We also have information about distances between each pair of centerpoints. I would've liked to have added nighttime lights to my gravity model, but unfortunately I was unable to get the nighttime lights data extracted in such a way that I could use it. 

The below plot shows how we are able to visualize our OD matrix; each centerpoint of migration is connected to all the others with lines.

![](lines_btwn_cpts.png)

## Animated migration

I then made an animated plot of migration, which shows the small points travelling between the centerpoints as the migration from one area to another.

![](output_mig.gif)

## Tesselation of voronoi polygons

