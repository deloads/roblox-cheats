getgenv().autoClick = false
getgenv().autoSell = false

function setPart( x,y,z,name,cancol)
    local part = Instance.new("Part",workspace)
    part.Anchored = true
    part.Transparency = 1
    part.Size = Vector3.new(2,2,2)
    part.Position = Vector3.new(x,y,z)
    part.Name = name
    part.CanCollide = cancol
end

function autoClickFunc()
    spawn(function()
        while autoClick do
            wait()
            local args = {[1] = "swingKatana"}
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
        end
    end)
end


function autoSellFunc()
    spawn(function()
        while autoSell do
            wait(3)
            local playerX = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X
            local playerY = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y
            local playerZ = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z
            setPart(playerX,playerY,playerZ,"tpSell",false)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").sellTeleportPart.CFrame
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").tpSell.CFrame
            game:GetService("Workspace").tpSell:Destroy()
        end
    end)
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Ninja Legends", "BloodTheme")

local AutoFarming = Window:NewTab("Auto Farming")

local Section = AutoFarming:NewSection("AutoFarming")

Section:NewToggle("AutoClick", "it automaticly clicks for you", function(state)
    autoClick = state
    autoClickFunc()
end)

Section:NewToggle("AutoSell", "it automaticly Sells for you", function(state)
    autoSell = state
    autoSellFunc()
end)