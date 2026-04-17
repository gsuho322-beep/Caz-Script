local player = game.Players.LocalPlayer 
local debounce = false 

local function jump()
    if not debounce then 
        debounce = true 
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) 
        wait(0.5) -- 
        debounce = false 
    end
end

-- 
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then -- 
        jump()
    end
end)
