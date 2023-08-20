local CATEGORY_NAME = "noooooo's stuff"

function ulx.dissolve( calling_ply, target_plys )
	local died = {}
	for k, v in ipairs( target_plys ) do
		local dissolveinfo = DamageInfo()
			dissolveinfo:SetDamage(v:Health())
			dissolveinfo:SetAttacker(calling_ply) -- setting the attacker to the admin cause without it some addons break
			dissolveinfo:SetDamageType(DMG_DISSOLVE)
		if not v:IsValid() or not v:Alive()  then
			ULib.tsayError(calling_ply , "Couldnt dissolve player(s) please try again later")
		else
			if v.ULXHasGod then
				v:GodDisable()
				v.ULXHasGod = nil
			end
			v:TakeDamageInfo(dissolveinfo)
			table.insert(died, v)
		end
	end
	ulx.fancyLogAdmin(calling_ply , "#A dissolved #T" , died )
end

local dissolve = ulx.command(CATEGORY_NAME, "ulx dissolve" , ulx.dissolve , "!dissolve" , true)
dissolve:addParam{type = ULib.cmds.PlayersArg}
dissolve:defaultAccess(ULib.ACCESS_ADMIN)
dissolve:help("Dissolves Players")

function ulx.entcount(calling_ply)
	local entities = ents.FindByClass("prop_*")
	local entcount = table.Count(entities)
	ulx.fancyLogAdmin(calling_ply, "#A , there are #s entities on the server.", entcount )
end

local entcount = ulx.command(CATEGORY_NAME, "ulx entcount", ulx.entcount, "!entcount")
entcount:addParam{type = ULib.cmds.BoolArg, invisible = true}
entcount:defaultAccess(ULib.ACCESS_ALL)
entcount:help("counts every entity in the server")

function ulx.flashwindow( calling_ply , target_plys )
	for k,v in pairs( target_plys ) do
		v:SendLua("system.FlashWindow()")
	end
end

local flashwindow = ulx.command(CATEGORY_NAME , "ulx flashwindow" , ulx.flashwindow , "!flashwindow")
flashwindow:addParam{ type = ULib.cmds.PlayersArg }
flashwindow:defaultAccess( ULib.ACCESS_ADMIN )
flashwindow:help( "flashes window of player(s) only works if they are tabbed out however" )
function ulx.freezeents(calling_ply)
	local entities = ents.FindByClass("prop_*")
	for k, v in pairs(entities) do
				local entPhysObj = v:GetPhysicsObject()
				if entPhysObj:IsValid() and v:IsInWorld()  then
					entPhysObj:EnableMotion(false)
				end
		end
	ulx.fancyLogAdmin(calling_ply,"#A froze #s entities!", #entities)
end

local freezeents = ulx.command(CATEGORY_NAME, "ulx freezeents", ulx.freezeents, "!freezeents")
freezeents:addParam{type = ULib.cmds.BoolArg, invisible = true}
freezeents:defaultAccess(ULib.ACCESS_ADMIN)
freezeents:help("freeze all entities")

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


