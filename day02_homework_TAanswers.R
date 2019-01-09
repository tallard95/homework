# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R
getwd()
memdat<-read.csv("Winter2019Rcourse_data.csv")

# 2. Peek at the top few rows
head(memdat)

# 3. Peek at the top few rows for only a few columns
head(memdat$id)
head(memdat$age)
head(memdat$sex)

# 4. How many rows does your data have?
nrow(memdat)

# 5. Get a summary for every column
summary(memdat)

# 6. Get a summary for one column
summary(memdat$age)

# 7. Are any of the columns giving you unexpected values?

# No. However, I can already guess that I will need to learn 
# how to deal with missing data as several of my particpants 
# are missing brain data.

# 8. Select a few key columns, make a vector of the column names

colsA <- c("id", "age", "l_dghead", "r_dghead", "iq", "lr_precent")
colsA

# 9. Create a new data.frame with just that subset of columns
newmem<-data.frame(memdat$id, memdat$age, memdat$l_dghead, memdat$r_dghead, memdat$iq, memdat$lr_precent)

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step
newmem1<-data.frame(newmem[1:10,])
newmem2<-data.frame(newmem[21:30,])
newmem3<-rbind.data.frame(newmem1, newmem2)

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample

library("dplyr")
newmemB<-data.frame(sample_n(newmem, 15))
nrow(newmemB)

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test() (or cor.test()) for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)

cor.test(memdat$iq, memdat$age)

# The default is pearson's r which is the version I need becuase 
# I have to continuous variables. It appears there is a stastiscally
# signifigant positive correlation between these two variables.

#     - run the test with BOTH the formula and "vector"
#       formats, if possible
#Not sure what this means
#     - if one is NOT possible, say why you can't do it

# 13. Repeat #12 for TWO more comparisons
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise

cor.test(memdat$lr_precent, memdat$r_dghead)
cor.test(memdat$lr_precent, memdat$l_dghead)

# Apperntly, there is no relationship between 
# performance on the lorsbach task and dentate 
# gyrus volume in the head of the hippocampus

# 14. Save all results from #12 and #13 in an .RData file
a <- cor.test(memdat$iq, memdat$age)
b <- cor.test(memdat$lr_precent, memdat$r_dghead)
c <- cor.test(memdat$lr_precent, memdat$l_dghead)

save(a, b, c, file = "correlations.RData")

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link

