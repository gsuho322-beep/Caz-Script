local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Caz Script",
    LoadingTitle = "Velocity Executor",
    LoadingSubtitle = "by Rebo",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "CazHub",
        FileName = "Config"
    },
    KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateButton({
    Name = "FLY",
    Callback = function()
        local p = game.Players.LocalPlayer
        local c = p.Character or p.CharacterAdded:Wait()
        local r = c:WaitForChild("HumanoidRootPart")
        local bv = r:FindFirstChild("CazFly")
        if not bv then
            bv = Instance.new("BodyVelocity")
            bv.Name = "CazFly"
            bv.Velocity = Vector3.new(0, 50, 0)
            bv.MaxForce = Vector3.new(0, math.huge, 0)
            bv.Parent = r
        else
            bv:Destroy()
        end
    end,
})

MainTab:CreateButton({
    Name = "AIMBOT",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local function GetT()
            local t = nil
            local d = math.huge
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= lp and v.Character and v.Character:FindFirstChild("Head") then
                    local m = (v.Character.Head.Position - lp.Character.Head.Position).Magnitude
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
