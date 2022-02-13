ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local tsv = TriggerServerEvent
-------------------------------------------------------------------------------
-------██████╗░██████╗░██╗░░░██╗░█████╗░░██████╗███████╗░█████╗░░█████╗░-------
-------██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗-------
-------██║░░██║██████╔╝╚██╗░██╔╝██║░░██║╚█████╗░█████╗░░██║░░╚═╝███████║-------
-------██║░░██║██╔══██╗░╚████╔╝░██║░░██║░╚═══██╗██╔══╝░░██║░░██╗██╔══██║-------
-------██████╔╝██║░░██║░░╚██╔╝░░╚█████╔╝██████╔╝███████╗╚█████╔╝██║░░██║-------
-------╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░╚═════╝░╚══════╝░╚════╝░╚═╝░░╚═╝-------
-------------------------------------------------------------------------------


local PlayerData                = {}
ESX                             = nil

local kopali = false
local preradjujeli = false
local impakti = 0
local vreme = 0

local lokacije = {
{ ['x'] =-553.19,  ['y'] = 5372.66 , ['z'] = 70.35},
{ ['x'] =-554.17,  ['y'] = 5369.96 , ['z'] = 70.36},
{ ['x'] =-555.03,  ['y'] = 5367.3 , ['z'] = 70.34},

{ ['x'] =-545.36,  ['y'] = 5385.99 , ['z'] = 70.37},
{ ['x'] =-543.63,  ['y'] = 5388.6 , ['z'] =70.29},
{ ['x'] =-541.2,  ['y'] =5393.23 , ['z'] =70.11},

{ ['x'] =-537.83,  ['y'] = 5372.75 , ['z'] = 70.61},
{ ['x'] =-538.77,  ['y'] = 5370.04 , ['z'] =70.48},

}
local prerada2X = -524.86
local prerada2Y = 5285.99
local prerada2Z = 74.17

local prerada3X = -523.98
local prerada3Y = 5288.93
local prerada3Z = 74.17

local prerada4X = -524.15
local prerada4Y = 5293.98
local prerada4Z = 74.2

local prerada5X = -526.86
local prerada5Y = 5294.92
local prerada5Z = 74.17

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)  

RegisterNetEvent("kila:prerada")
AddEventHandler("kila:prerada", function()
    prerada()
end)


