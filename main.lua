local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Caz Script",
    LoadingTitle = "Velocity System",
    LoadingSubtitle = "by Rebo",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "CazHub",
        FileName = "Config"
    },
    KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)

-- 1. REAL FLY (CFrame Version)
local Flying = false
local FlySpeed = 1.5
local p = game.Players.LocalPlayer

MainTab:CreateButton({
    Name = "REAL FLY",
    Callback = function()
        Flying = not Flying
        local char = p.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        task.spawn(function()
            while Flying do
                if not char:FindFirstChild("HumanoidRootPart") then break end
                root.CFrame = root.CFrame + (char.Humanoid.MoveDirection * FlySpeed)
                
                local bv = root:FindFirstChild("CazFloat") or Instance.new("BodyVelocity")
                bv.Name = "CazFloat"
                bv.Velocity = Vector3.new(0, 0, 0)
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bv.Parent = root
                task.wait()
            end
            if root:FindFirstChild("CazFloat") then
                root.CazFloat:Destroy()
            end
        end)
    end,
})

-- 2. ALL SKIN (Unlocker)
MainTab:CreateButton({
    Name = "ALL SKIN",
    Callback = function()
        for _, v in pairs(game:GetDescendants()) do
            if v.Name == "Unlocked" or v.Name == "Owned" then
                if v:IsA("BoolValue") then
                    v.Value = true
                end
            end
        end
    end,
})

-- 3. AIMBOT
MainTab:CreateButton({
    Name = "AIMBOT",
    Callback = function()
        local function GetT()
            local t = nil
            local d = math.huge
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= p and v.Character and v.Character:FindFirstChild("Head") then
                    local m = (v.Character.Head.Position - p.Character.Head.Position).Magnitude
                    if m < d then d = m t = v end
                end
            end
            return t
        end
        local target = GetT()
        if target then
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Character.Head.Position)
        end
    end,
})

Rayfield:LoadConfiguration()
