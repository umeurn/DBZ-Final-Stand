getgenv().Settings = {
	Slots = {
		Namekian = "Slot1",
		PointSlot = "Slot3",
	},
	-----------------------Norm Setting's
	MaxPoints = math.huge, --math.huge is basiclly inf so change it to what you want
	HideClientName = false, --This hides The Users name to show proof of stat's
	ReplicatedLag = 0, --This will simulate lag not make it so vpn is recommended but this sometimes can help
	KamiChatDelay = 0.2, --Increase this if you dont see the White aura around the namekian during the procces or decrease accordingly
	SlotChangeDelay = 0.128, --The Time For Chat Dialog
}

-------------------------------------------------------------------------------------------------------------

loadstring(game:HttpGet("https://raw.githubusercontent.com/TheUnknownScripter/Roblox/main/DBZFS/Auto%20Inf%20Stat's%20Legacy%20v2.0.lua"))()