getgenv().autoFarm = false
getgenv().autoColectboxes = false
getgenv().trainHack = false

function setPart( x,y,z,name,cancol)
    local part = Instance.new("Part",workspace)
    part.Anchored = true
    part.Transparency = 1
    part.Size = Vector3.new(2,2,2)
    part.Position = Vector3.new(x,y,z)
    part.Name = name
    part.CanCollide = cancol
end

setPart(121,-3166,10,"trainHack",false)
function trainHackFunc()
    spawn(function()
        setPart(121,-3170,10,"PlateHack",true)
        while trainHack do
            wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").trainHack.CFrame
        end
        game:GetService("Workspace").PlateHack:Destroy()
    end)
end

local maneySpend = 0
function autoFarmFunc()
    spawn(function()
        local maneySpend = 0
        while autoFarm do
            wait()
            local curentCash = game:GetService("Players").LocalPlayer.leaderstats.Cash.Value
            local ubgradePrise = game:GetService("Players").LocalPlayer.PlayerGui.MainScreen.BaseUI.MainUI.UpgradeUI.GroupFrame.MainFrame.MainPage.Scroll.PageA.Item01.BValue.Value
            local ubgradePrise2 = game:GetService("Players").LocalPlayer.PlayerGui.MainScreen.BaseUI.MainUI.UpgradeUI.GroupFrame.MainFrame.MainPage.Scroll.PageA.Item02.BValue.Value
            local priseToRebir = game:GetService("Players").LocalPlayer.PlayerGui.MainScreen.ClientBaseScript.CashToRebirth.Value
            if curentCash > ubgradePrise and maneySpend < (0.25*priseToRebir) then
                maneySpend = maneySpend + ubgradePrise

                local args = {[1] = "PageA",[2] = "Pickaxe Power"}
                game:GetService("ReplicatedStorage").UISystem.UpgradeClick:FireServer(unpack(args))
                
            end
            if curentCash > priseToRebir then
                maneySpend = 0
                game:GetService("ReplicatedStorage").GameSystem.Rebirth:FireServer()
            end
            game:GetService("ReplicatedStorage").GameSystem.PlayerClick:FireServer()
        end
    end)
end

setPart(37, 37, -4,"ColectBoxes",false)
function autoColectboxesfunc()
    spawn(function()
        while autoColectboxes do
            wait(0.1)
            for i, v in pairs(game:GetService("Workspace").GameWorkspace.AirdropBoxes:GetChildren()) do
                wait()
                if v.ClassName == "Part" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    wait(0.1)
                end
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ColectBoxes.CFrame
        end
    end)
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("endlesmining sim", "BloodTheme")

local Tab = Window:NewTab("farming")
local TabTr = Window:NewTab("trainHack")
local TabPl = Window:NewTab("player")

local Section = Tab:NewSection("Section Name")
local SectionTr = TabTr:NewSection("Section Name")
local SectionPl = TabPl:NewSection("Section Name")

Section:NewToggle("auto dig", "automaticly digs for gold", function(state)
    autoFarm = state
    autoFarmFunc()
end)

Section:NewToggle("auto collect drone boxes", "automaticly collects drone boxes", function(state)
    autoColectboxes = state
    autoColectboxesfunc()
end)

SectionTr:NewToggle("train hack", "you can not die", function(state)
    trainHack = state
    trainHackFunc()
end)

SectionPl:NewSlider("Speed", "changes movement speed", 30, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

SectionPl:NewSlider("jump power", "changes Jump Power", 200, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)