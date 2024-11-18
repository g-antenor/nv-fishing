local inFishing = false

local function isDeepWater(playerCoords)
    local _, groundHeight, _, _, _ = GetGroundZAndNormalFor_3dCoord(playerCoords.x, playerCoords.y, playerCoords.z, 0)

    if groundHeight < -200.0 or groundHeight == 0.0 then return true end
    return false
end

local function DropFishi()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local inOpenSea = isDeepWater(playerCoords)

    while true do
        local totalFishings = #Config.Fishings
        local roll = math.random(1, 100)
        local fishing = Config.Fishings[math.random(1, totalFishings)]

        if fishing.openOcean and not inOpenSea then
            goto continue
        end
        print(roll, fishing.chance, fishing.openOcean, inOpenSea)
        if roll <= fishing.chance then
            return fishing
        end

        ::continue::
    end
end

local function StartFishing()
    local time = math.random(10000, 30000)
    local fishingModel, fishingSkill, fishingDifficulty = nil, nil, nil
    local drop = DropFishi()
    inFishing = true

    fishingModel = drop.model
    fishingSkill = drop.skill
    fishingDifficulty = drop.difficulty

    utils.AnimationFishing("amb@world_human_stand_fishing@idle_a", "idle_a")
    Wait(time)

    utils.AnimationFishing("amb@world_human_stand_fishing@idle_a", "idle_c")
    Wait(1000)

    local success = exports.bl_ui:Progress(fishingSkill, fishingDifficulty)
    if success then
        lib.callback('fishing:server:DropItems', false, function()
            utils.Notify(Lang:t('notify.success.fishing_success'), 'success', 5000)
        end, fishingModel, 'success')
        local stress = lib.callback.await('fishing:server:StressDegree', false, math.random(1, 2))
        if stress and Config.StressDegreeChance >= math.random(1, 100) then
            utils.Notify(Lang:t('notify.success.stress'), 'success', 5000)
        end
    else
        lib.callback('fishing:server:DropItems', false, function()
            utils.Notify(Lang:t('notify.error.no_fishing_rod'), 'error', 5000)
        end, nil, 'fail')
    end
    
    utils.AnimationFishing("anim@scripted@player@mission@tun_table_grab@gold@heeled@", "grab")
    Wait(1000)

    inFishing = false
    utils.StopFishing()
end

RegisterNetEvent('fishing:client:StartFishing', function()
    local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed)
    local hasBait = lib.callback.await('fishing:server:CheckBait', false, Config.Fishbait)

    if inFishing then return end
    if IsPedSwimming(playerPed) then return end
    if IsPedInAnyVehicle(playerPed, false) then return end
    if not hasBait then utils.Notify(Lang:t('notify.error.no_fishbait'), 'error', 5000) return end

    if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z - 3.0) then
        utils.Notify(Lang:t('notify.success.start_fishing'), 'success', 5000)
        StartFishing()
    else
        utils.Notify(Lang:t('notify.error.no_water'), 'error', 5000)
    end
end)

RegisterNetEvent('fishing:client:OpenCheast', function()
    local ped = PlayerPedId()

    RequestAnimDict('amb@medic@standing@kneel@base')
	while not HasAnimDictLoaded('amb@medic@standing@kneel@base') do
	    Wait(100)
	end
	TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)

    if exports.bl_ui:Progress(3, 80) then
        local progress = utils.ProgressAnimations('anim@gangops@facility@servers@bodysearch@', 'player_search', 12000, Lang:t('progress.OpenCheast'))
        if progress then
            lib.callback.await('fishing:server:OpenCheast', false, 'success')
        end
    else
        lib.callback.await('fishing:server:OpenCheast', false, 'fail')
    end 
    ClearPedTasks(ped)
end)

RegisterNetEvent('fishing:client:CutFishing', function(fishing)
    local ped = PlayerPedId()
    local hasItem = lib.callback.await('fishing:server:CheckWeapon', false, Config.Knife)

    if not hasItem then utils.Notify(Lang:t('notify.error.no_knife'), 'error', 5000) return end

    RequestAnimDict('amb@medic@standing@kneel@base')
	while not HasAnimDictLoaded('amb@medic@standing@kneel@base') do
	    Wait(100)
	end
	TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)

    if exports.bl_ui:Progress(3, 50) then
        local progress = utils.ProgressAnimations('anim@gangops@facility@servers@bodysearch@', 'player_search', 12000, Lang:t('progress.CutFishing'))
        if progress then
            lib.callback.await('fishing:server:CutFishing', false, fishing, 'success')
        end
    else
        lib.callback.await('fishing:server:CutFishing', false, fishing, 'fail')
    end
    ClearPedTasks(ped)
end)
