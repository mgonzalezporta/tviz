\name{plotStars}
\docType{methods}
\alias{plotStars}
\alias{plotStars,TranscriptExpressionSet-method}
\encoding{UTF-8}
\title{Create a starplot for the specified TranscriptExpressionSet object.}

\description{
A starplot provides information on the transcript RPKM quantifications in a sample specific manner.
In this plot each sample is represented as a pie chart, where each of the slices corresponds to a transcript. The size of each slice is proportional to the transcript expression level, and the overall size of the plot is proportional to the gene expression level, thus allowing comparisons across samples.
}

\usage{
\S4method{plotStars}{TranscriptExpressionSet}(tes, outfile)
}
\arguments{
  \item{tes}{a \code{TranscriptExpressionSet} object.}
  \item{outfile}{ouput file (pdf).}
}
\author{
  Mar Gonzàlez-Porta, <mar@ebi.ac.uk>
}
