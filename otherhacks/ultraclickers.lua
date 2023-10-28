getgenv().autoFarm = false

local playerName = game.Players.LocalPlayer.Name

function autoFarmFunc()
    spawn(function()
        while autoFarm do
            wait()
            workspace.Events.AddClick:FireServer()
        end
    end)
end

local TelepordLoc = ""
function TelepordFunc()
    if workspace.Portals:FindFirstChild(TelepordLoc) then
        workspace:FindFirstChild(playerName).HumanoidRootPart.CFrame = workspace.Portals:FindFirstChild(TelepordLoc).Teleport.CFrame
    end
end



local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
 
local w = library:CreateWindow("ultraclickers") -- Creates the window

local b = w:CreateFolder("farm") -- Creates the folder(U will put here your buttons,etc)

local c = w:CreateFolder("telepord") -- Creates the folder(U will put here your buttons,etc)

b:Toggle("AutoClick",function(bool)
    shared.toggle = bool
    autoFarm = bool
    autoFarmFunc()
end)

c:Button("telepord",function()
    TelepordFunc()
end)

local TP = {}
workspace.Portals.Script:Destroy()
for i, v in pairs(workspace.Portals:GetChildren()) do
    TP[i] = v.Name
end

c:Dropdown("Tp location",TP,true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
    TelepordLoc = mob
end)
