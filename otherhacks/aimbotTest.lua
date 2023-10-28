getgenv().aimbot = false
getgenv().aimbotSelection = ""

local playerName = game.Players.LocalPlayer.Name



local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
 
local w = library:CreateWindow("hacks") -- Creates the window
 
local b = w:CreateFolder("aimbot") -- Creates the folder(U will put here your buttons,etc)

b:Button("Rplayer",function()
    Rplayer()
end)

b:Toggle("aimbot",function(bool)
    shared.toggle = bool
    aimbot = bool
    aimbotFunc()
end)

function Rplayer()
    spawn(function()
        local playerTab = {}
        for i, v in pairs(game.Players:GetChildren()) do
            playerTab[i] = v.Name
        end
        b:Dropdown("player select",playerTab,true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
            aimbotSelection = mob
        end)
    end)
end

function aimbotFunc()
    spawn(function()
        while aimbot do
            wait()
            workspace:FindFirstChild(playerName).Head.Cframe = CFrame.lookAt(workspace:FindFirstChild(playerName).Head.Position,workspace:FindFirstChild(aimbotSelection).Head.Position)
        end
    end)
end




