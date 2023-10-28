------------------LoadString--------------------
loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Main.lua"))()
getgenv().Aimbot.Settings = {
    SendNotifications = true,
    SaveSettings = false, -- Re-execute upon changing
    ReloadOnTeleport = true,
    Enabled = true,
    TeamCheck = false,
    AliveCheck = true,
    WallCheck = false, -- Laggy
    Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
    ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
    ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
    TriggerKey = "MouseButton2",
    Toggle = false,
    LockPart = "Head" -- Body part to lock on (Character part's name)
}