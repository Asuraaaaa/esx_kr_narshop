ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

KRX_Nar_Config = {
    Positions = {
            {x = 248.168106079,   y = -46.583744049072, z = 69.94},
            { x = -664.64569091797,   y = -940.21185302734,   z = 21.829 },
            { x = 812.56927490234,     y = -2152.1096191406,   z = 29.62 },
            { x = 1694.9117431641,    y = 3755.3195800781,    z = 34.71 },
            { x = -328.69104003906,    y = 6078.6918945313,    z = 31.45 },
            { x = 18.28125,      y = -1110.5366210938,   z = 29.80 },
            { x = 2570.3037109375,    y = 298.80117797852,     z = 108.73 },
            { x = -1116.3403320313,   y = 2693.3076171875,    z = 18.55 },
            { x = 844.77264404297,     y = -1028.8736572266,   z = 28.19 }
	},
	
	

    Items = {
        {Label = '~b~Skin de Luxe', Value = 'yusuf', Price = 950},
        {Label = '~b~Poignée', Value = 'grip', Price = 150 },
        {Label = '~b~Chargeur', Value = 'clip', Price = 500 },
        {Label = '~b~Silencieux', Value = 'silencieux', Price = 80 },
        {Label = '~b~Lampe', Value = 'flashlight', Price = 250 } 
    }
}

--Citizen.CreateThread(function()
--	for k, v in pairs(KRX_Nar_Config.Positions) do
--		local blip = AddBlipForCoord(v.x, v.y, v.z)
--
--     --- Blip Apple 
--
--		SetBlipSprite(blip, 205)
--		SetBlipScale (blip, 0.8)
--	--	SetBlipColour(blip, 2)
--		SetBlipAsShortRange(blip, true)
--
--		BeginTextCommandSetBlipName('STRING')
--		AddTextComponentSubstringPlayerName(_U('shop') .. ' ['.. v.name .. ']')
--		EndTextCommandSetBlipName(blip)
--	end
--end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())

		for k, v in pairs(KRX_Nar_Config.Positions) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

            if distance < 10.0 then
                actualZone = v

                zoneDistance = GetDistanceBetweenCoords(playerCoords, actualZone.x, actualZone.y, actualZone.z, true)

				DrawMarker(29, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9, 0.9, 0, 128, 255, 255, true, true, 2, false, nil, nil, false)
            end

            
            if distance <= 1.5 then
                ESX.ShowHelpNotification(_U('open_menu'))

                if IsControlJustPressed(1, 51) then
                    RageUI.Visible(RMenu:Get('showcase', 'shopMenu'), not RageUI.Visible(RMenu:Get('showcase', 'shopMenu')))
                end
            end

            if zoneDistance ~= nil then
                if zoneDistance > 1.5 then
                    RageUI.CloseAll()
                end
            end
		end
	end
end)

local max = 10 
Numbers = {}

Citizen.CreateThread(function()
    for i = 1, max do
        table.insert(Numbers, i)
    end
end)

-- PED NUMERO 1 - PED NUMBER 1

Citizen.CreateThread(function()
    local hash = GetHashKey("csb_sol")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_APPLE", "csb_sol", -627.307, -274.830, 34.577, 133.015, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)



-- PED NUMERO 2

Citizen.CreateThread(function()
    local hash = GetHashKey("csb_sol")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_APPLE", "csb_sol", -659.040, -858.839, 23.490, 358.280, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)



-- Nom au dessus du PED 1 

local v1 = vector3(-627.307, -274.830, 36.577)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "Mounir")
        end
    end
end)






-- Nom au dessus du PED 2

local v1 = vector3(-659.040, -858.839, 25.490)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "Mounir")
        end
    end
end)
