local Scrw, Scrh = ScrW(), ScrH()

surface.CreateFont("sleekHUD50", {font = "Montserrat ExtraBold",    size = Scrw*0.0255,     weight = 500})
surface.CreateFont("sleekHUD40", {font = "Montserrat ExtraBold",    size = Scrw*0.0205,     weight = 500})
surface.CreateFont("sleekHUD30", {font = "Montserrat ExtraBold",    size = Scrw*0.0155,     weight = 500})
surface.CreateFont("sleekHUD28", {font = "Montserrat ExtraBold",    size = Scrw*0.0145,     weight = 500})
surface.CreateFont("sleekHUD26", {font = "Montserrat ExtraBold",    size = Scrw*0.0135,     weight = 500})
surface.CreateFont("sleekHUD24", {font = "Montserrat ExtraBold",    size = Scrw*0.0125,     weight = 500})
surface.CreateFont("sleekHUD22", {font = "Montserrat ExtraBold",    size = Scrw*0.0135,     weight = 500})
surface.CreateFont("sleekHUD20", {font = "Montserrat ExtraBold",    size = Scrw*0.0105,     weight = 500})

hook.Add( "OnScreenSizeChanged", "OnScreenSizeChanged_ChnageFont", function()
Scrw, Scrh = ScrW(), ScrH()
surface.CreateFont("sleekHUD50", {font = "Montserrat ExtraBold",    size = Scrw*0.0255,     weight = 500})
surface.CreateFont("sleekHUD40", {font = "Montserrat ExtraBold",    size = Scrw*0.0205,     weight = 500})
surface.CreateFont("sleekHUD30", {font = "Montserrat ExtraBold",    size = Scrw*0.0155,     weight = 500})
surface.CreateFont("sleekHUD28", {font = "Montserrat ExtraBold",    size = Scrw*0.0145,     weight = 500})
surface.CreateFont("sleekHUD26", {font = "Montserrat ExtraBold",    size = Scrw*0.0135,     weight = 500})
surface.CreateFont("sleekHUD24", {font = "Montserrat ExtraBold",    size = Scrw*0.0125,     weight = 500})
surface.CreateFont("sleekHUD22", {font = "Montserrat ExtraBold",    size = Scrw*0.0135,     weight = 500})
surface.CreateFont("sleekHUD20", {font = "Montserrat ExtraBold",    size = Scrw*0.0105,     weight = 500})
end)

local SleekHUdheart = Material("sleekhud/heart.png")
local SleekHUDarmor = Material("sleekhud/armor.png")
local SleekHUDdollar = Material("sleekhud/dollar.png")
local SleekHUDfood = Material("sleekhud/food.png")
local SleekHUDammo = Material("sleekhud/ammo.png")
local SleekHUDbriefcase = Material("sleekhud/briefcase.png")
local SleekHUDblock = Material("sleekhud/block.png")
local SleekHUDgunlicense = Material("sleekhud/gunlicense.png")
local SleekHUdheart_12 = Material("sleekhud/heart_16.png")

local MoneyLerped = 0
local SalaryLerped = 0

local DarkGreyColor = Color(33, 33, 33,255)
local LightGreyColor = Color(33, 33, 33,200)
local WhiteColor = Color(255, 255, 255, 255)
local DarkGreyTransparentColor = Color(33, 33, 33,100)
local HealthRedColor = Color(237, 41, 57,255)
local ArmorBlueColor = Color(15, 82, 186,255)
local HungerBrownColor = Color(153, 102, 0,255)
local MoneyGreenColor = Color(59, 177, 67, 255)

	local smoothhealth = 100
	local smoothhealthOverhead = 100
	local smootharmor = 100
	local smoothhunger = 100
	local maxprops = GetConVar("sbox_maxprops"):GetInt()

	local hideHUDElements = {
    ["CHudAmmo"] = true,
	["DarkRP_Agenda"] = true,
	["DarkRP_ArrestedHUD"] = true,
	["DarkRP_EntityDisplay"] = true,
	["DarkRP_HUD"] = true,
	["DarkRP_Hungermod"] = true,
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_LockdownHUD"] = true
}

hook.Add("HUDShouldDraw", "SleekHUDHideHUD", function(name)
    if hideHUDElements[name] then return false end
end)

