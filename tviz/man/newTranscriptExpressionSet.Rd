\name{newTranscriptExpressionSet}
\alias{newTranscriptExpressionSet}
\encoding{UTF-8}
\title{
Create a new TranscriptExpressionSet object from data files provided by the user
}
\description{Creates a new TranscriptExpressionSet object for further visualisation of the
embedded expression data.}
\usage{
newTranscriptExpressionSet( 
  gId=gId, 
  rpkms=rpkms, 
  biotypes=biotypes, 
  significant_events=significant_events, 
  cond1=cond1, 
  cond2=cond2)
}
\arguments{
  \item{gId}{Id for the gene to be plotted.}
  \item{rpkms}{Matrix of transcript RPKM/FPKM values in each sample, 
  loaded using the 'readExpressionData' function.}
  \item{biotypes}{Matrix of biotypes for each of the annotated transcripts within the gene, 
  loaded using the 'readBiotypeData' function.}
  \item{significant_events}{List of transcript ids that undergo differential usage across the studied conditions, loaded using the 'readSignificantEvents' function. Must be set to 'NA' in case such information is not available.}
  \item{cond1}{String indicating the range of columns (samples) 
  that belong to the first condition. E.g: '3-6'.}
  \item{cond2}{String indicating the range of columns (samples) 
  that belong to the second condition. E.g: '7-10'.}
}
\value{
A TranscriptExpressionSet object.
}
\author{
   Mar Gonzàlez-Porta, <mar@ebi.ac.uk>
}
