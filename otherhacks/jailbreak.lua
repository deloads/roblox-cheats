getgenv().fly = false
getgenv().easyArrest = false
getgenv().blip = false
getgenv().togles = false
getgenv().tp = false
getgenv().glideFly = false

function setPart(x,y,z,name,cancol)
    local part = Instance.new("Part",game:GetService("Workspace"))
    part.Anchored = true
    part.Transparency = 0.5
    part.Size = Vector3.new(250,1,250)
    part.Position = Vector3.new(x,y,z)
    part.Name = name
    part.CanCollide = cancol
end

local y = 1
local useriput = game:GetService("UserInputService")
local moveup = false
local movedown = false
useriput.InputBegan:Connect(function(keycode)
    if keycode.KeyCode == Enum.KeyCode.K then
        if moveup then
            moveup = false
        else
            moveup = true
        end
    end
    if keycode.KeyCode == Enum.KeyCode.M then
        if movedown then
            movedown = false
        else
            movedown = true
        end
    end

    if keycode.KeyCode == Enum.KeyCode.B then
        if tp then
            tp = false
        else
            tp = true
        end
    end
end)

function flyFunc()
    spawn(function()
        local players = game:GetService("Players")
        if players.LocalPlayer.Character.HumanoidRootPart then
            y = players.LocalPlayer.Character.HumanoidRootPart.Position.Y-7
        end


        if fly then
            local work = game:GetService("Workspace")
            if work:FindFirstChild("hois") then
                work:FindFirstChild("hois"):Destroy()
            end
            setPart(1,1,1,"hois",true)
        else
            local work = game:GetService("Workspace")
            if work:FindFirstChild("hois") then
                work:FindFirstChild("hois"):Destroy()
            end
        end
        while fly do
            wait(0.05)
            if moveup then
                y = y + 0.5
            end
            if movedown then
                y = y - 0.5
            end
            local players = game:GetService("Players")
            if players.LocalPlayer.Character.HumanoidRootPart then
                local x = players.LocalPlayer.Character.HumanoidRootPart.Position.X
                local z = players.LocalPlayer.Character.HumanoidRootPart.Position.Z
                local work = game:GetService("Workspace")

                work:FindFirstChild("hois").Position = Vector3.new(x,y,z)
            end
        end
    end)
end

function easyArrestFunc()
    spawn(function()
        local playerLock = false
        local prisonerTable = {}
        local playersIntable = 0
        local closePLayerDistance = 1000000
        local closePLayer = ""
        while easyArrest do
            local players = game:GetService("Players")
            wait()
            if players.LocalPlayer.Character.HumanoidRootPart then
                if playerLock then
                    if players.LocalPlayer.Character.HumanoidRootPart then
                        if players:FindFirstChild(closePLayer).Character.HumanoidRootPart then
                            players.LocalPlayer.Character.HumanoidRootPart.CFrame = players:FindFirstChild(closePLayer).Character.HumanoidRootPart.CFrame
                        end
                    end
                else

                    local playerPosx = players.LocalPlayer.Character.HumanoidRootPart.Position.X
                    local playerPosy = players.LocalPlayer.Character.HumanoidRootPart.Position.Y
                    local playerPosz = players.LocalPlayer.Character.HumanoidRootPart.Position.Z
                    prisonerTable = {}
                    playersIntable = 0
                    for i,v in pairs(players:GetChildren()) do
                        if v.TeamValue.Value == "Prisoner" then
                            if v.Character then
                                if v.Character.HumanoidRootPart then
                                    playersIntable = playersIntable + 1
                                    prisonerTable[playersIntable] = v
                                end
                            end
                        end
                    end
                    for i,v in pairs(prisonerTable) do
                        if v.Character.HumanoidRootPart then
                            local TarPlayerPosX = v.Character.HumanoidRootPart.Position.X
                            local TarPlayerPosY = v.Character.HumanoidRootPart.Position.Y
                            local TarPlayerPosZ = v.Character.HumanoidRootPart.Position.Z

                            local xDistance = math.abs(TarPlayerPosX-playerPosx)
                            local yDistance = math.abs(TarPlayerPosY-playerPosy)
                            local zDistance = math.abs(TarPlayerPosZ-playerPosz)
                            local Dis = ((xDistance^2)+(yDistance^2)+(zDistance^2))^0.5
                            if closePLayerDistance > Dis then
                                closePLayerDistance = Dis
                                closePLayer = v.Name
                            end
                        end
                    end
                    print(closePLayerDistance)
                    print(closePLayer)
                    if closePLayerDistance < 30 then
                        playerLock = true
                    end
                end
            end
        end
    end)
