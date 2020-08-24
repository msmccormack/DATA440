x <- 1:10
y <- 10:1

plot(x, y)

plot(x, y, type = 'l')

plot(x, y, type='o')

plot(x, y, type = "o", 
     main = "The Path of a Running Boy",
     sub = "units of distance = meters",
     xlab = "longitude", 
     ylab = "latitude")

plot(x, y, type = "b", main = "The Path of a Running Boy", 
     sub = "units of distance = meters", 
     xlab = "longitude", 
     ylab = "latitude",
     lty = 2,
     lwd = .75,
     col = "blue",
     pch = 0,
     cex = 1.5)

x <- 1:100
y <- 1:100

east <- sample(x, size = 10, replace = TRUE)
north <- sample(y, size = 10, replace = TRUE)

symbols(east, north, squares = rep(.75,10), inches = FALSE)

symbols(sample(x, 10, replace = TRUE), 
        sample(y, 10, replace = TRUE), 
        circles = rep(.75,10), 
        inches = FALSE,
        fg = "green",
        add = TRUE)

symbols(east, north, squares = rep(.75,10), inches = FALSE)

symbols(sample(x, 10, replace = TRUE), 
        sample(y, 10, replace = TRUE), 
        circles = rep(.75,10), 
        inches = FALSE,
        fg = "green1",
        bg = "beige",
        add = TRUE)

symbols(sample(x, 10, replace = TRUE), 
        sample(y, 10, replace = TRUE), 
        circles = rep(1.5,10), 
        inches = FALSE,
        fg = "green4",
        bg = "beige",
        add = TRUE)

dwellings <- cbind.data.frame(id = 1:10, east, north)

#lines(x = dwellings$east,
#      y = dwellings$north,
#      lty = 2,
#      lwd = .75,
#      col = "blue")

text(x = dwellings$east,
     y = dwellings$north,
     labels = dwellings$id)

locs <- sample(1:10, 3, replace = FALSE)

#lines(x = dwellings[locs, 2],
#      y = dwellings[locs, 3],
#      lty = 2,
#      lwd = .75,
#      col = "blue")

# text(x = dwellings$east,
#      y = dwellings$north + 3,
#      labels = dwellings$id)

text(x = dwellings[locs, ]$east, 
     y = dwellings[locs, ]$north + 3,
     labels = dwellings[locs, ]$id)

xspline(x = dwellings[locs, 2],
        y = dwellings[locs, 3],
        shape = -1,
        lty = 2)
title(main="A Person's path between Homes")

#Challenge Plot
#Make the dimensions 1-1000
x <- 1:1000
y <- 1:1000

sample_x <- sample(x, size = 50, replace = TRUE)
sample_y <- sample(y, size = 50, replace = TRUE)

#Randomly place the 50 dwelling units throughout the area
symbols(sample_x, sample_y, squares = rep(5,50), inches = FALSE)

# create a dataframe for these points
fifty_points <- cbind.data.frame(id = 1:50, sample_x, sample_y)
fifty_points$id
#Take a sample of 7 homes (these will be the ones that have the dashed spline)
seven_sampled = sample(fifty_points$id,7)

#Randomly place the 40 small trees/circles around the area
symbols(sample(x, 40, replace = TRUE), 
        sample(y, 40, replace = TRUE), 
        circles = rep(5,40), 
        inches = FALSE,
        fg = "green",
        add = TRUE)

#Randomly place the 12 larger trees in the area (such that the tree is 2x wider)
twelve_x = sample(x, 12, replace = TRUE)
twelve_y = sample(y, 12, replace = TRUE)

symbols(twelve_x,
        twelve_y, 
        circles = rep(10,12), 
        inches = FALSE,
        fg = "green",
        add = TRUE)

#Add the dashed spline connecting the seven homes

xspline(x = fifty_points$sample_x[seven_sampled],
        y = fifty_points$sample_y[seven_sampled],
        shape = -1,
        lty = 2)

#Add the desired title
title("A person's path between homes")

