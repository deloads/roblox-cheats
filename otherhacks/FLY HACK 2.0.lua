wait(2)
local fly = false
local anchor = false


local work = game:GetService("Workspace")
local cemara = work.CurrentCamera
local decrees = 0
local player = game.Players.LocalPlayer
local playerW = player.Character
local humanoidRootPart = playerW.HumanoidRootPart

local studs = 25
local upDownStuds = 10


local ts = game:GetService("TweenService")
local walkF = false
local walkB = false
local walkL = false
local walkR = false
local walkU = false
local walkD = false
local useriput = game:GetService("UserInputService")

local part = Instance.new("Part",work)
part.Name = "Kjswr"
part.Anchored = true
part.CanCollide = false
part.Transparency = 1
part.Size = Vector3.new(1,1,1)
local Blib = Instance.new("Part",work)
Blib.Name = "Blib"
Blib.Anchored = true
Blib.CanCollide = false
Blib.Transparency = 1
Blib.Size = Vector3.new(1,1,1)

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
function flyFunc()
    spawn(function()
        walkF = false
        walkB = false
        walkL = false
        walkR = false
        walkU = false
        walkD = false
        work.Kjswr.CFrame = playerW.HumanoidRootPart.CFrame

        if anchor then
            playerW.HumanoidRootPart.Anchored = true
        else
            local bodyvel = Instance.new("BodyVelocity",game:GetService("Players").LocalPlayer.Character.LowerTorso)
            bodyvel.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
        end
        while fly do
            --playerW.HumanoidRootPart.CFrame = work.Kjswr.CFrame
            wait(0.1)
            
            if walkF then
                local work = game:GetService("Workspace")
                
                local currendPos = work.Kjswr.Position
                work.Kjswr.CFrame = cemara.CFrame
                work.Kjswr.Orientation = Vector3.new(0,work.Kjswr.Orientation.Y,0)
                work.Kjswr.Position = currendPos
                
                local degree = work.Kjswr.Orientation.Y
                degree = 340 - degree
                degree = degree - 70
                local x = studs * math.cos(math.rad(degree))
                local z = studs * math.sin(math.rad(degree))
                
                work.Blib.Orientation = work.Kjswr.Orientation
                work.Blib.Position = Vector3.new(
                    work.Kjswr.Position.X + x,
                    work.Kjswr.Position.Y,
                    work.Kjswr.Position.Z + z
                )
                
                local info = TweenInfo.new(
                    0.1,
                    Enum.EasingStyle.Linear,
                    Enum.EasingDirection.Out,
                    0,
                    false,
                    0
                )
                local goal = {}
                goal.CFrame = work.Blib.CFrame
                local partTween = ts:Create(playerW.HumanoidRootPart, info, goal)
                partTween:Play()
                
                work.Kjswr.Position = work.Blib.Position
            end
            
            if walkB then
                local work = game:GetService("Workspace")
                local currendPos = work.Kjswr.Position
                work.Kjswr.CFrame = cemara.CFrame
                work.Kjswr.Orientation = Vector3.new(0,work.Kjswr.Orientation.Y,0)
                work.Kjswr.Position = currendPos

                local degree = work.Kjswr.Orientation.Y
                degree = 340 - degree
                degree = degree - 70
                degree = degree - 180
                local x = studs * math.cos(math.rad(degree))
                local z = studs * math.sin(math.rad(degree))

                work.Blib.Orientation = work.Kjswr.Orientation
                work.Blib.Position = Vector3.new(
                    work.Kjswr.Position.X + x,
                    work.Kjswr.Position.Y,
                    work.Kjswr.Position.Z + z
                )

                local info = TweenInfo.new(
                    0.1,
                    Enum.EasingStyle.Linear,
                    Enum.EasingDirection.Out,
                    0,
                    false,
                    0
                )
                local goal = {}
                goal.CFrame = work.Blib.CFrame
                local partTween = ts:Create(playerW.HumanoidRootPart, info, goal)
                partTween:Play()

                work.Kjswr.Position = work.Blib.Position
            end
            
            if walkL then
                local work = game:GetService("Workspace")
                local currendPos = work.Kjswr.Position
                work.Kjswr.CFrame = cemara.CFrame
                work.Kjswr.Orientation = Vector3.new(0,work.Kjswr.Orientation.Y,0)
                work.Kjswr.Position = currendPos

                local degree = work.Kjswr.Orientation.Y
                degree = 340 - degree
                degree = degree - 70
                degree = degree - 90
                local x = studs * math.cos(math.rad(degree))
                local z = studs * math.sin(math.rad(degree))

                work.Blib.Orientation = work.Kjswr.Orientation
                work.Blib.Position = Vector3.new(
                    work.Kjswr.Position.X + x,
                    work.Kjswr.Position.Y,
                    work.Kjswr.Position.Z + z
                )

                local info = TweenInfo.new(
                    0.1,
                    Enum.EasingStyle.Linear,
                    Enum.EasingDirection.Out,
                    0,
                    false,
                    0
                )
                local goal = {}
                goal.CFrame = work.Blib.CFrame
                local partTween = ts:Create(playerW.HumanoidRootPart, info, goal)
                partTween:Play()

                work.Kjswr.Position = work.Blib.Position
            end
            
            if walkR then
                local work = game:GetService("Workspace")
                local currendPos = work.Kjswr.Position
                work.Kjswr.CFrame = cemara.CFrame
                work.Kjswr.Orientation = Vector3.new(0,work.Kjswr.Orientation.Y,0)
                work.Kjswr.Position = currendPos

                local degree = work.Kjswr.Orientation.Y
                degree = 340 - degree
                degree = degree - 70
                degree = degree + 90
                local x = studs * math.cos(math.rad(degree))
                local z = studs * math.sin(math.rad(degree))

                work.Blib.Orientation = work.Kjswr.Orientation
                work.Blib.Position = Vector3.new(
                    work.Kjswr.Position.X + x,
                    work.Kjswr.Position.Y,
                    work.Kjswr.Position.Z + z
                )

                local info = TweenInfo.new(
                    0.1,
                    Enum.EasingStyle.Linear,
                    Enum.EasingDirection.Out,
                    0,
                    false,
                    0
                )
                local goal = {}
                goal.CFrame = work.Blib.CFrame
                local partTween = ts:Create(playerW.HumanoidRootPart, info, goal)
                partTween:Play()

                work.Kjswr.Position = work.Blib.Position
            end
            if walkD then
                local work = game:GetService("Workspace")
                local currendPos = work.Kjswr.Position
                work.Kjswr.CFrame = cemara.CFrame
                work.Kjswr.Orientation = Vector3.new(0,work.Kjswr.Orientation.Y,0)
                work.Kjswr.Position = currendPos

                work.Blib.Orientation = work.Kjswr.Orientation
                work.Blib.Position = Vector3.new(
                    work.Kjswr.Position.X,
                    work.Kjswr.Position.Y-upDownStuds,
                    work.Kjswr.Position.Z
                )

                local info = TweenInfo.new(
                    0.1,
                    Enum.EasingStyle.Linear,
                    Enum.EasingDirection.Out,
                    0,
                    false,
                    0
                )
                local goal = {}
                goal.CFrame = work.Blib.CFrame
                local partTween = ts:Create(playerW.HumanoidRootPart, info, goal)
                partTween:Play()

                work.Kjswr.Position = work.Blib.Position
            end
            if walkU then
                local work = game:GetService("Workspace")
                local currendPos = work.Kjswr.Position
                work.Kjswr.CFrame = cemara.CFrame
                work.Kjswr.Orientation = Vector3.new(0,work.Kjswr.Orientation.Y,0)
                work.Kjswr.Position = currendPos

                work.Blib.Orientation = work.Kjswr.Orientation
                work.Blib.Position = Vector3.new(
                    work.Kjswr.Position.X,
                    work.Kjswr.Position.Y+upDownStuds,
                    work.Kjswr.Position.Z
                )

                local info = TweenInfo.new(
                    0.1,
                    Enum.EasingStyle.Linear,
                    Enum.EasingDirection.Out,
                    0,
                    false,
                    0
                )
                local goal = {}
                goal.CFrame = work.Blib.CFrame
                local partTween = ts:Create(playerW.HumanoidRootPart, info, goal)
                partTween:Play()

                work.Kjswr.Position = work.Blib.Position
            end
        end
        playerW.HumanoidRootPart.Anchored = false
        if anchor then
        else
            bodyvel:Destroy()
        end
    end)
end

----------------------------------

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
 
local w = library:CreateWindow("MovementHacks") -- Creates the window
 
local a = w:CreateFolder("FlyHack")

a:Toggle("Fly Hack",function(bool)
    shared.toggle = bool
    fly = bool
    flyFunc()
end)

a:Toggle("Anchor",function(bool)
    shared.toggle = bool
    anchor = bool
end)

a:Slider("Up Speed",{
    min = 1; -- min value of the slider
    max = 10; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    upDownStuds = value
end)

a:Slider("FSpeed",{
    min = 1; -- min value of the slider
    max = 30; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    studs = value
end)