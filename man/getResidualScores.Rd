% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/phers.R
\name{getResidualScores}
\alias{getResidualScores}
\title{Calculate residual phenotype risk scores}
\usage{
getResidualScores(demos, scores, lmFormula)
}
\arguments{
\item{demos}{A data.table of characteristics for each person in the cohort.
Must have column \code{person_id}.}

\item{scores}{A data.table containing the phenotype risk score for each
person for each disease. Must have columns \code{person_id}, \code{disease_id}, and
\code{score}.}

\item{lmFormula}{A formula representing the linear model to use for
calculating residual scores. All terms in the formula must correspond to
columns in \code{demos}.}
}
\value{
A data.table, based on \code{scores}, with an additional column
\code{resid_score}. Residual scores for each disease are standardized to have
unit variance.
}
\description{
The residual score indicates to what extent a person's phenotype risk score
for a given disease deviates from the expected score, after adjusting for
the person's characteristics in a linear model.
}
\examples{
library('data.table')

# map ICD codes to phecodes
phecodeOccurrences = getPhecodeOccurrences(icdSample)

# calculate weights (using the prevalence method)
weights = getWeights(demoSample, phecodeOccurrences)

# OMIM disease IDs for which to calculate phenotype risk scores
diseaseId = 154700

# map diseases to phecodes
diseasePhecodeMap = mapDiseaseToPhecode()

# calculate scores
scores = getScores(weights, diseasePhecodeMap[disease_id == diseaseId])

# calculate residual scores
rscores = getResidualScores(demoSample, scores, lmFormula = ~ sex)
}
\seealso{
\code{\link[stats:influence.measures]{stats::rstandard()}}, \code{\link[=getScores]{getScores()}}
}
