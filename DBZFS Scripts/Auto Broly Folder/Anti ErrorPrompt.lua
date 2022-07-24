wait(5)
game:WaitForChild("CoreGui")
game.CoreGui:WaitForChild("RobloxPromptGui")
game.CoreGui.RobloxPromptGui:WaitForChild("promptOverlay")
_G.xd = true 
while _G.xd do wait()
if game:GetService("CoreGui").RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") then 
game:GetService("TeleportService"):Teleport(3565304751, LocalPlayer)
end
end