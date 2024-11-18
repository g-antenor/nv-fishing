local QBCore = exports['qb-core']:GetCoreObject()
local rodHandle = nil
utils = {}

---@param notification string
---@param type string
---@param time number
function utils.Notify(notification, type, time)
    local time = time or 5000

    if Config.Util == 'qb' then
        QBCore.Functions.Notify(notification, type, time)
    elseif Config.Util == 'ox' then
        lib.notify({ description = notification, type = type, time = time })
    end
end


---@param dict string
---@param clip string
function utils.AnimationFishing(dict, clip)
    local ped = PlayerPedId()
    local pedPos = GetEntityCoords(ped)
	local bone = GetPedBoneIndex(ped, 18905)
	local fishingRodHash = `prop_fishing_rod_01`

    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	    Wait(100)
	end
	TaskPlayAnim(ped, dict, clip, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
    
    if rodHandle ~= 0 then DeleteObject(rodHandle) end
    rodHandle = CreateObject(fishingRodHash, pedPos, true)
    AttachEntityToEntity(rodHandle, ped, bone, 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)
end


---@param dict string
---@param clip string
---@param time number
---@param txt string
---@return boolean
function utils.ProgressAnimations(dict, clip, time, txt)
    local progress = false

    if Config.Util == 'qb' then
        QBCore.Functions.Progressbar('fishing', txt, time or 5000, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },{
            animDict = dict,
            anim = clip
        })
        progress = true
    elseif Config.Util == 'ox' then
        lib.progressCircle({
            duration = time or 5000,
            label = txt,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
                combat = true
            },
            anim = {
                dict = dict,
                clip = clip
            },
        })
        progress = true
    end

    return progress
end


function utils.StopFishing()
    local ped = PlayerPedId()
    if rodHandle ~= 0 then
		DeleteObject(rodHandle)
		rodHandle = 0
		
        ClearPedTasks(ped)
    end
end