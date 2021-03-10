if not SleekHUD.ShowNotifications then return end

local Scrw, Scrh = ScrW(), ScrH()
local WhiteColor = Color(255, 255, 255, 255)
local DarkGreyColor = Color(33, 33, 33,255)
local LightGreyColor = Color(33, 33, 33,200)

surface.CreateFont("sleekHUD22", {font = "Montserrat ExtraBold",    size = Scrw*0.0135,     weight = 500})

hook.Add( "OnScreenSizeChanged", "OnScreenSizeChanged_ChnageFont", function()
Scrw, Scrh = ScrW(), ScrH()
surface.CreateFont("sleekHUD22", {font = "Montserrat ExtraBold",    size = Scrw*0.0135,     weight = 500})
end)

local SleekHUDNotifications = SleekHUDNotifications or {}

local SleekHUDIcons = {}
SleekHUDIcons[NOTIFY_GENERIC] = Material("sleekhud/generic.png")
SleekHUDIcons[NOTIFY_ERROR] = Material("sleekhud/error.png")
SleekHUDIcons[NOTIFY_UNDO] = Material("sleekhud/undo.png")
SleekHUDIcons[NOTIFY_HINT] = Material("sleekhud/hint.png")
SleekHUDIcons[NOTIFY_CLEANUP] = Material("sleekhud/cleanup.png")

local function SleekDrawIcon(x, y, w, h, color, icon)
	surface.SetMaterial(icon)
	surface.SetDrawColor(color)
	surface.DrawTexturedRect(x, y, w, h)
end

function notification.AddLegacy(text, type, time)
	local x, y = Scrw, Scrh

	surface.SetFont("sleekHUD22")
	local w, h = surface.GetTextSize(text)

	table.insert(SleekHUDNotifications, 1, {x = x, y = y, w = w + 49, h = h + 16, text = text, icon = SleekHUDIcons[type], time = CurTime() + time})
end

function notification.Kill(id)
	for k, v in ipairs(SleekHUDNotifications) do
		if v.id == id then v.time = 0 end
	end
end

local function SleekDrawNotification(x, y, w, h, text, icon)
	local iconW = Scrw * .0125
	local iconH = Scrh * .0223
	draw.RoundedBox(4, x, y, w, h, LightGreyColor)
	--draw.RoundedBox(4, x, y, w * 0.24, h, Color(33,33,33,255))
	SleekDrawIcon(x + 8, y + 8, iconW, iconH, WhiteColor, icon)
	draw.SimpleText(text, "sleekHUD22", x + 41, y + 8, WhiteColor)
end

local function SleekDrawNotifications()
	for k, v in ipairs(SleekHUDNotifications) do
		SleekDrawNotification(math.floor(v.x), math.floor(v.y), v.w, v.h, v.text, v.icon)
		v.x = Lerp(FrameTime() * 10, v.x, v.time > CurTime() and Scrw - v.w - 8 or Scrw + 1)
		v.y = Lerp(FrameTime() * 10, v.y, Scrh - 200 - (k - 1) * (v.h + 8))
	end

	for k, v in ipairs(SleekHUDNotifications) do
		if v.x >= Scrw and v.time < CurTime() then
			table.remove(SleekHUDNotifications, k)
		end
	end
end

hook.Add("HUDPaint", "SleekDrawNotifications", SleekDrawNotifications)