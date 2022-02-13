ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--------------------------------------------------------
-------	░█████╗░██████╗░░█████╗░███████╗████████╗-------
-------	██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝-------
-------	██║░░╚═╝██████╔╝███████║█████╗░░░░░██║░░░-------
-------	██║░░██╗██╔══██╗██╔══██║██╔══╝░░░░░██║░░░-------
-------	╚█████╔╝██║░░██║██║░░██║██║░░░░░░░░██║░░░-------
-------	░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░░░░╚═╝░░░-------
--------------------------------------------------------


---------KUNDAK---------
local kundak = {}
ESX.RegisterUsableItem('daska', function(source)
	local _source = source
	local Igrac = ESX.GetPlayerFromId(source)	
	local metal = Igrac.getInventoryItem('metal')
	local daska = Igrac.getInventoryItem('daska').count
	if daska > 4 then
		if not kundak[source] and Igrac.getInventoryItem('kundak').count < 1 then
			TriggerClientEvent('kila:kundak', source)
			kundak[_source] = ESX.SetTimeout(8000, function()
			Igrac.removeInventoryItem('metal', 2)
			Igrac.removeInventoryItem('daska', 5)
			Igrac.addInventoryItem('kundak', 1)
            TriggerClientEvent('noticeme:Info', source, "Uspesno ste napravili kundak!")
			end)
		else
            TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno mesta!")
		end
		kundak[_source] = nil
	else
		TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno materijala da napravite kundak!")
	end
end)

---------CEV---------

local cevcuga = {}
ESX.RegisterUsableItem('metal', function(source)
	local _source = source
	local Igrac = ESX.GetPlayerFromId(source)	
	local cev = Igrac.getInventoryItem('cev')
	local metal = Igrac.getInventoryItem('metal').count

	if metal > 2 then
		if not cevcuga[source] and Igrac.getInventoryItem('cev').count < 1 then
			TriggerClientEvent('kila:cev', source)
			cevcuga[_source] = ESX.SetTimeout(8000, function()
			Igrac.removeInventoryItem('metal', 3)
			Igrac.addInventoryItem('cev', 1)
            TriggerClientEvent('noticeme:Info', source, "Uspesno ste napravili pistoljsku cev!")
			end)
		else
            TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno mesta!")
		end
		cevcuga[_source] = nil
	else
		TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno materijala!")
	end
end)

---------PISTOLJ(ITEM)---------


local stoljpi = {}
ESX.RegisterUsableItem('kundak', function(source)
	local _source = source
	local Igrac = ESX.GetPlayerFromId(source)
	local kundak = Igrac.getInventoryItem('kundak').count
	local cev = Igrac.getInventoryItem('cev')
	if kundak > 0 then
		if not stoljpi[source] and Igrac.getInventoryItem('pistolj').count < 1 then
			TriggerClientEvent('kila:stoljpi', source)
			stoljpi[_source] = ESX.SetTimeout(20000, function()
			Igrac.removeInventoryItem('kundak', 1)
			Igrac.removeInventoryItem('cev', 1)
			Igrac.addInventoryItem('pistolj', 1)
            TriggerClientEvent('noticeme:Info', source, "Uspesno ste napravili pistolj!")
			end)
		else
            TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno mesta!")
		end
		stoljpi[_source] = nil
	else
		TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno materijala za pistolj!")
	end
end)

---------PISTOLJ(WEAPON)---------


local pistolj = {}
ESX.RegisterUsableItem('pistolj', function(source)
	local _source = source
	local Igrac = ESX.GetPlayerFromId(source)
	local stoljpi = Igrac.getInventoryItem('pistolj').count
	if stoljpi > 0 then
		if not pistolj[source] and Igrac.getInventoryItem('pistolj').count < 2 then
			Igrac.removeInventoryItem('pistolj', 1)
			Igrac.addWeapon('weapon_pistol', 12)
            TriggerClientEvent('noticeme:Info', source, "Uzeli ste pistolj!")
		else
            TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno mesta!")
		end
		pistolj[_source] = nil
	else 
		TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno materijala!")
	end
end)

-------------------------------------------------------------------------------
-------██████╗░██████╗░██╗░░░██╗░█████╗░░██████╗███████╗░█████╗░░█████╗░-------
-------██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗-------
-------██║░░██║██████╔╝╚██╗░██╔╝██║░░██║╚█████╗░█████╗░░██║░░╚═╝███████║-------
-------██║░░██║██╔══██╗░╚████╔╝░██║░░██║░╚═══██╗██╔══╝░░██║░░██╗██╔══██║-------
-------██████╔╝██║░░██║░░╚██╔╝░░╚█████╔╝██████╔╝███████╗╚█████╔╝██║░░██║-------
-------╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░╚═════╝░╚══════╝░╚════╝░╚═╝░░╚═╝-------
-------------------------------------------------------------------------------


