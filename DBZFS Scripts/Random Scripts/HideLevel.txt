(game:GetService("RunService")).RenderStepped:Connect(function()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v.Name:find("Lvl.") then
			v:Destroy();
		end;
	end;
end);
