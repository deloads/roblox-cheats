-------------------Variables--------------------

local FreeCam = false
local USpeed = 3
local FSpeed = 3

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

local function SetColide(Bool)
    local WorkSpace = game:GetService("Workspace")
    WorkSpace.savePartt.CanCollide = Bool
    WorkSpace.savePartxp.CanCollide = Bool
    WorkSpace.savePartxm.CanCollide = Bool
    WorkSpace.savePartzp.CanCollide = Bool
    WorkSpace.savePartzm.CanCollide = Bool
end

local function setSavePart( part,ox,oy,oz,ax,ay,az )
    part.Position = Vector3.new(
        ox+ax,
        oy+ay,
        oz+az
    )
end

local function setAllSaveParts(x,y,z)
    local WorkSpace = game:GetService("Workspace")
    setSavePart(WorkSpace.savePartt,x,y,z,0,-4.5,0)
    setSavePart(WorkSpace.savePartxp,x,y,z,4,0,0)
    setSavePart(WorkSpace.savePartxm,x,y,z,-4,0,0)
    setSavePart(WorkSpace.savePartzp,x,y,z,0,0,4)
    setSavePart(WorkSpace.savePartzm,x,y,z,0,0,-4)
end

local walkF = false
local walkB = false
local walkL = false
local walkR = false
local walkU = false
local walkD = false
local useriput = game:GetService("UserInputService")

useriput.InputBegan:Connect(function(keycode)
	if keycode.KeyCode == Enum.KeyCode.W then
		walkF = true
	end
	if keycode.KeyCode == Enum.KeyCode.S then
		walkB = true
	end
	if keycode.KeyCode == Enum.KeyCode.A then
		walkL = true
	end
	if keycode.KeyCode == Enum.KeyCode.D then
		walkR = true
	end
	if keycode.KeyCode == Enum.KeyCode.Space then
		walkU = true
	end
	if keycode.KeyCode == Enum.KeyCode.LeftShift then
		walkD = true
	end
end)

useriput.InputEnded:Connect(function(keycode)
	if keycode.KeyCode == Enum.KeyCode.W then
		walkF = false
	end
	if keycode.KeyCode == Enum.KeyCode.S then
		walkB = false
	end
	if keycode.KeyCode == Enum.KeyCode.A then
		walkL = false
	end
	if keycode.KeyCode == Enum.KeyCode.D then
		walkR = false
	end
	if keycode.KeyCode == Enum.KeyCode.Space then
		walkU = false
	end
	if keycode.KeyCode == Enum.KeyCode.LeftShift then
		walkD = false
	end
end)

local ts = game:GetService("TweenService")
setPart(1,1,1,"CemeraPart",false,1,2)
setPart(1,1,1,"savePartt",true,1,3)
setPart(1,1,1,"savePartxp",true,1,5)
setPart(1,1,1,"savePartxm",true,1,5)
setPart(1,1,1,"savePartzp",true,1,5)
setPart(1,1,1,"savePartzm",true,1,5)

function FreeCamFunc()
    spawn(function()
        local WorkSpace = game:GetService("Workspace")
        WorkSpace.CemeraPart.CFrame = game:GetService("Players").LocalPlayer.Character.Head.CFrame
        local cam = WorkSpace.CurrentCamera
        cam.CameraSubject = WorkSpace.CemeraPart
        local x = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.X
        local y = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y
        local z = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Z
        SetColide(true)
        setAllSaveParts(x,y,z)

        local playerMod = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule)
        local Controls = playerMod:GetControls()
        Controls:Disable()
        while FreeCam do
            wait(0.1)
            local CemeraPartPos = WorkSpace.CemeraPart.Position
            WorkSpace.CemeraPart.CFrame = cam.CFrame
            local orientationY = WorkSpace.CemeraPart.Orientation.Y
            WorkSpace.CemeraPart.Position = CemeraPartPos

            local xGoal = WorkSpace.CemeraPart.Position.X
            local yGoal = WorkSpace.CemeraPart.Position.Y
            local zGoal = WorkSpace.CemeraPart.Position.Z

            if walkF then
                local degree = orientationY
                degree = 340 - degree
                degree = degree - 70
                xGoal = xGoal + (FSpeed * math.cos(math.rad(degree)))
                zGoal = zGoal + (FSpeed * math.sin(math.rad(degree)))
            end
            if walkB then
                local degree = orientationY
                degree = 340 - degree
                degree = degree - 70 - 180
                xGoal = xGoal + (FSpeed * math.cos(math.rad(degree)))
                zGoal = zGoal + (FSpeed * math.sin(math.rad(degree)))
            end
            if walkR then
                local degree = orientationY
                degree = 340 - degree
                degree = degree - 70 + 90
                xGoal = xGoal + (FSpeed * math.cos(math.rad(degree)))
                zGoal = zGoal + (FSpeed * math.sin(math.rad(degree)))
            end
            if walkL then
                local degree = orientationY
                degree = 340 - degree
                degree = degree - 70 - 90
                xGoal = xGoal + (FSpeed * math.cos(math.rad(degree)))
                zGoal = zGoal + (FSpeed * math.sin(math.rad(degree)))
            end
            if walkU then
                yGoal = yGoal + USpeed
            end
            if walkD then
                yGoal = yGoal - USpeed
            end

            local info = TweenInfo.new(
                0.1,
                Enum.EasingStyle.Linear,
                Enum.EasingDirection.Out,
                0,
                false,
                0
            )
            local goal = {}
            goal.Position = Vector3.new(xGoal,yGoal,zGoal)
            local partTween = ts:Create(WorkSpace.CemeraPart, info, goal)
            partTween:Play()

        end
        SetColide(false)
        Controls:Enable()
        cam.CameraSubject = WorkSpace:WaitForChild(game:GetService("Players").LocalPlayer.Name).Humanoid
    end)
end
-------------------gui--------------------------
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("TITLE", "BloodTheme")

local Movement = Window:NewTab("Movement")

local FreecamSection = Movement:NewSection("Freecam")

FreecamSection:NewKeybind("Freecam", "KeybindInfo", Enum.KeyCode.G, function()
	if FreeCam == true then
        FreeCam = false
    else
        FreeCam = true
        FreeCamFunc()
    end
end)

FreecamSection:NewKeybind("Tp on spot", "", Enum.KeyCode.C, function()
    if FreeCam then
        if game:GetService("Workspace"):FindFirstChild(game:GetService("Players").LocalPlayer.Name) then
            game:GetService("Workspace"):FindFirstChild(game:GetService("Players").LocalPlayer.Name).HumanoidRootPart.CFrame = game:GetService("Workspace").CemeraPart.CFrame
            local x = game:GetService("Workspace"):FindFirstChild(game:GetService("Players").LocalPlayer.Name).HumanoidRootPart.Position.X
            local y = game:GetService("Workspace"):FindFirstChild(game:GetService("Players").LocalPlayer.Name).HumanoidRootPart.Position.Y
            local z = game:GetService("Workspace"):FindFirstChild(game:GetService("Players").LocalPlayer.Name).HumanoidRootPart.Position.Z
            setAllSaveParts(x,y,z)
        end
    end
end)

FreecamSection:NewSlider("Freecam F speed", "SliderInfo", 35, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
    FSpeed = s
end)
FreecamSection:NewSlider("Freecam U speed", "SliderInfo", 20, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
    USpeed = s
end)