## Introduction

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

##Data

The data for this assignment are available from the course web site as a single zip file:

https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

The zip file contains two files: 

* PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

* Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.



##A (Plot1)

#Analysis
Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Data Selection Method

with(NIE, tapply(Emissions, year, sum, na.rm = T))  - where NIE is Data Frame loaded from summarySCC_PM25.rds


#The Plot1 script (plot1.R) does the following:

1. Download and unzip data to the Current Working Directory
2. Load data using readRDS(): 
	* PM2.5 Emissions Data (summarySCC_PM25.rds) to NEI 
	* Source Classification Code Table (Source_Classification_Code.rds) to SCC
3. Extracts the total emissions from PM2.5 decreased in the United States from 1999 to 2008.
4. Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
5. Save the plot to plot1.png

# Running the script
To run the script, source `plot1.R`. After running, you will see the following output as the script works:
```
[Wed Feb 24 22:28:05 2016 ] Exploratory Data Analysis Project.
[Wed Feb 24 22:28:05 2016 ] Assignment: Course Project 2
[Wed Feb 24 22:28:05 2016 ] Author: Samarjit Roy.
[Wed Feb 24 22:28:05 2016 ] 
[Wed Feb 24 22:28:05 2016 ] if current directory does not have data subdir, create one...completed.
[Wed Feb 24 22:28:05 2016 ] download zip file from the source...completed.
[Wed Feb 24 22:28:05 2016 ] if zip file exists, unzip with overwrite..completed.
[Wed Feb 24 22:28:05 2016 ] Load  PM2.5 Emissions Data : summarySCC_PM25.rds .....completed.
[Wed Feb 24 22:28:23 2016 ] Load  Source Classification Code Table : Source_Classification_Code.rds .....completed.
[Wed Feb 24 22:28:25 2016 ] Ploting for PM2.5 decreased in the United States (1999 to 2008) on device(plot1.png): 2 ...completed.
```

![plot1](plot1.png)

<a href="plot1.R">Click here to view <b>Code plot1.R</b></a>


##B (Plot2)

#Analysis

Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#Data Selection Method
1. subset(NIE,fips == "24510")  - where NIE is Data Frame loaded from summarySCC_PM25.rds
2. with(BaltimoreCityDF , tapply(Emissions, year, sum, na.rm = T)) - Where BaltimoreCityDF is the output from 1.


#The Plot2 script (plot1.R) does the following:

1. Download and unzip data to the Current Working Directory
2. Load data using readRDS(): 
	* PM2.5 Emissions Data (summarySCC_PM25.rds) to NEI 
	* Source Classification Code Table (Source_Classification_Code.rds) to SCC
3. Extracts the total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008. 
4. Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
5. Save the plot to plot1.png

# Running the script
To run the script, source `plot2.R`. After running, you will see the following output as the script works:
```
[Thu Feb 25 09:29:41 2016 ] Exploratory Data Analysis Project.
[Thu Feb 25 09:29:41 2016 ] Assignment: Course Project 2
[Thu Feb 25 09:29:41 2016 ] Author: Samarjit Roy.
[Thu Feb 25 09:29:41 2016 ] 
[Thu Feb 25 09:29:41 2016 ] if current directory does not have data subdir, create one...completed.
[Thu Feb 25 09:29:41 2016 ] download zip file from the source...completed.
[Thu Feb 25 09:29:41 2016 ] if zip file exists, unzip with overwrite..completed.
[Thu Feb 25 09:29:42 2016 ] Load  PM2.5 Emissions Data : summarySCC_PM25.rds .....completed.
[Thu Feb 25 09:30:07 2016 ] Load  Source Classification Code Table : Source_Classification_Code.rds .....completed.
[Thu Feb 25 09:30:08 2016 ] Ploting for PM2.5 decreased in the Baltimore City, Maryland (1999 to 2008) on device(plot2.png): 2 ...completed.

```

![plot2](plot2.png)

<a href="plot2.R">Click here to view <b>Code plot2.R</b></a>


