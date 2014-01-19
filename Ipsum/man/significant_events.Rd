\name{significant_events}
\encoding{UTF-8}
\Rdversion{1.1}
\docType{methods}
\alias{significant_events,TranscriptExpressionSet-method}
\alias{significant_events}
\title{
   Accessor function for the 'significant_events' slot of a TranscriptExpressionSet object.
}

\description{
   The significant_events slot holds a list of transcript ids reported by the user 
   as differentially used across the studied conditions. 
   In the case that such information is not available, 
   'NA' will be assigned.
}

\usage{
\S4method{significant_events}{TranscriptExpressionSet}(object)
}

\arguments{
  \item{object}{a \code{TranscriptExpressionSet} object.}
}

\author{
   Mar Gonzàlez-Porta, mar@ebi.ac.uk
}
\examples{
}   
   
