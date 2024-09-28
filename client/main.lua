local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local breakcuffs = 0

local function BreakLoose()
    if exports['qb-policejob']:IsHandcuffed() then
        if breakcuffs < Config.MaxBreaks then
            if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] then
                local success = exports["qb-minigames"]:Skillbar(Config.SkillbarLevel, Config.SkillbarKeys)
                if success then
                    breakcuffs = breakcuffs + 1
                    TriggerServerEvent("InteractSound_SV:PlayOnSource", "Uncuff", 0.2)
                    ClearPedTasksImmediately(PlayerPedId())
                    exports['qb-policejob']:SetHandcuffed(false)
                    exports['qb-policejob']:SetEscorted(false)
                    exports['qb-policejob']:SetHandcuffStatus(false)
                    QBCore.Functions.Notify(Lang:t('info.break_lose'), "success")
                    return
                else
                    breakcuffs = breakcuffs + 1
                    QBCore.Functions.Notify(Lang:t('info.break_failed'), "error")         
                    return
                end
            end
        end
    else
        breakcuffs = 0
    end
end

RegisterNetEvent('police:client:GetCuffed', function(playerId, isSoftcuff)
    Wait(500)
    BreakLoose()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    breakcuffs = 0
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
    breakcuffs = 0
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerData = QBCore.Functions.GetPlayerData()
        breakcuffs = 0
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerData = {}
        breakcuffs = 0
    end
end)

if Config.DevMode then
    RegisterCommand('breaktest', function()
        ClearPedTasksImmediately(PlayerPedId())
        TriggerEvent('police:client:GetCuffed', PlayerPedId(), true)
    end, false)
end
