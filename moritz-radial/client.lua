local ESX
local menuOpen = false
local currentIndex = 1

CreateThread(function()
    if Config.UseESXNotify then
        while ESX == nil do
            pcall(function()
                ESX = exports['es_extended']:getSharedObject()
            end)
            if ESX == nil then
                TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            end
            Wait(500)
        end
    end
end)

local function Notify(msg)
    if Config.UseESXNotify and ESX and ESX.ShowNotification then
        ESX.ShowNotification(msg)
    else
        print('[RadialMenu] ' .. msg)
    end
end

local function OpenMenu()
    if menuOpen then return end
    menuOpen = true
    currentIndex = 1

    -- keine Maus-/Tastensperre, kein NUI-Fokus
    SetNuiFocus(false, false)

    SendNUIMessage({
        action = "open",
        slots = Config.Slots,
        index = currentIndex
    })
end

local function CloseMenu()
    if not menuOpen then return end
    menuOpen = false

    SendNUIMessage({
        action = "close"
    })
end

-- Command + Keymapping auf O
RegisterCommand('open_radialmenu', function()
    if menuOpen then
        CloseMenu()
    else
        OpenMenu()
    end
end, false)

RegisterKeyMapping('open_radialmenu', 'Radialmenü öffnen', 'keyboard', 'O')

-- Steuerung
CreateThread(function()
    while true do
        if menuOpen then
            -- NICHT DisableAllControlActions, damit Maus frei ist

            -- Menü schließen (ESC oder Backspace)
            if IsControlJustPressed(0, 177) or IsControlJustPressed(0, 322) then
                CloseMenu()
            end

            -- Links (Pfeil links)
            if IsControlJustPressed(0, 174) then
                currentIndex = currentIndex - 1
                if currentIndex < 1 then currentIndex = 16 end
                SendNUIMessage({
                    action = "updateIndex",
                    index = currentIndex
                })
            end

            -- Rechts (Pfeil rechts)
            if IsControlJustPressed(0, 175) then
                currentIndex = currentIndex + 1
                if currentIndex > 16 then currentIndex = 1 end
                SendNUIMessage({
                    action = "updateIndex",
                    index = currentIndex
                })
            end

            -- Enter
            if IsControlJustPressed(0, 191) then
                local slot = Config.Slots[currentIndex]
                if slot and slot.enabled then
                    if slot.command ~= nil and slot.command ~= "" then
                        ExecuteCommand(slot.command)
                    end
                    CloseMenu()
                else
                    Notify("Dieser Menüpunkt ist aktuell nicht funktionabel.")
                end
            end

            Wait(0)
        else
            Wait(250)
        end
    end
end)
