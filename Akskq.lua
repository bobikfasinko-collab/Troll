-- failed to get script bytecode
-- ОБЪЕДИНЁННЫЙ СКРИПТ (Поместить в ServerScriptService)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Создаём RemoteEvent
local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "CoconutEvent"
RemoteEvent.Parent = ReplicatedStorage

-- Функция полёта
local function FlyPlayer(player)
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then return end
    
    humanoid.PlatformStand = true
    hrp.Anchored = false
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Velocity = Vector3.new(0, 20, 0)
    bodyVelocity.Parent = hrp
    
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity.Velocity = Vector3.new(0, 25, 0)
        end
    end)
    
    task.wait(10)
    if bodyVelocity then
        bodyVelocity:Destroy()
        humanoid.PlatformStand = false
        connection:Disconnect()
    end
end

-- Функция ядерной атаки
local function NuclearAttack(player)
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    hrp.Velocity = Vector3.new(0, 250, 0)
    
    task.wait(4)
    
    local explosion = Instance.new("Explosion")
    explosion.Position = hrp.Position
    explosion.BlastRadius = 20
    explosion.BlastPressure = 100000
    explosion.Parent = workspace
    
    task.wait(0.1)
    if player.Character then
        player.Character:BreakJoints()
    end
end

-- Обработка нажатий
RemoteEvent.OnServerEvent:Connect(function(player, choice)
    if choice == "fly" then
        local msg = Instance.new("Message")
        msg.Text = "а кто не любит?"
        msg.Parent = workspace
        task.wait(2)
        msg:Destroy()
        
        FlyPlayer(player)
        
    elseif choice == "nuke" then
        for i = 10, 1, -1 do
            local msg = Instance.new("Message")
            msg.Text = "ЯДЕРНАЯ АТАКА! " .. i
            msg.Parent = workspace
            task.wait(1)
            msg:Destroy()
        end
        
        NuclearAttack(player)
    end
end)

-- СОЗДАЁМ GUI ДЛЯ КАЖДОГО ИГРОКА
Players.PlayerAdded:Connect(function(player)
    local gui = Instance.new("ScreenGui")
    gui.Name = "CoconutGUI"
    gui.Parent = player.PlayerGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(50, 30, 20)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = frame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🥥 КОКОС 🥥"
    title.TextColor3 = Color3.fromRGB(255, 200, 100)
    title.TextSize = 30
    title.Font = Enum.Font.Bold
    title.Parent = frame
    
    local buttonGood = Instance.new("TextButton")
    buttonGood.Size = UDim2.new(0, 250, 0, 40)
    buttonGood.Position = UDim2.new(0.5, -125, 0, 70)
    buttonGood.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    buttonGood.Text = "🍃 Кокосы крутые!"
    buttonGood.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonGood.TextSize = 18
    buttonGood.Font = Enum.Font.Bold
    buttonGood.Parent = frame
    
    local corner2 = Instance.new("UICorner")
    corner2.CornerRadius = UDim.new(0, 10)
    corner2.Parent = buttonGood
    
    local buttonBad = Instance.new("TextButton")
    buttonBad.Size = UDim2.new(0, 250, 0, 40)
    buttonBad.Position = UDim2.new(0.5, -125, 0, 130)
    buttonBad.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    buttonBad.Text = "💩 Кокосы гавно!"
    buttonBad.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonBad.TextSize = 18
    buttonBad.Font = Enum.Font.Bold
    buttonBad.Parent = frame
    
    local corner3 = Instance.new("UICorner")
    corner3.CornerRadius = UDim.new(0, 10)
    corner3.Parent = buttonBad
    
    -- Обработка нажатий (клиентская часть)
    buttonGood.MouseButton1Click:Connect(function()
        if RemoteEvent then
            RemoteEvent:FireServer("fly")
        end
        gui:Destroy()
    end)
    
    buttonBad.MouseButton1Click:Connect(function()
        if RemoteEvent then
            RemoteEvent:FireServer("nuke")
        end
        gui:Destroy()
    end)
end)iled to get script bytecode
-- ОБЪЕДИНЁННЫЙ СКРИПТ (Поместить в ServerScriptService)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Создаём RemoteEvent
local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "CoconutEvent"
RemoteEvent.Parent = ReplicatedStorage

