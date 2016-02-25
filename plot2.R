# This Script (plot1.R) will do the followings on the data available at "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
# 
# 	1. Download and unzip data to the Current Working Directory
#	2. Load data using readRDS(): 
#		a) PM2.5 Emissions Data (summarySCC_PM25.rds) to NEI 
#		b) Source Classification Code Table (Source_Classification_Code.rds) to SCC
#	3. Extracts the total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008.
#	4. Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
#	5. Save the plot to plot2.png
#
#
#
p <- function(...) {
  d <- format(Sys.time(), "[%a %b %d %H:%M:%S %Y ]")
  cat(d, ...)
  flush.console()
}

done <- function() {
  cat("completed.\n")
}

chkDataDir <- function(){
	# if current directory does not have data subdir, create one
	p("if current directory does not have data subdir, create one...")
	mainDir <- getwd()
	if (!file.exists("data")){
		dir.create(file.path(mainDir, "data"))
	}
	done()
	dataDir <- file.path(mainDir, "data")
	return (dataDir)
}

loadData <- function(dataDir,LoadFile, FileDesc){
  	p("Load ",FileDesc,":",LoadFile,".....")
  	rdsData = readRDS(file.path(dataDir, LoadFile))
    	done()
	return (rdsData)
}

getDataFileUnzip <- function(DataDir,DataURL){
      # download zip file from the source
	p("download zip file from the source...")
	#setwd(DataDir)

	downloadFileName <- "exdataFdataFNEI_data.zip"
	if (!file.exists(downloadFileName))
	{
		download.file(DataURL, dest=downloadFileName, method="libcurl",quiet = TRUE)
	}
	done()

      # if zip file exists, unzip with overwrite
      p("if zip file exists, unzip with overwrite..")
	if (file.exists(downloadFileName))
	{
		unzip(downloadFileName, exdir = "data", overwrite = TRUE)
     	} 
	done()
}

baltimoreCity <- function(NIE,SCC){
	BaltimoreCityDF <- subset(NIE,fips == "24510")
	yearlyEmissions <- with(BaltimoreCityDF , tapply(Emissions, year, sum, na.rm = T))
      	
	years <- names(yearlyEmissions)
	noYear <- dim(years)
	# get the range for the x and y axis 
	xrange <- range(years) 
	xrange[1] <- as.character(as.numeric(xrange[1]) - 1)
	yrange <- range(as.integer(as.character(yearlyEmissions)))
	ytics  <- as.integer(as.character(yearlyEmissions))

	#Set Plot Device to plot1.p as 240x200...
    	png("plot2.png", width=240, height=200,units="mm",res=300)
      curPlotDevice <- dev.cur()
      
	p("Ploting for PM2.5 decreased in the Baltimore City, Maryland (1999 to 2008) on device(plot2.png):",toString(curPlotDevice),"...")
	# set up the plot 
	plot(yearlyEmissions, x = years ,type="n",axes = FALSE, xlab="Year", ylab="Total emissions from PM2.5") 

	points(yearlyEmissions, x = years, pch = 16, col = "red")
	text(yearlyEmissions, x = years, labels=as.integer(as.character(yearlyEmissions)), cex= 0.6, pos=3)

	# add lines 
  	lines( yearlyEmissions,x=years, type="b", lwd=1.5,lty=1, col="blue", pch=18) 

	# add a title and subtitle 
	title("PM2.5 decreased in the Baltimore City, Maryland (1999 to 2008)")
	axis(side = 1, at = years )
	axis(side = 2, at = ytics )
	box()
      
	#Closing current device....
    	dev.off()      
      done()
}



DoPlot <- function(){
	library(curl)
	library(data.table)
	library(dplyr)
	library(ggplot2)

	p("Exploratory Data Analysis Project.\n")
	p("Assignment: Course Project 2\n")
	p("Author: Samarjit Roy.\n")
	p("\n")
	dataDir<-chkDataDir()
	getDataFileUnzip(dataDir, "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip")
	NIE<-loadData(dataDir,"summarySCC_PM25.rds","PM2.5 Emissions Data")
	SCC<-loadData(dataDir,"Source_Classification_Code.rds","Source Classification Code Table")
	baltimoreCity(NIE,SCC)
}

DoPlot ()
