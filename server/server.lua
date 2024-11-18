local QBCore = exports['qb-core']:GetCoreObject()


lib.callback.register('fishing:server:CutFishing', function(source, fishing, status)
    if status == 'success' then
        for _, fishingData in pairs(Config.Fishings) do
            if fishingData.model == fishing then
                local amount = math.random(2, 3)
                utils.AddItem(source, fishingData.drop[1], amount)
                if 5 > math.random(1, 10) then
                    local amount = math.random(2, 3)
                    utils.AddItem(source, fishingData.drop[2], amount)
                end
                utils.RemoveItem(source, fishing, 1)
            end
        end
    elseif status == 'fail' and 5 > math.random(1, 10) then
        utils.RemoveItem(source, Config.Knife, 1)
    end
end)

lib.callback.register('fishing:server:DropItems', function(source, fishing, status)
    if status == 'success' then
        for _, fishingData in ipairs(Config.Fishings) do
            if fishing == fishingData.model then
                utils.AddItem(source, fishing, 1)
                if 5 > math.random(1, 10) then utils.RemoveItem(source, Config.Fishbait, 1) end
            end
        end
    elseif status == 'fail' then
        utils.RemoveItem(source, Config.Fishbait, 1)
    end

    return true
end)

lib.callback.register('fishing:server:CheckBait', function(source, itemName)
    local hasitem = utils.SearchItem(source, itemName)

    if hasitem > 0 then
        return true
    end
    return false
end)

lib.callback.register('fishing:server:OpenCheast', function(source, status)
    local drop = Config.Drops[math.random(1, #Config.Drops)]
    local amount = math.random(Config.AmountDrop[1], Config.AmountDrop[2])

    if status == 'success' then
        utils.AddItem(source, drop, amount)
        utils.RemoveItem(source, Config.Rewards, 1)
    end

    utils.RemoveItem(source, 'lockpick', 1)
end)

lib.callback.register('fishing:server:StressDegree', function(source, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local newStress = 0
    
    if not Player then return end
    if not Player.PlayerData.metadata['stress'] then
        Player.PlayerData.metadata['stress'] = 0
    end
    
    newStress = Player.PlayerData.metadata['stress'] - amount

    if newStress <= 0 then newStress = 0 end
    if newStress > 100 then newStress = 100 end
    
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', source, newStress)
    
    return true
end)

lib.callback.register('fishing:server:CheckWeapon', function(source, itemName)
    local hasItem = utils.SearchItem(source, itemName)

    if hasItem > 0 then return true end
    return false
end)

-- Objects
QBCore.Functions.CreateUseableItem(Config.Fishingrod, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then TriggerClientEvent("fishing:client:StartFishing", src) end
end)

QBCore.Functions.CreateUseableItem(Config.Rewards, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and utils.SearchItem(src, 'lockpick') > 0 then TriggerClientEvent("fishing:client:OpenCheast", src) end
end)


-- Fishings
QBCore.Functions.CreateUseableItem('killerwhale', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then TriggerClientEvent("fishing:client:CutFishing", src, 'killerwhale') end
end)

QBCore.Functions.CreateUseableItem('dolphin', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then TriggerClientEvent("fishing:client:CutFishing", src, 'dolphin') end
end)

QBCore.Functions.CreateUseableItem('sharkhammer', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then TriggerClientEvent("fishing:client:CutFishing", src, 'sharkhammer') end
end)

QBCore.Functions.CreateUseableItem('sharktiger', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then TriggerClientEvent("fishing:client:CutFishing", src, 'sharktiger') end
end)
