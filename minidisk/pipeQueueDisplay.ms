ensureImport "qa"
ensureImport "pipeQueue"

pipeImages = [
    file.loadImage("images/pipes/pipeH.png"),
    file.loadImage("images/pipes/pipeV.png")]
imageExtents = {"width": 64, "height" : 64}

pipeSprites = []
origin = {"x" : 0, "y" : 0}

setup = function(queue, position)
    qa.assert queue isa pipeQueue.pipeQueue, "Argument 0 needs to be a pipeQueue!"
    qa.assert position isa map and position.hasIndex("x") and position.hasIndex("y"), "Argument 1 needs to be a map containing keys x and y!"
    origin = {"x" : position.x, "y": position.y}
    for i in range(0, queue.pipes.len-1)
        sprite = new Sprite
        sprite.image = pipeImages[queue.pipes[i]]
        sprite.x = origin.x + imageExtents.width * 0.5
        sprite.y = origin.y + imageExtents.height * 0.5 + imageExtents.height * i
        pipeSprites.push sprite
    end for
end function

show = function(spriteDisplay)
    qa.assert spriteDisplay isa SpriteDisplay, "Argument 0 needs to be a SpriteDisplay"
    for pipeSprite in pipeSprites
        spriteDisplay.sprites.push pipeSprite
    end for
end function