gdpdf <- read.csv('gdp.csv',skip = 4, nrows = 215)
gdpdf <- gdpdf[which(gdpdf$X != ""),c('X','X.1','X.2','X.3','X.4')]
gdpdf <- rename(gdpdf,CountryCode = X)
edudf <- read.csv('edu.csv')
sum(!is.na(unique(dt$X.1)))
#finding by income
group_by(dt,Income.Group)
print(summarize(x, res = mean(X.1, na.rm = TRUE)))