-------------------Variables--------------------
local tpDelay = 0.2
local tpHight = 150
local tpF = 12


-------------------Functions--------------------

function setPart( x,y,z,name,cancol,Trans,Size)
    local part = Instance.new("Part",workspace)
    part.Anchored = true
    part.Transparency = Trans
    part.Size = Vector3.new(Size,Size,Size)
    part.Position = Vector3.new(x,y,z)
    part.Name = name
    part.CanCollide = cancol
end

setPart(1,1,1,"TpPart",false,0.5,2)
function TpFunc(x,y,z)
    spawn(function()
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local WorkSpace = game:GetService("Workspace")

        if WorkSpace:FindFirstChild(Player.Name) then
            local PlayerW = WorkSpace:FindFirstChild(Player.Name)
            WorkSpace.TpPart.CFrame = PlayerW.HumanoidRootPart.CFrame
            WorkSpace.TpPart.Position = Vector3.new(x,y,z)
            Player.Character.HumanoidRootPart.CFrame = WorkSpace.TpPart.CFrame
        end
    end)
end

function FanceHopperFunc()
    spawn(function()
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local WorkSpace = game:GetService("Workspace")

        if WorkSpace:FindFirstChild(Player.Name) then
            local bodyvel = Instance.new("BodyVelocity",game:GetService("Players").LocalPlayer.Character.LowerTorso)
            bodyvel.MaxForce = Vector3.new(math.huge,math.huge,math.huge)

            local PlayerW = WorkSpace:FindFirstChild(Player.Name)
            local orientationY = PlayerW.HumanoidRootPart.Orientation.Y

            local xGoal = PlayerW.HumanoidRootPart.Position.X
            local yGoal = PlayerW.HumanoidRootPart.Position.Y+tpHight
            local zGoal = PlayerW.HumanoidRootPart.Position.Z
            TpFunc(xGoal,yGoal,zGoal)
            wait(tpDelay)
            local degree = orientationY
            degree = 340 - degree
            degree = degree - 70
            xGoal = xGoal + (tpF * math.cos(math.rad(degree)))
            zGoal = zGoal + (tpF * math.sin(math.rad(degree)))
            TpFunc(xGoal,yGoal,zGoal)
            wait(tpDelay)
            yGoal = yGoal-tpHight+3
            TpFunc(xGoal,yGoal,zGoal)
            wait(tpDelay)
            bodyvel:Destroy()
        end
    end)
end

-------------------gui--------------------------
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("FanceHopper", "BloodTheme")

local MovementTab = Window:NewTab("Movement")

local FanceHopperSection = MovementTab:NewSection("Fance Hopper")

FanceHopperSection:NewKeybind("Fire event", "KeybindInfo", Enum.KeyCode.V, function()
	FanceHopperFunc()
end)

FanceHopperSection:NewSlider("Delay of Tp", "SliderInfo", 10, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
    tpDelay = s/10
end)

FanceHopperSection:NewSlider("tpHight", "SliderInfo", 200, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
    tpHight = s
end)

FanceHopperSection:NewSlider("tpF", "SliderInfo", 40, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
    tpF = s
end)
