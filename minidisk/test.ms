import "coreUtils"
ensureImport "pipeQueue"
ensureImport "pipeQueueDisplay"

upcomingPipes = pipeQueue.create
pipeQueueDisplay.setup upcomingPipes, {"x": 0, "y" : 0}
pipeQueueDisplay.show display(4)