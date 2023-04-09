 ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

KaitoFiveDev              = {}
KaitoFiveDev.DrawDistance = 100
KaitoFiveDev.Size         = {x = 1.0, y = 1.0, z = 1.0}
KaitoFiveDev.Color        = {r = 255, g = 255, b = 255}
KaitoFiveDev.Type         = -1

local ilestlalemenu = {
        {x = -1546.53, y = 138.73, z = 55.97}      
}  

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k in pairs(ilestlalemenu) do
            if (KaitoFiveDev.Type ~= -1 and GetDistanceBetweenCoords(coords, ilestlalemenu[k].x, ilestlalemenu[k].y, ilestlalemenu[k].z, true) < KaitoFiveDev.DrawDistance) then
                DrawMarker(KaitoFiveDev.Type, ilestlalemenu[k].x, ilestlalemenu[k].y, ilestlalemenu[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, KaitoFiveDev.Size.x, KaitoFiveDev.Size.y, KaitoFiveDev.Size.z, KaitoFiveDev.Color.r, KaitoFiveDev.Color.g, KaitoFiveDev.Color.b, 100, false, true, 2, false, false, false, false)
                letSleep = false
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

RMenu.Add('black_kaito', 'main', RageUI.CreateMenu("Marché Noir", "Catalogue des armes...."))
RMenu.Add('black_kaito', 'shop', RageUI.CreateSubMenu(RMenu:Get('black_kaito', 'main'), "Armurerie", "Voici nos armes létal."))
RMenu.Add('black_kaito', 'armurerie', RageUI.CreateSubMenu(RMenu:Get('black_kaito', 'main'), "Armurerie", "Voici nos armes blanche."))
RMenu.Add('black_kaito', 'armurerie', RageUI.CreateSubMenu(RMenu:Get('black_kaito', 'main'), "Armererie", "Voici nos objets de braquo"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('black_kaito', 'main'), true, true, true, function()


			RageUI.Checkbox("Activer le VPN",nil, service,{},function(Hovered,Ative,Selected,Checked)
                if Selected then

                    service = Checked


                    if Checked then
                        onservice = true
						RageUI.Popup({
							message = "Vous êtes sur votre VPN !"})

                        
                    else
                        onservice = false
						RageUI.Popup({
							message = "Vous avez déco de votre VPN !"})

                    end
                end
            end)

			if onservice then

				RageUI.Separator("↓ ~y~   Armes de Poing  ~s~↓")

                RageUI.Checkbox("Voir toutes les pistolets..",nil, servicee,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then
    
                        servicee = Checked
    
    
                        if Checked then
                            onservicee = true
                            RageUI.Popup({
                                message = "Vous ouvrez la page!"})
    
                            
                        else
                            onservicee = false
                            RageUI.Popup({
                                message = "Vous fermez la page !"})
    
                        end
                    end
                end)

                if onservicee then

                RageUI.ButtonWithStyle("Pistolet Lourd", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        local item = "weapon_heavypistol"
                        local prix = 0
                        TriggerServerEvent('black_kaito:acheter', item, prix)
                        ExecuteCommand("me achète un Pistolet Lourd")
                    end
                    end)

                    RageUI.ButtonWithStyle("Pistolet Calibre 50", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            local item = "weapon_pistol50"
                            local prix = 0
                            TriggerServerEvent('black_kaito:acheter', item, prix)
                            ExecuteCommand("me achète un Calibre 50")
                        end
                        end)
		
                    RageUI.ButtonWithStyle("Pétoire", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            local item = "weapon_snspistol"
                            local prix = 0
                            TriggerServerEvent('black_kaito:acheter', item, prix)
                            ExecuteCommand("me achète un Pétoire")
                        end
                        end)

                        RageUI.ButtonWithStyle("Revolver", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                            if (Selected) then   
                                local item = "weapon_revolver"
                                local prix = 0
                                TriggerServerEvent('black_kaito:acheter', item, prix)
                                ExecuteCommand("me achète un Revolver")
                            end
                            end)

                            RageUI.ButtonWithStyle("Pistolet Vintage", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                                if (Selected) then   
                                    local item = "weapon_vintagepistol"
                                    local prix = 0
                                    TriggerServerEvent('black_kaito:acheter', item, prix)
                                    ExecuteCommand("me achète un Pistolet Vintage")
                                end
                                end)

				RageUI.Separator("↓ ~r~ Armes Lourdes  ~s~↓")

                RageUI.Checkbox("Voir toutes ces merveilles..",nil, serviceee,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then
    
                        serviceee = Checked
    
    
                        if Checked then
                            onserviceee = true
                            RageUI.Popup({
                                message = "Vous ouvrez la page!"})
    
                            
                        else
                            onserviceee = false
                            RageUI.Popup({
                                message = "Vous fermez la page !"})
    
                        end
                    end
                end)

                if onserviceee then

                RageUI.ButtonWithStyle("Micro-UZI", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        local item = "weapon_microsmg"
                        local prix = 0
                        TriggerServerEvent('black_kaito:acheter', item, prix)
                        ExecuteCommand("me achète un Micro-UZI")
                    end
                    end)

                    RageUI.ButtonWithStyle("SMG D'Assaut", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            local item = "weapon_assaultsmg"
                            local prix = 0
                            TriggerServerEvent('black_kaito:acheter', item, prix)
                            ExecuteCommand("me achète une SMG D'Assaut")
                        end
                        end)
        
                        
                    RageUI.ButtonWithStyle("ADP de Combat", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            local item = "weapon_combatpdw"
                            local prix = 0
                            TriggerServerEvent('black_kaito:acheter', item, prix)
                            ExecuteCommand("me achète un ADP de Combat")
                        end
                        end)

                        RageUI.ButtonWithStyle("SMG", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                            if (Selected) then   
                                local item = "weapon_smg"
                                local prix = 0
                                TriggerServerEvent('black_kaito:acheter', item, prix)
                                ExecuteCommand("me achète une SMG")
                            end
                            end)

                            RageUI.ButtonWithStyle("AK-47", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                                if (Selected) then   
                                    local item = "weapon_assaultrifle"
                                    local prix = 0
                                    TriggerServerEvent('black_kaito:acheter', item, prix)
                                    ExecuteCommand("me achète une AK-47")
                                end
                                end)

                                RageUI.ButtonWithStyle("Mini SMG", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                                    if (Selected) then   
                                        local item = "weapon_minismg"
                                        local prix = 0
                                        TriggerServerEvent('black_kaito:acheter', item, prix)
                                        ExecuteCommand("me achète une Mini SMG")
                                    end
                                    end)

                                    RageUI.ButtonWithStyle("AK-74u", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                                        if (Selected) then   
                                            local item = "weapon_compactrifle"
                                            local prix = 0
                                            TriggerServerEvent('black_kaito:acheter', item, prix)
                                            ExecuteCommand("me achète une AK-74u")
                                        end
                                        end)

                                        RageUI.ButtonWithStyle("Balayeuse Gusenberg", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                                            if (Selected) then   
                                                local item = "weapon_gusenberg"
                                                local prix = 0
                                                TriggerServerEvent('black_kaito:acheter', item, prix)
                                                ExecuteCommand("me achète une Balayeuse Gusenberg")
                                            end
                                            end)

                                            RageUI.ButtonWithStyle("Advanced", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                                                if (Selected) then   
                                                    local item = "weapon_advancedrifle"
                                                    local prix = 0
                                                    TriggerServerEvent('black_kaito:acheter', item, prix)
                                                    ExecuteCommand("me achète un Advanced")
                                                end
                                                end)

                                                RageUI.ButtonWithStyle("Famas", nil, {RightLabel = "~g~0$"},true, function(Hovered, Active, Selected)
                                                    if (Selected) then   
                                                        local item = "weapon_bullpuprifle"
                                                        local prix = 0
                                                        TriggerServerEvent('black_kaito:acheter', item, prix)
                                                        ExecuteCommand("me achète un Famas")
                                                    end
                                                    end)
                end
            end
            end
			end, function()
			end)

Citizen.Wait(0)
end
end)

Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)



        for k in pairs(ilestlalemenu) do



            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, ilestlalemenu[k].x, ilestlalemenu[k].y, ilestlalemenu[k].z)

            DrawMarker(20, 797.86, -561.46, 21.49+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 250, 3, 200, 255, 0, 1, 2, 0, nil, nil, 0)

            if ESX.PlayerData.job and ESX.PlayerData.job2.name == 'arme' then  

            if dist <= 2.0 then

                
                RageUI.Text({

                    message = "[~r~E~w~] ~w~Se Connecter au PC",

                    time_display = 1

                })

                if IsControlJustPressed(1,51) then

                    RageUI.Visible(RMenu:Get('black_kaito', 'main'), not RageUI.Visible(RMenu:Get('black_kaito', 'main'))) 

                end   

            end

        end

    end
end

end)


----- PED 

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_business_02")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
	end
	ped = CreatePed("PED_TYPE_CIVMALE", "a_m_y_business_02", 785.73, -542.07,  21.47, 162.44, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)