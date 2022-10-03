local maxMecano = Optionsmecano.max
local cost = Optionsmecano.cost
local jobmechanic = Optionsmecano.jobname

RegisterServerEvent('mecano:mecanoonline')
AddEventHandler('mecano:mecanoonline', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	local mecaOnline = 0
	print('dispatch server')
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == jobmechanic then
			mecaOnline = mecaOnline + 1
		end
	end
	if mecaOnline <= maxMecano then
		TriggerEvent('mecano:verifmoney', xPlayer, target)
	else
		TriggerClientEvent('mecano:msgonline', xPlayer.source)
	end
end)

RegisterServerEvent('mecano:verifmoney')
AddEventHandler('mecano:verifmoney', function(xPlayer, target)
	local Money = xPlayer.getAccount('money').money
	local Bank = xPlayer.getAccount('bank').money    
	print('verif money')
    if Money >= cost then
		xPlayer.removeAccountMoney('money', cost)
		TriggerClientEvent('mecano:msgcashpay', xPlayer.source, cost)
		Citizen.Wait(3000)
		TriggerClientEvent('mecano:repair', xPlayer.source, target)
	elseif Bank >= cost then
		xPlayer.removeAccountMoney('bank', cost)
		TriggerClientEvent('mecano:msgbankpay', xPlayer.source, cost)
		Citizen.Wait(3000)
		TriggerClientEvent('mecano:repair', xPlayer.source, target)
	else
		TriggerClientEvent('mecano:msgnomoney', xPlayer.source, cost)
	end
end)
