local RSEvents = game.ReplicatedStorage.Events
local Events = {
	["NameConfirm"] = RSEvents.NameConfirm,
	["CheckIfNameHave"] = RSEvents.CheckIfNameHave,
	["AfterDataStoreSucces"] = RSEvents.AfterDataStoreSucces,
	["PlayerAdded"] = RSEvents.PlayerAdded,
	["PlayerRemoved"] = RSEvents.PlayerRemoved,
}
local function getplayerdata(player)
	if player.Values.HasName.Value == false then
		print("Value is false")
		Events.CheckIfNameHave:FireClient(player, "False")
	else
		print("Value is true")
		player.Character.Head.NameUI.NameText.Text = player.Values.CharName.Value
		Events.CheckIfNameHave:FireClient(player, "True") return end
end
Events.NameConfirm.OnServerEvent:Connect(function(Player,unimportant,name)
	print(Player)
	print(Player.Character.Head.NameUI.NameText.Text)
	print(name)
	Player.Values.HasName.Value = true
	Player.Character.Head.NameUI.NameText.Text = name
	Player.Values.CharName.Value = name
end)
game.Players.PlayerAdded:Connect(function(newplr)
	Events.AfterDataStoreSucces.OnServerEvent:Connect(function(player)
		print("code ran server script")
		Events.PlayerAdded:FireClient(player,newplr)
		print(player)
		getplayerdata(player)
		player.CharacterAdded:Connect(function()
			getplayerdata(player)
		end)
	end)
end)
game.Players.PlayerRemoving:Connect(function(player)
	Events.PlayerRemoved:FireClient(player)
end)