-- Функция полёта
local function FlyPlayer(player)
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then return end
    
    humanoid.PlatformStand = true
    hrp.Anchored = false
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Velocity = Vector3.new(0, 20, 0)
    bodyVelocity.Parent = hrp
    
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity.Velocity = Vector3.new(0, 25, 0)
        end
    end)
    
    task.wait(10)
    if bodyVelocity then
        bodyVelocity:Destroy()
        humanoid.PlatformStand = false
        connection:Disconnect()
    end
end

-- Функция ядерной атаки
local function NuclearAttack(player)
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    hrp.Velocity = Vector3.new(0, 250, 0)
    
    task.wait(4)
    
    local explosion = Instance.new("Explosion")
    explosion.Position = hrp.Position
    explosion.BlastRadius = 20
    explosion.BlastPressure = 100000
    explosion.Parent = workspace
    
    task.wait(0.1)
    if player.Character then
        player.Character:BreakJoints()
    end
end

-- Обработка нажатий
RemoteEvent.OnServerEvent:Connect(function(player, choice)
    if choice == "fly" then
        local msg = Instance.new("Message")
        msg.Text = "а кто не любит?"
        msg.Parent = workspace
        task.wait(2)
        msg:Destroy()
        
        FlyPlayer(player)
        
    elseif choice == "nuke" then
        for i = 10, 1, -1 do
            local msg = Instance.new("Message")
            msg.Text = "ЯДЕРНАЯ АТАКА! " .. i
            msg.Parent = workspace
            task.wait(1)
            msg:Destroy()
        end
        
        NuclearAttack(player)
    end
end)

-- СОЗДАЁМ GUI ДЛЯ КАЖДОГО ИГРОКА
Players.PlayerAdded:Connect(function(player)
    local gui = Instance.new("ScreenGui")
    gui.Name = "CoconutGUI"
    gui.Parent = player.PlayerGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(50, 30, 20)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = frame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🥥 КОКОС 🥥"
    title.TextColor3 = Color3.fromRGB(255, 200, 100)
    title.TextSize = 30
    title.Font = Enum.Font.Bold
    title.Parent = frame
    
    local buttonGood = Instance.new("TextButton")
    buttonGood.Size = UDim2.new(0, 250, 0, 40)
    buttonGood.Position = UDim2.new(0.5, -125, 0, 70)
    buttonGood.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    buttonGood.Text = "🍃 Кокосы крутые!"
    buttonGood.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonGood.TextSize = 18
    buttonGood.Font = Enum.Font.Bold
    buttonGood.Parent = frame
    
    local corner2 = Instance.new("UICorner")
    corner2.CornerRadius = UDim.new(0, 10)
    corner2.Parent = buttonGood
    
    local buttonBad = Instance.new("TextButton")
    buttonBad.Size = UDim2.new(0, 250, 0, 40)
    buttonBad.Position = UDim2.new(0.5, -125, 0, 130)
    buttonBad.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    buttonBad.Text = "💩 Кокосы гавно!"
    buttonBad.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonBad.TextSize = 18
    buttonBad.Font = Enum.Font.Bold
    buttonBad.Parent = frame
    
    local corner3 = Instance.new("UICorner")
    corner3.CornerRadius = UDim.new(0, 10)
    corner3.Parent = buttonBad
    
    -- Обработка нажатий (клиентская часть)
    buttonGood.MouseButton1Click:Connect(function()
        if RemoteEvent then
            RemoteEvent:FireServer("fly")
        end
        gui:Destroy()
    end)
    
    buttonBad.MouseButton1Click:Connect(function()
        if RemoteEvent then
            RemoteEvent:FireServer("nuke")
        end
        gui:Destroy()
    end)
end)iled to get script bytecode
-- ОБЪЕДИНЁННЫЙ СКРИПТ (Поместить в ServerScriptService)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Создаём RemoteEvent
local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "CoconutEvent"
RemoteEvent.Parent = ReplicatedStorage

