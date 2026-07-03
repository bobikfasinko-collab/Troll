-- Grow a Garden 2 Visual Cheat Panel
-- Только визуально, никто кроме тебя не видит!

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Все семена из игры
local SEEDS = {
    "Carrot", "Strawberry", "Blueberry", "Tulip", "Tomato", "Apple",
    "Bamboo", "Corn", "Cactus", "Pineapple", "Mushroom", "Green Bean",
    "Banana", "Grape", "Coconut", "Mango", "Dragon Fruit", "Acorn",
    "Cherry", "Sunflower", "Venus Fly Trap", "Pomegranate", "Poison Apple",
    "Venom Spitter", "Moon Bloom", "Dragon's Breath", "Hypno Bloom", "Ghost Pepper"
}

-- Все питомцы из игры
local PETS = {
    "Frog", "Bunny", "Owl", "Deer", "Turtle", "Robin",
    "Bee", "Monkey", "Golden Dragonfly", "Unicorn", "Raccoon",
    "Black Dragon", "Ice Serpent"
}

-- ===== СОЗДАНИЕ ГЛАВНОЙ ПАНЕЛИ =====
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CheatPanel"
screenGui.ResetOnSpawn = false
screenGui.ZIndex = 999
screenGui.Parent = playerGui

-- Основной контейнер
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 600)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Добавляем скругление углов
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Заголовок панели
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(30, 150, 60)
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

-- Заголовок текст
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🌱 GROW GARDEN 2 CHEAT"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = header

-- Кнопка закрытия панели
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 45, 1, 0)
closeBtn.Position = UDim2.new(1, -45, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "✕"
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = header

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0, 8)
closeBtnCorner.Parent = closeBtn

-- ScrollingFrame для семян
local seedsLabel = Instance.new("TextLabel")
seedsLabel.Name = "SeedsLabel"
seedsLabel.Size = UDim2.new(1, 0, 0, 30)
seedsLabel.Position = UDim2.new(0, 0, 0, 50)
seedsLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
seedsLabel.TextColor3 = Color3.fromRGB(100, 200, 100)
seedsLabel.Text = "📚 СЕМЕНА"
seedsLabel.TextSize = 14
seedsLabel.Font = Enum.Font.GothamBold
seedsLabel.BorderSizePixel = 0
seedsLabel.Parent = mainFrame

local seedsScroll = Instance.new("ScrollingFrame")
seedsScroll.Name = "SeedsScroll"
seedsScroll.Size = UDim2.new(1, 0, 0, 180)
seedsScroll.Position = UDim2.new(0, 0, 0, 80)
seedsScroll.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
seedsScroll.BorderSizePixel = 0
seedsScroll.ScrollBarThickness = 6
seedsScroll.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 100)
seedsScroll.Parent = mainFrame

local seedsLayout = Instance.new("UIGridLayout")
seedsLayout.CellSize = UDim2.new(0, 90, 0, 40)
seedsLayout.CellPadding = UDim2.new(0, 5, 0, 5)
seedsLayout.Parent = seedsScroll

-- Добавляем кнопки семян
for _, seedName in ipairs(SEEDS) do
    local seedBtn = Instance.new("TextButton")
    seedBtn.Name = seedName .. "Btn"
    seedBtn.Size = UDim2.new(0, 85, 0, 35)
    seedBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
    seedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    seedBtn.Text = seedName
    seedBtn.TextSize = 11
    seedBtn.Font = Enum.Font.GothamBold
    seedBtn.BorderSizePixel = 0
    seedBtn.Parent = seedsScroll
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = seedBtn
    
    -- Эффект при нажатии
    seedBtn.MouseButton1Click:Connect(function()
        seedBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
        task.wait(0.2)
        seedBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
        print("✅ Добавлено семя: " .. seedName)
    end)
    
    -- Эффект наведения
    seedBtn.MouseEnter:Connect(function()
        seedBtn.BackgroundColor3 = Color3.fromRGB(80, 150, 80)
    end)
    
    seedBtn.MouseLeave:Connect(function()
        seedBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
    end)
end

-- Обновляем высоту ScrollingFrame
seedsScroll.CanvasSize = UDim2.new(0, 0, 0, (#SEEDS / 4) * 45 + 20)

-- Лейбл питомцев
local petsLabel = Instance.new("TextLabel")
petsLabel.Name = "PetsLabel"
petsLabel.Size = UDim2.new(1, 0, 0, 30)
petsLabel.Position = UDim2.new(0, 0, 0, 260)
petsLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
petsLabel.TextColor3 = Color3.fromRGB(100, 150, 255)
petsLabel.Text = "🐾 ПИТОМЦЫ"
petsLabel.TextSize = 14
petsLabel.Font = Enum.Font.GothamBold
petsLabel.BorderSizePixel = 0
petsLabel.Parent = mainFrame

local petsScroll = Instance.new("ScrollingFrame")
petsScroll.Name = "PetsScroll"
petsScroll.Size = UDim2.new(1, 0, 0, 200)
petsScroll.Position = UDim2.new(0, 0, 0, 290)
petsScroll.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
petsScroll.BorderSizePixel = 0
petsScroll.ScrollBarThickness = 6
petsScroll.ScrollBarImageColor3 = Color3.fromRGB(100, 150, 255)
petsScroll.Parent = mainFrame

local petsLayout = Instance.new("UIGridLayout")
petsLayout.CellSize = UDim2.new(0, 90, 0, 40)
petsLayout.CellPadding = UDim2.new(0, 5, 0, 5)
petsLayout.Parent = petsScroll

-- Добавляем кнопки питомцев
for _, petName in ipairs(PETS) do
    local petBtn = Instance.new("TextButton")
    petBtn.Name = petName .. "Btn"
    petBtn.Size = UDim2.new(0, 85, 0, 35)
    petBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 150)
    petBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    petBtn.Text = petName
    petBtn.TextSize = 11
    petBtn.Font = Enum.Font.GothamBold
    petBtn.BorderSizePixel = 0
    petBtn.Parent = petsScroll
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = petBtn
    
    -- Эффект при нажатии
    petBtn.MouseButton1Click:Connect(function()
        petBtn.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
        task.wait(0.2)
        petBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 150)
        print("✅ Добавлен питомец: " .. petName)
    end)
    
    -- Эффект наведения
    petBtn.MouseEnter:Connect(function()
        petBtn.BackgroundColor3 = Color3.fromRGB(80, 130, 180)
    end)
    
    petBtn.MouseLeave:Connect(function()
        petBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 150)
    end)
end

-- Обновляем высоту ScrollingFrame питомцев
petsScroll.CanvasSize = UDim2.new(0, 0, 0, (#PETS / 4) * 45 + 20)

-- ===== УПРАВЛЕНИЕ ПАНЕЛЬЮ (Открыть/Закрыть) =====
local panelOpen = true

-- Кнопка закрытия
closeBtn.MouseButton1Click:Connect(function()
    mainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true)
    panelOpen = false
    task.wait(0.3)
    mainFrame.Visible = false
end)

-- Горячая клавиша для открыения/закрытия (Insert)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Insert then
        if panelOpen then
            mainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true)
            panelOpen = false
            task.wait(0.3)
            mainFrame.Visible = false
        else
            mainFrame.Visible = true
            mainFrame:TweenSize(UDim2.new(0, 400, 0, 600), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true)
            panelOpen = true
        end
    end
end)

print("✅ Cheat Panel загружена! Нажми INSERT чтобы открыть/закрыть панель.")
