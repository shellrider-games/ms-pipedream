import "coreUtils"
ensureImport "pipeQueue"
ensureImport "pipeQueueDisplay"

clear

upcomingPipes = pipeQueue.create
pipeQueueDisplay.setup upcomingPipes, {"x": 0, "y" : 0}
pipeQueueDisplay.show display(4)


wait 3

print pipeQueueDisplay.pipeSprites.len

upcomingPipes.pullPipe
nextType = upcomingPipes.addPipe
pipeQueueDisplay.nextPipe nextType
