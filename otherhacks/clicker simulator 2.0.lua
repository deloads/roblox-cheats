local autoAttackBoss = false
local autoClick = false

function autoAttackBossfunc()
    spawn(function()
        while autoAttackBoss do
            wait()
            local args = {[1] = "Karen Keyboard"}
            game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.CursorCannonService.FireBoss:FireServer(unpack(args))
        end
    end)
end

function autoClickfunc()
    spawn(function()
        while autoClick do
            wait()
            local args = {[1] = 1}game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.ClickService.Click:FireServer(unpack(args))
        end
    end)
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
 
local w = library:CreateWindow("clicker simulator") -- Creates the window
 
local b = w:CreateFolder("farming") -- Creates the folder(U will put here your buttons,etc)

b:Toggle("auto click",function(bool)
    shared.toggle = bool
    autoClick = bool
    autoClickfunc()
end)

local c = w:CreateFolder("atacking")

c:Toggle("auto attack boss",function(bool)
    shared.toggle = bool
    autoAttackBoss = bool
    autoAttackBossfunc()
end)