ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}
local societyarmemoney2 = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job2 == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)

RMenu.Add('test', 'boss', RageUI.CreateMenu("Vendeur D'Arme", "Actions Patron"))
Citizen.CreateThread(function()
    while true do

        RageUI.IsVisible(RMenu:Get('test', 'boss'), true, true, true, function()

            if societyarmemoney2 ~= nil then
                RageUI.ButtonWithStyle("Argent société :", nil, {RightLabel = "$" .. societyarmemoney2}, true, function()
                end)
            end

           RageUI.ButtonWithStyle("Accéder aux actions de Management",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                if Selected then
                    aboss()
                    RageUI.CloseAll()
                end
            end)


        end, function()
        end, 1)
                        Citizen.Wait(0)
                                end
                            end)

---------------------------------------------

local ilestlalemenu = {
    {x = -1545.01, y = 137.07, z = 55.97}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(ilestlalemenu) do
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'arme' or ESX.PlayerData.job2 and ESX.PlayerData.job2.name == 'arme' and ESX.PlayerData.job2.grade_name == 'boss' then 

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, ilestlalemenu[k].x, ilestlalemenu[k].y, ilestlalemenu[k].z)
			DrawMarker(20, 791.21, -573.87, 21.49+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 150, 50, 157, 255, 0, 1, 2, 0, nil, nil, 0)        
            if dist <= 1.0 then
                RageUI.Text({

                    message = "Appuyez sur [~r~E~w~] pour gérer votre organisation",
        
                    time_display = 1
        
                })
                if IsControlJustPressed(1,51) then
                    RefresharmeMoney()
                    RageUI.Visible(RMenu:Get('test', 'boss'), not RageUI.Visible(RMenu:Get('test', 'boss')))
                end
            end
        end
    end
    end
end)

function RefresharmeMoney()
    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then
        ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
            UpdateSocietyarmeMoney(money)
        end, ESX.PlayerData.job2.name)
    end
end

function UpdateSocietyarmeMoney(money)
    societyarmemoney2 = ESX.Math.GroupDigits(money)
end

function aboss()
    TriggerEvent('esx_society:openBossMenu', 'arme', function(data, menu)
        menu.close()
    end, {wash = false})
end



