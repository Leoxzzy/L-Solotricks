


Citizen.CreateThread(function()
    while true do
        local cooldown = 1250

        local pVeh = GetVehiclePedIsIn(PlayerPedId(), false)

        if GetEntityModel(pVeh) == GetHashKey('deluxo') then
            cooldown = 0
            if IsControlJustReleased(1, 51) then

                local vCoords = GetEntityCoords(pVeh)
                local vVelocity = GetEntityVelocity(pVeh)
                SetEntityVelocity(pVeh, 0, 0, 0)

                SetPedCanRagdoll(PlayerPedId(), false)
                SetEntityCoords(PlayerPedId(), vCoords.x, vCoords.y, vCoords.z, 0, 0, 0, false)

                SetEntityVelocity(PlayerPedId(), vVelocity)
                SetEntityVelocity(pVeh, vVelocity)

                Citizen.SetTimeout(10000, function()
                    SetPedCanRagdoll(PlayerPedId(), true)
                end)
            end
        end

        Citizen.Wait(cooldown)
    end
end)