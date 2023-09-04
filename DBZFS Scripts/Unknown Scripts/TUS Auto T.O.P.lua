--To Make Your Wish Its based of numbers 
--[ 1 = 100K Zenni - 2 = Prestige - 3 = Remove Level Cap - 4 = More EXP Normal Top ]
--[ 5 = Death - 6 = G.O.D Form - 7 = Nothing ]

--[ To Auto Teleport To T.O.P put 1 to Auto Teleport To Hard T.O.P do 2 ]

getgenv().Settings = {
	ClientSettings = {
		AdvertiseServer = false,
		NoCharge = false,
		CarryMode = false,
		AutoBean = true,
	},
	TimeSettings = {
		TopTimerLimit = 300,
	},
	TopSettings = {
		AutoWish = true,
		Wish = 1,
		Queue = true,
		AutoTeleportToSeat = 1,
	},
}

getgenv().Moves = {
	"TS Molotov",
	"Wolf Fang Fist",
	"Anger Rush",
	"Meteor Crash",
	"Sweep Kick",
	"Flash Skewer",
	"Deadly Dance",
	"Neo Wolf Fang Fist",
	"God Slicer",
}

---------------------------------------------------------------------------------

loadstring(game:HttpGet("https://raw.githubusercontent.com/TheUnknownScripter/Roblox/main/DBZFS/Auto%20Top%20v4.0.lua"))()