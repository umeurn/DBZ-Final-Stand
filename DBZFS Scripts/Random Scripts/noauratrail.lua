(game:GetService("RunService")).RenderStepped:Connect(function()
	for i, v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
		if v.Name:find("Trail") or v.Name:find("AuraOriginal") or v.Name:find("AuraParticle") then
			v:Destroy();
		end;
	end;
end);
