local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local tween = game:GetService("TweenService")

-- ================= OPEN BUTTON =================
local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0,150,0,55)
openBtn.Position = UDim2.new(0,10,0.5,-27)
openBtn.Text = "🍉 OGURCHIK MENU"
openBtn.Parent = gui

-- ================= PANEL =================
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0,340,0,0)
panel.Position = UDim2.new(0.5,-170,0.5,-200)
panel.Visible = false
panel.Active = true
panel.Draggable = true
panel.Parent = gui

Instance.new("UICorner", panel).CornerRadius = UDim.new(0,12)

-- 🌈 RGB ANIMATION
task.spawn(function()
	while true do
		for i = 0,1,0.01 do
			panel.BackgroundColor3 = Color3.fromHSV(i,1,1)
			task.wait(0.02)
		end
	end
end)

-- ================= SCROLL =================
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,0,1,0)
scroll.CanvasSize = UDim2.new(0,0,0,1200)
scroll.ScrollBarThickness = 6
scroll.Parent = panel

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,5)

-- ================= OPEN/CLOSE =================
local opened = false

openBtn.MouseButton1Click:Connect(function()
	opened = not opened

	if opened then
		panel.Visible = true
		tween:Create(panel, TweenInfo.new(0.35), {
			Size = UDim2.new(0,340,0,480)
		}):Play()
	else
		local t = tween:Create(panel, TweenInfo.new(0.35), {
			Size = UDim2.new(0,340,0,0)
		})
		t:Play()
		t.Completed:Wait()
		panel.Visible = false
	end
end)

-- ================= UTIL =================
local function char()
	return player.Character or player.CharacterAdded:Wait()
end

local function boom(pos, r)
	local e = Instance.new("Explosion")
	e.Position = pos
	e.BlastRadius = r
	e.Parent = workspace
end

-- ================= EFFECTS =================

local function bomb()
	local h = char():WaitForChild("Head")
	for i=10,1,-1 do task.wait(1) end
	boom(h.Position, 12)
end

local function melon()
	local r = char():WaitForChild("HumanoidRootPart")
	for i=10,1,-1 do task.wait(1) end
	boom(r.Position, 15)
end

local function apoc()
	local r = char():WaitForChild("HumanoidRootPart")
	for i=1,25 do
		boom(r.Position + Vector3.new(math.random(-25,25),0,math.random(-25,25)), 10)
		task.wait(0.2)
	end
end

local function rocket()
	local r = char():WaitForChild("HumanoidRootPart")

	local p = Instance.new("Part")
	p.Shape = Enum.PartType.Ball
	p.Size = Vector3.new(1,1,1)
	p.Position = r.Position + Vector3.new(0,10,0)
	p.Anchored = false
	p.Parent = workspace

	task.spawn(function()
		while p.Parent do
			p.Velocity = (r.Position - p.Position).Unit * 90
			task.wait(0.1)
		end
	end)

	task.wait(3)
	boom(p.Position, 10)
	p:Destroy()
end

local function void()
	local r = char():WaitForChild("HumanoidRootPart")

	local h = Instance.new("Part")
	h.Shape = Enum.PartType.Ball
	h.Size = Vector3.new(7,7,7)
	h.Material = Enum.Material.Neon
	h.Color = Color3.new(0,0,0)
	h.Anchored = true
	h.Position = r.Position + Vector3.new(0,3,0)
	h.Parent = workspace

	task.wait(3)
	boom(h.Position, 20)
	h:Destroy()
end

local function npc()
	local r = char():WaitForChild("HumanoidRootPart")

	for i=1,6 do
		local n = Instance.new("Part")
		n.Shape = Enum.PartType.Ball
		n.Size = Vector3.new(2,2,2)
		n.Color = Color3.fromRGB(0,255,0)
		n.Position = r.Position + Vector3.new(math.random(-10,10),5,math.random(-10,10))
		n.Parent = workspace

		task.spawn(function()
			for t=1,25 do
				n.Position = n.Position + (r.Position - n.Position).Unit * 0.5
				task.wait(0.1)
			end
			boom(n.Position, 8)
			n:Destroy()
		end)
	end
end

-- ⭐ ДОПОЛНИТЕЛЬНЫЕ КНОПКИ (НОВЫЕ)

local function superSpeed()
	char().Humanoid.WalkSpeed = 50
end

local function jumpBoost()
	char().Humanoid.JumpPower = 120
end

local function normal()
	local h = char().Humanoid
	h.WalkSpeed = 16
	h.JumpPower = 50
end

local function heal()
	char().Humanoid.Health = 100
end

local function fling()
	local r = char():WaitForChild("HumanoidRootPart")
	r.Velocity = Vector3.new(0,200,0)
end

local function freeze()
	char().HumanoidRootPart.Anchored = true
	task.wait(2)
	char().HumanoidRootPart.Anchored = false
end

local function rainbow()
	task.spawn(function()
		while true do
			char().Head.Color = Color3.fromHSV(tick()%1,1,1)
			task.wait(0.1)
		end
	end)
end

-- ================= BUTTON CREATOR =================
local function add(text, func)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,0,0,50)
	b.Text = text
	b.Parent = scroll

	b.MouseButton1Click:Connect(func)
end

-- ================= MAIN BUTTONS =================
add("💣 Bomb Head", bomb)
add("🍉 Watermelon", melon)
add("💀 Apocalypse", apoc)
add("🚀 Rocket", rocket)
add("🕳 Black Hole", void)
add("🧠 NPC Spawn", npc)

-- ⭐ NEW BUTTONS
add("⚡ Speed Boost", superSpeed)
add("🦘 Jump Boost", jumpBoost)
add("💚 Heal", heal)
add("🧊 Freeze", freeze)
add("🌈 Rainbow Head", rainbow)
add("🧍 Normal Mode", normal)
add("🚀 Fling Up", fling)
