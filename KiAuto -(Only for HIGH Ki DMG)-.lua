Moves = {
    "Blaster Meteor",
    "Sudden Storm",
    "Crusher Ball",
    "Chain Destructo Disk",
    "Genocide Shell",
    "Divine Lasso",
    "Death Saucer"
}
AntiLeech = false
Fov = 120
WaitTimer = .5
RejoinTimer = 120
TeamDamage = false
LateTransformation = true

local Broly = 2050207304
local Queue = 3565304751
start = tick();
while true do
    if game:IsLoaded() and game.Players.LocalPlayer then
        break;
    end;
    task.wait();
end;
lplr = game.Players.LocalPlayer;
char = lplr and (lplr.Character or game.Workspace.Live:WaitForChild(lplr.Name)) or nil;
if not char then
    repeat task.wait() until game.Players.LocalPlayer.Character;
    char = lplr.Character;
end;
repeat task.wait() until char:FindFirstChild("Block") and char:FindFirstChild("Prestige");
game.RunService.Stepped:Connect(function()
    if game:GetService("CoreGui").RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") then 
        game:GetService("TeleportService"):Teleport(Queue) --536102540
    end
end)
if game.GameId ~= 210213771 then
    -- game:GetService("TeleportService"):teleport(536102540)
    return;
end
if game.PlaceId ~= Queue and game.PlaceId ~= Broly and game.GameId == 210213771 then
    game:GetService("TeleportService"):teleport(Queue);
end;
if game.Players.LocalPlayer.PlayerGui.HUD.Bottom.SP.Visible == false then
    game.Players.LocalPlayer.PlayerGui.HUD.Bottom.SP.Visible = true
else
    game.Players.LocalPlayer.PlayerGui.HUD.Bottom.SP.Visible = true
end
if game.PlaceId == Queue then
    local Pads,RPads,Output= {},nil,nil;
    for i,v in pairs(game.Workspace:GetChildren()) do
        if (v.Name == "BrolyTeleport") then
            table.insert(Pads,v);
        end;
    end;
    for i,v in pairs(char:GetChildren()) do
        if (v.Name == "PowerOutput" or v.ClassName == "Model") then
            v:Destroy();
        elseif v:FindFirstChild("Root") then
            v.Root:Destroy();
        end;
    end;
    task.wait(.1);
    RPads = Pads[math.random(1,7)];
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (RPads.PrimaryPart.CFrame * CFrame.new(0,3,0));
        end);
    end);
    while task.wait(65) do
        game:GetService("TeleportService"):teleport(Queue);
    end;
elseif game.PlaceId == Broly then
    if AntiLeech and #game.Players:GetPlayers() ~= 1 then
        game:GetService("TeleportService"):teleport(Queue);
    end;
    local br = game.Workspace.Live['Broly BR']
    if TeamDamage then
        if char:FindFirstChild("team damage") then
            char['team damage']:Destroy();
        end;
    end
    game.Workspace.Camera.FieldOfView = Fov;
    task.spawn(function()
        char.ChildAdded:Connect(function(child)
            if child:FindFirstChild("Targeter") then
                child['Targeter']:FireServer(workspace.Live['Broly BR']);
            end;
        end);
        while task.wait() and game:GetService("RunService").Heartbeat:Wait() do
            for c, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if h:FindFirstChild("Mesh") and h:FindFirstChild("Ki") then
                    h.CFrame = br.HumanoidRootPart.CFrame
                end
            end
            for t, y in pairs(game.Workspace:GetChildren()) do
                if y:FindFirstChild("Mesh") and y:FindFirstChild("Ki") then
                    y.CFrame = br.HumanoidRootPart.CFrame
                end
            end
        end
    end)
    coroutine.wrap(function()
        repeat task.wait() until (tick() - start) > RejoinTimer;
        game:GetService("TeleportService"):teleport(Queue)
    end)();
    step = game:GetService("RunService").Stepped:Connect(function()
        if not LateTransformation then 
            lplr.Backpack.ServerTraits['Transform']:FireServer('g') 
            step:Disconnect()
        else
            if (char.Ki.Value / char.Ki.MaxValue * 100) < 80 then
                lplr.Backpack.ServerTraits['Transform']:FireServer('g')
                step:Disconnect();
            end;
        end;
    end);
    function percent(value,maxvalue)
        return math.floor(value / maxvalue * 100);
    end;
    noslow={"action","attacking","using","hyper","tele","kiblasted","heavy","killed","slow","tele","dodging","bstun","creator"};
    game:GetService("RunService").Stepped:Connect(function()
        game.Workspace.Camera.CFrame = CFrame.new(game.Workspace.Camera.CFrame.Position,br.HumanoidRootPart.CFrame.Position);
        for i,v in pairs(char:GetChildren()) do
            if table.find(noslow,v.Name:lower()) then
                v:Destroy();
            end
        end;
        local message = "broly: " .. percent(br.Humanoid.Health,br.Humanoid.MaxHealth) ..
        " | plr: "..percent(char.Humanoid.Health,char.Humanoid.MaxHealth).." | time: " .. math.floor(tick()-start);
        game.Players.LocalPlayer.PlayerGui.HUD.Bottom.SP.Text = message;
    end);
    while task.wait() do
        for i,v in pairs(lplr.Backpack:GetChildren()) do
            if table.find(Moves,v.Name) then
                v.Parent=char;
                v:Activate();
                task.wait();
                v:Deactivate();
                v.Parent=lplr.Backpack;
            end;
        end;
        if (percent(char.Humanoid.Health,char.Humanoid.MaxHealth)) < 15 then
            lplr.Backpack.ServerTraits['Transform']:FireServer('g');
        end;
        if rawequal(char.Humanoid.Health,0) or rawequal(br.Humanoid,nil) or rawequal(br.Humanoid.Health,0) then
            game:GetService("TeleportService"):teleport(Queue);
            break;
        end
        lplr.Backpack.ServerTraits['EatSenzu']:FireServer("ez");
    end
end;