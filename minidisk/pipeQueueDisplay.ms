ensureImport "qa"
ensureImport "pipeQueue"
ensureImport "listUtil"

pipeImages = [
    file.loadImage("images/pipes/pipeH.png"),
    file.loadImage("images/pipes/pipeV.png")]
imageExtents = {"width": 64, "height" : 64}

pipeSprites = []
pipeCount = 0
origin = {"x" : 0, "y" : 0}
spriteDisplay = {}

setup = function(queue, position)
    qa.assert queue isa pipeQueue.pipeQueue, "Argument 0 needs to be a pipeQueue!"
    qa.assert position isa map and position.hasIndex("x") and position.hasIndex("y"), "Argument 1 needs to be a map containing keys x and y!"
    origin = {"x" : position.x, "y": position.y}
    pipeCount = queue.pipes.len
    for i in range(0, queue.pipes.len-1)
        sprite = new Sprite
        sprite.image = pipeImages[queue.pipes[i]]
        sprite.x = origin.x + imageExtents.width * 0.5
        sprite.y = origin.y + imageExtents.height * 0.5 + imageExtents.height * i
        pipeSprites.push sprite
    end for
end function

nextPipe = function(type)
    old = pipeSprites.pull
    next = new Sprite
    next.image = pipeImages[type]
    next.x = origin.x + imageExtents.width * 0.5
    pipeSprites.push next
    updateYPositions
    spriteDisplay.sprites.removeVal old
    spriteDisplay.sprites.push next
end function

updateYPositions = function
    for i in range(0, pipeSprites.len-1)
        pipeSprites[i].y = origin.y + imageExtents.height * 0.5 + imageExtents.height * i
    end for
end function

show = function(disp)
    qa.assert disp isa SpriteDisplay, "Argument 0 needs to be a SpriteDisplay"
    outer.spriteDisplay = disp
    for pipeSprite in pipeSprites
        spriteDisplay.sprites.push pipeSprite
    end for
end function