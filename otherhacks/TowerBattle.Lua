-------------------Variables--------------------
local autoSlingshot = false

-------------------Functions--------------------

function autoSlingshotFunc()
    spawn(function()
        while autoSlingshot do
            local args = {[1] = Vector3.new(11.848077774047852, 128.65586853027344, 151.91168212890625),[2] = Vector3.new(1.3413975238800049, 23.54580307006836, -81.6626968383789)}
            game:GetService("Players").LocalPlayer.Character.Slingshot.PelletCreateEvent:FireServer(unpack(args))
            wait(0.1)
        end
    end)
end

-------------------gui--------------------------
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("TITLE", "BloodTheme")

local Tab = Window:NewTab("TabName")

local Section = Tab:NewSection("Section Name")