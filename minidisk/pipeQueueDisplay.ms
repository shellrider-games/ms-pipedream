ensureImport "qa"
ensureImport "pipeQueue"
ensureImport "listUtil"
ensureImport "mathUtil"

pipeImages = [
    file.loadImage("images/pipes/pipeH.png"),
    file.loadImage("images/pipes/pipeV.png")]
imageExtents = {"width": 64, "height" : 64}
animationTime = 0.25

pipeSprites = []
pipeCount = 0
origin = {"x" : 0, "y" : 0}
spriteDisplay = {}

animating = false
currentAnimationTimer = 0

setup = function(queue, position)
    qa.assert queue isa pipeQueue.pipeQueue, "Argument 0 needs to be a pipeQueue!"
    qa.assert position isa map and position.hasIndex("x") and position.hasIndex("y"), "Argument 1 needs to be a map containing keys x and y!"
    outer.origin = {"x" : position.x, "y": position.y}
    outer.pipeCount = queue.pipes.len
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
    spriteDisplay.sprites.removeVal old
    next = new Sprite
    next.image = pipeImages[type]
    next.x = origin.x + imageExtents.width * 0.5
    next.y = origin.y + imageExtents.height * (0.5 + pipeCount)
    pipeSprites.push next
    spriteDisplay.sprites.push next
    updateYPositions
end function

updateYPositions = function
    outer.animating = true
    outer.currentAnimationTimer = animationTime
end function

update = function(delta)
    if not animating then return
    outer.currentAnimationTimer = mathUtil.max(0, currentAnimationTimer - delta)
    for i in range(0, pipeCount-1)
        pipeSprites[i].y = origin.y + imageExtents.height * (0.5 + i) + imageExtents.height * currentAnimationTimer/animationTime 
    end for
    outer.animating = currentAnimationTimer > 0
end function

show = function(disp)
    qa.assert disp isa SpriteDisplay, "Argument 0 needs to be a SpriteDisplay"
    outer.spriteDisplay = disp
    for pipeSprite in pipeSprites
        spriteDisplay.sprites.push pipeSprite
    end for
end function