hook.Add( "Initialize", "some_unique_name", function()
	MsgC(Color(66, 139, 202), "[SleekHUD] ", Color(210, 210, 210), "Loaded SleekHUD by ","Lukyspore ","(STEAM_0:1:45109369)\n")
end )



	local function BottomLeft_armor_hunger()
	local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local armor = ply:Armor()
	local maxarmor = ply:GetMaxArmor()
	local hunger = ply:getDarkRPVar("Energy")
	local boxW = Scrw * .1
	local boxH = Scrh * .01

	local iconW = Scrw * .0125
	local iconH = Scrh * .0223

	smoothhealth = Lerp(10 * FrameTime(),smoothhealth,hp)
	smootharmor = Lerp(10 * FrameTime(),smootharmor,armor)

	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 17.5, boxW * 1.8, boxH * 16, LightGreyColor,false,false,true,true )
	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 21, boxW * 1.8, boxH * 3.5, DarkGreyColor,true,true,false,false )

	draw.SimpleText(ply:getDarkRPVar("rpname"),"sleekHUD28", Scrw * .01, Scrh * .792,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(ply:getDarkRPVar("job"),"sleekHUD26", Scrw * .03, Scrh * .828,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 13.4, boxW*1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 13.4, smoothhealth * (Scrw * .0013), boxH, HealthRedColor )

	surface.SetMaterial( SleekHUdheart )
	surface.SetDrawColor( 237, 41, 57, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.86, iconW, iconH )

	surface.SetMaterial( SleekHUDbriefcase )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.83, iconW, iconH )

	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, boxW * 1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, smootharmor * (Scrw * .0013), boxH, ArmorBlueColor )

	surface.SetMaterial( SleekHUDarmor )
	surface.SetDrawColor( 15, 82, 186, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.89, iconW, iconH )

	smoothhunger = Lerp(10 * FrameTime(),smoothhunger,hunger)

	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 7.4, boxW * 1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 7.4,smoothhunger * (Scrw * .0013), boxH, HungerBrownColor )

	surface.SetMaterial( SleekHUDfood )
	surface.SetDrawColor( 153, 102, 0, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.92, iconW, iconH )

end

local function BottomLeft_GunLicense_hunger_armor()
	local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local armor = ply:Armor()
	local maxarmor = ply:GetMaxArmor()
	local hunger = ply:getDarkRPVar("Energy")
	local boxW = Scrw * .1
	local boxH = Scrh * .01

	local iconW = Scrw * .0125
	local iconH = Scrh * .0223

	smoothhealth = Lerp(10 * FrameTime(),smoothhealth,hp)
	smootharmor = Lerp(10 * FrameTime(),smootharmor,armor)

	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 21, boxW * 1.8, boxH * 19.5, LightGreyColor,false,false,true,true )
	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 24.5, boxW * 1.8, boxH * 3.5, DarkGreyColor,true,true,false,false )

	draw.SimpleText(ply:getDarkRPVar("rpname"),"sleekHUD28", Scrw * .01, Scrh * .756,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(ply:getDarkRPVar("job"),"sleekHUD26", Scrw * .03, Scrh * .799,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 16.4, boxW*1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 16.4, smoothhealth * (Scrw * .0013), boxH, HealthRedColor )

	surface.SetMaterial( SleekHUdheart )
	surface.SetDrawColor( 237, 41, 57, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.83, iconW, iconH )

	surface.SetMaterial( SleekHUDbriefcase )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.8, iconW, iconH )

	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 13.4, boxW * 1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 13.4, smootharmor * (Scrw * .0013), boxH, ArmorBlueColor )

	surface.SetMaterial( SleekHUDarmor )
	surface.SetDrawColor( 15, 82, 186, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.86, iconW, iconH )

	smoothhunger = Lerp(10 * FrameTime(),smoothhunger,hunger)

	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, boxW * 1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4,smoothhunger * (Scrw * .0013), boxH, HungerBrownColor )

	surface.SetMaterial( SleekHUDfood )
	surface.SetDrawColor( 153, 102, 0, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.89, iconW, iconH )

	surface.SetMaterial( SleekHUDgunlicense )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.92, iconW, iconH )

	if ply:getDarkRPVar("HasGunlicense") == true then
		gunlicense = "Yes"

	else 
		gunlicense = "No"
	end

	draw.SimpleText(gunlicense,"sleekHUD26", Scrw * .03, Scrh * .919,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end

local function BottomLeft_hunger()
	local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local armor = ply:Armor()
	local maxarmor = ply:GetMaxArmor()
	local hunger = ply:getDarkRPVar("Energy")
	local boxW = Scrw * .1
	local boxH = Scrh * .01

	local iconW = Scrw * .0125
	local iconH = Scrh * .0223

	smoothhealth = Lerp(10 * FrameTime(),smoothhealth,hp)

	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 14.3, boxW * 1.8, boxH * 12.8, LightGreyColor,false,false,true,true )
	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 17.8, boxW * 1.8, boxH * 3.5, DarkGreyColor,true,true,false,false )

	draw.SimpleText(ply:getDarkRPVar("rpname"),"sleekHUD28", Scrw * .01, Scrh * .825,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(ply:getDarkRPVar("job"),"sleekHUD26", Scrw * .03, Scrh * .858,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, boxW *1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, smoothhealth * (Scrw * .0013), boxH, HealthRedColor )

	surface.SetMaterial( SleekHUdheart )
	surface.SetDrawColor( 237, 41, 57,255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.89, iconW, iconH )

	surface.SetMaterial( SleekHUDbriefcase )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.86, iconW, iconH )

	smoothhunger = Lerp(10 * FrameTime(),smoothhunger,hunger)

	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 7.4, boxW * 1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 7.4, smoothhunger * (Scrw * .0013), boxH, HungerBrownColor )

	surface.SetMaterial( SleekHUDfood )
	surface.SetDrawColor( 153, 102, 0, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.92, iconW, iconH )