-- Функция полёта
local function FlyPlayer(player)
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then return end
    
    humanoid.PlatformStand = true
    hrp.Anchored = false
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Velocity = Vector3.new(0, 20, 0)
    bodyVelocity.Parent = hrp
    
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity.Velocity = Vector3.new(0, 25, 0)
        end
    end)
    
    task.wait(10)
    if bodyVelocity then
        bodyVelocity:Destroy()
        humanoid.PlatformStand = false
        connection:Disconnect()
    end
end

-- Функция ядерной атаки
local function NuclearAttack(player)
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    hrp.Velocity = Vector3.new(0, 250, 0)
    
    task.wait(4)
    
    local explosion = Instance.new("Explosion")
    explosion.Position = hrp.Position
    explosion.BlastRadius = 20
    explosion.BlastPressure = 100000
    explosion.Parent = workspace
    
    task.wait(0.1)
    if player.Character then
        player.Character:BreakJoints()
    end
end

-- Обработка нажатий
RemoteEvent.OnServerEvent:Connect(function(player, choice)
    if choice == "fly" then
        local msg = Instance.new("Message")
        msg.Text = "а кто не любит?"
        msg.Parent = workspace
        task.wait(2)
        msg:Destroy()
        
        FlyPlayer(player)
        
    elseif choice == "nuke" then
        for i = 10, 1, -1 do
            local msg = Instance.new("Message")
            msg.Text = "ЯДЕРНАЯ АТАКА! " .. i
            msg.Parent = workspace
            task.wait(1)
            msg:Destroy()
        end
        
        NuclearAttack(player)
    end
end)

-- СОЗДАЁМ GUI ДЛЯ КАЖДОГО ИГРОКА
Players.PlayerAdded:Connect(function(player)
    local gui = Instance.new("ScreenGui")
    gui.Name = "CoconutGUI"
    gui.Parent = player.PlayerGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(50, 30, 20)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = frame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🥥 КОКОС 🥥"
    title.TextColor3 = Color3.fromRGB(255, 200, 100)
    title.TextSize = 30
    title.Font = Enum.Font.Bold
    title.Parent = frame
    
    local buttonGood = Instance.new("TextButton")
    buttonGood.Size = UDim2.new(0, 250, 0, 40)
    buttonGood.Position = UDim2.new(0.5, -125, 0, 70)
    buttonGood.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    buttonGood.Text = "🍃 Кокосы крутые!"
    buttonGood.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonGood.TextSize = 18
    buttonGood.Font = Enum.Font.Bold
    buttonGood.Parent = frame
    
    local corner2 = Instance.new("UICorner")
    corner2.CornerRadius = UDim.new(0, 10)
    corner2.Parent = buttonGood
    
    local buttonBad = Instance.new("TextButton")
    buttonBad.Size = UDim2.new(0, 250, 0, 40)
    buttonBad.Position = UDim2.new(0.5, -125, 0, 130)
    buttonBad.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    buttonBad.Text = "💩 Кокосы гавно!"
    buttonBad.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonBad.TextSize = 18
    buttonBad.Font = Enum.Font.Bold
    buttonBad.Parent = frame
    
    local corner3 = Instance.new("UICorner")
    corner3.CornerRadius = UDim.new(0, 10)
    corner3.Parent = buttonBad
    
    -- Обработка нажатий (клиентская часть)
    buttonGood.MouseButton1Click:Connect(function()
        if RemoteEvent then
            RemoteEvent:FireServer("fly")
        end
        gui:Destroy()
    end)
    
    buttonBad.MouseButton1Click:Connect(function()
        if RemoteEvent then
            RemoteEvent:FireServer("nuke")
        end
        gui:Destroy()
    end)
end)iled to get script bytecode
-- ОБЪЕДИНЁННЫЙ СКРИПТ (Поместить в ServerScriptService)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Создаём RemoteEvent
local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "CoconutEvent"
RemoteEvent.Parent = ReplicatedStorage

