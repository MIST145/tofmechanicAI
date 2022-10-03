

function repairbody(veh)
    local oldbodyhealth = GetVehicleBodyHealth(veh)
    print('Old body health '..oldbodyhealth)
    SetVehicleFixed(veh)
    local newbodyhealth = GetVehicleBodyHealth(veh)
    print('New body health '..newbodyhealth)
end

function addfuellevel(veh)
    local oldfuel = GetVehicleFuelLevel(veh)
    print('old fuel level '..oldfuel)
    local newfuel = oldfuel + 10.0
    if newfuel > 100 then newfuel = 100.0 end
    print('new fuel level '..newfuel)
    SetVehicleFuelLevel(veh, newfuel)
end

function timermecanoanim(timer)
	------------------**notification**----------------------
    lib.progressCircle({
        duration = timer,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = false,
        },
    })
    ------------------**fin notification**-----------------
end

function model(modl)	
    RequestModel(modl)
    while not HasModelLoaded(modl) and RequestModel(modl) do	
        RequestModel(modl)
        Citizen.Wait(1)		
    end
end

function anim(dict)	
	RequestAnimDict(dict)		
	while not HasAnimDictLoaded(dict) and RequestAnimDict(dict) do		
		RequestAnimDict(dict)
		Citizen.Wait(1)		
	end
end