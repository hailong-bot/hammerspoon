-- url encode 和decode函数
local function urlEncode(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end

local function urlDecode(s)
s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
return s
end



-- 百度搜索
hs.hotkey.bind({"cmd", "alt"}, "2", function() 
    local clipboardText = tostring(hs.pasteboard.getContents())
    print("what is in the clipboard?:a"..clipboardText)
    hs.notify.new({title="百度搜索", informativeText=clipboardText}):send()
    hs.urlevent.openURL("https://www.baidu.com/s?wd="..urlEncode(clipboardText)) 
end)

-- 谷歌搜索
hs.hotkey.bind(hyperCmdAlt, "3", function() 
    local clipboardText = tostring(hs.pasteboard.getContents())
    hs.notify.new({title="谷歌搜索", informativeText=clipboardText}):send()
    hs.urlevent.openURL("https://www.google.com/search?q="..urlEncode(clipboardText)) 
end)

-- 打开链接
hs.hotkey.bind(hyperCmdAlt, "0", function() 
    local clipboardText = tostring(hs.pasteboard.getContents())
    hs.notify.new({title="打开url", informativeText=clipboardText}):send()
    hs.urlevent.openURL(clipboardText) 
end)