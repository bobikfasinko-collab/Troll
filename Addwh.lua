-- Grow a Garden 2 Visual Cheat Panel (Mobile + Delta Exploit)
-- Для телефона с Delta Exploit

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local mouse = player:GetMouse()

-- Все семена
local SEEDS = {
    "Carrot", "Strawberry", "Blueberry", "Tulip", "Tomato", "Apple",
    "Bamboo", "Corn", "Cactus", "Pineapple", "Mushroom", "Green Bean",
    "Banana", "Grape", "Coconut", "Mango", "Dragon Fruit", "Acorn",
    "Cherry", "Sunflower", "Venus Fly Trap", "Pomegranate", "Poison Apple",
    "Venom Spitter", "Moon Bloom", "Dragon's Breath", "Hypno Bloom", "Ghost Pepper"
}

-- Все питомцы
local PETS = {
    "Frog", "Bunny", "Owl", "Deer", "Turtle", "Robin",
    "Bee", "Monkey", "Golden Dragonfly", "Unicorn", "Raccoon",
    "Black Dragon", "Ice Serpent"
}

-- ===== СОЗДАНИЕ GUI =====
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DeltaCheatPanel"
screenGui.ResetOnSpawn = false
screenGui.ZIndex = 9999
screenGui.Parent = playerGui

-- Главный контейнер
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Панель чита
local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.Size = UDim2.new(0.9, 0, 0.8, 0)
panel.Position = UDim2.new(0.05, 0, 0.1, 0)
panel.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
panel.BorderSizePixel = 0
panel.Parent = mainFrame

local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 15)
panelCorner.Parent = panel

-- Заголовок
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 60)
header.BackgroundColor3 = Color3.fromRGB(30, 150, 60)
header.BorderSizePixel = 0
header.Parent = panel

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 15)
headerCorner.Parent = header

-- Название
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0.8, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "🌱 DELTA CHEAT GARDEN 2"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.Parent = header

-- Кнопка закрытия
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0.2, 0, 1, 0)
closeBtn.Position = UDim2.new(0.8, 0, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "✕"
closeBtn.TextSize = 24
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = header

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0, 10)
closeBtnCorner.Parent = closeBtn

-- Контент панели
local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, 0, 1, -60)
content.Position = UDim2.new(0, 0, 0, 60)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.Parent = panel

-- ScrollingFrame для семян
local seedsLabel = Instance.new("TextLabel")
seedsLabel.Name = "SeedsLabel"
seedsLabel.Size = UDim2.new(1, 0, 0, 40)
seedsLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
seedsLabel.TextColor3 = Color3.fromRGB(100, 200, 100)
seedsLabel.Text = "📚 СЕМЕНА"
seedsLabel.TextSize = 16
seedsLabel.Font = Enum.Font.GothamBold
seedsLabel.BorderSizePixel = 0
seedsLabel.Parent = content

local seedsScroll = Instance.new("ScrollingFrame")
seedsScroll.Name = "SeedsScroll"
seedsScroll.Size = UDim2.new(1, 0, 0.45, -40)
seedsScroll.Position = UDim2.new(0, 0, 0, 40)
seedsScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
seedsScroll.BorderSizePixel = 0
seedsScroll.ScrollBarThickness = 4
seedsScroll.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 100)
seedsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
seedsScroll.Parent = content

local seedsLayout = Instance.new("UIGridLayout")
seedsLayout.CellSize = UDim2.new(0.25, -5, 0, 45)
seedsLayout.CellPadding = UDim2.new(0, 5, 0, 5)
seedsLayout.Parent = seedsScroll

-- Создаём кнопки семян
for i, seedName in ipairs(SEEDS) do
    local btn = Instance.new("TextButton")
    btn.Name = seedName
    btn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = seedName
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.Parent = seedsScroll
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
        task.wait(0.15)
        btn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
        print("✅ Получено семя: " .. seedName)
    end)
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(80, 150, 80)
    end)
    
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
    end)
end

seedsScroll.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#SEEDS / 4) * 50)

-- Label для питомцев
local petsLabel = Instance.new("TextLabel")
petsLabel.Name = "PetsLabel"
petsLabel.Size = UDim2.new(1, 0, 0, 40)
petsLabel.Position = UDim2.new(0, 0, 0.45, 0)
petsLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
petsLabel.TextColor3 = Color3.fromRGB(100, 150, 255)
petsLabel.Text = "🐾 ПИТОМЦЫ"
petsLabel.TextSize = 16
petsLabel.Font = Enum.Font.GothamBold
petsLabel.BorderSizePixel = 0
petsLabel.Parent = content

-- ScrollingFrame для питомцев
local petsScroll = Instance.new("ScrollingFrame")
petsScroll.Name = "PetsScroll"
petsScroll.Size = UDim2.new(1, 0, 0.55, -40)
petsScroll.Position = UDim2.new(0, 0, 0.45, 40)
petsScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
petsScroll.BorderSizePixel = 0
petsScroll.ScrollBarThickness = 4
petsScroll.ScrollBarImageColor3 = Color3.fromRGB(100, 150, 255)
petsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
petsScroll.Parent = content

local petsLayout = Instance.new("UIGridLayout")
petsLayout.CellSize = UDim2.new(0.25, -5, 0, 45)
petsLayout.CellPadding = UDim2.new(0, 5, 0, 5)
petsLayout.Parent = petsScroll

-- Создаём кнопки питомцев
for i, petName in ipairs(PETS) do
    local btn = Instance.new("TextButton")
    btn.Name = petName
    btn.BackgroundColor3 = Color3.fromRGB(60, 100, 150)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = petName
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.Parent = petsScroll
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
        task.wait(0.15)
        btn.BackgroundColor3 = Color3.fromRGB(60, 100, 150)
        print("✅ Получен питомец: " .. petName)
    end)
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(80, 130, 180)
    end)
    
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(60, 100, 150)
    end)
end

petsScroll.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#PETS / 4) * 50)

-- ===== УПРАВЛЕНИЕ ПАНЕЛЬЮ =====
local panelVisible = false

-- Закрытие панели
closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    panelVisible = false
end)

-- Закрытие при клике на фон
mainFrame.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Touch then
        if panelVisible and input.Position.X < panel.AbsolutePosition.X or input.Position.X > panel.AbsolutePosition.X + panel.AbsoluteSize.X then
            mainFrame.Visible = false
            panelVisible = false
        end
    end
end)

-- Горячая клавиша (V) для открыть/закрыть
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.V then
        panelVisible = not panelVisible
        mainFrame.Visible = panelVisible
    end
end)

print("✅ Delta Cheat Panel загружена!")
print("📱 Нажми V чтобы открыть/закрыть панель")
