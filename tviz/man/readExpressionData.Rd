\name{readExpressionData}
\Rdversion{1.1}
\encoding{UTF-8}
\docType{methods}
\alias{readExpressionData}

\title{
   Create a matrix of transcript expression levels for a given gene from the specified input file.
}
\description{
   Loads transcript expression data for a given gene from the specified input file. 
   Each sample is represented as a column, and each transcript as a row.
}
\usage{
readExpressionData(gId=gId, infile=infile, cond1=cond1, cond2=cond2)
}
\arguments{
  \item{gId}{Id of the gene for which to load expression data.}
  \item{infile}{Path to the file that contains the expression data.}
  \item{cond1}{String indicating the range of columns (samples) 
  that belong to the first condition. E.g: '3-6'.}
  \item{cond2}{String indicating the range of columns (samples) 
  that belong to the second condition. E.g: '7-10'.}
}
\author{
   Mar Gonzàlez-Porta, <mar@ebi.ac.uk>
}
\examples{
}
