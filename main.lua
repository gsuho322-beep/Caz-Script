local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Caz Script",
   LoadingTitle = "Velocity System",
   LoadingSubtitle = "by Rebo",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)

local p = game.Players.LocalPlayer
local Flying = false

MainTab:CreateButton({
   Name = "REAL FLY",
   Callback = function()
      if Flying then 
         Flying = false 
         return 
      end
      Flying = true
      local char = p.Character
      local root = char and char:FindFirstChild("HumanoidRootPart")
      if not root then return end
      local bv = Instance.new("BodyVelocity", root)
      bv.Name = "CazFly"
      bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
      bv.Velocity = Vector3.new(0,0,0)
      local bg = Instance.new("BodyGyro", root)
      bg.Name = "CazGyro"
      bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
      bg.CFrame = root.CFrame
      task.spawn(function()
         while Flying and char.Parent do
            local cam = workspace.CurrentCamera
            root.CFrame = CFrame.new(root.Position, root.Position + cam.CFrame.LookVector)
            bv.Velocity = char.Humanoid.MoveDirection * 50
            task.wait()
         end
         if bv then bv:Destroy() end
         if bg then bg:Destroy() end
      end)
   end,
})

MainTab:CreateButton({
   Name = "AIMBOT",
   Callback = function()
      local target = nil
      local dist = math.huge
      for _, v in pairs(game.Players:GetPlayers()) do
         if v ~= p and v.Character and v.Character:FindFirstChild("Head") then
            local m = (v.Character.Head.Position - p.Character.Head.Position).Magnitude
            if m < dist then
               dist = m
               target = v
            end
         end
      end
      if target then
         workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Character.Head.Position)
      end
   end,
})

MainTab:CreateButton({
   Name = "ALL SKIN",
   Callback = function()
      for _, v in pairs(game:GetDescendants()) do
         if v:IsA("BoolValue") and (v.Name:lower():find("own") or v.Name:lower():find("unlock") or v.Name:lower():find("skin")) then
            v.Value = true
         end
      end
   end,
})

Rayfield:LoadConfiguration()