end

local function BottomLeft_GunLicense_hunger()
	local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local armor = ply:Armor()
	local maxarmor = ply:GetMaxArmor()
	local hunger = ply:getDarkRPVar("Energy")
	local boxW = Scrw * .1
	local boxH = Scrh * .01

	local iconW = Scrw * .0125
	local iconH = Scrh * .0223

	smoothhealth = Lerp(10 * FrameTime(),smoothhealth,hp)

	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 17.5, boxW * 1.8, boxH * 16, LightGreyColor,false,false,true,true )
	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 21, boxW * 1.8, boxH * 3.5, DarkGreyColor,true,true,false,false )

	draw.SimpleText(ply:getDarkRPVar("rpname"),"sleekHUD28", Scrw * .01, Scrh * .792,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(ply:getDarkRPVar("job"),"sleekHUD26", Scrw * .03, Scrh * .828,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 13.4, boxW *1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 13.4, smoothhealth * (Scrw * .0013), boxH, HealthRedColor )

	surface.SetMaterial( SleekHUdheart )
	surface.SetDrawColor( 237, 41, 57,255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.86, iconW, iconH )

	surface.SetMaterial( SleekHUDbriefcase )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.83, iconW, iconH )

	smoothhunger = Lerp(10 * FrameTime(),smoothhunger,hunger)

	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, boxW * 1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, smoothhunger * (Scrw * .0013), boxH, HungerBrownColor )

	surface.SetMaterial( SleekHUDfood )
	surface.SetDrawColor( 153, 102, 0, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.89, iconW, iconH )

	surface.SetMaterial( SleekHUDgunlicense )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.92, iconW, iconH )

	if ply:getDarkRPVar("HasGunlicense") == true then
		gunlicense = "Yes"

	else 
		gunlicense = "No"
	end

	draw.SimpleText(gunlicense,"sleekHUD26", Scrw * .03, Scrh * .919,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end

local function BottomLeft_armor()
	local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local armor = ply:Armor()
	local maxarmor = ply:GetMaxArmor()
	local hunger = ply:getDarkRPVar("Energy")
	local boxW = Scrw * .1
	local boxH = Scrh * .01

	local iconW = Scrw * .0125
	local iconH = Scrh * .0223

	smoothhealth = Lerp(10 * FrameTime(),smoothhealth,hp)
	smootharmor = Lerp(10 * FrameTime(),smootharmor,armor)
	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 14.3, boxW * 1.8, boxH * 12.8, LightGreyColor,false,false,true,true )
	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 17.8, boxW * 1.8, boxH * 3.5, DarkGreyColor,true,true,false,false )
	draw.SimpleText(ply:getDarkRPVar("rpname"),"sleekHUD28", Scrw * .01, Scrh * .825,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(ply:getDarkRPVar("job"),"sleekHUD26", Scrw * .03, Scrh * .858,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, boxW *1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, smoothhealth * (Scrw * .0013), boxH, HealthRedColor )

	surface.SetMaterial( SleekHUdheart )
	surface.SetDrawColor( 237, 41, 57,255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.89, iconW, iconH )

	surface.SetMaterial( SleekHUDbriefcase )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.86, iconW, iconH )

	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 7.4, boxW * 1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 7.4, smootharmor * (Scrw * .0013), boxH, ArmorBlueColor )

	surface.SetMaterial( SleekHUDarmor )
	surface.SetDrawColor( 15, 82, 186, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.92, iconW, iconH )
end

