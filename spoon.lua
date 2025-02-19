require("common")
local hspoon_list = {
	"AClock", -- 一个钟
	-- "ClipShow", -- 剪切板
	-- "KSheet", -- 快捷键
	"CountDown", -- 倒计时
	-- "WinWin", -- 窗口管理
	-- "VolumeScroll", -- 鼠标滚轮调节音量
	-- "PopupTranslateSelection", -- 翻译选中文本
	-- "SpeedMenu", -- 菜单栏显示网速
	-- "MountedVolumes", -- 显示已安装卷的饼图
	-- "HeadphoneAutoPause", -- 断开耳机自动暂停播放
	-- "HSearch",
	"ModalMgr",
}

for _, v in pairs(hspoon_list) do
	hs.loadSpoon(v)
end

----------------------------------------------------------------------------------------------------
-- countdownM 倒计时配置
----------------------------------------------------------------------------------------------------
if spoon.CountDown then
	spoon.ModalMgr:new("countdownM")
	local cmodal = spoon.ModalMgr.modal_list["countdownM"]
	cmodal:bind("", "escape", "退出面板", function()
		spoon.ModalMgr:deactivate({ "countdownM" })
	end)
	cmodal:bind("", "Q", "退出面板", function()
		spoon.ModalMgr:deactivate({ "countdownM" })
	end)
	--cmodal:bind('', 'tab', 'Toggle Cheatsheet', function() spoon.ModalMgr:toggleCheatsheet() end)
	cmodal:bind("", "0", "1 分钟", function()
		spoon.CountDown:startFor(1)
		spoon.ModalMgr:deactivate({ "countdownM" })
	end)
	for i = 1, 9 do
		cmodal:bind("", tostring(i), string.format("%s 分钟", 10 * i), function()
			spoon.CountDown:startFor(5 * i)
			spoon.ModalMgr:deactivate({ "countdownM" })
		end)
	end
	cmodal:bind("", "return", "25 分钟 ", function()
		spoon.CountDown:startFor(25)
		spoon.ModalMgr:deactivate({ "countdownM" })
	end)
	cmodal:bind("", "space", "暂停和恢复倒计时", function()
		spoon.CountDown:pauseOrResume()
		spoon.ModalMgr:deactivate({ "countdownM" })
	end)

	-- 定义打开倒计时面板快捷键
	local hscountdM_keys = { { "shift", "cmd", "alt", "ctrl" }, "C" }
	print(hscountdM_keys[1], hscountdM_keys[2])
	if string.len(hscountdM_keys[2]) > 0 then
		hs.hotkey.bind(Common.hyperKey, "I", function()
			spoon.ModalMgr:deactivateAll()
			-- 显示倒计时面板
			spoon.ModalMgr:activate({ "countdownM" }, "#FF6347", true)
		end)
		-- spoon.ModalMgr.supervisor:bind(hscountdM_keys[1], hscountdM_keys[2], "进入倒计时面板", function()
		-- 	spoon.ModalMgr:deactivateAll()
		-- 	-- 显示倒计时面板
		-- 	spoon.ModalMgr:activate({ "countdownM" }, "#FF6347", true)
		-- end)
	end
end
