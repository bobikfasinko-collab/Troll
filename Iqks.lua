local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- ================= KEY SYSTEM =================
local KEY = "PG1"

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,300,0,180)
frame.Position = UDim2.new(0.5,-150,0.5,-90)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Parent = gui

local box = Instance.new("TextBox")
box.Size = UDim2.new(0,260,0,50)
box.Position = UDim2.new(0,20,0,20)
box.PlaceholderText = "Enter Key"
box.Parent = frame

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0,260,0,50)
btn.Position = UDim2.new(0,20,0,90)
btn.Text = "ENTER"
btn.Parent = frame

-- ================= MAIN PANEL =================
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0,300,0,300)
panel.Position = UDim2.new(0.5,-150,0.5,-150)
panel.BackgroundColor3 = Color3.fromRGB(40,40,40)
panel.Visible = false
panel.Parent = gui

Instance.new("UICorner", panel).CornerRadius = UDim.new(0,10)

-- ================= PLAYER =================
local function char()
	return player.Character or player.CharacterAdded:Wait()
end

-- ================= SPEED =================
local function speed()
	char().Humanoid.WalkSpeed = 50
end

-- ================= NOCLIP =================
local noclip = false
local function toggleNoclip()
	noclip = not noclip

	game:GetService("RunService").Stepped:Connect(function()
		if noclip and char() then
			for _,v in pairs(char():GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end
	end)
end

-- ================= ESP =================
local espEnabled = false

local function esp()
	espEnabled = not espEnabled

	for _,v in pairs(game.Players:GetPlayers()) do
		if v ~= player and v.Character then
			local h = Instance.new("Highlight")
			h.FillColor = Color3.fromRGB(0,255,0)
			h.OutlineColor = Color3.fromRGB(255,255,255)
			h.Parent = v.Character
		end
	end
end

-- ================= BUTTONS =================
local function add(text, func, y)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0,260,0,60)
	b.Position = UDim2.new(0,20,0,y)
	b.Text = text
	b.Parent = panel
	b.MouseButton1Click:Connect(func)
end

-- ================= KEY CHECK =================
btn.MouseButton1Click:Connect(function()
	if box.Text == KEY then
		frame.Visible = false
		panel.Visible = true

		add("⚡ Speed Boost", speed, 20)
		add("👁 ESP Players", esp, 90)
		add("🧊 Toggle NoClip", toggleNoclip, 160)
	else
		box.Text = "WRONG KEY"
	end
end)
