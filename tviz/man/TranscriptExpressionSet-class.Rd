\name{TranscriptExpressionSet}
\Rdversion{1.1}
\encoding{UTF-8}
\docType{class}
\alias{TranscriptExpressionSet}
\alias{TranscriptExpressionSet,TranscriptExpressionSet-class}

\title{Class "TranscriptExpressionSet" -- a container for transcript-level expression data from RNA-seq experiments}
\description{This is the main class for the present package.}

\section{Slots}{
  \describe{
  \item{gId}{Id for the gene to be plotted.}
  \item{rpkms}{Matrix of transcript RPKM/FPKM values in each sample, 
  loaded using the 'readExpressionData' function.}
  \item{biotypes}{Matrix of biotypes for each of the annotated transcripts within the gene, 
  loaded using the 'readBiotypeData' function.}
  \item{significant_events}{List of transcript ids that undergo differential usage across the studied conditions, loaded using the 'readSignificantEvents' function. Must be set to 'NA' in case such information is not available.}
  \item{cond1}{String indicating the range of columns (samples) 
  that belong to the first condition. E.g: '3-6'.}
  \item{cond1}{String indicating the range of columns (samples) 
  that belong to the second condition. E.g: '7-10'.}
  }
}

\section{Objects from the Class}{
Objects should be created with calls to \code{\link{newTranscriptExpressionSet}}.
}

\author{
   Mar Gonzàlez-Porta, <mar@ebi.ac.uk>
}

\examples{
}

