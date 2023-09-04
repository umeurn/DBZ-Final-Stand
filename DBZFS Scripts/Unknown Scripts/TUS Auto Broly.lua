--R.I.P Noslow movespam and Glitched grabbing ;v
getgenv().Settings = {
	ClientSettings = {
		AdvertiseServer = false, --Advertises My Server so more people use the script
		CarryMode = false, --This Tells People your carrying and disables the invis state
		FasterGOD = false, --Requires at least one of these UI MUI G.O.D
		NoCharge = false,
	},
	BrolySettings = {
		QueueWorld = true,
		NPCAssist = true, --Summons your support char Best Support Char is Majin Vegeta
		AutoPunch = true,
		AntiLeech = false, --Leaves if someone else is in your Broly Server
		SmartAntiLeach = false, --Teleports you to a diffrent pad In queue
		SwitchPadsAmmount = 5, --How many times itll switch pads if detecting a leacher and when itll disable
		KiTracker = false, --Forces any ki moves to track broly
	},
	TimeSettings = {
		EarthTimer = 45, --How long you stay in Earth Before it kicks you
		QueueTimer = 30,
		BrolyTimer = 150,
	},
	Stat = {
		AutoStatToggle = false, --Turn this on if you want it to auto add stats
		AutoStat = "Phys-Damage", --Phys-Damage Ki-Damage Phys-Resist Ki-Resist Health-Max Ki-Max Speed
	},
	DuoMode = { --Keep In mind this is [ Experimental ]
		DuoEnabled = false,
		MainName = "", --Main Accs Name
		Alt = "", --Alt's Name
	},
}
getgenv().Moves = {
	"TS Molotov",
	"Mach Kick",
	"Anger Rush",
	"Meteor Crash",
	"Sweep Kick",
	"Wolf Fang Fist",
	"Deadly Dance",
	"Flash Skewer",
	"Neo Wolf Fang Fist",
}

----------------------------------------------------------------------------------

loadstring(game:HttpGet("https://raw.githubusercontent.com/TheUnknownScripter/Roblox/main/DBZFS/Auto%20Broly%20v5.0.lua"))()