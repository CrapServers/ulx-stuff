local CATEGORY_NAME = "noooooo's stuff"
function ulx.entcount(calling_ply)
	local entities = ents.FindByClass("prop_*")
	local entcount = table.Count(entities)
	ulx.fancyLogAdmin(calling_ply, "#A , there are #s entities on the server.", entcount )
end
local entcount = ulx.command(CATEGORY_NAME, "ulx entcount", ulx.entcount, "!entcount")
entcount:addParam{type=ULib.cmds.BoolArg, invisible=true}
entcount:defaultAccess(ULib.ACCESS_ALL)
entcount:help("counts every entity in the server")