-- Функция полёта
local function FlyPlayer(player)
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then return end
    
    humanoid.PlatformStand = true
    hrp.Anchored = false
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Velocity = Vector3.new(0, 20, 0)
    bodyVelocity.Parent = hrp
    
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity.Velocity = Vector3.new(0, 25, 0)
        end
    end)
    
    task.wait(10)
    if bodyVelocity then
        bodyVelocity:Destroy()
        humanoid.PlatformStand = false
        connection:Disconnect()
    end
end

-- Функция ядерной атаки
local function NuclearAttack(player)
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    hrp.Velocity = Vector3.new(0, 250, 0)
    
    task.wait(4)
    
    local explosion = Instance.new("Explosion")
    explosion.Position = hrp.Position
    explosion.BlastRadius = 20
    explosion.BlastPressure = 100000
    explosion.Parent = workspace
    
    task.wait(0.1)
    if player.Character then
        player.Character:BreakJoints()
    end
end

-- Обработка нажатий
RemoteEvent.OnServerEvent:Connect(function(player, choice)
    if choice == "fly" then
        local msg = Instance.new("Message")
        msg.Text = "а кто не любит?"
        msg.Parent = workspace
        task.wait(2)
        msg:Destroy()
        
        FlyPlayer(player)
        
    elseif choice == "nuke" then
        for i = 10, 1, -1 do
            local msg = Instance.new("Message")
            msg.Text = "ЯДЕРНАЯ АТАКА! " .. i
            msg.Parent = workspace
            task.wait(1)
            msg:Destroy()
        end
        
        NuclearAttack(player)
    end
end)

-- СОЗДАЁМ GUI ДЛЯ КАЖДОГО ИГРОКА
Players.PlayerAdded:Connect(function(player)
    local gui = Instance.new("ScreenGui")
    gui.Name = "CoconutGUI"
    gui.Parent = player.PlayerGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(50, 30, 20)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = frame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🥥 КОКОС 🥥"
    title.TextColor3 = Color3.fromRGB(255, 200, 100)
    title.TextSize = 30
    title.Font = Enum.Font.Bold
    title.Parent = frame
    
    local buttonGood = Instance.new("TextButton")
    buttonGood.Size = UDim2.new(0, 250, 0, 40)
    buttonGood.Position = UDim2.new(0.5, -125, 0, 70)
    buttonGood.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    buttonGood.Text = "🍃 Кокосы крутые!"
    buttonGood.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonGood.TextSize = 18
    buttonGood.Font = Enum.Font.Bold
    buttonGood.Parent = frame
    
    local corner2 = Instance.new("UICorner")
    corner2.CornerRadius = UDim.new(0, 10)
    corner2.Parent = buttonGood
    
    local buttonBad = Instance.new("TextButton")
    buttonBad.Size = UDim2.new(0, 250, 0, 40)
    buttonBad.Position = UDim2.new(0.5, -125, 0, 130)
    buttonBad.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    buttonBad.Text = "💩 Кокосы гавно!"
    buttonBad.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonBad.TextSize = 18
    buttonBad.Font = Enum.Font.Bold
    buttonBad.Parent = frame
    
    local corner3 = Instance.new("UICorner")
    corner3.CornerRadius = UDim.new(0, 10)
    corner3.Parent = buttonBad
    
    -- Обработка нажатий (клиентская часть)
    buttonGood.MouseButton1Click:Connect(function()
        if RemoteEvent then
            RemoteEvent:FireServer("fly")
        end
        gui:Destroy()
    end)
    
    buttonBad.MouseButton1Click:Connect(function()
        if RemoteEvent then
            RemoteEvent:FireServer("nuke")
        end
        gui:Destroy()
    end)
end)iled to get script bytecode
-- ОБЪЕДИНЁННЫЙ СКРИПТ (Поместить в ServerScriptService)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Создаём RemoteEvent
local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "CoconutEvent"
RemoteEvent.Parent = ReplicatedStorage

-- Функция полёта
local function FlyPlayer(player)
    local character = player.Character
    if not character the
