local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- ===== КНОПКА АКТИВАЦИИ =====
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 60)
button.Position = UDim2.new(0.5, -100, 0.5, -30)
button.Text = "АКТИВИРОВАТЬ ЧИТ"
button.Parent = gui

-- ===== БОМБА НА ГОЛОВЕ =====
local function createBomb(character)
	local head = character:WaitForChild("Head")

	local bomb = Instance.new("Part")
	bomb.Shape = Enum.PartType.Ball
	bomb.Size = Vector3.new(2,2,2)
	bomb.Color = Color3.fromRGB(0,0,0)
	bomb.Material = Enum.Material.Metal
	bomb.Anchored = false
	bomb.Parent = workspace

	bomb.CFrame = head.CFrame * CFrame.new(0, 2.5, 0)

	local weld = Instance.new("WeldConstraint")
	weld.Part0 = head
	weld.Part1 = bomb
	weld.Parent = bomb

	-- таймер текст
	local billboard = Instance.new("BillboardGui")
	billboard.Size = UDim2.new(2,0,2,0)
	billboard.StudsOffset = Vector3.new(0,2,0)
	billboard.Parent = bomb

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1,0,1,0)
	label.BackgroundTransparency = 1
	label.TextScaled = true
	label.TextColor3 = Color3.new(1,0,0)
	label.Parent = billboard

	-- ===== ТАЙМЕР =====
	for i = 10, 1, -1 do
		label.Text = tostring(i)
		task.wait(1)
	end

	-- взрыв бомбы
	local explosion = Instance.new("Explosion")
	explosion.Position = bomb.Position
	explosion.BlastRadius = 10
	explosion.BlastPressure = 500000
	explosion.Parent = workspace

	bomb:Destroy()

	-- ===== КОКОС =====
	local coconut = Instance.new("Part")
	coconut.Shape = Enum.PartType.Ball
	coconut.Size = Vector3.new(3,3,3)
	coconut.Color = Color3.fromRGB(139,69,19)
	coconut.Material = Enum.Material.Wood
	coconut.Position = character.HumanoidRootPart.Position + Vector3.new(0,5,0)
	coconut.Parent = workspace

	task.wait(1)

	local boom2 = Instance.new("Explosion")
	boom2.Position = coconut.Position
	boom2.BlastRadius = 12
	boom2.BlastPressure = 700000
	boom2.Parent = workspace

	coconut:Destroy()
end

-- ===== НАЖАТИЕ КНОПКИ =====
button.MouseButton1Click:Connect(function()
	button:Destroy()

	local character = player.Character or player.CharacterAdded:Wait()
	createBomb(character)
end)
