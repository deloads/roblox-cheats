getgenv().SetSpeed = false
getgenv().Speed = 16
getgenv().SetJumpPower = false
getgenv().JumpPower = 50

--Movements

function SetSpeedFunc()
    spawn(function()
        while SetSpeed do
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed
        end
    end)
end

function SetJumpPowerFunc()
    spawn(function()
        while SetJumpPower do
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
        end
    end)
end


local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
 
local wH = library:CreateWindow("Hider") -- Hider
local fH = wH:CreateFolder("Hider")

local wS = library:CreateWindow("Seaker") -- Seaker
local fS = wS:CreateFolder("Seaker")

local wV = library:CreateWindow("Visuals") -- Visuals
local fV = wV:CreateFolder("Visuals")

local wM = library:CreateWindow("Movements") -- Movements
local fM = wM:CreateFolder("Movements")

fM:Toggle("Anable Speed Hack",function(bool)
    shared.toggle = bool
    SetSpeed = bool
    SetSpeedFunc()
end)

fM:Slider("Walk Speed",{
    min = 16; -- min value of the slider
    max = 400; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    Speed = value
end)

fM:Toggle("Anable JumpPower Hack",function(bool)
    shared.toggle = bool
    SetJumpPower = bool
    SetJumpPowerFunc()
end)

fM:Slider("JumpPower",{
    min = 50; -- min value of the slider
    max = 500; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    JumpPower = value
end)