
# Renames scc.Short.Name to scc.short_Name (sqldf does not support col with .)
#colnames(scc)[3] <- "Short_Name"

# Selects the rows like '%Coal' and sum the emaissions per year
pm25Coal <- sqldf("select p.year from pm25 p")
#    "select p.year, sum(p.Emissions) sum 
#     from pm25 p 
#     group by p.year")
#     inner join scc s on p.SCC = s.SCC
#     where s.Short_Name like '%Coal'
#     group by p.year")

# Factors the year
#pm25Coal$year <- as.factor(pm25Coal$year)

