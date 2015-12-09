Timer = require "hump.timer"
local game_world = require "objects.gameworld"
Camera = require "hump.camera"

world_camera = Camera.new(200, 50)
world_camera:zoom(2)

function love.load()
	game_world:loadTiles()
end


function love.update(dt)
	world_camera:move(0.1,0)
end

function love.draw()
	world_camera:attach()
	game_world:draw()
	world_camera:detach()
end

function love.quit()

end


------ Controls -------

--Exit if we lose focus. Will make it go to the menu later
function love.focus(f)
	if not f then love.event.quit() end
end


------ Helpers -------

function math.round(n, deci) deci = 10^(deci or 0) return math.floor(n*deci+.5)/deci end

function math.multiple(n, size) size = size or 10 return math.round(n/size)*size end