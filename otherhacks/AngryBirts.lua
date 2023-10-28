--game:GetService("Workspace").ActionArea.TowerSpawns["Level01_Spawn"].Tower.Root


local TowerAuraLevel = 1
local TowerAuraAriaLevel = 1

local TowerAuraLevelLevels = {
    "1",
    "2",
    "3",
    "4"
}

function TowerAuraFunc()
    spawn(function()
        local players = game:GetService("Players")
        local player = players.LocalPlayer
        if player.Character then
            local PlayerW = player.Character
            local IfTP = false
            for i, v in pairs(game:GetService("Workspace").ActionArea.TowerSpawns:GetChildren()) do
                if v.Name == "Level01_Spawn" and IfTP == false then
                    if v.Level.Value < TowerAuraAriaLevel then
                        IfTP = true
                        PlayerW.HumanoidRootPart.CFrame = v.Tower.Root.CFrame
                    end
                end
            end
        end
    end)
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Angry Birts v 1.0.0", "Ocean")

local pvpMods = Window:NewTab("pvp mudules")

local TowerAura = pvpMods:NewSection("Tower Aura")

TowerAura:NewDropdown("Select Aria", "Bru why you ask for explination", TowerAuraLevelLevels, function(currentOption)
    print(currentOption)
end)

TowerAura:NewSlider("Tower Lever", "????????????", 10, 3, function(s) -- 500 (MaxValue) | 0 (MinValue)
    TowerAuraAriaLevel = s
end)

TowerAura:NewButton("Tp Tower", "Instand Tp to Tower", function()
    TowerAuraFunc()
end)