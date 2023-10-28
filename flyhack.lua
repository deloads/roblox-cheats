-------------------Variables--------------------
local players = game:GetService("Players")
local player = players.LocalPlayer
local worc = game:GetService("Workspace")
local char = worc:WaitForChild(player.Name)
local cam = worc.Camera
local useriput = game:GetService("UserInputService")
local tweenSurvice = game:GetService("TweenService")

local fly = false--fly hack
local flyspeed = 10

local walkF = false
local walkB = false
local walkL = false
local walkR = false
local walkU = false
local walkD = false

-------------------Functions--------------------

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
		local tweeninfo = TweenInfo.new(
			0.2,
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.In,
			0,
			false,
			0
		)
        while fly do
			local humanoidrootpart = char.HumanoidRootPart
            local goal = {}
			goal.CFrame = humanoidrootpart.CFrame
			local add = false
			if walkF then
				goal.CFrame = goal.CFrame + humanoidrootpart.CFrame.LookVector*flyspeed
				add = true
			end
			if walkB then
				goal.CFrame = goal.CFrame - humanoidrootpart.CFrame.LookVector*flyspeed
				add = true
			end
			if walkR then
				goal.CFrame = goal.CFrame + humanoidrootpart.CFrame.RightVector*flyspeed
				add = true
			end
			if walkL then
				goal.CFrame = goal.CFrame - humanoidrootpart.CFrame.RightVector*flyspeed
				add = true
			end
			if walkU then
				goal.CFrame = goal.CFrame + humanoidrootpart.CFrame.UpVector*flyspeed
				add = true
			end
			if walkD then
				goal.CFrame = goal.CFrame - humanoidrootpart.CFrame.UpVector*flyspeed
				add = true
			end
			local tween = tweenSurvice:Create(humanoidrootpart,tweeninfo,goal)
			if add then
				tween:Play()
			end
			wait(0.2)
        end
    end)
end


function UpdateCFrameFunc()
    spawn(function()
        local can = false
        if char:FindFirstChild("HumanoidRootPart") then
            can = true
            char.HumanoidRootPart.Anchored = true
        end
        while fly and can do
            wait()
            if char:FindFirstChild("HumanoidRootPart") then
                local newC = cam.CFrame+(cam.CFrame.LookVector*1000)
                char.HumanoidRootPart.CFrame = CFrame.new(
                    char.HumanoidRootPart.Position,
                    newC.Position
                )
            end
        end
        if char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.Anchored = false
        end
    end)
end

-------------------gui--------------------------
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("TITLE", "BloodTheme")

local movementTab = Window:NewTab("Movement")

local flySection = movementTab:NewSection("Fly")

flySection:NewKeybind("Fly Toggle", "KeybindInfo", Enum.KeyCode.G, function()
    if fly == false then
        fly = true
        UpdateCFrameFunc()
		flyFunc()
    else
        fly = false
    end
end)