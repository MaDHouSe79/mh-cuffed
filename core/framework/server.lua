Framework, CreateCallback = nil, nil
if GetResourceState("es_extended") ~= 'missing' then
    Framework = exports['es_extended']:getSharedObject()
    CreateCallback = Framework.RegisterServerCallback
    function GetPlayer(source) return Framework.GetPlayerFromId(source) end
    function Notify(src, message, type, length) TriggerClientEvent("mh-cuffed:client:notify", src, message, type, length) end
elseif GetResourceState("qb-core") ~= 'missing' then
    Framework = exports['qb-core']:GetCoreObject()
    CreateCallback = Framework.Functions.CreateCallback
    function GetPlayer(source) return Framework.Functions.GetPlayer(source) end
    function Notify(src, message, type, length) TriggerClientEvent("mh-cuffed:client:notify", src, message, type, length) end
end