QBCore = exports['qb-core']:GetCoreObject()
utils = {}

---@params source number
---@params itemName string
function utils.SearchItem(source, itemName)
    local itemCount = 0

    if Config.Inventory == 'ox' then
        itemCount = exports.ox_inventory:GetItemCount(source, itemName) or 0
    elseif Config.Inventory == 'qb' then
        itemCount = exports['qb-inventory']:GetItemCount(source, itemName) or 0
    end

    return itemCount
end


---@params source number
---@params itemName string
---@params amount number
function utils.RemoveItem(source, itemName, amount)
    local status = false

    if Config.Inventory == 'ox' then
        status = exports.ox_inventory:RemoveItem(source, itemName, amount)
    elseif Config.Inventory == 'qb' then
        status = exports['qb-inventory']:RemoveItem(source, itemName, amount)
    end
    
    return status
end

---@params source number
---@params itemName string
---@params amount number
function utils.AddItem(source, itemName, amount)
    local status = false
    amount = amount or 1

    if Config.Inventory == 'ox' then
        status = exports.ox_inventory:AddItem(source, itemName, amount)
    elseif Config.Inventory == 'qb' then
        status = exports['qb-inventory']:AddItem(source, itemName, amount)
    end
    
    return status
end