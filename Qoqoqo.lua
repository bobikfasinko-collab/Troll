local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- ===== ОКНО ВВОДА КЛЮЧА =====
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Parent = gui

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 260, 0, 50)
textBox.Position = UDim2.new(0, 20, 0, 20)
textBox.PlaceholderText = "Введите ключ..."
textBox.Text = ""
textBox.Parent = frame

local enter = Instance.new("TextButton")
enter.Size = UDim2.new(0, 260, 0, 50)
enter.Position = UDim2.new(0, 20, 0, 80)
enter.Text = "Войти"
enter.Parent = frame

-- ===== ОСНОВНАЯ КНОПКА =====
local mainButton = Instance.new("TextButton")
mainButton.Size = UDim2.new(0, 200, 0, 60)
mainButton.Position = UDim2.new(0.5, -100, 0.5, -30)
mainButton.Text = "огурчик чегурчик"
mainButton.Visible = false
mainButton.Parent = gui

-- ===== ЭФФЕКТЫ =====
local function rainbowEffect()
	local lighting = game:GetService("Lighting")

	task.spawn(function()
		while true do
			for i = 0, 1, 0.02 do
				lighting.Ambient = Color3.fromHSV(i, 1, 1)
				lighting.OutdoorAmbient = Color3.fromHSV(i, 1, 1)
				task.wait(0.05)
			end
		end
	end)
end

local function explosion()
	local char = player.Character or player.CharacterAdded:Wait()
	local root = char:WaitForChild("HumanoidRootPart")

	local boom = Instance.new("Explosion")
	boom.Position = root.Position
	boom.BlastRadius = 10
	boom.BlastPressure = 500000
	boom.Parent = workspace
end

local function cucumberScreen()
	local cucGui = Instance.new("ScreenGui")
	cucGui.Parent = player.PlayerGui

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1,0,1,0)
	label.Text = "🥒"
	label.TextScaled = true
	label.BackgroundTransparency = 1
	label.Parent = cucGui

	task.wait(2)
	cucGui:Destroy()
end

-- ===== ПРОВЕРКА КЛЮЧА =====
enter.MouseButton1Click:Connect(function()
	if textBox.Text == "Kokos" then
		frame.Visible = false
		mainButton.Visible = true
	else
		textBox.Text = "Неверный ключ!"
	end
end)

-- ===== НАЖАТИЕ КНОПКИ =====
mainButton.MouseButton1Click:Connect(function()
	explosion()
	cucumberScreen()
	rainbowEffect()
end)
