import "coreUtils"
ensureImport "pipeQueue"
ensureImport "pipeQueueDisplay"

clear

queueOrigin = {"x":106, "y" : 224 }

gfx.drawRect 190, 94, 644, 452, color.orange, 2
gfx.drawRect queueOrigin.x - 2, queueOrigin.y - 2, 68, 324, color.orange, 2

display(2).mode = displayMode.tile
td = display(2)
td.tileSet = file.loadImage("images/tileset.png")
td.tileSetTileSize = 64
td.extent = [10, 7]
td.scrollX = -192
td.scrollY = -96

td.clear 3

upcomingPipes = pipeQueue.create
pipeQueueDisplay.setup upcomingPipes, queueOrigin
pipeQueueDisplay.show display(4)

mouseWasDown = false
lastTimestamp = time

while not key.pressed("escape")
    currentTime = time
    delta = currentTime - lastTimestamp
    lastTimestamp = currentTime
    if not mouseWasDown and mouse.button and not pipeQueueDisplay.animating then
        tileX = floor((mouse.x + td.scrollX)/td.cellSize[0])
        tileY = floor((mouse.y + td.scrollY)/td.cellSize[1])
        if tileX >= 0 and tileX < td.extent[0] and tileY >= 0 and tileY < td.extent[1] then
            type = upcomingPipes.pullPipe
            td.setCell tileX, tileY, type
            nextType = upcomingPipes.addPipe
            pipeQueueDisplay.nextPipe nextType
        end if
    end if
    pipeQueueDisplay.update delta
    mouseWasDown = mouse.button
    yield
end while
key.clear
reset
clear