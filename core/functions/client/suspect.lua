--[[ ===================================================== ]] --
--[[                MH Cuffed by MaDHouSe79                ]] --
--[[ ===================================================== ]] --
Suspect = {}
Suspect.__index = Suspect

cuffedSuspects = {}

function Suspect:exsist(entity)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity then return true end
    end
    return false
end

function Suspect:new(entity)
    if not Suspect:exsist(entity) then
        cuffedSuspects[#cuffedSuspects + 1] = {entity = entity, isCuffed = true, isEscorting = true, isHostage = false}
        TriggerServerEvent('mh-cuffed:server:syncData', {searchSuspects = searchSuspects, searchVehicles = searchVehicles, cuffedSuspects = cuffedSuspects})
    end
end

function Suspect:delete(entity)
    if Suspect:exsist(entity) then
        for key, suspect in pairs(cuffedSuspects) do
            if suspect == entity then
                suspect = nil
                TriggerServerEvent('mh-cuffed:server:syncData', {searchSuspects = searchSuspects, searchVehicles = searchVehicles, cuffedSuspects = cuffedSuspects})
            end
        end
    end
end

function Suspect:setCuffed(entity, state)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity then suspect.isCuffed = state end
    end
end

function Suspect:setEscorting(entity, state)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity then suspect.isEscorting = state end
    end
end

function Suspect:toggleHostage(entity)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity then
            suspect.isHostage = not suspect.isHostage
        end
    end
    return false
end

function Suspect:toggleSurender(entity)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity then
            suspect.isSurender = not suspect.isSurender
        end
    end
    return false
end

function Suspect:isCuffed(entity)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity and suspect.isCuffed then return true end
    end
    return false
end

function Suspect:isEscorting(entity)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity and suspect.isEscorting then return true end
    end
    return false
end

function Suspect:isHostage(entity)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity and suspect.isHostage then return true end
    end
    return false
end

function Suspect:isSurender(entity)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity and suspect.isSurender then return true end
    end
    return false
end

function Suspect:setInVehicle(entity, vehicle)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity then
            suspect.isEscorting = false
            suspect.isInVehicle = true
            suspect.vehicle = vehicle
            suspectEntity = nil
            TriggerServerEvent('mh-cuffed:server:syncData', {searchSuspects = searchSuspects, searchVehicles = searchVehicles, cuffedSuspects = cuffedSuspects})
            break
        end
    end
end

function Suspect:takeOutVehicle(entity, vehicle)
    for key, suspect in pairs(cuffedSuspects) do
        if suspect.entity == entity and suspect.vehicle == vehicle then
            suspect.isEscorting = true
            suspect.isInVehicle = false
            suspect.vehicle = nil
            suspectEntity = entity
            TriggerServerEvent('mh-cuffed:server:syncData', {searchSuspects = searchSuspects, searchVehicles = searchVehicles, cuffedSuspects = cuffedSuspects})
            break
        end
    end
end

function Suspect:setInJail(entity)
    UnCuffEntity(entity)
    DetachEntity(entity, true, false)
    Suspect:delete(entity)
    Wait(10)
    DeleteEntity(entity)
    StopAnimTask(PlayerPedId(), 'amb@world_human_drinking@coffee@female@base', 'base', -8.0)
    suspectEntity = nil
end

-- cop/player VS Npc suspect
CreateThread(function()
    while true do
        local sleep = 1000
        if isLoggedIn then
            for key, suspect in pairs(cuffedSuspects) do
                if suspect.entity ~= nil and DoesEntityExist(suspect.entity) then
                    sleep = 0
                    if suspect.isCuffed then
                        if suspect.isEscorting then

                            if config.DisableRunningWhenCuffed then DisableControlAction(0, 21) end
                            
                            if not IsEntityAttachedToEntity(suspect.entity, PlayerPedId()) then
                                AttachEntityToEntity(suspect.entity, PlayerPedId(), 11816, 0.38, 0.4, 0.0, 0.0, 0.0, 0.0, false, false, true, true, 2, true)
                            elseif IsEntityAttachedToEntity(suspect.entity, PlayerPedId()) and not suspect.isInVehicle then
                                if not IsEntityPlayingAnim(PlayerPedId(), config.Animations.player.walk.dict, config.Animations.player.walk.name, 3) then
                                    TaskPlayAnim(PlayerPedId(), config.Animations.player.walk.dict, config.Animations.player.walk.name, 8.0, 8.0, -1, 50, 0, false, false, false)
                                end
                            end

                            if IsPedWalking(PlayerPedId()) then
                                StopAnimTask(suspect.entity, config.Animations.ped.run.dict, config.Animations.ped.run.name, -8.0)
                                if not IsEntityPlayingAnim(suspect.entity, config.Animations.ped.walk.dict, config.Animations.ped.walk.name, 3) then
                                    TaskPlayAnim(suspect.entity, config.Animations.ped.walk.dict, config.Animations.ped.walk.name, 8.0, -8, -1, 1, 0.0, false, false, false)
                                    SetPedKeepTask(suspect.entity, true)
                                end
                            elseif IsPedSprinting(PlayerPedId()) then
                                if not IsEntityPlayingAnim(suspect.entity, config.Animations.ped.run.dict, config.Animations.ped.run.name, 3) then
                                    TaskPlayAnim(suspect.entity, config.Animations.ped.run.dict, config.Animations.ped.run.name, 8.0, -8, -1, 1, 0.0, false, false, false)
                                    SetPedKeepTask(suspect.entity, true)
                                end
                            else
                                StopAnimTask(suspect.entity, config.Animations.ped.walk.dict, config.Animations.ped.walk.name, -8.0)
                                StopAnimTask(suspect.entity, config.Animations.ped.run.dict, config.Animations.ped.run.name, -8.0)
                                if not IsEntityPlayingAnim(suspect.entity, config.Animations.ped.idle.dict, config.Animations.ped.idle.name, 3) then
                                    TaskPlayAnim(suspect.entity, config.Animations.ped.idle.dict, config.Animations.ped.idle.name, 8.0, -8, -1, 1, 0.0, false, false, false)
                                    SetPedKeepTask(suspect.entity, true)
                                end
                            end

                        elseif not suspect.isEscorting then
                            if suspect.isInVehicle then
                                if not IsEntityPlayingAnim(suspect.entity, config.Animations.ped.sit.dict, config.Animations.ped.sit.name, 3) then
                                    TaskPlayAnim(suspect.entity, config.Animations.ped.sit.dict, config.Animations.ped.sit.name, 8.0, -8, -1, 1, 0.0, false, false, false)
                                    SetPedKeepTask(suspect.entity, true)
                                end
                            else
                                if not IsEntityPlayingAnim(suspect.entity, config.Animations.ped.idle.dict, config.Animations.ped.idle.name, 3) then
                                    TaskPlayAnim(suspect.entity, config.Animations.ped.idle.dict, config.Animations.ped.idle.name, 8.0, -8, -1, 1, 0.0, false, false, false)
                                    SetPedKeepTask(suspect.entity, true)
                                end
                            end
                        end


                        if suspect.isHostage then
                            suspect.isCuffed = false
                            if not IsEntityPlayingAnim(suspect.entity, config.Animations.ped.hostage.dict, config.Animations.ped.hostage.name, 3) then
                                TaskPlayAnim(suspect.entity, config.Animations.ped.hostage.dict, config.Animations.ped.hostage.name, 8.0, -8.0, -1, 1, 0, false, false, false)
                                SetPedKeepTask(suspect.entity, true)
                            end
                        elseif not suspect.isHostage then
                            if IsEntityPlayingAnim(suspect.entity, config.Animations.ped.hostage.dict, config.Animations.ped.hostage.name, 3) then
                                StopAnimTask(suspect.entity, config.Animations.ped.hostage.dict, config.Animations.ped.hostage.name, -8.0)
                            end
                        end


                        if suspect.isSurender then
                            suspect.isCuffed = false
                            if not IsEntityPlayingAnim(suspect.entity, config.Animations.ped.surender.dict, config.Animations.ped.surender.name, 3) then
                                TaskPlayAnim(suspect.entity, config.Animations.ped.surender.dict, config.Animations.ped.surender.name, 8.0, -8.0, -1, 1, 0, false, false, false)
                                SetPedKeepTask(suspect.entity, true)
                            end
                        elseif not suspect.isSurender then
                            if IsEntityPlayingAnim(suspect.entity, config.Animations.ped.surender.dict, config.Animations.ped.surender.name, 3) then
                                StopAnimTask(suspect.entity, config.Animations.ped.surender.dict, config.Animations.ped.surender.name, -8.0)
                            end
                        end

                    end
                end
            end
        end
        Wait(sleep)
    end
end)