local function BottomLeft_GunLicense_armor()
		local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local armor = ply:Armor()
	local maxarmor = ply:GetMaxArmor()
	local hunger = ply:getDarkRPVar("Energy")
	local boxW = Scrw * .1
	local boxH = Scrh * .01

	local iconW = Scrw * .0125
	local iconH = Scrh * .0223

	smoothhealth = Lerp(10 * FrameTime(),smoothhealth,hp)
	smootharmor = Lerp(10 * FrameTime(),smootharmor,armor)
	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 17.5, boxW * 1.8, boxH * 16, LightGreyColor,false,false,true,true )
	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 21, boxW * 1.8, boxH * 3.5, DarkGreyColor,true,true,false,false )

	draw.SimpleText(ply:getDarkRPVar("rpname"),"sleekHUD28", Scrw * .01, Scrh * .792,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(ply:getDarkRPVar("job"),"sleekHUD26", Scrw * .03, Scrh * .828,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 13.4, boxW *1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 13.4, smoothhealth * (Scrw * .0013), boxH, HealthRedColor )

	surface.SetMaterial( SleekHUdheart )
	surface.SetDrawColor( 237, 41, 57,255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.86, iconW, iconH )

	surface.SetMaterial( SleekHUDbriefcase )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.83, iconW, iconH )

	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, boxW * 1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, smootharmor * (Scrw * .0013), boxH, ArmorBlueColor )

	surface.SetMaterial( SleekHUDarmor )
	surface.SetDrawColor( 15, 82, 186, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.89, iconW, iconH )

	surface.SetMaterial( SleekHUDgunlicense )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.92, iconW, iconH )

	if ply:getDarkRPVar("HasGunlicense") == true then
		gunlicense = "Yes"

	else 
		gunlicense = "No"
	end

	draw.SimpleText(gunlicense,"sleekHUD26", Scrw * .03, Scrh * .919,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end

local function BottomLeft()
	local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local armor = ply:Armor()
	local maxarmor = ply:GetMaxArmor()
	local hunger = ply:getDarkRPVar("Energy")
	local boxW = Scrw * .1
	local boxH = Scrh * .01

	local iconW = Scrw * .0127
	local iconH = Scrh * .0227

	local gunlicense

	smoothhealth = Lerp(10 * FrameTime(),smoothhealth,hp)

	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 11.7, boxW * 1.8, boxH * 10.5, LightGreyColor,false,false,true,true )
	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 15, boxW * 1.8, boxH * 3.5, DarkGreyColor,true,true,false,false )

	draw.SimpleText(ply:getDarkRPVar("rpname"),"sleekHUD28", Scrw * .01, Scrh * .852,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(ply:getDarkRPVar("job"),"sleekHUD26", Scrw * .03, Scrh * .888,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 7.4, boxW * 1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 7.4, smoothhealth * (Scrw * .0013), boxH, HealthRedColor )

	surface.SetMaterial( SleekHUdheart )
	surface.SetDrawColor( 237, 41, 57, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.92, iconW, iconH )

	surface.SetMaterial( SleekHUDbriefcase )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.89, iconW, iconH )
end