RegisterNetEvent("kila:cepanje")
AddEventHandler("kila:cepanje", function(item, count)
    local _source = source
    local Igrac  = ESX.GetPlayerFromId(_source)
    local drvo = Igrac.getInventoryItem('drvo').count 

    if Igrac ~= nil then
        if drvo < 5 then
            Igrac.addInventoryItem('drvo', 1)
            TriggerClientEvent('noticeme:Info', source, "Dobili ste x1 drvo!")
        else
            TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno mesta!")
        end
    end
end)

    
RegisterServerEvent("kila:prerada")
AddEventHandler("kila:prerada", function(item, count)
    local src = source
    local Igrac  = ESX.GetPlayerFromId(source)
    local daska = Igrac.getInventoryItem('daska').count    
    if daska > 4 then 
    	TriggerClientEvent('noticeme:Info', src, "Nemate dovoljno mesta!")
        else    
        
        if Igrac.getInventoryItem('drvo').count > 0 then
            TriggerClientEvent("kila:prerada", source)
            Citizen.Wait(15900)
            Igrac.addInventoryItem('daska', 1)
            Igrac.removeInventoryItem("drvo", 1)
        
            TriggerClientEvent('noticeme:Info', src, "Dobili ste x1 dasku!")
        elseif Igrac.getInventoryItem('drvo').count < 1 then
            TriggerClientEvent('noticeme:Info', src, "Nemate drva za secenje!")
        end
    end
end)

-------------------------------------------------------
-------██████╗░██╗░░░██╗██████╗░░█████╗░██████╗░-------
-------██╔══██╗██║░░░██║██╔══██╗██╔══██╗██╔══██╗-------
-------██████╔╝██║░░░██║██║░░██║███████║██████╔╝-------
-------██╔══██╗██║░░░██║██║░░██║██╔══██║██╔══██╗-------
-------██║░░██║╚██████╔╝██████╔╝██║░░██║██║░░██║-------
-------╚═╝░░╚═╝░╚═════╝░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝-------
-------------------------------------------------------



---kopanje metala
RegisterServerEvent('kila:iskopaj')
AddEventHandler('kila:iskopaj', function()
    local Igrac = ESX.GetPlayerFromId(source)
	local metal = Igrac.getInventoryItem('mruda')
    if math.random(0, 100) <= 20 then
		if (metal.count + 1) > metal.limit then
			TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno mesta!")
		else
        	Igrac.addInventoryItem("mruda", 1)
		end
    end
end)

---prerada metala
local preradjuje = {}
RegisterServerEvent('kila:preradi')
AddEventHandler('kila:preradi', function()
	if not preradjuje[source] then
		local _source = source
		preradjuje[_source] = ESX.SetTimeout(50000, function()
			local Igrac = ESX.GetPlayerFromId(_source)
			local mruda = Igrac.getInventoryItem('mruda')
            local metal = Igrac.getInventoryItem('metal')

			if (metal.count + 1) > metal.limit then
				TriggerClientEvent('noticeme:Info', source, "Nemate dovoljno mesta!")
			elseif mruda.count < 1 then
				TriggerClientEvent('noticeme:Info', source, "Morate imati bar 20 komada metalnih ruda!")
			else
				Igrac.removeInventoryItem('mruda', 20)
				Igrac.addInventoryItem('metal', 5)
				TriggerClientEvent('noticeme:Info', source, "Preradili ste metal!")
			end

			preradjuje[_source] = nil
		end)
	end
end)

function prekinipreradu(playerID)
	if preradjuje[playerID] then
		ESX.ClearTimeout(preradjuje[playerID])
		preradjuje[playerID] = nil
	end
end

AddEventHandler('esx:playerDropped', function(playerID, reason)
	prekinipreradu(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	prekinipreradu(source)
end)


---------------------------------------------------------------------------------------

local getajresourcename = GetCurrentResourceName()


if getajresourcename ~= "kila_kraftsistem" then
	print("                                             #")
	print("                                             ###")
	print("###### ###### ###### ###### ######  ##############")
	print("#      #    # #    # #    # #    #  ################    Promeni '" .. getajresourcename .. "' u 'kila_kraftsistem'")
	print("###    ###### ###### #    # ######  ##################  ovako ti skripta nece raditi!")
	print("#      # ##   # ##   #    # # ##    ################")
	print("###### #   ## #   ## ###### #   ##  ##############")
	print("                                             ###")
	print("                                             #")
	StopResource(getajresourcename)
	Wait(5000)
	os.exit(69)
	kresuj = true
	Citizen.CreateThread(function()
		while kresuj do
	    end
	end)
end