APACt2dmNetworkStudies
==============================


Requirements
============

- A database in [Common Data Model version 5](https://github.com/OHDSI/CommonDataModel) in one of these platforms: SQL Server, Oracle, PostgreSQL, IBM Netezza, Apache Impala, Amazon RedShift, Google BigQuery, or Microsoft APS.
- R version 4.1.3
- On Windows: [RTools](http://cran.r-project.org/bin/windows/Rtools/)
- [Java](http://java.com)
- 25 GB of free disk space

How to run
==========
1. Follow [these instructions](https://ohdsi.github.io/Hades/rSetup.html) for setting up your R environment, including RTools and Java. 

2. Open your study package in RStudio. Use the following code to install all the dependencies:

	```r
	.libPaths(C:/path/to/your/package/library) #Change to your pacakge library path
 	renv::restore()
	```

3. In RStudio, select 'Build' then 'Install and Restart' to build the package.

	#If you encounter the error "_tries to install the package in the developer's repo_", install from the terminal instead:

	```r
	R CMD INSTALL --preclean --library="Path/to/your/R/library" "Path/to/APACt2dmNetworkStudies"
	```

	--library= should be the same as the path you use in .libPaths()
	The second path is where the study project is saved.
	You can find it in RStudio via **More --> Copy Folder Path to Clipboard**

4. Once installed, you can execute the study by modifying and using the code below. For your convenience, this code is also provided under `extras/CodeToRun.R`:

	```r
	#### Use R package 4.1.3 version and align dependencies ####
	.libPaths("C:/path/to/your/package/library")
 	
	# Locale: use system default or UTF-8 (cross-platform)
	Sys.setlocale(category = "LC_ALL", locale = "") # or "en_GB.UTF-8"

 	library(APACt2dmNetworkStudies)
	
	# Optional: specify where the temporary files (used by the Andromeda package) will be created:
	options(andromedaTempFolder = "s:/andromedaTemp")
	
	# Maximum number of cores to be used: #did not used this part
	# maxCores <- parallel::detectCores()
	
	# The folder where the study intermediate and result files will be written:
	outputFolder <- here::here("results")
	
	# Details for connecting to the server:
	# See ?DatabaseConnector::createConnectionDetails for help
	connectionDetails <- DatabaseConnector::createConnectionDetails(
 									dbms = "postgresql",
									server = "some.server.com/ohdsi",
									user = "joe",
									password = "secret",
 									port = Sys.getenv("PDW_PORT")
									)
	
	# The name of the database schema where the CDM data can be found:
	cdmDatabaseSchema <- "cdm_synpuf"
	
	# The name of the database schema and table where the study-specific cohorts will be instantiated:
	cohortDatabaseSchema <- "scratch.dbo"
	cohortTable <- "my_study_cohorts"
	
	# Some meta-information that will be used by the export function:
	databaseId <- "Synpuf"
	databaseName <- "Medicare Claims Synthetic Public Use Files (SynPUFs)"
	databaseDescription <- "OHDSI APAC network study: type 2 diabetes mellitus cohort characterization"
	
	# For some database platforms (e.g. Oracle): define a schema that can be used to emulate temp tables:
	options(sqlRenderTempEmulationSchema = NULL)
	
	runCohortDiagnostics(connectionDetails = connectionDetails,
            cdmDatabaseSchema = cdmDatabaseSchema,
            cohortDatabaseSchema = cohortDatabaseSchema,
            cohortTable = cohortTable,
            outputFolder = outputFolder,
            databaseId = databaseId,
            databaseName = databaseName,
            databaseDescription = databaseDescription,
            verifyDependencies = FALSE,
            createCohorts = TRUE,
            synthesizePositiveControls = TRUE,
            runAnalyses = TRUE,
            packageResults = TRUE,
            maxCores = maxCores)
	```

4. Upload the file ```export/Results_<DatabaseId>.zip``` in the output folder to the study coordinator:

	```r
	uploadResults(outputFolder, privateKeyFileName = "<file>", userName = "<name>")
	```
	
	Where ```<file>``` and ```<name<``` are the credentials provided to you personally by the study coordinator.
		
5. To view the results, use the Shiny app:

	```r
	launchDiagnosticsExplorer()
	```
  
  Note that you can save plots from within the Shiny app. 

License
=======
The APACt2dmNetworkStudies package is licensed under Apache License 2.0

Development
===========
APACt2dmNetworkStudies was developed in ATLAS and R Studio.

### Development status

Unknown


