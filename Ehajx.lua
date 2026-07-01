local player = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local tween = game:GetService("TweenService")

local event = rs:WaitForChild("OGURCHIK_EVENT")

local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- ================= OPEN BUTTON =================
local open = Instance.new("TextButton")
open.Size = UDim2.new(0,120,0,50)
open.Position = UDim2.new(0,10,0.5,-25)
open.Text = "OGURCHIK"
open.Parent = gui

-- ================= PANEL =================
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 300, 0, 0)
panel.Position = UDim2.new(0.5,-150,0.5,-200)
panel.ClipsDescendants = true
panel.Active = true
panel.Draggable = true
panel.Parent = gui

Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 12)

-- 🌈 RGB
task.spawn(function()
	while true do
		for i = 0,1,0.01 do
			panel.BackgroundColor3 = Color3.fromHSV(i,1,1)
			task.wait(0.03)
		end
	end
end)

-- ================= SCROLL MENU =================
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,0,1,0)
scroll.CanvasSize = UDim2.new(0,0,0,600)
scroll.ScrollBarThickness = 6
scroll.Parent = panel

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,5)

-- ================= SMOOTH OPEN =================
local openState = false

open.MouseButton1Click:Connect(function()
	openState = not openState

	if openState then
		panel.Visible = true
		tween:Create(panel, TweenInfo.new(0.35), {Size = UDim2.new(0,300,0,400)}):Play()
	else
		local t = tween:Create(panel, TweenInfo.new(0.35), {Size = UDim2.new(0,300,0,0)})
		t:Play()
		t.Completed:Wait()
		panel.Visible = false
	end
end)

-- ================= BUTTON FACTORY =================
local function btn(text, action)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,0,0,55)
	b.Text = text
	b.Parent = scroll

	b.MouseButton1Click:Connect(function()
		event:FireServer(action)
	end)
end

-- ================= FEATURES =================
btn("💣 Bomb Head", "BOMB")
btn("🍉 Watermelon", "MELON")
btn("💀 Apocalypse", "APOC")
btn("🚀 Rocket", "ROCKET")
btn("🕳 Black Hole", "VOID")
btn("🧠 Spawn Ogurchik NPCs", "NPC")
