--[[ ===================================================== ]] --
--[[                MH Cuffed by MaDHouSe79                ]] --
--[[ ===================================================== ]] --
RegisterNetEvent('police:server:CuffPlayer', function(playerId, isSoftcuff)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local Player = QBCore.Functions.GetPlayer(src)
    local CuffedPlayer = QBCore.Functions.GetPlayer(playerId)
    if not Player or not CuffedPlayer or (not Player.Functions.GetItemByName('handcuffs') and Player.PlayerData.job.type ~= 'leo') then return end
    TriggerClientEvent('mh-cuffed:client:SetData', -1, {cop = Player.PlayerData.source, suspect = CuffedPlayer.PlayerData.source})
end)