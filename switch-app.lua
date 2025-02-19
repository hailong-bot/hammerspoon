-- Define the keyboard shortcut to switch to Chrome
require("common")
local hyperKey = Common.hyperKey
local shortcuts = {
	-- ["Google Chat.app"] = "c",
	["Google Chrome.app"] = "e", -- explore
	-- ["Neovide"] = "j",
	["Obsidian"] = "n", -- note
	["Typora"] = "k", -- 随便写
	-- ["Finder"] = "l",
	["Alacritty"] = "t", -- terminal
	["Excalidraw.app"] = "o", -- o
	["Visual Studio Code"] = "v", -- this is Visual Studio Code
}

local function switchTo(appName)
	local appRunning = hs.application.get(appName)

	if appRunning then
		-- If App is running, activate it
		appRunning:activate()
	else
		-- If App is not running, launch it
		hs.application.launchOrFocus(appName)
	end
end

for appName, shortcut in pairs(shortcuts) do
	hs.hotkey
		.new(hyperKey, shortcut, function()
			switchTo(appName)
		end)
		:enable()
end
