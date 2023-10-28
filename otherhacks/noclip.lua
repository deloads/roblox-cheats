getgenv().noclip = false
getgenv().noWalsTrans = false
--wait(5)

function setPart(x,y,z,name,cancol,xS,yS,zS)
    local part = Instance.new("Part",workspace)
    part.Anchored = true
    part.Transparency = 0.5
    part.Size = Vector3.new(xS,yS,zS)
    part.Position = Vector3.new(x,y,z)
    part.Name = name
    part.CanCollide = cancol
    return part
end

local NoclipAnable = setPart(1,1,1,"NoclipAn",false,14,1,14)

function noclipfunc()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Transparency = 0.5
    game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(7,1,7)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
    spawn(function()
        while noclip == true do
            wait()
            local playerW = game.Players.LocalPlayer.Character.HumanoidRootPart
            NoclipAnable.Position = playerW.Position
        end
    end)
end

game.Players.LocalPlayer.Character.Head.Touched:Connect(function(P)
    spawn(function()
        if noclip == true then
            if P.Parent == game.Players.LocalPlayer.Character then
            else
                P.CanCollide = false
            end
        end
    end)
end)

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
 
local w = library:CreateWindow("lekker") -- Creates the window
 
local b = w:CreateFolder("noclip") -- Creates the folder(U will put here your buttons,etc)

b:Label("van marijn",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
})

b:Toggle("Toggle",function(bool)
    shared.toggle = bool
    noclip = true
    noclipfunc()
end)