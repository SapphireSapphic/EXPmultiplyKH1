LUAGUI_NAME = "EXP Multiplier"
LUAGUI_AUTH = "SapphireSapphic"
LUAGUI_DESC = "Multiplly the amount of EXP gained by a customizable amount."

local offset = 0x3A0606
local multiplyBy = 3 --This is how much your EXP is multiplied by.
local currentEXPAdr = 0x2DE5A10 - offset
local canExecute = false
local previousEXP = 0
local delta = 0
local deltaADD = 0
local newEXP = 0
local currentEXP = 0

function _OnInit()
if GAME_ID == 0xAF71841E and ENGINE_TYPE == "BACKEND" then
		ConsolePrint("EXP Multiplier - installed")
		canExecute = true
	else
		ConsolePrint("EXP Multiplier - failed")
	end
end

function _OnFrame()
	currentEXP = ReadByte(currentEXPAdr)
	--ConsolePrint(currentEXP)
	if previousEXP < currentEXP then
		delta = currentEXP - previousEXP
		deltaADD = delta * multiplyBy
		newEXP = previousEXP + deltaADD
		WriteByte(currentEXPAdr, newEXP)
	end
	previousEXP = ReadByte(currentEXPAdr)
end