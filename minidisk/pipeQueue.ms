pipeTypes = ["horizontal", "vertical"]

pipeQueue = {}
pipeQueue.size = 5
pipeQueue.pipes = []

pipeQueue.initializePipes = function
    self.pipes = []
    for i in range(0,self.size-1)
        self.pipes.push(floor(rnd * pipeTypes.len))
    end for
end function

pipeQueue.pullPipe = function
    return self.pipes.pull
end function

pipeQueue.addPipe = function
    type = floor(rnd * pipeTypes.len)
    self.pipes.push type
    return type
end function

create = function
    noob = new pipeQueue
    noob.initializePipes
    return noob
end function