\name{plotDistr}
\docType{methods}
\alias{plotDistr}
\alias{plotDistr,TranscriptExpressionSet-method}
\encoding{UTF-8}
\title{Create a distribution plot for the specified TranscriptExpressionSet object.}

\description{
A distribution plot contains information on the distribution of gene expression levels, major transcript dominance and transcript relative abundances in each condition. This plot contains three panels:

left - Distribution of gene expression levels (RPKMs or FPKMs).

middle - Distribution of major transcript dominance. Major transcript dominance is calculated in each condition as the ratio of expression of the second/first most abundant transcripts. Thus, a ratio close to 0 will indicate that the most abundant transcript is dominating the expression for that gene, while a ratio close to 1 indicates that the first and second most abundant transcripts are expressed at the same level.

right - Relative abundances for all the transcripts annotated within the gene. Considering that gene expression is the result of adding up transcript expression levels, relative abundance can be understood as the fraction of gene expression explained by each transcript.

Depending on the number of samples, the information in each panel will be displayed as boxplots (n >= 10 in each condition) or as dots + error bars (which correspond to the mean + SD across samples, respectively).
}

\usage{
\S4method{plotDistr}{TranscriptExpressionSet}(tes, outfile)
}
\arguments{
  \item{tes}{a \code{TranscriptExpressionSet} object.}
  \item{outfile}{ouput file (pdf).}
}
\author{
  Mar Gonzàlez-Porta, <mar@ebi.ac.uk>
}
