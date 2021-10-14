local CATEGORY_NAME = "noooooo's stuff"


function ulx.dissolve( calling_ply, target_plys )
	for k, v in ipairs( target_plys ) do
		local dissolveinfo = DamageInfo()
			dissolveinfo:SetDamage(v:Health())
			dissolveinfo:SetAttacker(calling_ply)
			dissolveinfo:SetDamageType( DMG_DISSOLVE )
		if not v:IsValid() or not v:Alive()  then
			ULib.tsayError(calling_ply , 'Couldnt dissolve players(s) please try again later')
		else
			if v.ULXHasGod then 
			v:GodDisable()
			v.ULXHasGod = nil 
		end
			v:TakeDamageInfo(dissolveinfo)
			--v:Kill()
			ulx.fancyLogAdmin(calling_ply , '#A dissolved #T' , target_plys )
		end
	end
end

local dissolve = ulx.command(CATEGORY_NAME, 'ulx dissolve' , ulx.dissolve , '!dissolve' , true)
dissolve:addParam{type=ULib.cmds.PlayersArg}
dissolve:defaultAccess(ULib.ACCESS_ADMIN)
dissolve:help('Dissolves Players')
