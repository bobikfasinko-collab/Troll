local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

------------------------------------------------
-- GUI
------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "AIM_TRAINER_9"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

------------------------------------------------
-- KEY SYSTEM
------------------------------------------------
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0,300,0,180)
keyFrame.Position = UDim2.new(0.5,-150,0.5,-90)
keyFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
keyFrame.Parent = gui
Instance.new("UICorner", keyFrame)

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8,0,0,40)
keyBox.Position = UDim2.new(0.1,0,0.35,0)
keyBox.PlaceholderText = "Enter Key"
keyBox.Parent = keyFrame
Instance.new("UICorner", keyBox)

local errorText = Instance.new("TextLabel")
errorText.Size = UDim2.new(1,0,0,25)
errorText.BackgroundTransparency = 1
errorText.TextColor3 = Color3.fromRGB(255,0,0)
errorText.Font = Enum.Font.GothamBold
errorText.TextSize = 14
errorText.Parent = keyFrame

local enter = Instance.new("TextButton")
enter.Size = UDim2.new(0.8,0,0,40)
enter.Position = UDim2.new(0.1,0,0.7,0)
enter.Text = "ENTER"
enter.Parent = keyFrame
Instance.new("UICorner", enter)

------------------------------------------------
-- MAIN UI
------------------------------------------------
local main = Instance.new("Frame")
main.Size = UDim2.new(0,420,0,520)
main.Position = UDim2.new(0.5,-210,0.5,-260)
main.BackgroundColor3 = Color3.fromRGB(18,18,18)
main.Visible = false
main.Parent = gui
Instance.new("UICorner", main)

------------------------------------------------
-- RGB BORDER
------------------------------------------------
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2

task.spawn(function()
	while true do
		for i=0,1,0.01 do
			stroke.Color = Color3.fromHSV(i,1,1)
			task.wait(0.02)
		end
	end
end)

------------------------------------------------
-- HEADER
------------------------------------------------
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,35)
title.BackgroundTransparency = 1
title.Text = "AIM TRAINING HUB 9.0"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.Parent = main

local greet = Instance.new("TextLabel")
greet.Size = UDim2.new(1,0,0,20)
greet.Position = UDim2.new(0,0,0,30)
greet.BackgroundTransparency = 1
greet.Text = "привет " .. player.Name .. "!"
greet.TextColor3 = Color3.fromRGB(180,180,180)
greet.Parent = main

------------------------------------------------
-- TAB SYSTEM
------------------------------------------------
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1,0,0,45)
tabBar.Position = UDim2.new(0,0,0,60)
tabBar.BackgroundTransparency = 1
tabBar.Parent = main

local content = Instance.new("Frame")
content.Size = UDim2.new(1,0,1,-110)
content.Position = UDim2.new(0,0,0,110)
content.BackgroundTransparency = 1
content.Parent = main

local function clear()
	for _,v in pairs(content:GetChildren()) do
		if v:IsA("TextButton") then v:Destroy() end
	end
end

local function button(text, func)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0.9,0,0,38)
	b.BackgroundColor3 = Color3.fromRGB(40,40,40)
	b.Text = text
	b.TextColor3 = Color3.new(1,1,1)
	b.Font = Enum.Font.Gotham
	b.Parent = content
	Instance.new("UICorner", b)

	b.MouseButton1Click:Connect(func)
end

------------------------------------------------
-- AIM TRAINING SYSTEM
------------------------------------------------

local targets = {}
local hits = 0

local function spawnTarget()
	local p = Instance.new("Part")
	p.Size = Vector3.new(2,2,2)
	p.Shape = Enum.PartType.Ball
	p.Anchored = true
	p.CanCollide = false
	p.Material = Enum.Material.Neon
	p.Color = Color3.fromRGB(255,0,0)
	p.Position = Vector3.new(math.random(-20,20),5,math.random(-20,20))
	p.Parent = workspace

	table.insert(targets, p)

	p.Touched:Connect(function(hit)
		if hit.Parent == player.Character then
			hits += 1
			p:Destroy()
		end
	end)
end

local function startTraining()
	for i=1,10 do
		spawnTarget()
	end
end

------------------------------------------------
-- AIM ASSIST (LEGIT TRAINING)
------------------------------------------------
local aimAssist = false

RunService.RenderStepped:Connect(function()
	if not aimAssist then return end

	local closest = nil
	local dist = 999

	for _,t in pairs(targets) do
		if t and t.Parent then
			local d = (t.Position - workspace.CurrentCamera.CFrame.Position).Magnitude
			if d < dist then
				dist = d
				closest = t
			end
		end
	end

	if closest then
		workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(
			CFrame.new(workspace.CurrentCamera.CFrame.Position, closest.Position),
			0.05
		)
	end
end)

------------------------------------------------
-- ESP (FOR TARGETS ONLY)
------------------------------------------------
local espOn = false

local function updateESP()
	while espOn do
		for _,t in pairs(targets) do
			if t and t:FindFirstChild("BillboardGui") == nil then
				local bb = Instance.new("BillboardGui", t)
				bb.Size = UDim2.new(0,100,0,40)
				bb.AlwaysOnTop = true

				local txt = Instance.new("TextLabel", bb)
				txt.Text = "TARGET"
				txt.TextColor3 = Color3.new(1,0,0)
				txt.BackgroundTransparency = 1
			end
		end
		task.wait(1)
	end
end

------------------------------------------------
-- KEY CHECK
------------------------------------------------
enter.MouseButton1Click:Connect(function()
	if keyBox.Text == "Ger" then
		keyFrame.Visible = false
		main.Visible = true
	else
		errorText.Text = player.Name .. " не тот ключ!"
	end
end)

------------------------------------------------
-- TABS
------------------------------------------------
local tabs = {"Aim","Training","Visual"}

for i,v in ipairs(tabs) do
	local t = Instance.new("TextButton")
	t.Size = UDim2.new(0,120,1,0)
	t.Position = UDim2.new(0,(i-1)*130,0,0)
	t.Text = v
	t.Parent = tabBar
	Instance.new("UICorner", t)

	t.MouseButton1Click:Connect(function()
		clear()

		if v == "Aim" then
			button("Aim Assist", function()
				aimAssist = not aimAssist
			end)

			button("ESP Targets", function()
				espOn = not espOn
				if espOn then updateESP() end
			end)

		elseif v == "Training" then
			button("Spawn Targets", startTraining)
			button("Reset Hits", function() hits = 0 end)

		elseif v == "Visual" then
			button("Full Bright", function()
				game.Lighting.Brightness = 3
			end)
		end
	end)
end
