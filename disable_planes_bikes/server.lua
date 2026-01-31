RegisterNetEvent("disableVehicles:deleteVehicle", function()
    local src = source
    local ped = GetPlayerPed(src)

    if not ped or ped == 0 then return end

    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        local class = GetVehicleClass(vehicle)

        -- FULL DISABLE: ALL PLANES + ALL BIKES
        if class == 16 or class == 8 then
            DeleteEntity(vehicle)

            print(("🚫 Forbidden vehicle removed from player %s"):format(src))

            -- Optional: Kick player if they keep trying
            -- DropPlayer(src, "Planes and motorbikes are disabled on this server.")
        end
    end
end)

AddEventHandler("entityCreating", function(entity)
    local entType = GetEntityType(entity)

    if entType == 2 then -- Vehicle
        local model = GetEntityModel(entity)
        local class = GetVehicleClassFromName(model)

        -- Block ALL planes + bikes
        if class == 16 or class == 8 then
            CancelEvent()
            print("🚫 Blocked forbidden vehicle spawn (Plane/Bike)")
        end
    end
end)

