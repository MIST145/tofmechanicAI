lib.locale()

RegisterNetEvent('mecano:msgcashpay')
AddEventHandler('mecano:msgcashpay', function(cost)
    ------------------**notification**----------------------
    lib.showTextUI(locale('cashpay')..cost..' $', {
        position = "bottom-left",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'green',
            color = 'white'
        }
    })
    Citizen.Wait(10000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)

RegisterNetEvent('mecano:msgbankpay')
AddEventHandler('mecano:msgbankpay', function(cost)
    ------------------**notification**----------------------
    lib.showTextUI(locale('bankpay')..cost..' $', {
        position = "bottom-left",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'green',
            color = 'white'
        }
    })
    Citizen.Wait(10000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)

RegisterNetEvent('mecano:msgonline')
AddEventHandler('mecano:msgonline', function()
    ------------------**notification**----------------------
    lib.showTextUI(locale('mecaonline'), {
        position = "top-center",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'red',
            color = 'white'
        }
    })
    Citizen.Wait(10000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)

RegisterNetEvent('mecano:msgnomoney')
AddEventHandler('mecano:msgnomoney', function(cost)
    ------------------**notification**----------------------
    lib.showTextUI(locale('nomoney')..cost..' $', {
        position = "bottom-left",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'red',
            color = 'white'
        }
    })
    Citizen.Wait(10000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)

RegisterNetEvent('mecano:msgcommand')
AddEventHandler('mecano:msgcommand', function()
    ------------------**notification**----------------------
    lib.showTextUI(locale('command')..Optionsmecano.command, {
        position = "top-center",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'grey',
            color = 'white'
        }
    })
    Citizen.Wait(3000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)

RegisterNetEvent('mecano:msgstay')
AddEventHandler('mecano:msgstay', function()
    ------------------**notification**----------------------
    lib.showTextUI(locale('stayvehicle'), {
        position = "top-center",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'grey',
            color = 'white'
        }
    })
    Citizen.Wait(3000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)

RegisterNetEvent('mecano:msgwait')
AddEventHandler('mecano:msgwait', function()
    ------------------**notification**----------------------
    lib.showTextUI(locale('wait'), {
        position = "top-center",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'grey',
            color = 'white'
        }
    })
    Citizen.Wait(3000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)

RegisterNetEvent('mecano:msgrepairengine')
AddEventHandler('mecano:msgrepairengine', function()
    ------------------**notification**----------------------
    lib.showTextUI(locale('repairengine'), {
        position = "top-center",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'grey',
            color = 'white'
        }
    })
    Citizen.Wait(3000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)

RegisterNetEvent('mecano:msgengineok')
AddEventHandler('mecano:msgengineok', function()
    ------------------**notification**----------------------
    lib.showTextUI(locale('engineok'), {
        position = "top-center",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'grey',
            color = 'white'
        }
    })
    Citizen.Wait(3000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)

RegisterNetEvent('mecano:msgbodyok')
AddEventHandler('mecano:msgbodyok', function()
    ------------------**notification**----------------------
    lib.showTextUI(locale('bodyok'), {
        position = "top-center",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'grey',
            color = 'white'
        }
    })
    Citizen.Wait(3000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)

RegisterNetEvent('mecano:msgfuelok')
AddEventHandler('mecano:msgfuelok', function()
    ------------------**notification**----------------------
    lib.showTextUI(locale('fuelok'), {
        position = "top-center",
        icon = 'circle-info',
        style = {
            borderRadius = 1,
            backgroundColor = 'grey',
            color = 'white'
        }
    })
    Citizen.Wait(3000)
    lib.hideTextUI()
    ------------------**fin notification**-----------------
end)