-------------------------
--- BadgerBankRobbery ---
-------------------------
NDCore = exports["ND_Core"]:GetCoreObject()
RegisterServerEvent("GiveRewardBank", function()
	local player = source
	NDCore.Functions.AddMoney(20000, player, "cash")
end)

RegisterServerEvent("GiveRewardAmmo", function()
	local player = source
	NDCore.Functions.AddMoney(500, player, "cash")
end)

RegisterServerEvent("GiveRewardLTD", function()
	local player = source
	NDCore.Functions.AddMoney(5000, player, "cash")
end)

RegisterServerEvent("GiveReward247", function()
	local player = source
	NDCore.Functions.AddMoney(5000, player, "cash")
end)

RegisterServerEvent("GiveRewardLiq", function()
	local player = source
	NDCore.Functions.AddMoney(5000, player, "cash")
end)


--- Server ---
robberyActive = false
RegisterNetEvent('BadgerBankRobbery:IsActive')
AddEventHandler('BadgerBankRobbery:IsActive', function()
	-- Check if active or not
	if robberyActive then
		-- One is active
		TriggerClientEvent('BadgerBankRobbery:IsActive:Return', source, true)
	else
		-- One is not active
		TriggerClientEvent('BadgerBankRobbery:IsActive:Return', source, false)
	end
end)

RegisterNetEvent('BadgerBankRobbery:SetActive')
AddEventHandler('BadgerBankRobbery:SetActive', function(bool)
	robberyActive = bool
	if bool then
		Wait((1000 * 60 * config.robberyCooldown)) -- Wait 15 minutes
		robberyActive = false
	end
end)

RegisterNetEvent('Print:PrintDebug')
AddEventHandler('Print:PrintDebug', function(msg)
	print(msg)
	TriggerClientEvent('chatMessage', -1, "^7[^1Badger's Scripts^7] ^1DEBUG ^7" .. msg)
end)
RegisterNetEvent('PrintBR:PrintMessage')
AddEventHandler('PrintBR:PrintMessage', function(msg)
	TriggerClientEvent('chatMessage', -1, msg)
end)