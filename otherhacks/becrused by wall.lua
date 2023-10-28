local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
 
local w = library:CreateWindow("becrused by wall") -- Creates the window
 
local b = w:CreateFolder("Player") -- Creates the folder(U will put here your buttons,etc)

b:Slider("Speed",{
    min = 16; -- min value of the slider
    max = 250; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

b:Slider("JumpPower",{
    min = 50; -- min value of the slider
    max = 500; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)