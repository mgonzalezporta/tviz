readExpressionData=function(gId=gId, infile=infile, cond1=cond1, cond2=cond2) {
  # header
  command=paste("head -n1", infile, sep=" ")
  header=read.table(pipe(command), as.is=T)

  # conditions
  cond1=.format_cond(cond1)
  cond2=.format_cond(cond2)

  # transcript RPKMs
  command=paste("grep", gId, infile, sep=" ")
  data=read.table(pipe(command), col.names=header,
    colClasses=c("NULL", "character", rep("numeric", length(header)-2)))
  rpkms=as.matrix(data[,c(cond1, cond2)])
  rownames(rpkms)=data[,1]

  return(rpkms)
}

readBiotypeData=function(gId=gId, infile=infile) {
  # biotype info
  command=paste("grep", gId, infile, sep=" ")
  tBiotype=read.table(pipe(command))[,4:5]
  colnames(tBiotype)=c("tId", "tBiotype")

  return(tBiotype)
}

readSignificantEvents=function(gId=gId, infile=infile) {
  # significant events, if any
  command=paste("grep", gId, infile, sep=" ")
  significant_events=tryCatch(
        {
	    significant_events=as.character(read.table(pipe(command))[,2])	
        },
        error=function(e) {
            significant_events="NA"
        }
  )    
  return(significant_events)
}

newTranscriptExpressionSet=function(gId=gId, rpkms=rpkms, biotypes=biotypes, significant_events=significant_events, cond1=cond1, cond2=cond2) {
  # conditions
  cond1=.format_cond(cond1)
  cond2=.format_cond(cond2)

  cond1=cond1-1
  cond2=seq(from=length(cond1)+1, to=dim(rpkms)[2], by=1)
  conditions=list(cond1=cond1, cond2=cond2)

  # create TranscriptExpressionSet object
  tes=new("TranscriptExpressionSet",
    id=gId,
    conditions=conditions,
    rpkms=rpkms,
    biotypes=biotypes,
    significant_events=significant_events
  )

  return(tes)
}

## internal functions
.format_cond=function(cond) {
  x=as.numeric(strsplit(cond, "-")[[1]])
  cond=(x[1]-1):(x[2]-1)
  return(cond)
}