local function BottomLeft_GunLicense()
	local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local armor = ply:Armor()
	local maxarmor = ply:GetMaxArmor()
	local hunger = ply:getDarkRPVar("Energy")
	local boxW = Scrw * .1
	local boxH = Scrh * .01

	local iconW = Scrw * .0127
	local iconH = Scrh * .0227

	local gunlicense

	smoothhealth = Lerp(10 * FrameTime(),smoothhealth,hp)

	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 14.3, boxW * 1.8, boxH * 12.8, LightGreyColor,false,false,true,true )
	draw.RoundedBoxEx( 14, Scrw * .0525 - boxW / 2, Scrh - boxH * 17.8, boxW * 1.8, boxH * 3.5, DarkGreyColor,true,true,false,false )

	draw.SimpleText(ply:getDarkRPVar("rpname"),"sleekHUD28", Scrw * .01, Scrh * .825,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(ply:getDarkRPVar("job"),"sleekHUD26", Scrw * .03, Scrh * .858,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, boxW * 1.3, boxH, DarkGreyTransparentColor )
	draw.RoundedBox( 6, Scrw * .08 - boxW / 2, Scrh - boxH * 10.4, smoothhealth * (Scrw * .0013), boxH, HealthRedColor )

	surface.SetMaterial( SleekHUdheart )
	surface.SetDrawColor( 237, 41, 57, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.89, iconW, iconH )

	surface.SetMaterial( SleekHUDbriefcase )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.86, iconW, iconH )

	surface.SetMaterial( SleekHUDgunlicense )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.92, iconW, iconH )

	if ply:getDarkRPVar("HasGunlicense") == true then
		gunlicense = "Yes"

	else 
		gunlicense = "No"
	end

	draw.SimpleText(gunlicense,"sleekHUD26", Scrw * .03, Scrh * .918,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end

local function DrawAmmo()
	local iconW = Scrw * .0125
	local iconH = Scrh * .0223
	if IsValid(LocalPlayer():GetActiveWeapon()) then 
        local mag_extra = LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType())
        local ammo = (math.max((LocalPlayer():GetActiveWeapon():Clip1()), 0)) .. " / " .. mag_extra

        if ammo != "0 / 0" then
            surface.SetMaterial( SleekHUDammo )
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.DrawTexturedRect( Scrw * 0.115, Scrh * 0.95, iconW, iconH )

            draw.SimpleText(ammo, "sleekHUD26", Scrw * .145, Scrh * .9485, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
        end
    end
end

local function DrawLockDown()

    local LockDown = GetGlobalBool("DarkRP_LockDown")

	if not LockDown then return end

	surface.SetFont("sleekHUD28")
	local LockDownText = DarkRP.textWrap(DarkRP.getPhrase("lockdown_started"):gsub("\\n", "\n"), "sleekHUD28", 715)
	local LockDownWidth, LockDownHeight = surface.GetTextSize(LockDownText)

	draw.RoundedBox(14, (Scrw * 0.5) - (LockDownWidth * 0.45), Scrh *0.01, LockDownWidth * 0.9, LockDownHeight + 16, Color(30,30,30,200))
	draw.DrawText(LockDownText, "sleekHUD24", (Scrw * 0.53) - (LockDownWidth * 0.5), Scrh *0.018, Color(255,255,255,255))
end

local function DrawAgenda()
	local Agenda = LocalPlayer():getAgendaTable()
	local ply = LocalPlayer()

	if not Agenda then return end

	local AgendaTitle = Agenda.Title
	local AgendaText = DarkRP.textWrap((ply:getDarkRPVar("agenda") or ""):gsub("\\n", "\n"), "sleekHUD28", 490)

		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.0085, Scrw * 0.243, Scrh * 0.036, Color(33,33,33,255), true, true, false, false)
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.044, Scrw * 0.243, Scrh * 0.12, Color(33,33,33,200), false, false, true, true)
		draw.SimpleText(AgendaTitle, "sleekHUD28", Scrw * 0.007, Scrh * 0.01, Color(255,255,255,255))
		draw.DrawText(AgendaText, "sleekHUD24", Scrw * 0.007, Scrh * 0.045, Color(255,255,255,255))
end

