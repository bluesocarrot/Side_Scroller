local game_world = {}

function game_world.loadTiles(self)
	self.tiles = {}
	self.tile_width = 14
	self.tile_height = 14
	self.background_scroll_speed = 0.5
	
	for i=1,4 do
      self.tiles[i], err = love.graphics.newImage( "images/tile"..i..".png" )
	  if err then love.event.quit()
	  end
	end
	
	
	--Discover last load
	
	self.map = {
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
		{ 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 3, 4}, 
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
		{ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2} 
	}
	
	self.background = {0, 0, 1}
	self.camera_position = 0
end

function game_world.draw(self, camera)
	camera:attach()
	-- Draw tiles
	for y, n in ipairs(self.map) do
		for x, m in ipairs(n) do
			tile_type = self.map[y][x]
			self:drawTile(x, y, tile_type)
		end
	end
	
	
	-- Draw background
	camera:detach()
	
	local x,y = camera:position()
	camera:lookAt(x*self.background_scroll_speed, y)
	
	camera:attach()
	
	for num, item in ipairs(self.background) do
		--Pass
	end
	
	for y, n in ipairs(self.map) do
		for x, m in ipairs(n) do
			tile_type = self.map[y][x]
			self:drawTile(x, y+20, tile_type)
		end
	end
	
	camera:detach()
	camera:lookAt(x,y)
end

function game_world.drawTile(self, x, y, tile_type)
	if tile_type ~= nil and tile_type ~= 0 then
		love.graphics.draw(self.tiles[tile_type], x*self.tile_width, y*self.tile_height)
	end
end

return game_world