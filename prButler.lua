local _, ns = ...

-- Adds /frame for getting frame name where the mouse pointer is
SlashCmdList["FRAMENAME"] = function()
    DEFAULT_CHAT_FRAME:AddMessage("|cff00FF00   "..GetMouseFocus():GetName())
end
SLASH_FRAMENAME1 = "/frame"

-- Adds /rl for reloading UI
SlashCmdList["RELOADUI"] = function()
    ReloadUI()
end
SLASH_RELOADUI1 = "/rl"

-- Makes the interface window movable
InterfaceOptionsFrame:SetMovable(1)
InterfaceOptionsFrame:RegisterForDrag('LeftButton')

InterfaceOptionsFrame:SetScript('OnDragStart', function(self)
	self:StartMoving()
end)

InterfaceOptionsFrame:SetScript('OnDragStop', function(self)
	self:StopMovingOrSizing()
end)

-- Disables healing spam for shadow priests
local ShadowPriest = CreateFrame('Frame')
local function OnEvent_ShadowPriest(...)
	if (GetShapeshiftForm() == 1) then
		SetCVar('CombatHealing',0)
	else
		SetCVar('CombatHealing',1)
	end
end
ShadowPriest:RegisterEvent('UPDATE_SHAPESHIFT_FORM')
ShadowPriest:RegisterEvent('UPDATE_SHAPESHIFT_FORMS')
ShadowPriest:SetScript('OnEvent', OnEvent_ShadowPriest)