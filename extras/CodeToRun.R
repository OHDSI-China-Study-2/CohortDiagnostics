
#### used R package 4.1.3 version and aligned the dependency with the version ####
.libPaths("C:/link your own direction/R-4.1.3/R-4_1_3/R-4.1.3")
sys.setlocale(category= "LC_ALL", locale= "english")

library(APACt2dmNetworkStudies)

# Optional: specify where the temporary files (used by the Andromeda package) will be created:
options(andromedaTempFolder = "C:/t2dmNetworkStudyDiagnostics/andromedaTemp")

# Maximum number of cores to be used:
# maxCores <- parallel::detectCores()

# The folder where the study intermediate and result files will be written:
outputFolder <- "s:/APACt2dmNetworkStudies"

# Details for connecting to the server:
connectionDetails <-
        DatabaseConnector::createConnectionDetails(
                dbms = "pdw",
                server = Sys.getenv("PDW_SERVER"),
                user = NULL,
                password = NULL,
                port = Sys.getenv("PDW_PORT")
        )

# The name of the database schema where the CDM data can be found:
cdmDatabaseSchema <- "CDM_IBM_MDCD_V1153.dbo"

# The name of the database schema and table where the study-specific cohorts will be instantiated:
cohortDatabaseSchema <- "scratch.dbo"
cohortTable <- "rao_skeleton"

# Some meta-information that will be used by the export function:
databaseId <- "Synpuf"
databaseName <-
        "Medicare Claims Synthetic Public Use Files (SynPUFs)"
databaseDescription <-
        "Medicare Claims Synthetic Public Use Files (SynPUFs) were created to allow interested parties to gain familiarity using Medicare claims data while protecting beneficiary privacy. These files are intended to promote development of software and applications that utilize files in this format, train researchers on the use and complexities of Centers for Medicare and Medicaid Services (CMS) claims, and support safe data mining innovations. The SynPUFs were created by combining randomized information from multiple unique beneficiaries and changing variable values. This randomization and combining of beneficiary information ensures privacy of health information."

# For some database platforms (e.g. Oracle): define a schema that can be used to emulate temp tables:
options(sqlRenderTempEmulationSchema = NULL)

APACt2dmNetworkStudies::execute(
        connectionDetails = connectionDetails,
        cdmDatabaseSchema = cdmDatabaseSchema,
        cohortDatabaseSchema = cohortDatabaseSchema,
        cohortTable = cohortTable,
        verifyDependencies = FALSE,
        outputFolder = outputFolder,
        databaseId = databaseId,
        databaseName = databaseName,
        databaseDescription = databaseDescription
)

CohortDiagnostics::preMergeDiagnosticsFiles(dataFolder = outputFolder)

CohortDiagnostics::launchDiagnosticsExplorer(dataFolder = outputFolder)


# Upload the results to the OHDSI SFTP server:
privateKeyFileName <- ""
userName <- ""
APACt2dmNetworkStudies::uploadResults(outputFolder, privateKeyFileName, userName)
