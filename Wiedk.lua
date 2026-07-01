local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")

-- ================= CAMERA SHAKE =================
local function shakeCamera()
	local cam = workspace.CurrentCamera
	for i = 1, 10 do
		cam.CFrame = cam.CFrame * CFrame.new(
			math.random(-1,1)*0.3,
			math.random(-1,1)*0.3,
			0
		)
		task.wait(0.03)
	end
end

-- ================= SOUND =================
local function sound(id, parent, vol)
	local s = Instance.new("Sound")
	s.SoundId = "rbxassetid://"..id
	s.Volume = vol or 1
	s.Parent = parent
	s:Play()
	game.Debris:AddItem(s, 5)
end

local DEEP = "138081500"
local AAAAA = "9118823101"

-- ================= LOGIN =================
local login = Instance.new("Frame")
login.Size = UDim2.new(0, 280, 0, 170)
login.Position = UDim2.new(0.5, -140, 0.5, -85)
login.BackgroundColor3 = Color3.fromRGB(20,20,20)
login.Parent = gui

local pass = Instance.new("TextBox")
pass.Size = UDim2.new(0, 240, 0, 50)
pass.Position = UDim2.new(0,20,0,20)
pass.PlaceholderText = "Password"
pass.Parent = login

local enter = Instance.new("TextButton")
enter.Size = UDim2.new(0,240,0,50)
enter.Position = UDim2.new(0,20,0,80)
enter.Text = "ENTER"
enter.Parent = login

-- ================= MOBILE MENU BUTTON =================
local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0,120,0,50)
openBtn.Position = UDim2.new(0,10,0.5,-25)
openBtn.Text = "MENU"
openBtn.Visible = false
openBtn.Parent = gui

-- ================= MAIN MENU =================
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 320, 0, 360)
menu.Position = UDim2.new(0.5,-160,0.5,-180)
menu.BackgroundColor3 = Color3.fromRGB(35,35,35)
menu.Visible = false
menu.Active = true
menu.Draggable = true
menu.Parent = gui

-- mobile scale feel
local corner = Instance.new("UICorner", menu)
corner.CornerRadius = UDim.new(0, 12)

local layout = Instance.new("UIListLayout", menu)
layout.Padding = UDim.new(0,6)

-- ================= EFFECTS FLAGS =================
local apocalypse = false
local godMode = false

-- ================= BUTTON CREATOR =================
local function btn(text)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,0,0,50)
	b.Text = text
	b.Parent = menu
	return b
end

local bBomb = btn("💣 Bomb Head")
local bMelon = btn("🍉 Watermelon Back")
local bApoc = btn("💀 Apocalypse")
local bRocket = btn("🚀 Rocket")
local bVoid = btn("🕳 Black Hole")
local bGod = btn("😈 Cucumber God Mode")

-- ================= BOMB =================
local function bomb()
	local head = char:WaitForChild("Head")

	local p = Instance.new("Part")
	p.Shape = Enum.PartType.Ball
	p.Size = Vector3.new(2,2,2)
	p.Parent = workspace
	p.CFrame = head.CFrame * CFrame.new(0,2,0)

	local w = Instance.new("WeldConstraint", p)
	w.Part0 = head
	w.Part1 = p

	for i=10,1,-1 do task.wait(1) end

	sound(DEEP, p, 3)
	shakeCamera()

	local ex = Instance.new("Explosion")
	ex.Position = p.Position
	ex.BlastRadius = 12
	ex.Parent = workspace

	p:Destroy()
end

-- ================= MELON =================
local function melon()
	local m = Instance.new("Part")
	m.Shape = Enum.PartType.Ball
	m.Size = Vector3.new(3,3,3)
	m.Color = Color3.fromRGB(0,255,0)
	m.Parent = workspace
	m.CFrame = root.CFrame * CFrame.new(0,0,-2)

	local w = Instance.new("WeldConstraint", m)
	w.Part0 = root
	w.Part1 = m

	for i=10,1,-1 do task.wait(1) end

	sound(AAAAA, m, 5)
	shakeCamera()

	local ex = Instance.new("Explosion")
	ex.Position = m.Position
	ex.BlastRadius = 15
	ex.Parent = workspace

	m:Destroy()
end

-- ================= APOCALYPSE =================
local function apocalypseStart()
	apocalypse = true
	task.spawn(function()
		while apocalypse do
			local ex = Instance.new("Explosion")
			ex.Position = root.Position + Vector3.new(math.random(-15,15),0,math.random(-15,15))
			ex.BlastRadius = 8
			ex.Parent = workspace
			shakeCamera()
			task.wait(0.3)
		end
	end)
end

-- ================= ROCKET =================
local function rocket()
	local r = Instance.new("Part")
	r.Shape = Enum.PartType.Ball
	r.Size = Vector3.new(1,1,1)
	r.Color = Color3.new(1,0,0)
	r.Parent = workspace
	r.Position = root.Position + Vector3.new(0,10,0)

	task.spawn(function()
		while r.Parent do
			r.Velocity = (root.Position - r.Position).Unit * 90
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

-- ================= BLACK HOLE =================
local function blackHole()
	local hole = Instance.new("Part")
	hole.Shape = Enum.PartType.Ball
	hole.Size = Vector3.new(6,6,6)
	hole.Material = Enum.Material.Neon
	hole.Color = Color3.new(0,0,0)
	hole.Anchored = true
	hole.Position = root.Position + Vector3.new(0,3,0)
	hole.Parent = workspace

	task.spawn(function()
		for i=1,20 do
			root.Velocity = (hole.Position - root.Position).Unit * 60
			task.wait(0.2)
		end
	end)

	task.wait(3)
	hole:Destroy()
end

-- ================= GOD MODE =================
local function godModeOn()
	godMode = true
	humanoid.WalkSpeed = 30
	humanoid.JumpPower = 80

	task.spawn(function()
		while godMode do
			char.Head.BrickColor = BrickColor.new("Bright green")
			task.wait(0.2)
		end
	end)
end

-- ================= LOGIN =================
enter.MouseButton1Click:Connect(function()
	if pass.Text == "Kokos" then
		login.Visible = false
		openBtn.Visible = true
	else
		pass.Text = "WRONG"
	end
end)

-- ================= MENU TOGGLE =================
openBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
end)

-- ================= CONNECT =================
bBomb.MouseButton1Click:Connect(bomb)
bMelon.MouseButton1Click:Connect(melon)
bApoc.MouseButton1Click:Connect(apocalypseStart)
bRocket.MouseButton1Click:Connect(rocket)
bVoid.MouseButton1Click:Connect(blackHole)
bGod.MouseButton1Click:Connect(godModeOn)
