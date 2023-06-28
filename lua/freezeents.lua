local CATEGORY_NAME = "noooooo's stuff"
function ulx.freezeents(calling_ply)
	local entities = ents.FindByClass("prop_*")
	for k, v in pairs(entities) do
				--if v:IsPlayer() then continue end
				local entPhysObj = v:GetPhysicsObject()
				if entPhysObj:IsValid() and v:IsInWorld()  then
					entPhysObj:EnableMotion(false)
				end
		end
	local entcount = #entities
	ulx.fancyLogAdmin(calling_ply,"#A froze #s entities!",entcount)
end

local freezeents = ulx.command(CATEGORY_NAME, "ulx freezeents", ulx.freezeents, "!freezeents")
freezeents:addParam{type = ULib.cmds.BoolArg, invisible = true}
freezeents:defaultAccess(ULib.ACCESS_ADMIN)
freezeents:help("freeze all entities")