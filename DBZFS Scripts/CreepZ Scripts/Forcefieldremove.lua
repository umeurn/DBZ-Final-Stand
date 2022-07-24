game:GetService("RunService").RenderStepped:Connect(function()
    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v.ClassName == "ForceField" then 
            v:Destroy(); 
        end;
    end;
end);