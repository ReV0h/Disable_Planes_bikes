Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 then
            local class = GetVehicleClass(vehicle)

            -- 16 = Planes, 8 = Motorbikes
            if class == 16 or class == 8 then
                TriggerServerEvent("disableVehicles:deleteVehicle")
            end
        end
    end
end)
