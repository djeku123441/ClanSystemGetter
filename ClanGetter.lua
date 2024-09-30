local event = game.ReplicatedStorage.Events.AfterDataStoreSucces
local spinclanevent = game.ReplicatedStorage.Events.SpinClan
local module = require(game.ReplicatedStorage.Modules.ClanModule)
function toArray(dictionary)
	local result = {}
	for _, v in pairs(dictionary) do 
		table.insert(result, v)
	end
	return result 
end
local function clanget(player)
	local odds = math.random(1,100)
	if odds == module.Chances.Legendary then
		print(odds)
		print("Legendary clan")
		local array = toArray(module.Clans.Legendary)
		local index = math.random(1,#array)
		local clan = array[index]
		print(clan)
		player.Character.Head.Clan.NameText.Text = clan
		player.Values.Clan.Value = clan
		player.Values.HasClan.Value = true
	elseif odds <= module.Chances.Rare and odds >= module.Chances.Legendary + 1 then
		print(odds)
		print("Rare clan")
		local array = toArray(module.Clans.Rare)
		local index = math.random(1,#array)
		local clan = array[index]
		print(clan)
		player.Character.Head.Clan.NameText.Text = clan
		player.Values.Clan.Value = clan
		player.Values.HasClan.Value = true
	elseif odds <= module.Chances.Uncommon and odds >= module.Chances.Rare + 1 then
		print(odds)
		print("Uncommon")
		local array = toArray(module.Clans.Uncommon)
		local index = math.random(1,#array)
		local clan = array[index]
		print(clan)
		player.Character.Head.Clan.NameText.Text = clan
		player.Values.Clan.Value = clan
		player.Values.HasClan.Value = true
	elseif odds <= 100 and odds >= module.Chances.Uncommon + 1 then
		print(odds)
		print("CommonClan")
		local array = toArray(module.Clans.Common)
		local index = math.random(1,#array)
		local clan = array[index]
		print(clan)
		player.Character.Head.Clan.NameText.Text = clan
		player.Values.Clan.Value = clan
		player.Values.HasClan.Value = true
	end
end
game.Players.PlayerAdded:Connect(function(player)
	event.OnServerEvent:Connect(function()
		print("event got ran2")
		if player.Values.HasClan.Value == false then
			clanget(player)
		else 
			player.Character.Head.Clan.NameText.Text = player.Values.Clan.Value
			return end
	end)
	player.CharacterAdded:Connect(function()
		if player.Values.HasClan.Value == false then
			clanget(player)
		else 
			player.Character.Head.Clan.NameText.Text = player.Values.Clan.Value
			return end
	end)
	spinclanevent.OnServerEvent:Connect(function(player)
		clanget(player)
	end)
end)