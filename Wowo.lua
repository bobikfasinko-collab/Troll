local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- ======================
-- ЗВУКИ
-- ======================
local function playSound(id, parent, vol)
	local s = Instance.new("Sound")
	s.SoundId = "rbxassetid://"..id
	s.Volume = vol or 1
	s.Parent = parent
	s:Play()
	game.Debris:AddItem(s, 5)
end

local DEEP = "138081500"
local AAAAA = "9118823101"

-- ======================
-- LOGIN
-- ======================
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 300, 0, 180)
loginFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
loginFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
loginFrame.Parent = gui

local passBox = Instance.new("TextBox")
passBox.Size = UDim2.new(0, 260, 0, 50)
passBox.Position = UDim2.new(0, 20, 0, 20)
passBox.PlaceholderText = "Введите пароль..."
passBox.Parent = loginFrame

local enterBtn = Instance.new("TextButton")
enterBtn.Size = UDim2.new(0, 260, 0, 50)
enterBtn.Position = UDim2.new(0, 20, 0, 90)
enterBtn.Text = "Войти"
enterBtn.Parent = loginFrame

-- ======================
-- МЕНЮ
-- ======================
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 300, 0, 260)
menu.Position = UDim2.new(0.5, -150, 0.5, -130)
menu.BackgroundColor3 = Color3.fromRGB(40,40,40)
menu.Visible = false
menu.Active = true
menu.Draggable = true
menu.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.Text = "OGURCHIK MENU"
title.Parent = menu

local function makeButton(text, y)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,0,0,50)
	b.Position = UDim2.new(0,0,0,y)
	b.Text = text
	b.Parent = menu
	return b
end

local bombBtn = makeButton("💣 БОМБА", 40)
local melonBtn = makeButton("🍉 АРБУЗ", 90)
local apocBtn = makeButton("💀 АПОКАЛИПСИС", 140)
local rocketBtn = makeButton("🚀 РАКЕТА НА ТЕБЯ", 190)

-- ======================
-- БОМБА НА ГОЛОВЕ
-- ======================
local function headBomb()
	local char = player.Character or player.CharacterAdded:Wait()
	local head = char:WaitForChild("Head")

	local bomb = Instance.new("Part")
	bomb.Shape = Enum.PartType.Ball
	bomb.Size = Vector3.new(2,2,2)
	bomb.Color = Color3.new(0,0,0)
	bomb.Parent = workspace
	bomb.CFrame = head.CFrame * CFrame.new(0,2,0)

	local weld = Instance.new("WeldConstraint")
	weld.Part0 = head
	weld.Part1 = bomb
	weld.Parent = bomb

	local bb = Instance.new("BillboardGui", bomb)
	bb.Size = UDim2.new(2,0,2,0)

	local t = Instance.new("TextLabel", bb)
	t.Size = UDim2.new(1,0,1,0)
	t.BackgroundTransparency = 1
	t.TextScaled = true
	t.TextColor3 = Color3.new(1,0,0)

	for i=10,1,-1 do
		t.Text = tostring(i)
		task.wait(1)
	end

	playSound(DEEP, bomb, 3)

	local ex = Instance.new("Explosion")
	ex.Position = bomb.Position
	ex.BlastRadius = 12
	ex.Parent = workspace

	bomb:Destroy()
end

-- ======================
-- АРБУЗ НА СПИНЕ
-- ======================
local function watermelon()
	local char = player.Character or player.CharacterAdded:Wait()
	local root = char:WaitForChild("HumanoidRootPart")

	local m = Instance.new("Part")
	m.Shape = Enum.PartType.Ball
	m.Size = Vector3.new(3,3,3)
	m.Color = Color3.fromRGB(0,255,0)
	m.Parent = workspace
	m.CFrame = root.CFrame * CFrame.new(0,0,-2)

	local w = Instance.new("WeldConstraint")
	w.Part0 = root
	w.Part1 = m
	w.Parent = m

	for i=10,1,-1 do task.wait(1) end

	playSound(AAAAA, m, 5)

	local ex = Instance.new("Explosion")
	ex.Position = m.Position
	ex.BlastRadius = 15
	ex.Parent = workspace

	m:Destroy()
end

-- ======================
-- АПОКАЛИПСИС
-- ======================
local apocalypse = false

local function startApocalypse()
	apocalypse = true
	local char = player.Character or player.CharacterAdded:Wait()
	local root = char:WaitForChild("HumanoidRootPart")

	task.spawn(function()
		while apocalypse do
			local ex = Instance.new("Explosion")
			ex.Position = root.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10))
			ex.BlastRadius = 8
			ex.Parent = workspace
			task.wait(0.4)
		end
	end)
end

-- ======================
-- РАКЕТА
-- ======================
local function rocket()
	local char = player.Character or player.CharacterAdded:Wait()
	local root = char:WaitForChild("HumanoidRootPart")

	local r = Instance.new("Part")
	r.Shape = Enum.PartType.Ball
	r.Size = Vector3.new(1,1,1)
	r.Color = Color3.fromRGB(255,0,0)
	r.Anchored = false
	r.Parent = workspace
	r.Position = root.Position + Vector3.new(0,10,0)

	task.spawn(function()
		while r and r.Parent do
			local dir = (root.Position - r.Position).Unit
			r.Velocity = dir * 80
			task.wait(0.1)
		end
	end)

	task.wait(3)

	local ex = Instance.new("Explosion")
	ex.Position = r.Position
	ex.BlastRadius = 10
	ex.Parent = workspace

	r:Destroy()
end

-- ======================
-- ЛОГИН
-- ======================
enterBtn.MouseButton1Click:Connect(function()
	if passBox.Text == "Kokos" then
		loginFrame.Visible = false
		menu.Visible = true
	else
		passBox.Text = "НЕВЕРНО"
	end
end)

-- ======================
-- КНОПКИ
-- ======================
bombBtn.MouseButton1Click:Connect(headBomb)
melonBtn.MouseButton1Click:Connect(watermelon)
apocBtn.MouseButton1Click:Connect(startApocalypse)
rocketBtn.MouseButton1Click:Connect(rocket)
