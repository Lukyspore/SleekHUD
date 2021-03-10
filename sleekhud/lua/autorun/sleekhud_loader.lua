include("sleek_hud/sh_config.lua")

if SERVER then	
	resource.AddWorkshop("2260130845")
	AddCSLuaFile("sleek_hud/sh_config.lua")
	AddCSLuaFile("sleek_hud/client/hud_draw.lua")
	AddCSLuaFile("sleek_hud/client/notifications.lua")
elseif CLIENT then

	include("sleek_hud/client/hud_draw.lua")
	include("sleek_hud/client/notifications.lua")
	
end