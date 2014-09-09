library("tviz")

#####################################
# Test 1: small number of samples 
#####################################

setwd("./tviz/inst/tests/")

## arguments
gId='ENSG00000124193'
expdata='expdata1.txt' 
filt='NA'
annot='biotype.txt' 
cond1='3-6' 
cond2='7-10' 
outdir='./output-test'

## create output dir
dir.create(outdir, showWarnings = FALSE)

## load data
texp=readExpressionData(gId=gId, infile=expdata, cond1=cond1, cond2=cond2)
biotypes=readBiotypeData(gId=gId, infile=annot)
if (filt != "NA") {
	significant_events=readSignificantEvents(gId=gId, infile=filt)
} else {
	significant_events="NA"
}

## create TranscriptExpressionSet object
tes=newTranscriptExpressionSet(
        gId=gId,
        texp=texp$texp,
        biotypes=biotypes,
        cond1=texp$cond1,
        cond2=texp$cond2,
        significant_events=significant_events
)

## generate plots
outfile=paste(outdir, "/", gId, "-starplot.pdf", sep="")
plotStars(tes=tes, outfile=outfile)
outfile=paste(outdir, "/", gId, "-distrplot.pdf", sep="")
plotDistr(tes=tes, outfile=outfile)


#####################################
# Test 2: large number of samples 
#####################################

## arguments
gId='ENSG00000153086' 
expdata='expdata2.txt' 
filt='significant_dtu.txt'
annot='biotype.txt' 
cond1='3-14' 
cond2='15-26' 
outdir='./output-test'

## create output dir
dir.create(outdir, showWarnings = FALSE)

## load data
texp=readExpressionData(gId=gId, infile=expdata, cond1=cond1, cond2=cond2)
biotypes=readBiotypeData(gId=gId, infile=annot)
if (filt != "NA") {
	significant_events=readSignificantEvents(gId=gId, infile=filt)
} else {
	significant_events="NA"
}

## create TranscriptExpressionSet object
tes=newTranscriptExpressionSet(
        gId=gId,
        texp=texp$texp,
        biotypes=biotypes,
        cond1=texp$cond1,
        cond2=texp$cond2,
        significant_events=significant_events
)

## generate plots
outfile=paste(outdir, "/", gId, "-starplot.pdf", sep="")
plotStars(tes=tes, outfile=outfile)
outfile=paste(outdir, "/", gId, "-distrplot.pdf", sep="")
plotDistr(tes=tes, outfile=outfile)