Citizen.CreateThread(function()
    local wejtara = 2000
    while true do
    Citizen.Wait(wejtara)

	    local ped = PlayerPedId()
        local djamu = 0
		local koordinate = GetEntityCoords(PlayerPedId())

        for i=1, #lokacije, 1 do
            if(Omega.Tip ~= -1 and GetDistanceBetweenCoords(koordinate, lokacije[i].x, lokacije[i].y, lokacije[i].z, true) < Omega.Daljina and kopali == false) then
                wejtara = 5
                djamu = 1
                DrawMarker(20, lokacije[i].x, lokacije[i].y, lokacije[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Omega.Velicina.x, Omega.Velicina.y, Omega.Velicina.z, Omega.Boja.r, Omega.Boja.g, Omega.Boja.b, 100, false, true, 2, false, false, false, false)
            
            
                if GetDistanceBetweenCoords(GetEntityCoords(ped), lokacije[i].x, lokacije[i].y, lokacije[i].z, true) < 1 then
                    ESX.ShowHelpNotification(Omega.Cepaj)
                    if IsControlJustReleased(1, 51) then
                    
                        animacija()
                        kopali = true
                    end
                end
                if djamu == 0 then
                    wejtara = 2000
                end
            else
                Citizen.Wait(200)    
            end
        end
    end
end)

Citizen.CreateThread(function()
    local wejtara = 2000
    while true do

    local djamu = 0
    local ped = PlayerPedId()

        Citizen.Wait(wejtara)
       
        if GetDistanceBetweenCoords(GetEntityCoords(ped), Omega.PreradaX, Omega.PreradaY, Omega.PreradaZ, true) < 25 and preradjujeli == false then
            wejtara = 5
            djamu = 1
            DrawMarker(20, Omega.PreradaX, Omega.PreradaY, Omega.PreradaZ, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Omega.Velicina.x, Omega.Velicina.y, Omega.Velicina.z, Omega.Boja.r, Omega.Boja.g, Omega.Boja.b, 100, false, true, 2, false, false, false, false)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), Omega.PreradaX, Omega.PreradaY, Omega.PreradaZ, true) < 1 then
                    ESX.ShowHelpNotification("Pritisni ~INPUT_CONTEXT~ da preradis drvo ")
                        if IsControlJustReleased(1, 51) then
                            tsv("kila:prerada")
                end
                if djamu == 0 then
                    wejtara = 2000
                end
            end
        else
            Citizen.Wait(200)
        end

        if GetDistanceBetweenCoords(GetEntityCoords(ped), prerada2X, prerada2Y, prerada2Z, true) < 25 and preradjujeli == false then
            wejtara = 5
            djamu = 1
            DrawMarker(20, prerada2X, prerada2Y, prerada2Z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Omega.Velicina.x, Omega.Velicina.y, Omega.Velicina.z, Omega.Boja.r, Omega.Boja.g, Omega.Boja.b, 100, false, true, 2, false, false, false, false)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), prerada2X, prerada2Y, prerada2Z, true) < 1 then
                    ESX.ShowHelpNotification(Omega.Preradi)
                        if IsControlJustReleased(1, 51) then
                            tsv("kila:prerada")
                end
                if djamu == 0 then
                    wejtara = 2000
                end
            end
        else
            Citizen.Wait(200)
        end
        if GetDistanceBetweenCoords(GetEntityCoords(ped), prerada3X, prerada3Y, prerada3Z, true) < 25 and preradjujeli == false then
            wejtara = 5
            djamu = 1
            DrawMarker(20, prerada3X, prerada3Y, prerada3Z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Omega.Velicina.x, Omega.Velicina.y, Omega.Velicina.z, Omega.Boja.r, Omega.Boja.g, Omega.Boja.b, 100, false, true, 2, false, false, false, false)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), prerada3X, prerada3Y, prerada3Z, true) < 1 then
                    ESX.ShowHelpNotification(Omega.Preradi)
                        if IsControlJustReleased(1, 51) then
                            tsv("kila:prerada")
                end
                if djamu == 0 then
                    wejtara = 2000
                end
            end
        else
            Citizen.Wait(200)
        end
        if GetDistanceBetweenCoords(GetEntityCoords(ped), prerada3X, prerada4Y, prerada4Z, true) < 25 and preradjujeli == false then
            wejtara = 5
            djamu = 1
            DrawMarker(20, prerada3X, prerada4Y, prerada4Z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Omega.Velicina.x, Omega.Velicina.y, Omega.Velicina.z, Omega.Boja.r, Omega.Boja.g, Omega.Boja.b, 100, false, true, 2, false, false, false, false)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), prerada3X, prerada4Y, prerada4Z, true) < 1 then
                    ESX.ShowHelpNotification(Omega.Preradi)
                        if IsControlJustReleased(1, 51) then
                            tsv("kila:prerada")
                end
                if djamu == 0 then
                    wejtara = 2000
                end
            end
        else
            Citizen.Wait(200)
        end

        if GetDistanceBetweenCoords(GetEntityCoords(ped), prerada5X, prerada5Y, prerada5Z, true) < 25 and preradjujeli == false then
            wejtara = 5
            djamu = 1
            DrawMarker(20, prerada5X, prerada5Y, prerada5Z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Omega.Velicina.x, Omega.Velicina.y, Omega.Velicina.z, Omega.Boja.r, Omega.Boja.g, Omega.Boja.b, 100, false, true, 2, false, false, false, false)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), prerada5X, prerada5Y, prerada5Z, true) < 1 then
                    ESX.ShowHelpNotification(Omega.Preradi)
                        if IsControlJustReleased(1, 51) then
                            tsv("kila:prerada")
                end
                if djamu == 0 then
                    wejtara = 2000
                end
            end
        else
            Citizen.Wait(200)
        end

    end
end)

function animacija()
    Citizen.CreateThread(function()
        while impakti < 3 do
            Citizen.Wait(1)
		    local ped = PlayerPedId()	
            exports['progressBars']:startUI(2500, "Secete drvo")
            RequestAnimDict("amb@world_human_hammering@male@base")
            Citizen.Wait(100)
            TaskPlayAnim(ped, 'amb@world_human_hammering@male@base', 'base', 8.0, 8.0, -1, 80, 0, 0, 0, 0)
            SetEntityHeading(ped, 270.0)

            if impakti == 0 then
                sekirce = CreateObject(GetHashKey('prop_w_me_hatchet'), 0, 0, 0, true, true, true) 
                AttachEntityToEntity(sekirce, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.15, -0.02, -0.02, 350.0, 100.00, 280.0, true, true, false, true, 1, true)
            end  
            Citizen.Wait(2500)
            ClearPedTasks(ped)
            impakti = impakti+1
            if impakti == 3 then
                DetachEntity(sekirce, 1, true)
                DeleteEntity(sekirce)
                DeleteObject(sekirce)
                kopali = false
                impakti = 0
                tsv("kila:cepanje")
                break
            end        
        end
    end)
