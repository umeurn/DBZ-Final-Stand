local Client = game:GetService("Players").LocalPlayer
local Earth, Queue, BrolyWorld = 536102540, 3565304751, 2050207304

BlacklistedServers = { "19eb91e5-88c7-444b-ab67-27be1071587d" }

local function Hop()
    local i = {}
    
    local Success, Failed = pcall(function()
        for l, v in next, game:GetService("HttpService"):JSONDecode(game:HttpGet(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=%d"):format(game.PlaceId, 100))).data, nil do
            if(typeof(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId) then
                if(not table.find(BlacklistedServers, v.id)) then
                    i[#i + 1] = {
                        amount = tonumber(v.playing), 
                        id = v.id
                    }
                end
            end
        end
    end)
    
    if (not Success) then game:GetService("TeleportService"):Teleport(Earth) end
    
    table.sort(i, function(a, b)
        return a.amount < b.amount
    end)
    
    if(i[1]) then
        return game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, i[1].id)
    end
    
    return game:GetService("TeleportService"):Teleport(Earth)
end

wait(3.5)

coroutine.wrap(function()
    game:WaitForChild("CoreGui").RobloxPromptGui:FindFirstChild("promptOverlay").DescendantAdded:Connect(function()
        if (game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")) then
            game:GetService("TeleportService"):Teleport(Queue)
        end
    end)
    
    while wait() do
        if (game:GetService("CoreGui").RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")) then 
            game:GetService("TeleportService"):Teleport(Queue)
        end
        
        if (table.find(BlacklistedServers, game.JobId)) then
            Hop()
        end
        
        if (#game.Workspace:FindFirstChild("Live"):GetChildren() == 0) then
            Hop() 
        end
        
        if (Client and #game.Workspace:FindFirstChild("Live"):GetChildren() > 1 and not game.Workspace.Live:FindFirstChild(Client.Name)) then
            Hop()
        end
        
        if (math.floor(game.Workspace.DistributedGameTime) >= 14 and Client and Client.Character == nil) then
            Hop()
        end
    end
    
    repeat wait() until game.PlaceId
    
    if (game.PlaceId == 536102540) then
        wait(45)
        game:GetService("TeleportService"):Teleport(Queue)
    end
    
    if (game.PlaceId == 3552157537) then
        wait(20)
        game:GetService("TeleportService"):Teleport(3552157537)
    end
            
    if (game.PlaceId == 3618359401) then
        wait(23)
        game:GetService("TeleportService"):Teleport(3552157537)
    end
            
    if (game.PlaceId == 3565304751) then
        wait(25)
        game:GetService("TeleportService"):Teleport(Queue)
    end
            
    if (game.PlaceId == 2050207304) then
        wait(45)
        game:GetService("TeleportService"):Teleport(Queue)
    end
end)()