--[[ ===================================================== ]] --
--[[                MH Cuffed by MaDHouSe79                ]] --
--[[ ===================================================== ]] --
RegisterNetEvent('mh-cuffed:server:onjoin', function() TriggerClientEvent('mh-cuffed:client:onjoin', source, SV_Config) end)
RegisterNetEvent('mh-cuffed:server:syncData', function(data) TriggerClientEvent('mh-cuffed:client:syncData', -1, data) end)