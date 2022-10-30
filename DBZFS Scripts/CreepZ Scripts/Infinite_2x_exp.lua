game:GetService("RunService").Stepped:Connect(function()
    if game.Players.LocalPlayer.Character:FindFirstChild("True") then
        game.Players.LocalPlayer.Character:FindFirstChild("True"):Destroy();
    end;
end);
