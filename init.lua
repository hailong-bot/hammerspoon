hs.configdir = os.getenv('HOME') .. '/.hammerspoon'
package.path = hs.configdir .. '/?.lua;' .. hs.configdir .. '/?/init.lua;' .. hs.configdir .. '/Spoons/?.spoon/init.lua;' .. package.path

print("================================")
require "reload.reload"
require "hotkey.hotkey"
require "init.commons"
-- require "weather.weather"
-- require "wifi.wifi"
require "system.systeminfo"
require "system.caffeine"
require "search.search"

-- Private use
print(hs.host.localizedName())
if (hs.host.localizedName() == '陈海龙的MacBook Pro') then
	-- require("autoscript.autoscript")
    require 'private.hotkey'
end
