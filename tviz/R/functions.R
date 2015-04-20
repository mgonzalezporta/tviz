readExpressionData=function(gId=gId, infile=infile, cond1=cond1, cond2=cond2) {
  # header
  command=paste("head -n1", infile, sep=" ")
  header=read.table(pipe(command), as.is=T, 
        check.names=FALSE  # necessary to deal with technical replicates
        )

  # transcript expression levels
  command=paste("grep", gId, infile, sep=" ")
  data=read.table(pipe(command), col.names=header, check.names=FALSE,
    colClasses=c("NULL", "character", rep("numeric", length(header)-2)))
  
  # take the median across technical replicates, if any
  cond1=.format_cond(cond1)
  cond2=.format_cond(cond2)

  data_cond1=data.frame(data[,cond1+1])
  colnames(data_cond1)=colnames(data)[cond1+1]
  new_data_cond1=.aggregate_technical_replicates(data_cond1)

  data_cond2=data.frame(data[,cond2+1])
  colnames(data_cond2)=colnames(data)[cond2+1]
  new_data_cond2=.aggregate_technical_replicates(data_cond2)

  new_data=as.matrix(cbind(new_data_cond1, new_data_cond2))
  rownames(new_data)=data[,1]

  # recalculate condition intervals
  cond1=1:dim(new_data_cond1)[2]
  cond2=(dim(new_data_cond1)[2]+1):dim(new_data)[2]

  # return result
  texp=list(
      texp=new_data,
      cond1=cond1,
      cond2=cond2
    )
  return(texp)
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

newTranscriptExpressionSet=function(gId=gId, texp=texp, biotypes=biotypes, significant_events=significant_events, cond1=cond1, cond2=cond2) {
  # conditions
  conditions=list(cond1=cond1, cond2=cond2)

  # create TranscriptExpressionSet object
  tes=new("TranscriptExpressionSet",
    id=gId,
    conditions=conditions,
    texp=texp,
    biotypes=biotypes,
    significant_events=significant_events
  )

  return(tes)
}

## internal functions
.format_cond=function(cond) {
  x=as.numeric(strsplit(cond, "-")[[1]])
  cond=(x[1]-2):(x[2]-2)
  return(cond)
}

.aggregate_technical_replicates=function(data) {
  new_colnames=unique(colnames(data))
  new_data = data.frame(
          matrix(vector(), length(rownames(data)), length(new_colnames)),
          stringsAsFactors=F)
  colnames(new_data)=new_colnames
  for (replicate in new_colnames) {
          median_exp=apply(data.frame(data[,colnames(data)==replicate]), 1, median)
          new_data[,replicate]=median_exp
  }
  return(new_data)
}