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

-- Tab 생성
local MainTab = Window:CreateTab("Main", 4483362458)
-- Section 생성 (버튼이 담길 공간)
local MainSection = MainTab:CreateSection("Features")

-- FLY 버튼
MainTab:CreateButton({
   Name = "FLY (Space/Ctrl)",
   SectionParent = MainSection, -- 섹션에 확실히 포함시킴
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

-- AIMBOT 버튼
MainTab:CreateButton({
   Name = "LOCK-ON AIMBOT",
   SectionParent = MainSection,
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Main.lua"))()
   end,
})

-- ALL SKIN 버튼
MainTab:CreateButton({
   Name = "ALL SKIN",
   SectionParent = MainSection,
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/p0is0n-dev/Roblox-Inventory-Unlocker/main/main.lua"))()
   end,
})

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings", 4483362458)
SettingsTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
       Rayfield:Destroy()
   end,
})
