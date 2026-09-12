import "qa"

board = {}
board.cols = 10
board.rows = 7
board.grid = []

board.init = function(cols, rows)
    self.cols = cols
    self.rows = rows
    self.grid = []
    
    numberOfCells = cols*rows

    for i in range(1,numberOfCells)
        self.grid.push -1
    end for
end function

board.inBounds = function(x,y)
    return x >= 0 and x < self.cols and y >= 0 and y < self.rows
end function

board.place = function(x,y, type)
    if not self.inBounds(x,y) then return
    self.grid[y*self.cols + x] = type
end function

board.pipeAt = function(x,y)
    if not self.inBounds(x,y) then return -1
    return self.grid[y*self.cols + x]
end function

if(globals == locals) then
    print "Running self test..."
    board.init 10,7
    shouldBeInside = board.inBounds(3,3)
    shouldBeOutside = board.inBounds(10,7)
    qa.assert shouldBeInside, "3/3 should be inside"
    qa.assert not shouldBeOutside, "10/7 should be outside"
    qa.assertEqual board.pipeAt(3,3), -1, "No pipe placed yet at 3/3, pipe code therefore should be -1"
    board.place 3,3,1
    qa.assertEqual board.pipeAt(3,3), 1 , "Just placed pipe type 1 at 3/3, pipe code therefore should be 1"
    print "All OK"
end if