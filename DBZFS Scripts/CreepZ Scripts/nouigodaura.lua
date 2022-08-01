(game:GetService("RunService")).RenderStepped:Connect(function()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v.Name:find("Ui") then
			v:Destroy();
		end;
	end;
end);
