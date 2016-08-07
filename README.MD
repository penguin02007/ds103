# DS103
[Week1](#week1)
[Week2](#week2)
[Week3](#week3)
[Week4](#week4)

## <a name="week2"></a>Week2
### Reading from MySQL

### Reading from HDF5
### www.bioconductor.org/packages/release/bioc/vignettes/rhdf5/inst/doc/rhdf5.odf
### Versatile data model that can represent complex data objects
### Portable file format with no limit on the number or size of data objects in the collection
### Heirarchical data format
```
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("example.h5")
created
created = h5createFile("example.h5","foo")
```
### Writing to groups
```
A = matrix(1:10,nr=5,nc=2)
h5write(A, "example.h5", "foo/A")
B = array(seq(0.1,2.0,by=0.1)),dim=c(5,2,2))
attr(B, "example.h5","foo/foobaa/B")
h5write(B,"example.h5","foo/foobaa/B")
h5lx("example.h5")
```
### Write a data set

### Writing and reading chunks

### Reading from the web

### Getting data from web - readLines()
```
con <- url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ")
htmlCode <- readLines(con)
close(con)
htmlCode
```
##### Parsing with XML
```
library(XML)
con <- url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
html <- htmlTreeParse(url, useInternalNodes=T)
scholar_name <- xpathSApply (html, "//title", xmlValue)
cited_by <- xpathSApply(html, "//td[@id='col-cityedby']", xmlValue)
```
#### GET from httr package
```
library(httr); html2 <- GET(url)
content2 <- content(html2, as='text')
parsedhtml <- htmlParse(content2, asTEXT=TRUE)
xpathSApply(parsedHtml,"//title",xmlValue)
```
```
GET(url),authenticated(user,pass) # Access website with passswords
```
### API method
#### Method - GET, POST, PUT, DELETE

### data storage mechanism R
file - open connection to a text file
url - open connection to url
gzfile - open connection to gzip file
?connections

## <a name="week3"></a>Week3
### Summarizing Data
```
summary()
str()
```
#### Quantiles of quantitative cariables
quantile()
### Dealing with NAs
```
```
any(is.na(df_gdp$gdp)) # Finding NA
```

## <a name="week4"></a>Week4
grep()
grepl()
sub()
gsub()
```
paste0("l","chan") # Paste without space
[1] "lchan"
```
```
str_trim("lchan   ") # Trim off excess and necessary space
```

### Date
#### lubridate
```
help(package = lubridate)
date()
now()
```
### format dates
```
Sys.getlocale("LC_TIME")	# View locale
```
```
format(Sys.Date(),"%Y%m%d")
```
### Setting timezone with lubridate
```
> ymd_hms(Sys.time())
[1] "2016-08-07 16:15:33 UTC"

> ymd("1920-1-2")
[1] "1920-01-02 UTC"
```
### Find out 2d17h34m at EST and convert to HKT
```
nyc<-now(tzone="America/New_York")
depart<-nyc+days(2)
depart<-update(depart, hours = 17, minutes = 34)
arrive <- with_tz(arrive, "Asia/Hong_Kong")
```
### Find out how long two dates have been elapsed
```
last_time <- mdy("June 17, 2008",tz = "Singapore")
how_long <- interval(last_time, arrive)
as.period(how_long)
```


