local command = Optionsmecano.command
local mecano = GetHashKey(Optionsmecano.model)
local timerwait = Optionsmecano.timerwait
local timerrepair = Optionsmecano.timerrepair
local bodyrepair = Optionsmecano.body
local addfuel = Optionsmecano.addfuel
local repairstate = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

-------------------------------------------------------------

Citizen.CreateThread(function()  
	while true do
		local playerPed = PlayerPedId()
		local targetmessage = nil		
		if IsPedSittingInAnyVehicle(playerPed) then		
			targetmessage = GetVehiclePedIsIn(playerPed, false)			
		end    		
		local healthengine = GetVehicleEngineHealth(targetmessage)		
		if healthengine <= 500 then		
			TriggerEvent('mecano:msgcommand')
		end    
		Citizen.Wait(6000)  
  	end
end)

RegisterNetEvent('mecano:repairstate')
AddEventHandler('mecano:repairstate', function()
	repairstate = not repairstate
	print(repairstate)	
end)

RegisterNetEvent('mecano:dispatch_c')
AddEventHandler('mecano:dispatch_c', function()
	local player = PlayerPedId()
	local target = nil
	print('dispatch client')
	if IsPedSittingInAnyVehicle(player) then 
		target = GetVehiclePedIsIn(player, false)
	end
	if DoesEntityExist(target) then
		TriggerServerEvent('mecano:mecanoonline', target)
	else
		TriggerEvent('mecano:msgstay')
	end		
end)

RegisterNetEvent('mecano:repair')
AddEventHandler("mecano:repair", function(target)
	TriggerEvent('mecano:repairstate')
	local player = PlayerPedId()
    local playerPos = GetEntityCoords(player)
	local oldhealthengine = nil
	local newhealthengine = nil
	Citizen.Wait(100)
	local oldhealthengine = GetVehicleEngineHealth(target)
	print('old health engine '..oldhealthengine)
	FreezeEntityPosition(player, true)
	model(mecano)
	anim('cellphone@')
	Citizen.Wait(100)
	TriggerEvent('mecano:msgwait')
	timermecanoanim(timerwait)		
    MecaP = CreatePed(4, mecano, playerPos.x+2, playerPos.y+2, playerPos.z, spawnHeading, true, false)  		
	SetEntityInvincible(MecaP, true)
	SetPedFleeAttributes(MecaP, 0, false)
	mecapos = GetEntityCoords(MecaP)
	engine = GetWorldPositionOfEntityBone(target, GetEntityBoneIndexByName(target, "engine"))
    TaskGoToCoordAnyMeans(MecaP, engine, 2.0, 0, 0, 786603, 0xbf800000)
	Citizen.Wait(5000)
	SetVehicleUndriveable(target, true)
    TaskTurnPedToFaceCoord(MecaP, GetEntityCoords(target), -1)
    Citizen.Wait(2500)
	for i = 0, 7 do
		SetVehicleDoorOpen(target, i, false, true)
	end
	FreezeEntityPosition(MecaP, true)
	TaskStartScenarioInPlace(MecaP, "PROP_HUMAN_BUM_BIN", 0, 1)
    Citizen.Wait(1000)
	TriggerEvent('mecano:msgrepairengine')
    timermecanoanim(timerrepair)	
	SetVehicleEngineHealth(target, 1000.0)
	if bodyrepair then
		repairbody(target)
		Citizen.Wait(2000)
		TriggerEvent('mecano:msgbodyok')
	end
	Citizen.Wait(1000)
	if addfuel then
		addfuellevel(target)
		Citizen.Wait(2000)
		TriggerEvent('mecano:msgfuelok')
	end
	local newhealthengine = GetVehicleEngineHealth(target)
	print('New health engine '..newhealthengine)
	Citizen.Wait(3000)
	TriggerEvent('mecano:msgengineok')
	FreezeEntityPosition(MecaP, false)
	ClearPedTasks(MecaP)		
	for i = 0, 7 do
		SetVehicleDoorShut(target, i, true)
	end
	RemovePedElegantly(MecaP)	
	SetVehicleOnGroundProperly(target)
	SetVehicleUndriveable(target, false)
	FreezeEntityPosition(player, false)
	TriggerEvent('mecano:repairstate')	
end)


RegisterCommand(command, function(source, args, raw)
	if not repairstate then
		TriggerEvent('mecano:dispatch_c')
	end
end)


------- fin docteur ---------