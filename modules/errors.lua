local f, o, ncErrorDB = CreateFrame("Frame"), "No error yet.", errorFilter

f:SetScript("OnEvent", function(self, event, error)
	if not ncErrorDB[error] then
		UIErrorsFrame:AddMessage(error, 1, 0 , 0)
	else
		o = error
	end
end)
SLASH_NCERROR1 = "/error"
function SlashCmdList.NCERROR() print(o) end
UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")
f:RegisterEvent("UI_ERROR_MESSAGE")