end
local studs = 3
setPart(0,0,0,"blib",false)
game:GetService("Workspace").blib.Size = Vector3.new(1,1,1)
function blibfunc()
    spawn(function()
        while blip do
            local playerW = game:GetService("Players").LocalPlayer.Character
            playerW.HumanoidRootPart.Anchored = true
            wait()
            if tp then
                local playerW = game:GetService("Players").LocalPlayer.Character
                local degree = playerW.HumanoidRootPart.Orientation.Y
                degree = 340 - degree
                degree = degree - 73
                local part = game:GetService("Workspace").blib
                local x = studs * math.cos(math.rad(degree))
                local z = studs * math.sin(math.rad(degree))
                
                game:GetService("Workspace").blib.Position = Vector3.new(
                    playerW.HumanoidRootPart.Position.X + x,
                    playerW.HumanoidRootPart.Position.y,
                    playerW.HumanoidRootPart.Position.Z + z
                )
                game:GetService("Workspace").blib.Orientation = playerW.HumanoidRootPart.Orientation

                local playerW = game:GetService("Players").LocalPlayer.Character
                playerW.HumanoidRootPart.CFrame = game:GetService("Workspace").blib.CFrame
                if togles then
                    tp = false
                end
            end
            playerW.HumanoidRootPart.Anchored = false
        end
    end)
end
setPart(0,0,0,"glideFly",false)
game:GetService("Workspace").glideFly.Size = Vector3.new(1,1,1)
function glideFlyFunc()
    spawn(function()
        local Y = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y
        while glideFly do
            wait(0.1)
            local playerW = game:GetService("Players").LocalPlayer.Character
            if moveup then
                Y = Y + 1
            end
            if movedown then
                Y = Y - 1
            end
            game:GetService("Workspace").glideFly.Position = Vector3.new(
                playerW.HumanoidRootPart.Position.X,
                Y,
                playerW.HumanoidRootPart.Position.Z)
            game:GetService("Workspace").glideFly.Orientation = playerW.HumanoidRootPart.Orientation
            playerW.HumanoidRootPart.CFrame = game:GetService("Workspace").glideFly.CFrame
        end
    end)
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
 
local w = library:CreateWindow("JailBreak")

local a = w:CreateFolder("Police")

a:Toggle("Easy Arrest",function(bool)
    shared.toggle = bool
    easyArrest = bool
    easyArrestFunc()
end)
 
local b = w:CreateFolder("Movement")

b:Toggle("Flyhack",function(bool)
    shared.toggle = bool
    fly = bool
    flyFunc()
end)

b:Slider("trancparecy",{
    min = 0; -- min value of the slider
    max = 1; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
    local work = game:GetService("Workspace")
    if work:FindFirstChild("hois") then
        work:FindFirstChild("hois").Transparency = value
    end
end)

b:Toggle("Blibing",function(bool)
    shared.toggle = bool
    blip = bool
    blibfunc()
end)

b:Toggle("Togle",function(bool)
    shared.toggle = bool
    togles = bool
end)

b:Slider("studs",{
    min = 3; -- min value of the slider
    max = 13; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    studs = value
end)

b:Toggle("GlydeFly",function(bool)
    shared.toggle = bool
    glideFly = bool
    glideFlyFunc()
end)