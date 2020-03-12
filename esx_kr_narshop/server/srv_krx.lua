ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- FR

RegisterServerEvent('KRX_Nar:giveItem')
AddEventHandler('KRX_Nar:giveItem', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()

    if playerMoney >= item.Price * count then
        xPlayer.addInventoryItem(item.Value, count)
        xPlayer.removeMoney(item.Price * count)

        TriggerClientEvent('esx:showNotification', source, "Merci, sois ~o~Prudent !")
     else
          TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez d'argent, il vous manque: ~r~".. item.Price * count - playerMoney .."$")
     end
end)



-- EN

--RegisterServerEvent('KRX_Nar:giveItem')
--AddEventHandler('KRX_Nar:giveItem', function(item, count)
--    local xPlayer = ESX.GetPlayerFromId(source)
--    local playerMoney = xPlayer.getMoney()
--
--    if playerMoney >= item.Price * count then
--        xPlayer.addInventoryItem(item.Value, count)
--        xPlayer.removeMoney(item.Price * count)
--
--        TriggerClientEvent('esx:showNotification', source, "Thank you. ~b~be careful !")
--     else
--          TriggerClientEvent('esx:showNotification', source, "You don't have enough money, you are missing: ~r~".. item.Price * count - playerMoney .."$")
--     end
--end)