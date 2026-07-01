local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local tween = game:GetService("TweenService")

-- ================= OPEN BUTTON =================
local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0,140,0,55)
openBtn.Position = UDim2.new(0,10,0.5,-27)
openBtn.Text = "🍉 OGURCHIK"
openBtn.Parent = gui

-- ================= PANEL =================
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0,320,0,0)
panel.Position = UDim2.new(0.5,-160,0.5,-200)
panel.Visible = false
panel.Active = true
panel.Draggable = true
panel.Parent = gui

Instance.new("UICorner", panel).CornerRadius = UDim.new(0,12)

-- 🌈 RGB
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
scroll.CanvasSize = UDim2.new(0,0,0,800)
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
			Size = UDim2.new(0,320,0,420)
		}):Play()
	else
		local t = tween:Create(panel, TweenInfo.new(0.35), {
			Size = UDim2.new(0,320,0,0)
		})
		t:Play()
		t.Completed:Wait()
		panel.Visible = false
	end
end)

-- ================= EFFECTS (LOCAL ONLY) =================
local function getChar()
	return player.Character or player.CharacterAdded:Wait()
end

local function boom(pos, radius)
	local ex = Instance.new("Explosion")
	ex.Position = pos
	ex.BlastRadius = radius
	ex.Parent = workspace
end

-- 💣 BOMB
local function bomb()
	local char = getChar()
	local head = char:WaitForChild("Head")

	for i = 10,1,-1 do task.wait(1) end
	boom(head.Position, 12)
end

-- 🍉 MELON
local function melon()
	local char = getChar()
	local root = char:WaitForChild("HumanoidRootPart")

	for i = 10,1,-1 do task.wait(1) end
	boom(root.Position, 15)
end

-- 💀 APOC
local function apoc()
	local char = getChar()
	local root = char:WaitForChild("HumanoidRootPart")

	for i = 1,20 do
		boom(root.Position + Vector3.new(math.random(-20,20),0,math.random(-20,20)), 10)
		task.wait(0.25)
	end
end

-- 🚀 ROCKET
local function rocket()
	local char = getChar()
	local root = char:WaitForChild("HumanoidRootPart")

	local r = Instance.new("Part")
	r.Shape = Enum.PartType.Ball
	r.Size = Vector3.new(1,1,1)
	r.Position = root.Position + Vector3.new(0,10,0)
	r.Anchored = false
	r.Parent = workspace

	task.spawn(function()
		while r.Parent do
			r.Velocity = (root.Position - r.Position).Unit * 90
			task.wait(0.1)
		end
	end)

	task.wait(3)
	boom(r.Position, 10)
	r:Destroy()
end

-- 🕳 VOID
local function void()
	local char = getChar()
	local root = char:WaitForChild("HumanoidRootPart")

	local h = Instance.new("Part")
	h.Shape = Enum.PartType.Ball
	h.Size = Vector3.new(7,7,7)
	h.Material = Enum.Material.Neon
	h.Color = Color3.new(0,0,0)
	h.Anchored = true
	h.Position = root.Position + Vector3.new(0,3,0)
	h.Parent = workspace

	task.wait(3)
	boom(h.Position, 20)
	h:Destroy()
end

-- 🧠 NPC
local function npc()
	local char = getChar()
	local root = char:WaitForChild("HumanoidRootPart")

	for i = 1,5 do
		local n = Instance.new("Part")
		n.Shape = Enum.PartType.Ball
		n.Size = Vector3.new(2,2,2)
		n.Color = Color3.fromRGB(0,255,0)
		n.Position = root.Position + Vector3.new(math.random(-10,10),5,math.random(-10,10))
		n.Parent = workspace

		task.spawn(function()
			for t = 1,25 do
				n.Position = n.Position + (root.Position - n.Position).Unit * 0.5
				task.wait(0.1)
			end
			boom(n.Position, 8)
			n:Destroy()
		end)
	end
end

-- ================= BUTTONS =================
local function make(text, func)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,0,0,55)
	b.Text = text
	b.Parent = scroll

	b.MouseButton1Click:Connect(func)
end

make("💣 Bomb Head", bomb)
make("🍉 Watermelon", melon)
make("💀 Apocalypse", apoc)
make("🚀 Rocket", rocket)
make("🕳 Black Hole", void)
make("🧠 NPC", npc)
