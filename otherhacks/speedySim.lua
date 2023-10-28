local autoClickSpeed = false
local ClickSpeed = 1

local autoCollectRings = false
--game:GetService("Workspace").Rings

function setPart( x,y,z,name,cancol,Trans,Size)
    local part = Instance.new("Part",workspace)
    part.Anchored = true
    part.Transparency = Trans
    part.Size = Vector3.new(Size,Size,Size)
    part.Position = Vector3.new(x,y,z)
    part.Name = name
    part.CanCollide = cancol
end

function autoClickSpeedFunc()
    spawn(function()
        while autoClickSpeed do
            wait(ClickSpeed)
            game:GetService("ReplicatedStorage").Events.clickRE:FireServer()
        end
    end)
end

function autoCollectRingsFunc()
    spawn(function()
        while autoCollectRings do
            wait(1)
            for i,v in pairs(game:GetService("Workspace").Rings:GetChildren()) do
                local PLayers = game:GetService("Players")
                local Player = game:GetService("Players").LocalPlayer
                local WorkSpace = game:GetService("Workspace")
                if WorkSpace:FindFirstChild(Player.Name) then
                    wait(0.2)
                    local PlayerW = Player.Character
                    PlayerW.HumanoidRootPart.CFrame = v.CFrame
                end
            end
            --
            for i,v in pairs(game:GetService("Workspace").ballsFolder.Zone1:GetChildren()) do
                local PLayers = game:GetService("Players")
                local Player = game:GetService("Players").LocalPlayer
                local WorkSpace = game:GetService("Workspace")
                if WorkSpace:FindFirstChild(Player.Name) then
                    wait(0.1)
                    local PlayerW = Player.Character
                    PlayerW.HumanoidRootPart.CFrame = v.Base.CFrame
                end
            end
        end
    end)
end

-------------------------- gui stuff ------------------------------------------
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Speedy Sim", "LightTheme")

local AutoFarming = Window:NewTab("Auto Farming")

local AutoClick = AutoFarming:NewSection("AutoClick")

AutoClick:NewToggle("AutoClick", "if you know you know", function(state)
    autoClickSpeed = state
    autoClickSpeedFunc()
end)

AutoClick:NewSlider("ClickSpeed", "jea", 100, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    ClickSpeed = s/100
end)

local AutoCollectRings = AutoFarming:NewSection("Auto Collect Rings")

AutoCollectRings:NewToggle("Auto Collect Rings", "if you know you know", function(state)
    autoCollectRings = state
    autoCollectRingsFunc()
end)