local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Caz Script",
    LoadingTitle = "Velocity System",
    LoadingSubtitle = "by Rebo",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)

local Flying = false
local FlySpeed = 50
local p = game.Players.LocalPlayer

-- [REAL FLY]
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

        local bv = Instance.new("BodyVelocity")
        bv.Name = "CazFly"
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = root
        
        local bg = Instance.new("BodyGyro")
        bg.Name = "CazGyro"
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bg.CFrame = root.CFrame
        bg.Parent = root

        task.spawn(function()
            while Flying and char.Parent do
                local cam = workspace.CurrentCamera
                root.CFrame = CFrame.new(root.Position, root.Position + cam.CFrame.LookVector)
                bv.Velocity = char.Humanoid.MoveDirection * FlySpeed
                task.wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end,
})

-- [AIMBOT]
MainTab:CreateButton({
    Name = "AIMBOT",
    Callback = function()
        local function GetTarget()
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
            return target
        end
        local target = GetTarget()
        if target then
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Character.Head.Position)
        end
    end,
})

-- [ALL SKIN]
MainTab:CreateButton({
    Name = "ALL SKIN",
    Callback = function()
        for _, v in pairs(game:GetDescendants()) do
