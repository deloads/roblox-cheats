-------------------Variables--------------------
local autowalk = false
-------------------Functions--------------------

function autowalkFunc()
    spawn(function()
        local players = game:GetService("Players")
        local localPLayer = players.LocalPlayer
        local char = game:GetService("Workspace"):FindFirstChild(localPLayer.Name)
        local HumanoidRootPart = char.HumanoidRootPart
        while autowalk do
            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + (HumanoidRootPart.CFrame.lookVector*5)
        end
    end)
end

-------------------gui--------------------------
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("TITLE", "BloodTheme")

local Tab = Window:NewTab("TabName")

local Section = Tab:NewSection("Section Name")

Section:NewToggle("ToggleText", "ToggleInfo", function(state)
    autowalk = state
    autowalkFunc()
end)