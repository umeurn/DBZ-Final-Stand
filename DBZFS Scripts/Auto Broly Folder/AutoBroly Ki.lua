Move1 = "TS Molotov"
Move2 = "Blaster Meteor"
Move3 = "Big Bang Kamehameha"
Move4 = "Deadly Dance"
Move5 = "Demon Flash"
Move6 = "Chain Destructo Disk"
Move7 = "Anger Rush"
Move8 = "Sudden Storm"
Move9 = "Trash???"
Move10 = "Trash?"

Settings = {
    Earth = false; -- True to auto on earth, false to auto on queue (Recommended if you bug in queue)
    AntiLeach = false; -- If it exceeds the limit of people, rejoins you
        PeopleAllowed = 1; -- Number of people allowed in broly
    AutoPunch = true;  -- Auto Punches (Left Click) if you ran out of ki
    DoubleFreeze = true;  -- Freezes double exp
    TeamDamage = true;-- Makes you be able to kill other people in broly
    LateTransform = true;  -- For androids, transforms when ki is at 70%
    LateTransform2 = false; -- For other races, transforms when ki is at 85% (Only h type form)
    Promote = true;  -- Promotes my discord
    forms = false;  -- turn this on for forms, turn off for androids
    RejoinTime = 200;  -- rejoins in broly if this time is exceeded
    GrabChecker = 79;  -- time it takes for broly to be last form, rejoins you if hes not by then
    AnimateFreeze = true;  -- Breaks your animator (if you have forms on you can't use this)
    invis = true;  -- Makes you invisible or not (Queue, Earth)
    waittime = .3;  -- The time waited before the script loads
}

-- [[ Game Load ]]

repeat
    wait()
until game:IsLoaded()


if game:GetService("CoreGui").RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") then 
game:GetService("TeleportService"):Teleport(3565304751, LocalPlayer)
end

repeat
    wait()
until game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
game.Players.LocalPlayer.Character:WaitForChild("PowerOutput")
wait(Settings.waittime)

-- [[ Variables ]]

local Rootpart = game.Players.LocalPlayer.Character.HumanoidRootPart
local Client = game.Players.LocalPlayer
local Ids = {
    536102540, -- Earth
    3565304751, -- Que
    2050207304 -- Broly
}
function Twn(HRP, Place, Length)
    local Twn =
        game:GetService("TweenService"):Create(
        HRP,
        TweenInfo.new(Length, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        {CFrame = Place}
    )
    Twn:Play()
    Twn.Completed:Wait()
end
local State = "Loading"
wait()
print("Nexus is Daddy")
wait()
print("Broly Loaded")

--[[ Credits ]]
game:GetService("StarterGui"):SetCore(
    "SendNotification",
    {
        Title = "Cake's Autobroly",
        Text = "Cracked by Promasu, Promoting .gg/metric",
        Duration = "30"
    }
)

-- [[ NormalGui ]]

local NormalGui = 
    coroutine.create(
    function()
        game:GetService("RunService").RenderStepped:connect(
            function()
                if game.PlaceId ~= Ids[3] then
                    game:GetService("Players")[Client.name].PlayerGui.HUD.Bottom.SP.Visible = true
                Client.PlayerGui.HUD.Bottom.SP.Text = "Level : " .. Client.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text .. " | Time : " .. math.floor(Workspace.DistributedGameTime) ..  " | Status : " .. State
                Client.PlayerGui.HUD.Bottom.SP.BackgroundColor3 = Color3.new(1, 0, 0)  
                end
            end
        )
    end
)


coroutine.resume(NormalGui)

--[[ AntiKick ]]

local AntiKick = 
    coroutine.create(
    function()
        game:GetService("RunService").RenderStepped:connect(
            function()
                if game:GetService("CoreGui").RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") then 
                    if Settings.Earth == true then
                        game:GetService('TeleportService'):Teleport(Ids[1], LocalPlayer)
                    elseif Settings.Earth == false then
                        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
                    end
                end
            end
        )
    end

)

-- [[ Server Promotion and Credits ]]

local Credits =
    coroutine.create(
    function()
        if Settings.Promote == true then
            while wait(2) do
                local A_1 = "Join .gg/metric for Script"
                local A_2 = "All"
                local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
                Event:FireServer(A_1, A_2)
            end
        end
    end
)

coroutine.resume(Credits)
--[[ Death Checker ]]
local DeathChecker =
    coroutine.create(
    function()
        game:GetService("RunService").RenderStepped:Connect(
            function()
                if game:GetService("Workspace").Live[Client.name].Humanoid.Health <= 1 then
                    if Settings.Earth == true then
                        game:GetService('TeleportService'):Teleport(Ids[1], LocalPlayer)
                    elseif Settings.Earth == false then
                        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
                    end
                end
            end
        )
    end
)
coroutine.resume(DeathChecker)

--[[ Variables ]]
Character = Client.Character or Client.CharacterAdded:Wait()
Workspace = game:GetService("Workspace")

--[[ Earth Sequence ]]
if Settings.Earth == true and game.PlaceId == Ids[1] then
    game:GetService("Workspace").Live[Client.name].PowerOutput:Destroy()
    local EarthCFrame = CFrame.new(
    -956.959167, 22.3265114, -3803.77197, -0.55019325, -0, -0.83503747, -0, 1.00000012, -0, 0.835037351, 0, -0.55019331
    )
    wait(.2)
    Twn(Rootpart.CFrame, EarthCFrame, 1.5)
    wait(.2)
    Client.Character.LowerTorso:Destroy()
    wait(.1)
    local EarthCFrame2 = CFrame.new(
        2751.73364,
        3944.85986,
        -2272.65967,
        0.999996364,
        0,
        -0.00272208848,
        -0,
        1.00000012,
        -0,
        0.00272208848,
        0,
        0.999996364)
    Twn(Rootpart.CFrame, EarthCFrame2, 1.5)
    wait(.2)
    Rootpart.Anchored = true
    wait(75)
    game:GetService("TeleportService"):Teleport(Ids[1], LocalPlayer)
end

--[[Queue Sequence]]
if Settings.Earth == false and game.PlaceId ~= Ids[3] then
    if game.PlaceId == Ids[2] then
        game.Players.LocalPlayer.Character.PowerOutput:Destroy()
        wait(.1)
        if Settings.invis == true then
            local QueueCFrame = CFrame.new(-600.292664, 
            237.999954, 
            -536.939575, 
            0.406734318, 
            0, 
            -0.913546503, 
            -0, 1.00000012, 
            -0, 0.913546622, 
            0, 
            0.406734258)
            Twn(Rootpart, QueueCFrame, 1)
            wait(.2)
            Client.Character.LowerTorso:Destroy()
            wait(.1)
        end
        local Pads = {}
        for i, v in pairs(game:WaitForChild("Workspace"):GetChildren()) do
            if v.Name:find("BrolyTeleport") then
                table.insert(Pads, v)
            end
        end
        local pad = Pads[math.random(1, 7)]
        Twn(Rootpart, pad.PrimaryPart.CFrame, 1)
        wait(1)
        Rootpart.Anchored = true
        State = "Loaded"
        wait(45)
        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
    end
    if game.PlaceId ~= Ids[2] then
        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
    end
end


--[[ Broly Sequence ]]
if game.PlaceId == Ids[3] then
    if Settings.AntiLeach == true then
        if #game.Players:GetChildren() > Settings.PeopleAllowed then
            game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
        elseif Settings.AntiLeach == false then
            print("AntiLeach is false")
        end
    end

      

    if Settings.forms == true then
        State = "Transforming..."
        wait(.2)
        Client.Backpack.ServerTraits.Input:FireServer({"x"}, CFrame.new())
        wait(3.6)
        Client.Backpack.ServerTraits.Transform:FireServer("h")
        wait(.1)
        Client.Backpack.ServerTraits.Input:FireServer({"xoff"}, CFrame.new())
        wait(.5)
        State = "Transformed!"
    end
        

    local track =
        coroutine.create(
        function()
            Target = "broly br"
            for i, w in pairs(game.Workspace.Live:GetChildren()) do
                if string.match(string.lower(w.Name), string.lower(Target)) then
                    _G.Track = true
                    while _G.Track and game:GetService("RunService").Heartbeat:wait() do
                        w:WaitForChild("HumanoidRootPart")
                        for i, v in pairs(game.Workspace:GetChildren()) do
                            if v:FindFirstChild("Ki") and v:FindFirstChild("Mesh") then
                                v.CFrame = w.HumanoidRootPart.CFrame
                            end
                        end
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v:FindFirstChild("Ki") and v:FindFirstChild("Mesh") then
                                v.CFrame = w.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            end
        end
    )

    coroutine.resume(track)

    local DamageChecker =
        coroutine.create(
        function()
            repeat
                wait()
            until game:GetService("Workspace").DistributedGameTime >= Settings.GrabChecker
            if game:GetService("Workspace").Live["Broly BR"].Stats["Health-Max"].Value < 53589 then
                game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
            end
        end
    )

    coroutine.resume(DamageChecker)
    
    local GoGod =
        coroutine.create(
        function()
            local God = true
            while God == true do
                wait()
                if
                    game.Workspace.Live[Client.Name].Humanoid.Health <= Client.Character.Humanoid.MaxHealth * .2 and
                        game.Workspace.Live[Client.Name].Ki.Value <= Workspace.Live[Client.Name].Ki.MaxValue * .2
                 then
                    Client.Backpack.ServerTraits.Transform:FireServer("g")
                    wait()
                    Client.Backpack.ServerTraits.Transform:FireServer("h")
                    wait()
                    Client.Backpack.ServerTraits.Transform:FireServer("g")
                end
            end
        end
    )

    coroutine.resume(GoGod)

    local brolyhealthDisplay =
        coroutine.create(
        function()
            game:GetService("RunService").RenderStepped:connect(
                function()
                    local Conta1 = Workspace.Live["Broly BR"].Humanoid.Health / Workspace.Live["Broly BR"].Humanoid.MaxHealth
                    local Conta2 = Conta1 * 100
                    game:GetService("Players")[Client.name].PlayerGui.HUD.Bottom.SP.Visible = true
                    Client.PlayerGui.HUD.Bottom.SP.Text = "Level : " .. Client.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text .. " | Time : " .. math.floor(Workspace.DistributedGameTime) .. " / " .. Settings.RejoinTime .. " | Broly Health : " .. math.floor(Conta2).."%"
		    Client.PlayerGui.HUD.Bottom.SP.BackgroundColor3 = Color3.new(1, 0, 0)
                end
            )
        end
    )
    coroutine.resume(brolyhealthDisplay)

    local frameLoop = -- [[ always make a variable so you can insert it in the resume() --]]
        coroutine.create(
        function()
            -- Always wrap a function so the wrap has something to run
            game:GetService("RunService").RenderStepped:connect(
                function()
                    Rootpart.CFrame =
                        CFrame.new(
                        -17.7652674,
                        -126.684319,
                        -13.7393866,
                        0.989255607,
                        0,
                        0.146196648,
                        -0,
                        1.00000012,
                        -0,
                        -0.146196648,
                        0,
                        0.989255607
                        )
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    game:GetService("Workspace").Camera.FieldOfView = 120   
    State = "Grabing..."                   
 end
            )
        end
    )
    coroutine.resume(frameLoop)

    local AutoHit =
        coroutine.create(
        function()
            game:GetService("RunService").RenderStepped:Connect(
                function()
                    if Settings.AutoPunch == true and game.Workspace.Live[Client.name].Ki.Value < 36 then
                        Client.Backpack.ServerTraits.Input:FireServer({"m2"}, CFrame.new())
                    end
                end
            )
        end
    )

    local LateTransform =
        coroutine.create(
        function()
            if Settings.LateTransform == true then
                repeat
                    wait()
                until Workspace.Live[Client.name].Ki.Value <= Workspace.Live[Client.name].Ki.MaxValue * .7
                Client.Backpack.ServerTraits.Transform:FireServer("h")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("h")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("h")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("h")
            end
        end
    )

    coroutine.resume(LateTransform)

    local LateTransform2 =
        coroutine.create(
        function()
            if Settings.LateTransform2 == true then
                repeat
                    wait()
                until Workspace.Live[Client.name].Ki.Value <= Workspace.Live[Client.name].Ki.MaxValue * .85
                Client.Backpack.ServerTraits.Transform:FireServer("h")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("h")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("h")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("h")
            end
        end
    )

    coroutine.resume(LateTransform2)

    if Settings.AutoPunch == false then
        print("AutoPunch is false")
    end

    if Settings.DoubleFreeze == true then
        game:GetService("Workspace").Live[Client.name]:FindFirstChild("True"):Destroy()
    elseif Settings.DoubleFreeze == false then
        print("DoubleFreeze is false")
    end
    if Settings.TeamDamage == true then
        game:GetService("Workspace").Live[Client.name]:FindFirstChild("team damage"):Destroy()
    elseif Settings.TeamDamage == false then
        print("TeamDamage is false")
    end

    wait()
    Client.Backpack:WaitForChild("Dragon Throw")
    Client.Backpack["Dragon Throw"].Activator:WaitForChild("Flip")
    if (Client.Backpack:FindFirstChild("Dragon Throw")) then
        repeat
            wait()
            Character:FindFirstChildOfClass("Humanoid"):EquipTool(Client.Backpack["Dragon Throw"])
        until Client.Character:FindFirstChild("Dragon Throw")

        repeat
            wait()
            Character["Dragon Throw"]:Activate()
        until Character.Ki.Value < Character.Ki.MaxValue
    end

    local GrabCheck =
        coroutine.create(
        function()
            if Settings.forms == true then
                wait(2)
            else 
                wait(.5)
            end
            if not game.Workspace.Live["Broly BR"]:FindFirstChild("Override") then
                if Settings.Earth == true then
                    game.Players.LocalPlayer:Kick()
                    game:GetService('TeleportService'):Teleport(Ids[1], LocalPlayer)
                elseif Settings.Earth == false then
                    game.Players.LocalPlayer:Kick()
                    game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
                end
            end
            State = "Grabbed!"
        end
    )

    coroutine.resume(GrabCheck)
            

    repeat
        wait()
        Character["Dragon Throw"].Activator:FindFirstChild("Flip"):Destroy()
    until not Character["Dragon Throw"].Activator:FindFirstChild("Flip")

    coroutine.resume(AutoHit)

    local RejoinTime =
        coroutine.create(
        function()
            game:GetService("RunService").RenderStepped:Connect(
                function()
                    if game:GetService("Workspace").DistributedGameTime >= Settings.RejoinTime then
                        game:GetService("TeleportService"):Teleport(Ids[1], LocalPlayer)
                    end
                end
            )
        end
    )
    coroutine.resume(RejoinTime)

    local runService = game:GetService("RunService")
    local debuffs = {
        "Look",
        "xx",
        "Action",
        "SuperAction",
        "Attacking",
        "Using",
        "heavy",
        "hyper",
        "Hyper",
        "Tele",
        "tele",
        "Slow",
        "Killed",
        "KiBlasted",
        "MoveStart",
        "Hyper",
        "Dodging",
        "KiBlasting",
        "BStun",
        "creator",
        "KnockBacked",
        "NotHardBack"
    }

    local function onCharacterAdded(character)
        if (not character) then      
            return
        end

    if Settings.AnimateFreeze == true  and Settings.forms == false then
        game.Players.LocalPlayer.Character.Humanoid.Animator.Parent = game.Workspace.Live["Broly BR"].Humanoid
        wait(.2)
        game.Workspace.Live["Broly BR"].Humanoid.Animator:Destroy()
        wait(.1)
        game.Workspace.Live["Broly BR"].Humanoid.Animator:Destroy()
    end

        local GrabLol =
        coroutine.create(
        function()
            for i, v in pairs(Client.Character:GetChildren()) do
                    if v.Name == "Override" and Client.Character.Ki.Value == Client.Character.Ki.MaxValue then
                        game.Workspace.Live[Client.Name].Head:Destroy()
                    elseif v.Name == "Override" and Client.Character.Ki.Value < Client.Character.Ki.MaxValue * .99 then
                        print("niggerlover")
                        v:FindFirstChild("Override"):Destroy()
                    end
            end
        end
    )

    coroutine.resume(GrabLol)


        character.ChildAdded:Connect(
            function(child)
                runService.RenderStepped:Wait()
                if (table.find(debuffs, child.Name)) then
                    child:Destroy()
                end
            end
        )
    end

    onCharacterAdded(Client.Character)
    Client.CharacterAdded:Connect(onCharacterAdded)

    if (Client.Character) then
        for i, v in next, Client.Character:GetChildren() do
            if (table.find(debuffs, v.Name)) then
                runService.RenderStepped:Wait()
                v:Destroy()
            end
        end
    end

    local ExplosiveWaveEZ =
        coroutine.create(
        function()
            game:GetService("RunService").Stepped:Connect(
                function()
                    local Detection = {"ExplosiveWave"}

                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if table.find(Detection, v.Name) then
                            
                            Client.Character:FindFirstChild("Humanoid"):EquipTool(Client.Backpack["Flash Strike"])
                            Client.Character["Flash Strike"]:Activate()
                            wait(.001)
                            Client.Character["Flash Strike"]:Deactivate()
                            
                            if Client.Character["Flash Strike"] then
                                Client.Character["Flash Strike"].Parent = Client.Backpack
                            end
                        end
                    end
                end
            )
        end
    )

    coroutine.resume(ExplosiveWaveEZ)


     while true do
        for i, v in pairs(Client.Backpack:GetChildren()) do
            if
                v.Name == Move1 or v.Name == Move2 or v.Name == Move3 or v.Name == Move4 or v.Name == Move5 or
                    v.Name == Move6 or
                    v.Name == Move7 
                   
                    
             then
                v.Parent = Client.Character
                v:Activate()
                wait(.001)
                v:Deactivate()
                v.Parent = Client.Backpack
                Client.Backpack.ServerTraits.EatSenzu:FireServer(
                    "snake sucks dick nigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger nigger"
                )
                State = "Working"
                if game.Workspace.Live["Broly BR"].Humanoid.Health < .1 then
                    if Settings.Earth == true then
                        game:GetService("TeleportService"):Teleport(Ids[1], LocalPlayer)
                    elseif Settings.Earth == false then
                        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
                    end
                end
            end
        end
    end
end