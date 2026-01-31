local blockedModels = {
    -- Bikes
    `bati`,
    `bati2`,
    `akuma`,
    `sanchez`,
    `sanchez2`,
    `daemon`,
    `double`,
    `faggio`,
    `lectro`,
    `nemesis`,
    `pcj`,
    `ruffian`,
    `vader`,

    -- Planes
    `jet`,
    `luxor`,
    `luxor2`,
    `shamal`,
    `titan`,
    `dodo`,
    `hydra`,
    `lazer`,
    `besra`,
    `miljet`,
    `cuban800`,
    `velum`,
    `velum2`,
    `nimbus`
}

-- Convert to lookup table for speed
local blockedLookup = {}
for _, model in pairs(blockedModels) do
    blockedLookup[model] = true
end

AddEventHandler("entityCreating", function(entity)
    if GetEntityType(entity) ~= 2 then return end -- Not a vehicle

    local model = GetEntityModel(entity)

    if blockedLookup[model] then
        CancelEvent()
        print("Blocked forbidden vehicle spawn: " .. model)
    end
end)

RegisterNetEvent("disableVehicles:deleteVehicle", function()
    local src = source
    local ped = GetPlayerPed(src)

    if ped == 0 then return end

    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        local model = GetEntityModel(vehicle)

        if blockedLookup[model] then
            DeleteEntity(vehicle)
            print(("🚫 Removed forbidden vehicle from player %s"):format(src))
        end
    end
end)
