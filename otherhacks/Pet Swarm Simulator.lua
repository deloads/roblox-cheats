getgenv().autoFarm = false

function autoFarmFunc()
    spawn(function()
        while autoFarm do
            wait()
        end
    end)
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("endlesmining sim", "BloodTheme")

local Tab = Window:NewTab("farming")

Section:NewToggle("auto farm", "automaticly farms gold", function(state)
    autoFarm = state
    autoFarmFunc()
end)