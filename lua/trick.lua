local CATEGORY_NAME = "noooooo's stuff"
function ulx.trick(calling_ply,target_plys)
	for k,v in pairs(target_plys) do
		v:SendLua([[surface.PlaySound( "no/message.mp3" )]])
	end
	ulx.fancyLogAdmin(calling_ply, "#A tricked #T" , target_plys)

end
local trick = ulx.command(CATEGORY_NAME, "ulx trick", ulx.trick, "!trick")
trick:addParam{type = ULib.cmds.PlayersArg}
trick:defaultAccess(ULib.ACCESS_ADMIN)
trick:help("make a player think they have friends lol") 