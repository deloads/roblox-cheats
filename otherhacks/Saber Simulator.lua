-------------------Variables--------------------
--farming
local AutoSwing = false
-------------------Functions--------------------

function AutoSwingFunc()
    spawn(function()
        while AutoSwing do
            wait(0.1)
            game:GetService("ReplicatedStorage").Events.Clicked:FireServer()
        end
    end)
end

-------------------gui--------------------------
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Saber Simulator", "Ocean")

local FarmingTab = Window:NewTab("Farming")

local AutoSwingSection = FarmingTab:NewSection("Auto Farm")

AutoSwingSection:NewToggle("Auto Swing", "ToggleInfo", function(state)
    AutoSwing = state
    AutoSwingFunc()
end)