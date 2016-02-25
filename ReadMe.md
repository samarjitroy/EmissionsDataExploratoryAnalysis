## Introduction

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

##Data

The data for this assignment are available from the course web site as a single zip file:

https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

The zip file contains two files: 

* PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

* Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.



##A

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
[Sat Feb 06 20:45:01 2016 ] Exploratory Data Analysis.
[Sat Feb 06 20:45:01 2016 ] Assignment: 1.
[Sat Feb 06 20:45:01 2016 ] Author: Samarjit Roy.
[Sat Feb 06 20:45:01 2016 ] Plot 1: Global Active Power.
[Sat Feb 06 20:45:01 2016 ] 
[Sat Feb 06 20:45:01 2016 ] if current directory does not have data subdir, create one...completed.
[Sat Feb 06 20:45:01 2016 ] download zip file from the source...completed.
[Sat Feb 06 20:45:01 2016 ] if zip file exists, unzip with overwrite..completed.
[Sat Feb 06 20:45:03 2016 ] Finding Last row number for Date '2007-02-01'  '2007-02-02'.....completed.
[Sat Feb 06 20:45:12 2016 ] Load Data into Data Frame with limited rows( 69517 ) from the lardge file..completed.
[Sat Feb 06 20:45:13 2016 ] convert date and time variables to Date/Time class...completed.
[Sat Feb 06 20:45:14 2016 ] only use data from the dates 2007-02-01 and 2007-02-02...completed.
[Sat Feb 06 20:45:14 2016 ] Set Plot Device to plot1.p as 480x480...completed.
[Sat Feb 06 20:45:14 2016 ] Creating Histogram on device: 2 ...completed.
[Sat Feb 06 20:45:14 2016 ] Closing current device: 2 ....completed.
```

![plot1](plot1.png)

