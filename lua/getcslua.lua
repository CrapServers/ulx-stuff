local CATEGORY_NAME = "noooooo's stuff"

local CSLuaRecivePlayer = {}
if SERVER then
	util.AddNetworkString("ulx_getcsluavarcl")
	util.AddNetworkString("ulx_getcsluavarsv")
end
net.Receive("ulx_getcsluavarsv", function()
	local target = CSLuaRecivePlayer[player]
	local convar = net.ReadBool()
	ulx.fancyLogAdmin(true,"#T's CSLua Convar is #s",  target,tostring(convar)) -- i have no idea why but calling true at the start makes this work

end)
function ulx.getcsluavar(calling_ply, target_ply)
	if target_ply:IsBot() then
		ULib.tsayError(calling_ply , "Bots dont have cslua.")
		return
	end
	CSLuaRecivePlayer.player = target_ply
	net.Start("ulx_getcsluavarcl")
	net.Send(target_ply)
	ulx.fancyLogAdmin(calling_ply,"#A sent a request to get #T's CSLua ConVar",target_ply)
end
if CLIENT then
	net.Receive("ulx_getcsluavarcl", function()
		local convar = GetConVar("sv_allowcslua"):GetBool()
		net.Start("ulx_getcsluavarsv")
		net.WriteBool(convar)
		net.SendToServer()
	end)


end
local getcsluaconvar = ulx.command(CATEGORY_NAME,"ulx getcsluaconvar", ulx.getcsluavar,"!getcsluavar")
getcsluaconvar:addParam{type = ULib.cmds.PlayerArg}
getcsluaconvar:defaultAccess(ULib.ACCESS_ADMIN)
getcsluaconvar:help("Sends a request to get the players CSLua convar. (Basically check if they're hacking)")