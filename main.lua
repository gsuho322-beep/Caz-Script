if game.CoreGui:FindFirstChild("Rayfield") then
    game.CoreGui.Rayfield:Destroy()
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Caz Script Hub",
   LoadingTitle = "Caz Script",
   LoadingSubtitle = "by Rebo",
   ConfigurationSaving = {
      Enabled = false
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)
local MainSection = MainTab:CreateSection("Features")

MainTab:CreateButton({
   Name = "FLY (Space/Ctrl)",
   Callback = function()
       local LP = game.Players.LocalPlayer
       local UIS = game:GetService("UserInputService")
       local RS = game:GetService("RunService")
       local Char = LP.Character or LP.CharacterAdded:Wait()
       local Root = Char:WaitForChild("HumanoidRootPart")
       local bv = Instance.new("BodyVelocity", Root)
       local bg = Instance.new("BodyGyro", Root)
       bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
       bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
       bg.P = 9e4
       RS.RenderStepped:Connect(function()
           local Cam = workspace.CurrentCamera
           local dir = Vector3.new(0,0,0)
           if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + Cam.CFrame.LookVector end
           if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - Cam.CFrame.LookVector end
           if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - Cam.CFrame.RightVector end
           if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + Cam.CFrame.RightVector end
           if UIS:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
           if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir + Vector3.new(0,-1,0) end
           bv.Velocity = dir * 60
           bg.CFrame = Cam.CFrame
       end)
   end,
})

MainTab:CreateButton({
   Name = "LOCK-ON AIMBOT",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Main.lua"))()
   end,
})

MainTab:CreateButton({
   Name = "ALL SKIN (Universal)",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/p0is0n-dev/Roblox-Inventory-Unlocker/main/main.lua"))()
   end,
})

local SettingsTab = Window:CreateTab("Settings", 4483362458)
SettingsTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
       Rayfield:Destroy()
   end,
})
