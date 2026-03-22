import "coreUtils"
ensureImport "pipeQueue"
ensureImport "pipeQueueDisplay"

clear

queueOrigin = {"x":106, "y" : 224 }

gfx.drawRect 190, 94, 644, 452, color.orange, 2
gfx.drawRect queueOrigin.x - 2, queueOrigin.y - 2, 68, 324, color.orange, 2

display(2).mode = displayMode.tile
td = display(2)
td.tileSet = file.loadImage("images/test_tiles.png")
td.tileSetTileSize = 64
td.extent = [10, 7]
td.scrollX = -192
td.scrollY = -96

td.clear 0

for row in range(0,6)
    for col in range(0,9)
        cellIdx = (row + col % 2) % 2 + 1
        td.setCell col, row, cellIdx
    end for
end for

upcomingPipes = pipeQueue.create
pipeQueueDisplay.setup upcomingPipes, queueOrigin
pipeQueueDisplay.show display(4)