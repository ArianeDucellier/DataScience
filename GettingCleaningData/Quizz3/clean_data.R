GDP <- read.csv("getdata_data_GDP.csv",skip=5,header=FALSE,na.strings="")
GDPgood <- GDP[!is.na(GDP$V1),]
names(GDPgood)[1] <- "id"
names(GDPgood)[2] <- "rang"
names(GDPgood)[4] <- "country"
names(GDPgood)[5] <- "GDP"

EDU <- read.csv("getdata_data_EDSTATS_Country.csv")

data <- merge(GDPgood,EDU,by.x="id",by.y="CountryCode")

data$rang <- as.numeric(as.character(data$rang))

data_order <- data[order(data$rang,decreasing=TRUE,na.last=NA),]
