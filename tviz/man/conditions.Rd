\name{conditions}
\encoding{UTF-8}
\Rdversion{1.1}
\docType{methods}
\alias{conditions,TranscriptExpressionSet-method}
\alias{conditions}
\title{
   Accessor function for the 'conditions' slot of a TranscriptExpressionSet object.
}

\description{
   The conditions slot contains information on the experimental conditions evaluated,
   as well as the list of samples corresponding to each one of them. This slot is automatically created
   from the header of the input file.
}

\usage{
\S4method{conditions}{TranscriptExpressionSet}(object)
}

\arguments{
  \item{object}{a \code{TranscriptExpressionSet} object.}
}

\author{
   Mar Gonzàlez-Porta, <mar@ebi.ac.uk>
}
\examples{
}   
   
