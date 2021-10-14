local CATEGORY_NAME = "noooooo's stuff"
function ulx.flashwindow( calling_ply , target_plys )
	for k,v in pairs( target_plys ) do 
		v:SendLua("system.FlashWindow()")
	end
end
local flashwindow = ulx.command(CATEGORY_NAME , 'ulx flashwindow' , ulx.flashwindow , '!flashwindow')
flashwindow:addParam{ type=ULib.cmds.PlayersArg }
flashwindow:defaultAccess( ULib.ACCESS_ADMIN )
flashwindow:help( "flashes window of player(s) only works if they are tabbed out however" )