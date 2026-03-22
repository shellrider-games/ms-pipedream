import "coreUtils"
ensureImport "pipeQueue"
ensureImport "pipeQueueDisplay"

clear

upcomingPipes = pipeQueue.create
pipeQueueDisplay.setup upcomingPipes, {"x": 0, "y" : 0}
pipeQueueDisplay.show display(4)

wait 3

upcomingPipes.pullPipe
nextType = upcomingPipes.addPipe
pipeQueueDisplay.nextPipe nextType

lastTimestamp = time

while pipeQueueDisplay.animating
    currentTime = time
    delta = currentTime - lastTimestamp
    lastTimestamp = currentTime
    pipeQueueDisplay.update delta
    yield
end while