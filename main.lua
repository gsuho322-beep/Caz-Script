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

local Flying = false
MainTab:CreateButton({
    Name = "FLY",
    Callback = function()
        Flying = not Flying
        local p = game.Players.LocalPlayer
        local c = p.Character or p.CharacterAdded:Wait()
        local r = c:WaitForChild("HumanoidRootPart")
        
        if Flying then
            local bv = Instance.new("BodyVelocity")
            bv.Name = "CazFly"
            bv.Velocity = Vector3.new(0, 50, 0)
            bv.MaxForce = Vector3.new(0, math.huge, 0)
            bv.Parent = r
        else
            if r:FindFirstChild("CazFly") then
                r.CazFly:Destroy()
            end
        end
    end,
})

MainTab:CreateButton({
    Name = "AIMBOT",
    Callback = function()
        local Cam = workspace.CurrentCamera
        local lp = game.Players.LocalPlayer
        local function GetT()
            local t = nil
            local d = math.huge
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= lp and v.Character and v.Character:FindFirstChild("Head") then
                    local m = (v.Character.Head.Position - lp.Character.Head.Position).Magnitude
                    if m < d then
                        d = m
                        t = v
                    end
                end
            end
            return t
        end
        local target = GetT()
        if target then
            Cam.CFrame = CFrame.new(Cam.CFrame.Position, target.Character.Head.Position)
        end
    end,
})

MainTab:CreateButton({
    Name = "ALL SKIN",
    Callback = function()
        print("Caz Skin Script Injected")
    end,
})

Rayfield:LoadConfiguration()