local remJailTime
local function DrawArrest()
	if (LocalPlayer():getDarkRPVar("Arrested") && SleekHUD.ShowArrestBox == true) then
	local ply = LocalPlayer()
	local boxW = Scrw * .1
	local boxH = Scrh * .01
	 if (!remJailTime) then
            remJailTime = CurTime() + (GAMEMODE.Config.jailtimer or 120)
        end

	if SleekHUD.ShowGunLicense == false then
    if (SleekHUD.ShowArmor == true && DarkRP.disabledDefaults["modules"]["hungermod"] == true) then
        draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.741, boxW * 1.8, boxH * 3.5, Color(33,33,33,255), true, true, false, false)
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.776, boxW * 1.8, boxH * 3.5, Color(33,33,33,200), false, false, true, true)
		draw.SimpleText(SleekHUD.LanguageSet.Text05, "sleekHUD28", Scrw * 0.0925, Scrh * 0.742, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.DrawText(math.max(math.floor(remJailTime - CurTime()), 0) .. "" .. SleekHUD.LanguageSet.Text06, "sleekHUD24", Scrw * 0.0925, Scrh * 0.776, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	elseif SleekHUD.ShowArmor == false && DarkRP.disabledDefaults["modules"]["hungermod"] == true  then
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.771, boxW * 1.8, boxH * 3.5, Color(33,33,33,255), true, true, false, false)
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.806, boxW * 1.8, boxH * 3.5, Color(33,33,33,200), false, false, true, true)
		draw.SimpleText(SleekHUD.LanguageSet.Text05, "sleekHUD28", Scrw * 0.0925, Scrh * 0.772, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.DrawText(math.max(math.floor(remJailTime - CurTime()), 0) .. "" .. SleekHUD.LanguageSet.Text06, "sleekHUD24", Scrw * 0.0925, Scrh * 0.81, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	elseif SleekHUD.ShowArmor == false && DarkRP.disabledDefaults["modules"]["hungermod"] == false  then
        draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.741, boxW * 1.8, boxH * 3.5, Color(33,33,33,255), true, true, false, false)
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.776, boxW * 1.8, boxH * 3.5, Color(33,33,33,200), false, false, true, true)
		draw.SimpleText(SleekHUD.LanguageSet.Text05, "sleekHUD28", Scrw * 0.0925, Scrh * 0.742, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.DrawText(math.max(math.floor(remJailTime - CurTime()), 0) .. "" .. SleekHUD.LanguageSet.Text06, "sleekHUD24", Scrw * 0.0925, Scrh * 0.776, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	elseif SleekHUD.ShowArmor == true && DarkRP.disabledDefaults["modules"]["hungermod"] == false  then
        draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.711, boxW * 1.8, boxH * 3.5, Color(33,33,33,255), true, true, false, false)
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.746, boxW * 1.8, boxH * 3.5, Color(33,33,33,200), false, false, true, true)
		draw.SimpleText(SleekHUD.LanguageSet.Text05, "sleekHUD28", Scrw * 0.0925, Scrh * 0.712, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.DrawText(math.max(math.floor(remJailTime - CurTime()), 0) .. "" .. SleekHUD.LanguageSet.Text06, "sleekHUD24", Scrw * 0.0925, Scrh * 0.746, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    else
        remJailTime = nil
	end
end

    if SleekHUD.ShowGunLicense == true then
    	if (SleekHUD.ShowArmor == true && DarkRP.disabledDefaults["modules"]["hungermod"] == true) then
        draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.706, boxW * 1.8, boxH * 3.5, Color(33,33,33,255), true, true, false, false)
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.741, boxW * 1.8, boxH * 3.5, Color(33,33,33,200), false, false, true, true)
		draw.SimpleText(SleekHUD.LanguageSet.Text05, "sleekHUD28", Scrw * 0.0925, Scrh * 0.706, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.DrawText(math.max(math.floor(remJailTime - CurTime()), 0) .. "" .. SleekHUD.LanguageSet.Text06, "sleekHUD24", Scrw * 0.0925, Scrh * 0.741, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	elseif SleekHUD.ShowArmor == false && DarkRP.disabledDefaults["modules"]["hungermod"] == true  then
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.741, boxW * 1.8, boxH * 3.5, Color(33,33,33,255), true, true, false, false)
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.771, boxW * 1.8, boxH * 3.5, Color(33,33,33,200), false, false, true, true)
		draw.SimpleText(SleekHUD.LanguageSet.Text05, "sleekHUD28", Scrw * 0.0925, Scrh * 0.741, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.DrawText(math.max(math.floor(remJailTime - CurTime()), 0) .. "" .. SleekHUD.LanguageSet.Text06, "sleekHUD24", Scrw * 0.0925, Scrh * 0.776, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	elseif SleekHUD.ShowArmor == false && DarkRP.disabledDefaults["modules"]["hungermod"] == false  then
        draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.706, boxW * 1.8, boxH * 3.5, Color(33,33,33,255), true, true, false, false)
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.741, boxW * 1.8, boxH * 3.5, Color(33,33,33,200), false, false, true, true)
		draw.SimpleText(SleekHUD.LanguageSet.Text05, "sleekHUD28", Scrw * 0.0925, Scrh * 0.706, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.DrawText(math.max(math.floor(remJailTime - CurTime()), 0) .. "" .. SleekHUD.LanguageSet.Text06, "sleekHUD24", Scrw * 0.0925, Scrh * 0.741, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	elseif SleekHUD.ShowArmor == true && DarkRP.disabledDefaults["modules"]["hungermod"] == false  then
        draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.676, boxW * 1.8, boxH * 3.5, Color(33,33,33,255), true, true, false, false)
		draw.RoundedBoxEx(14, Scrw * 0.0025, Scrh * 0.711, boxW * 1.8, boxH * 3.5, Color(33,33,33,200), false, false, true, true)
		draw.SimpleText(SleekHUD.LanguageSet.Text05, "sleekHUD28", Scrw * 0.0925, Scrh * 0.676, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.DrawText(math.max(math.floor(remJailTime - CurTime()), 0) .. "" .. SleekHUD.LanguageSet.Text06, "sleekHUD24", Scrw * 0.0925, Scrh * 0.711, Color(255,255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		else
        remJailTime = nil
	end

end

end

end

local function DrawWanted()
	local ply = LocalPlayer()
	local boxW = Scrw * .1
	local boxH = Scrh * .01

	local isWanted = ply:getDarkRPVar("wanted")

	if isWanted then 

	local WantedText = DarkRP.textWrap((ply:getDarkRPVar("wantedReason") or ""):gsub("\\n", "\n"), "sleekHUD24", 490)

		draw.RoundedBox(14, Scrw * 0.5 - (boxW * 3 / 2), Scrh *0.07, boxW * 3, boxH * 8, Color(30,30,30,200))
		draw.SimpleText(SleekHUD.LanguageSet.Text01, "sleekHUD40", Scrw * 0.47, Scrh *0.07, Color( 237, 41, 57, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		draw.DrawText(SleekHUD.LanguageSet.Text02..WantedText, "sleekHUD24", Scrw * 0.5, Scrh *0.105, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	end

end

function MoneyThink()
	local curmoney = LocalPlayer():getDarkRPVar("money") or 0
	local cursalary = LocalPlayer():getDarkRPVar("salary") or 0

	if MoneyLerped != curmoney then

		MoneyLerped = Lerp(FrameTime() * 8,MoneyLerped,curmoney)
	end

	if SalaryLerped != cursalary then

		SalaryLerped = Lerp(FrameTime() * 8,SalaryLerped,cursalary)
	end
end
hook.Add("Think", "MoneyThink", MoneyThink)

local function DrawMoney()
	local ply = LocalPlayer()
	local iconW = Scrw * .0125
	local iconH = Scrh * .02223

	surface.SetMaterial( SleekHUDdollar )
	surface.SetDrawColor( 59, 177, 67, 255 )
	surface.DrawTexturedRect( Scrw * 0.01, Scrh * 0.95, iconW, iconH )
	draw.SimpleText(math.Round(MoneyLerped).." (+"..math.Round(SalaryLerped)..")","sleekHUD26", Scrw * .029, Scrh * .9485,Color( 59, 177, 67, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end

local function DrawPhysgunProps()
	if SleekHUD.ShowPropCount == false then return end

	local ply = LocalPlayer()
	local boxW = Scrw * .1
	local boxH = Scrh * .01
	local spawnedprops = ply:GetCount( "props",0 )
	local iconW = Scrw * .0125
	local iconH = Scrh * .02223
	local boxW = Scrw * .1
	local boxH = Scrh * .01

		draw.RoundedBoxEx( 14, Scrw * 0.876, Scrh * 0.9, boxW * 1.2, boxH * 8.51,Color(33,33,33,200),false,false,true,true )
		draw.RoundedBoxEx( 14, Scrw * 0.876, Scrh * 0.865, boxW* 1.2, boxH * 3.5,Color(33,33,33,255),true,true,false,false )
		draw.SimpleText(SleekHUD.LanguageSet.Text03,"sleekHUD26",Scrw * 0.897, Scrh * 0.87,Color( 255, 255, 255, 255 ),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		surface.SetMaterial( SleekHUDblock )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect( Scrw * 0.881, Scrh * 0.872, iconW, iconH )
		draw.SimpleText(SleekHUD.LanguageSet.Text04..spawnedprops.." / "..math.Round(GetConVar("sbox_maxprops"):GetInt()),"sleekHUD26",Scrw * 0.935, Scrh * 0.92,Color( 255, 255, 255, 255 ),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		maxprops = Lerp(10 * FrameTime(),maxprops,spawnedprops)
		draw.RoundedBox( 6, Scrw * 0.88,Scrh * 0.94, boxW* 1.1, boxH,DarkGreyTransparentColor)
		draw.RoundedBox( 6, Scrw * 0.88,Scrh * 0.94, maxprops* (Scrw * .0013), boxH,Color(59, 177, 67,255))


end

local function SleekDrawEntityDisplay()
	local ShootPos = LocalPlayer():GetShootPos()
	local AimVector = LocalPlayer():GetAimVector()
	local iconW = Scrw * .0125
	local iconH = Scrh * .02223
	local iconW2 = Scrw * .0085
	local iconH2 = Scrh * .01482
	local boxW = Scrw * .1
	local boxH = Scrh * .005
	local gunlicense

	for k, ply in pairs(player.GetAll()) do
		if ply == LocalPlayer() or not ply:Alive() or ply:GetNoDraw() then continue end
		local PlyShootPos = ply:GetShootPos()

		if PlyShootPos:DistToSqr(ShootPos) < 104000 then
			local Pos = PlyShootPos - ShootPos
			local Units = Pos:GetNormalized()

			if Units:Dot(AimVector) > 0.95 then
				local Trace = util.QuickTrace(ShootPos, Pos, LocalPlayer())

				if Trace.Hit and Trace.Entity ~= ply then return end

				local EyePos = ply:EyePos()
				Pos = (EyePos + Vector(0, 0, 5)):ToScreen()
				Pos.y = Pos.y - 120

				if SleekHUD.ShowOverhead == true then
					if LocalPlayer():getDarkRPVar("HasGunlicense") && SleekHUD.ShowGunLicenseOverhead == true then
						surface.SetMaterial(SleekHUDgunlicense)
						surface.SetDrawColor(255,255,255,255)
						surface.DrawTexturedRect(Pos.x - 8, Pos.y - 24, iconW, iconH)
					end

					if GAMEMODE.Config.showname then
						draw.SimpleText(ply:Nick(), "sleekHUD26", Pos.x, Pos.y, team.GetColor(ply:Team()), 1)
						Pos.y = Pos.y + 32
					end

					if GAMEMODE.Config.showhealth then
						if SleekHUD.ShowHealthOverheadStyle == 0 then 
						draw.DrawText(DarkRP.getPhrase("health", ply:Health()), "sleekHUD24", Pos.x, Pos.y - 8, Color17, 1)
					elseif SleekHUD.ShowHealthOverheadStyle == 1 then

						surface.SetMaterial(SleekHUdheart_12)
						surface.SetDrawColor(237, 41, 57 ,255)
						surface.DrawTexturedRect(Pos.x - 86, Pos.y, iconW2 , iconH2)
						smoothhealthOverhead = Lerp(10 * FrameTime(), smoothhealthOverhead, ply:Health())
						draw.RoundedBox( 15, Pos.x - 64, Pos.y + 4, Scrw * .08, boxH, DarkGreyTransparentColor )
						draw.RoundedBox( 15, Pos.x - 64, Pos.y + 4, smoothhealthOverhead * (Scrw * .0008), boxH, HealthRedColor )

					end
						Pos.y = Pos.y + 22
					end

					if GAMEMODE.Config.showjob then
						draw.SimpleText(ply:getDarkRPVar("job"), "sleekHUD24", Pos.x, Pos.y - 8, Color18, 1)
						Pos.y = Pos.y + 22
					end
					if ply:getDarkRPVar("wanted") && SleekHUD.ShowWantedStatusOverhead == true then
						draw.SimpleText(SleekHUD.LanguageSet.Text01, "sleekHUD24", Pos.x + 2, Pos.y - 8, HealthRedColor, 1)
						Pos.y = Pos.y + 22
					end
				end
			end
		end
	end

	local EyeTrace = LocalPlayer():GetEyeTrace()

	if EyeTrace.Entity:IsValid() and EyeTrace.Entity:isKeysOwnable() and EyeTrace.Entity:GetPos():DistToSqr(LocalPlayer():GetPos()) < 42000 then
		EyeTrace.Entity:drawOwnableInfo()
	end
end

local function SleekDrawHUD()
	if SleekHUD.ShowGunLicense == true then
	if SleekHUD.ShowGunLicense == true && SleekHUD.ShowArmor == true && DarkRP.disabledDefaults["modules"]["hungermod"] == false then BottomLeft_GunLicense_hunger_armor() end
	if SleekHUD.ShowGunLicense == true && SleekHUD.ShowArmor == false &&  DarkRP.disabledDefaults["modules"]["hungermod"] == false then BottomLeft_GunLicense_hunger() end
	if SleekHUD.ShowGunLicense == true && SleekHUD.ShowArmor == true && DarkRP.disabledDefaults["modules"]["hungermod"] == true then BottomLeft_GunLicense_armor() end
	if SleekHUD.ShowGunLicense == true && SleekHUD.ShowArmor == false && DarkRP.disabledDefaults["modules"]["hungermod"] == true then BottomLeft_GunLicense() end
	else

	if SleekHUD.ShowArmor == true && DarkRP.disabledDefaults["modules"]["hungermod"] == false then BottomLeft_armor_hunger() end
	if SleekHUD.ShowArmor == false && DarkRP.disabledDefaults["modules"]["hungermod"] == false then BottomLeft_hunger() end
	if SleekHUD.ShowArmor == true && DarkRP.disabledDefaults["modules"]["hungermod"] == true then BottomLeft_armor() end
	if SleekHUD.ShowArmor == false && DarkRP.disabledDefaults["modules"]["hungermod"] == true then BottomLeft() end
end

	DrawLockDown()
	DrawAgenda()
	DrawAmmo()
	DrawWanted()
	DrawMoney()
	DrawPhysgunProps()
	SleekDrawEntityDisplay()
	DrawArrest()
end

local function SleekDrawHUDPaint()
	if not LocalPlayer():IsValid() then return end

	SleekDrawHUD()
end
hook.Add("HUDPaint", "SleekDrawHUDPaint", SleekDrawHUDPaint)