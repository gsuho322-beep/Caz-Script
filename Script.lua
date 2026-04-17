local LMG2L = {};
local player = game:GetService("Players").LocalPlayer
local RS = game:GetService("ReplicatedStorage")

LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

LMG2L["Frame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["Frame_2"]["BorderSizePixel"] = 3;
LMG2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["Frame_2"]["Size"] = UDim2.new(0, 380, 0, 304);
LMG2L["Frame_2"]["Position"] = UDim2.new(0, 176, 0, 10);
LMG2L["Frame_2"]["BorderColor3"] = Color3.fromRGB(255, 38, 232);
LMG2L["Frame_2"].Active = true; LMG2L["Frame_2"].Draggable = true;

LMG2L["TextLabel_3"] = Instance.new("TextLabel", LMG2L["Frame_2"]);
LMG2L["TextLabel_3"]["BorderSizePixel"] = 3;
LMG2L["TextLabel_3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextLabel_3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel_3"]["Size"] = UDim2.new(0, 380, 0, 62);
LMG2L["TextLabel_3"]["BorderColor3"] = Color3.fromRGB(255, 38, 232);
LMG2L["TextLabel_3"]["Text"] = [[8x6x0gui ultimate f3x reborn by 8x8x6x6x0]];

local function getf3x()
    local char = player.Character
    local backpack = player.Backpack
    for _, v in ipairs(backpack:GetChildren()) do if v:FindFirstChild("SyncAPI") then return v end end
    for _, v in ipairs(char:GetChildren()) do if v:FindFirstChild("SyncAPI") then return v end end
    return nil
end

local function hd(cmd)
    local sig = RS:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    sig:InvokeServer(cmd)
end

LMG2L["TextButton_4"] = Instance.new("TextButton", LMG2L["TextLabel_3"]);
LMG2L["TextButton_4"]["Size"] = UDim2.new(0, 54, 0, 50);
LMG2L["TextButton_4"]["Position"] = UDim2.new(0, 2, 0, 64);
LMG2L["TextButton_4"]["Text"] = [[r6]];
LMG2L["TextButton_4"].MouseButton1Click:Connect(function() hd(";r6 me") end)

LMG2L["TextButton_6"] = Instance.new("TextButton", LMG2L["TextButton_4"]);
LMG2L["TextButton_6"]["Size"] = UDim2.new(0, 54, 0, 50);
LMG2L["TextButton_6"]["Position"] = UDim2.new(0, 322, 0, 0);
LMG2L["TextButton_6"]["Text"] = [[Re]];
LMG2L["TextButton_6"].MouseButton1Click:Connect(function() hd(";re me") end)

LMG2L["TextButton_8"] = Instance.new("TextButton", LMG2L["TextButton_6"]);
LMG2L["TextButton_8"]["Size"] = UDim2.new(0, 324, 0, 42);
LMG2L["TextButton_8"]["Position"] = UDim2.new(0, -296, 0, 196);
LMG2L["TextButton_8"]["Text"] = [[Realm (for emergency)]];
LMG2L["TextButton_8"].MouseButton1Click:Connect(function()
    hd(";btools me ;fogcolor black ;punish all")
    task.wait(0.5)
    local f3x = getf3x()
    if not f3x then return end
    local endpoint = f3x.SyncAPI.ServerEndpoint

    local function resize(p, s, c) endpoint:InvokeServer("SyncResize", {{["Part"] = p, ["CFrame"] = c, ["Size"] = s}}) end
    local function color(p, c) endpoint:InvokeServer("SyncColor", {{["Part"] = p, ["Color"] = c, ["UnionColoring"] = false}}) end
    local function material(p, m) endpoint:InvokeServer("SyncMaterial", {{["Part"] = p, ["Material"] = m}}) end
    local function trans(p, t) endpoint:InvokeServer("SyncMaterial", {{["Part"] = p, ["Transparency"] = t}}) end
    local function lock(p, b) endpoint:InvokeServer("SetLocked", {p}, b) end
    local function collide(p, b) endpoint:InvokeServer("SyncCollision", {{["Part"] = p, ["CanCollide"] = b}}) end
    local function decal(p, id, s) 
        endpoint:InvokeServer("CreateTextures", {{["Part"] = p, ["Face"] = s, ["TextureType"] = "Decal"}})
        endpoint:InvokeServer("SyncTexture", {{["Part"] = p, ["Face"] = s, ["TextureType"] = "Decal", ["Texture"] = "rbxassetid://"..id}})
    end

    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("UnionOperation") then
            if not v:IsDescendantOf(player.Character) then
                task.spawn(function() endpoint:InvokeServer("Remove", {v}) end)
            end
        end
    end

    local basePos = CFrame.new(0, 5, 0)
    local base = endpoint:InvokeServer("CreatePart", "Normal", basePos, workspace)
    resize(base, Vector3.new(512, 16, 512), basePos)
    material(base, Enum.Material.Concrete)
    color(base, Color3.new(0.513725, 0.513725, 0.513725))
    lock(base, true)

    local spawnPos = CFrame.new(34.5, 8.1, -26)
    local spw = endpoint:InvokeServer("CreatePart", "Spawn", spawnPos, workspace)
    resize(spw, Vector3.new(20, 10, 20), spawnPos)
    lock(spw, true)
    decal(spw, "122316428447560", Enum.NormalId.Top)
    trans(spw, 1)

    local sky = endpoint:InvokeServer("CreatePart", "Normal", basePos, workspace)
    endpoint:InvokeServer("CreateMeshes", {{["Part"] = sky}})
    endpoint:InvokeServer("SyncMesh", {{["Part"] = sky, ["MeshId"] = "rbxassetid://111891702759441", ["TextureId"] = "rbxassetid://134032086027559", ["Scale"] = Vector3.new(99999, 99999, 99999)}})
    collide(sky, false)
    lock(sky, true)

    local rPos = CFrame.new(74.143, 24, -25.232)
    local rules = endpoint:InvokeServer("CreatePart", "Normal", rPos, workspace)
    collide(rules, false)
    decal(rules, "134032086027559", Enum.NormalId.Left)
    resize(rules, Vector3.new(4, 23, 37), rPos)

    local bPos = CFrame.new(1.143, 24, -25.232)
    local bad = endpoint:InvokeServer("CreatePart", "Normal", bPos, workspace)
    trans(bad, 1)
    collide(bad, false)
    decal(bad, "75444637376896", Enum.NormalId.Right)
    resize(bad, Vector3.new(4, 23, 37), bPos)

    hd(";res all ;r6 all ;time 14 ;music 134032086027559 ;volume inf ;pitch 0.99")
end)

LMG2L["TextButton_a"] = Instance.new("TextButton", LMG2L["TextButton_8"]);
LMG2L["TextButton_a"]["Size"] = UDim2.new(0, 76, 0, 46);
LMG2L["TextButton_a"]["Position"] = UDim2.new(0, 110, 0, -130);
LMG2L["TextButton_a"]["Text"] = [[decal spam]];
LMG2L["TextButton_a"].MouseButton1Click:Connect(function()
    local f3x = getf3x()
    if not f3x then return end
    local endpoint = f3x.SyncAPI.ServerEndpoint
    local id = "88176589493298"
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            task.spawn(function()
                endpoint:InvokeServer("SetLocked", {v}, false)
                for _, f in pairs({Enum.NormalId.Front, Enum.NormalId.Back, Enum.NormalId.Right, Enum.NormalId.Left, Enum.NormalId.Bottom, Enum.NormalId.Top}) do
                    endpoint:InvokeServer("CreateTextures", {{["Part"] = v, ["Face"] = f, ["TextureType"] = "Decal"}})
                    endpoint:InvokeServer("SyncTexture", {{["Part"] = v, ["Face"] = f, ["TextureType"] = "Decal", ["Texture"] = "rbxassetid://"..id}})
                end
            end)
        end
    end
end)

LMG2L["TextButton_c"] = Instance.new("TextButton", LMG2L["TextButton_a"]);
LMG2L["TextButton_c"]["Size"] = UDim2.new(0, 76, 0, 46);
LMG2L["TextButton_c"]["Position"] = UDim2.new(0, -112, 0, 2);
LMG2L["TextButton_c"]["Text"] = [[Skybox]];
LMG2L["TextButton_c"].MouseButton1Click:Connect(function()
    local f3x = getf3x()
    if not f3x then return end
    local endpoint = f3x.SyncAPI.ServerEndpoint
    local sky = endpoint:InvokeServer("CreatePart", "Normal", player.Character.HumanoidRootPart.CFrame, workspace)
    endpoint:InvokeServer("CreateMeshes", {{["Part"] = sky}})
    endpoint:InvokeServer("SyncMesh", {{["Part"] = sky, ["MeshId"] = "rbxassetid://111891702759441", ["TextureId"] = "rbxassetid://88176589493298", ["Scale"] = Vector3.new(7200, 7200, 7200)}})
    endpoint:InvokeServer("SyncCollision", {{["Part"] = sky, ["CanCollide"] = false}})
end)

LMG2L["TextButton_e"] = Instance.new("TextButton", LMG2L["TextButton_c"]);
LMG2L["TextButton_e"]["Size"] = UDim2.new(0, 50, 0, 46);
LMG2L["TextButton_e"]["Position"] = UDim2.new(0, 372, 0, -76);
LMG2L["TextButton_e"]["Text"] = [[hint]];
LMG2L["TextButton_e"].MouseButton1Click:Connect(function() hd(";sh 8x8x6x6x0 was here!") end)

LMG2L["TextButton_10"] = Instance.new("TextButton", LMG2L["TextButton_e"]);
LMG2L["TextButton_10"]["Size"] = UDim2.new(0, 50, 0, 46);
LMG2L["TextButton_10"]["Position"] = UDim2.new(0, 0, 0, 62);
LMG2L["TextButton_10"]["Text"] = [[Message]];
LMG2L["TextButton_10"].MouseButton1Click:Connect(function() hd(";sm 8x8x6x6x0 was here!") end)

LMG2L["TextButton_12"] = Instance.new("TextButton", LMG2L["TextButton_10"]);
LMG2L["TextButton_12"]["Size"] = UDim2.new(0, 78, 0, 46);
LMG2L["TextButton_12"]["Position"] = UDim2.new(0, -146, 0, 12);
LMG2L["TextButton_12"]["Text"] = [[unanchor]];
LMG2L["TextButton_12"].MouseButton1Click:Connect(function()
    local f3x = getf3x()
    if not f3x then return end
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("UnionOperation") then
            task.spawn(function() f3x.SyncAPI.ServerEndpoint:InvokeServer("SyncAnchor", {{["Part"] = v, ["Anchored"] = false}}) end)
        end
    end
end)

LMG2L["TextButton_14"] = Instance.new("TextButton", LMG2L["TextButton_12"]);
LMG2L["TextButton_14"]["Size"] = UDim2.new(0, 78, 0, 46);
LMG2L["TextButton_14"]["Position"] = UDim2.new(0, -226, 0, 64);
LMG2L["TextButton_14"]["Text"] = [[skeletons skybox]];
LMG2L["TextButton_14"].MouseButton1Click:Connect(function()
    local f3x = getf3x()
    if not f3x then return end
    local sky = f3x.SyncAPI.ServerEndpoint:InvokeServer("CreatePart", "Normal", player.Character.HumanoidRootPart.CFrame, workspace)
    f3x.SyncAPI.ServerEndpoint:InvokeServer("CreateMeshes", {{["Part"] = sky}})
    f3x.SyncAPI.ServerEndpoint:InvokeServer("SyncMesh", {{["Part"] = sky, ["MeshId"] = "rbxassetid://111891702759441", ["Scale"] = Vector3.new(8000, 8000, 8000)}})
end)

LMG2L["TextButton_16"] = Instance.new("TextButton", LMG2L["TextButton_14"]);
LMG2L["TextButton_16"]["Size"] = UDim2.new(0, 78, 0, 46);
LMG2L["TextButton_16"]["Position"] = UDim2.new(0, 114, 0, 2);
LMG2L["TextButton_16"]["Text"] = [[kill others]];
LMG2L["TextButton_16"].MouseButton1Click:Connect(function() hd(";kill others") end)

LMG2L["TextButton_18"] = Instance.new("TextButton", LMG2L["TextButton_16"]);
LMG2L["TextButton_18"]["Size"] = UDim2.new(0, 50, 0, 50);
LMG2L["TextButton_18"]["Position"] = UDim2.new(0, -202, 0, -138);
LMG2L["TextButton_18"]["Text"] = [[theme]];
LMG2L["TextButton_18"].MouseButton1Click:Connect(function() hd(";music 139874564810808 ;volume inf") end)

LMG2L["TextButton_1a"] = Instance.new("TextButton", LMG2L["TextButton_18"]);
LMG2L["TextButton_1a"]["Size"] = UDim2.new(0, 52, 0, 46);
LMG2L["TextButton_1a"]["Position"] = UDim2.new(0, 0, 0, 64);
LMG2L["TextButton_1a"]["Text"] = [[untheme]];
LMG2L["TextButton_1a"].MouseButton1Click:Connect(function() hd(";unmusic") end)

LMG2L["TextButton_1c"] = Instance.new("TextButton", LMG2L["TextButton_1a"]);
LMG2L["TextButton_1c"]["Size"] = UDim2.new(0, 76, 0, 44);
LMG2L["TextButton_1c"]["Position"] = UDim2.new(0, 314, 0, 76);
LMG2L["TextButton_1c"]["Text"] = [[bring all]];
LMG2L["TextButton_1c"].MouseButton1Click:Connect(function() hd(";bring all") end)

LMG2L["TextButton_1e"] = Instance.new("TextButton", LMG2L["TextButton_1c"]);
LMG2L["TextButton_1e"]["Size"] = UDim2.new(0, 50, 0, 44);
LMG2L["TextButton_1e"]["Position"] = UDim2.new(0, -312, 0, -14);
LMG2L["TextButton_1e"]["Text"] = [[btools]];
LMG2L["TextButton_1e"].MouseButton1Click:Connect(function() hd(";btools me") end)

LMG2L["TextButton_20"] = Instance.new("TextButton", LMG2L["TextButton_1e"]);
LMG2L["TextButton_20"]["Size"] = UDim2.new(0, 50, 0, 44);
LMG2L["TextButton_20"]["Position"] = UDim2.new(0, 460, 0, -4);
LMG2L["TextButton_20"]["Text"] = [[disco]];
LMG2L["TextButton_20"].MouseButton1Click:Connect(function() hd(";disco") end)

for _, v in pairs(LMG2L["Frame_2"]:GetDescendants()) do
    if v:IsA("TextButton") then
        v.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        v.TextColor3 = Color3.fromRGB(255, 255, 255)
        v.BorderColor3 = Color3.fromRGB(255, 38, 232)
        v.BorderSizePixel = 3
    end
end

return LMG2L["ScreenGui_1"]



      
