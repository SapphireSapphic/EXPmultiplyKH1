LUAGUI_NAME = "EXP Multiplier"
LUAGUI_AUTH = "SapphireSapphic"
LUAGUI_DESC = "Multiplly the amount of EXP gained by a customizable amount."

local offset = 0x3A0606
local multiplyBy = 3 --This is how much your EXP is multiplied by.
local currentEXPAdr = 0x2DE5A10 - offset
local adr2 = 0x2DE5A84 - offset
local adr3 = 0x2DE5AF8 - offset
local adr4 = 0x2DE5B6C - offset
local adr5 = 0x2DE5BE0 - offset
local adr6 = 0x2DE5C54 - offset
local adr7 = 0x2DE5CC8 - offset
local adr8 = 0x2DE5D3C - offset
local adr9 = 0x2DE5DB0 - offset
local adr10 = 0x2DE5E24 - offset
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
		WriteByte(adr2, newEXP)
		WriteByte(adr3, newEXP)
		WriteByte(adr4, newEXP)
		WriteByte(adr5, newEXP)
		WriteByte(adr6, newEXP)
		WriteByte(adr7, newEXP)
		WriteByte(adr8, newEXP)
		WriteByte(adr9, newEXP)
		WriteByte(adr10, newEXP)
	end
	previousEXP = ReadByte(currentEXPAdr)
end