end

function prerada()
    local ped = PlayerPedId()
    local tsv = TriggerServerEvent
    RequestAnimDict("mp_am_hold_up")
    preradjujeli = true
    Citizen.Wait(100)
    TaskPlayAnim(ped, 'mp_am_hold_up', 'purchase_beerbox_shopkeeper', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    tsv('InteractSound_SV:PlayOnSource', 'prerada', 4.0)
    exports.rprogress:Custom({
        Duration = 15900,
        Label = "Preradjujes drvo...",
        DisableControls = {
            Mouse = false,
            Player = true,
            Vehicle = true
        }
    })    
    Citizen.Wait(15900)
    ClearPedTasks(ped)
    preradjujeli = false
end

--BLIPOVI

--prerada

local blip1 = {
     {title="Prerada drveta", colour=52, id=237, x = -533.19, y = 5292.06, z = 74.17},
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blip1) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

--cepanje

local blip2 = {
    {title="Cepanje drva", colour=52, id=237, x = -553.19, y = 5372.66, z = 70.35},
 }
     
Citizen.CreateThread(function()

   for _, info in pairs(blip2) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, 1.0)
     SetBlipColour(info.blip, info.colour)
     SetBlipAsShortRange(info.blip, true)
     BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.title)
     EndTextCommandSetBlipName(info.blip)
   end
end)

local blip3 = {
    {title="Rudnik", colour=47, id=67, x = 2992.77, y = 2750.64, z = 42.78},
 }
     
Citizen.CreateThread(function()

   for _, info in pairs(blip3) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, 1.0)
     SetBlipColour(info.blip, info.colour)
     SetBlipAsShortRange(info.blip, true)
     BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.title)
     EndTextCommandSetBlipName(info.blip)
   end
end)

--------------------------------------------------------
-------	░█████╗░██████╗░░█████╗░███████╗████████╗-------
-------	██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝-------
-------	██║░░╚═╝██████╔╝███████║█████╗░░░░░██║░░░-------
-------	██║░░██╗██╔══██╗██╔══██║██╔══╝░░░░░██║░░░-------
-------	╚█████╔╝██║░░██║██║░░██║██║░░░░░░░░██║░░░-------
-------	░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░░░░╚═╝░░░-------
--------------------------------------------------------

RegisterNetEvent('kila:kundak')
AddEventHandler('kila:kundak', function()
	local igrac = PlayerPedId()
	local lib, anim = 'nmt_3_rcm-10', 'cs_nigel_dual-10'
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(igrac, lib, anim, 8.0, -8.0, -1, 15, 0, false, false, false)
	end)
    exports.rprogress:Custom({
        Duration = 8000,
        Label = "Pravis kundak...",
        DisableControls = {
            Mouse = false,
            Player = true,
            Vehicle = true
        }
    })    
    Wait(8000)
	ClearPedTasks(igrac)
end)

RegisterNetEvent('kila:cev')
AddEventHandler('kila:cev', function()
	local igrac = PlayerPedId()
	local lib, anim = 'nmt_3_rcm-10', 'cs_nigel_dual-10'
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(igrac, lib, anim, 8.0, -8.0, -1, 15, 0, false, false, false)
	end)
    exports.rprogress:Custom({
        Duration = 8000,
        Label = "Pravis pistoljsku cev...",
        DisableControls = {
            Mouse = false,
            Player = true,
            Vehicle = true
        }
    })    
    Wait(8000)
	ClearPedTasks(igrac)
end)

RegisterNetEvent('kila:stoljpi')
AddEventHandler('kila:stoljpi', function()
	local igrac = PlayerPedId()
	local lib, anim = 'nmt_3_rcm-10', 'cs_nigel_dual-10'
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(igrac, lib, anim, 8.0, -8.0, -1, 15, 0, false, false, false)
	end)
    exports.rprogress:Custom({
        Duration = 20000,
        Label = "Pravis pistolj...",
        DisableControls = {
            Mouse = false,
            Player = true,
            Vehicle = true
        }
    })
    Wait(20000)
	ClearPedTasks(igrac)
