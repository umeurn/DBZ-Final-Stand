--HybridScript--
-------Settings-------

local LowLvlSlotThatIsUseToBecomeAHybrid = "Slot3"
local SlotThatWillBeAHybrid = "Slot2"

-------Variables------

local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

-------functions-------

function respawn()
    if workspace.FriendlyNPCs:FindFirstChild'Hair Stylist' then
        plr.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs["Hair Stylist"])
        task.wait(0.3)
        plr.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"})
        task.wait(0.5)
        plr.Backpack.HairScript.RemoteEvent:FireServer("woah")
    end
end

function Slot1()
    plr.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs["Character Slot Changer"])
    task.wait(0.5)
    plr.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"})
    task.wait(0.5)
    plr.Backpack.ServerTraits.ChatAdvance:FireServer({"k"})
    task.wait(0.5)
    plr.Backpack.ServerTraits.ChatAdvance:FireServer({LowLvlSlotThatIsUseToBecomeAHybrid})
    task.wait(0.5)
    plr.Backpack.ServerTraits.ChatAdvance:FireServer({"k"})
end

function Slot2()
    plr.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs["Character Slot Changer"])
    task.wait(0.4)
    plr.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"})
    task.wait(0.4)
    plr.Backpack.ServerTraits.ChatAdvance:FireServer({"k"})
    task.wait(0.4)
    plr.Backpack.ServerTraits.ChatAdvance:FireServer({SlotThatWillBeAHybrid})
end

--------Script--------

mouse.KeyDown:connect(function(key)
    if key == "j" then--If it didn't work then go back to this slot by pressing this button
        Slot1()
    end
    if key == "k" then--This is the slot that you want to change in to a hybrid
        Slot2()
    end
    if key == "l" then--Press this when the slot is about to switch(Right when it says "Loading...")
        respawn()
    end
end)