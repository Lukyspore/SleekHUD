SleekHUD = SleekHUD or {}

SleekHUD.ShowArmor = false --Shows armor bar in bottom left corner.
SleekHUD.ShowNotifications = true --Shows Custom notifications.
SleekHUD.ShowPropCount = true --Shows Prop Counter in bottom right corner.
SleekHUD.ShowArrestBox = true --Shows Unjail Countdown in bottom left corner.
SleekHUD.ShowGunLicense = true --Shows Gun license status in bottom left corner.

SleekHUD.ShowOverhead = true --Shows info above players.
SleekHUD.ShowGunLicenseOverhead = false --Shows gun license above players head.
SleekHUD.ShowWantedStatusOverhead = true --Shows wanted status above players head.
SleekHUD.ShowHealthOverheadStyle = 1 --Changes in bettwen multiple Overhead styles. 0 = Health will be shown as numbers; 1 = Health will be shown as bar simular to hud health bar.

SleekHUD.Language = 0 -- 0 = English; 1 = Czech; 2 = Russian

----------------------------------------------
--End of Config
----------------------------------------------
if SleekHUD.Language == 0 then 
SleekHUD.LanguageSet = {
	Text01 = "Wanted",
	Text02 = "You are wanted for ",
	Text03 = "Prop Counter",
	Text04 = "Props: ",
	Text05 = "Unjail countdown",
	Text06 = "s left in jail."
}
elseif SleekHUD.Language == 1 then
SleekHUD.LanguageSet =  {
	Text01 = "Hledany",
	Text02 = "Jsi hledan z duvodu ",
	Text03 = "Pocitadlo Propu",
	Text04 = "Propy: ",
	Text05 = "Unjail countdown",
	Text06 = "s zbyva ve vezeni."
}
elseif SleekHUD.Language == 2 then
SleekHUD.LanguageSet = {
    Text01 = "Поиск",
    Text02 = "ты в розыске за ",
    Text03 = "Счетчик Pеквизит",
    Text04 = "Pеквизиты ",
    Text05 = "нетюрьма Обратный отсчет",
	Text06 = "ы осталось в тюрьме.",
}
end