end)

-------------------------------------------------------
-------██████╗░██╗░░░██╗██████╗░░█████╗░██████╗░-------
-------██╔══██╗██║░░░██║██╔══██╗██╔══██╗██╔══██╗-------
-------██████╔╝██║░░░██║██║░░██║███████║██████╔╝-------
-------██╔══██╗██║░░░██║██║░░██║██╔══██║██╔══██╗-------
-------██║░░██║╚██████╔╝██████╔╝██║░░██║██║░░██║-------
-------╚═╝░░╚═╝░╚═════╝░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝-------
-------------------------------------------------------


---skupljanje metala---

Citizen.CreateThread(function()
    while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
    while ESX.GetPlayerData().job == nil do Wait(0) end
    while true do
        local ublizini = 0
        for k, v in pairs(Omega.Rudnik) do
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.koordinate, true) <= 2.5 then
                ublizini = v
                break
            end
        end
        if type(ublizini) == 'table' then
            while GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), ublizini.koordinate, true) <= 2.5 do
                Wait(0)
                ESX.ShowHelpNotification("Pritisni ~INPUT_CONTEXT~ da zapocnes kopanje")
                if IsControlJustReleased(0, 38) then
                    local player, distance = ESX.Game.GetClosestPlayer()
                    if distance == -1 or distance >= 4.0 then
                        kopa = true
                        SetEntityCoords(PlayerPedId(), ublizini.koordinate)
                        SetEntityHeading(PlayerPedId(), ublizini.heading)
                        FreezeEntityPosition(PlayerPedId(), true)

                        local model = loadModel(GetHashKey(Omega.Objekti['kramp']))
                        local axe = CreateObject(model, GetEntityCoords(PlayerPedId()), true, false, false)
                        AttachEntityToEntity(axe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, true, true, true, 0, true)

                        while kopa do
                            Wait(0)
                            SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'))
                            ESX.ShowHelpNotification("Pritisnite ~INPUT_ATTACK~ da kopate, ~INPUT_FRONTEND_RRIGHT~ da prestanete")
                            DisableControlAction(0, 24, true)
                            if IsDisabledControlJustReleased(0, 24) then
                                local dict = loadDict('melee@hatchet@streamed_core')
                                TaskPlayAnim(PlayerPedId(), dict, 'plyr_rear_takedown_b', 8.0, -8.0, -1, 2, 0, false, false, false)
                                local tajmer = GetGameTimer() + 800
                                while GetGameTimer() <= tajmer do Wait(0) DisableControlAction(0, 24, true) end
                                ClearPedTasks(PlayerPedId())
                                tsv('kila:iskopaj')
                            elseif IsControlJustReleased(0, 194) then
                                break
                            end
                        end
                        kopa = false
                        DeleteObject(axe)
                        FreezeEntityPosition(PlayerPedId(), false)
                    else
                        ESX.ShowNotification("Neko je blizu vas")
                    end
                end
            end
        end
        Wait(250)
    end
end)

---prerada metala---

Citizen.CreateThread(function()
	while true do
	local nasao = 0
	local wejtara = 500
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
        for k, v in pairs(Omega.Prerada) do
            if #(coords - v) <= 2 then
                nasao = 1
                wejtara = 0
                if not isProcessing then
                    ESX.ShowHelpNotification('Pritisnite ~INPUT_CONTEXT~ da preradite ~r~rude metala~s~.')
                    if IsControlJustReleased(0, 38) then
                        preradimetal()
                    end
                end
            end
        end
        if nasao == 0 then
            wejtara = 500
        end
        Citizen.Wait(wejtara)
	end
end)

function preradimetal()
	local igrac = PlayerPedId()
	isProcessing = true
	TaskStartScenarioInPlace(igrac, "PROP_HUMAN_BUM_BIN", 0, true)
    exports.rprogress:Custom({
        Duration = 50000,
        Label = "Preradjujes rude metala...",
        DisableControls = {
            Mouse = false,
            Player = true,
            Vehicle = true
        }
    })   	
	tsv('kila:preradi')
    Wait(50000)
	ClearPedTasks(igrac)
	isProcessing = false
end

-------------------------
-----random funkcije-----
-------------------------

text = function(str)
SetTextComponentFormat("STRING")
AddTextComponentString(str)
DisplaytextFromStringLabel(0, 0, 1, -1)
end

loadModel = function(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

loadDict = function(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end
