local typeliststack = { }

local stack = { data = { } }

function stack:new()
	local ret = { }
	ret.data = { }
	table.insert(ret.data, { })
	setmetatable(ret, self)
	self.__index = self
	return ret
end

function stack:push_new()
	local new_table = { }
	setmetatable(new_table, { __index = self:top() })
	table.insert(self.data, new_table)
end

function stack:top()
	return self.data[#self.data]
end

function stack:pop()
	table.remove(self.data)
end

function stack:print()
	for i, t in ipairs(self.data) do
		print('level ' .. i)
		for k, v in pairs(self.data[i]) do
			print('', k, v)
		end
	end
end

return { stack = stack }