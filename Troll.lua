local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Создаем удаленное событие для связи клиента и сервера
local PushEvent = Instance.new("RemoteEvent")
PushEvent.Name = "PushPlayerEvent"
PushEvent.Parent = ReplicatedStorage

local PUSH_FORCE = 150 -- Сила толчка вверх и вперед
local MAX_DISTANCE = 15 -- Радиус действия способности (в студах)

PushEvent.OnServerEvent:Connect(function(player)
	local character = player.Character
	if not character then return end
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart then return end

	-- Ищем других игроков поблизости
	for _, otherPlayer in ipairs(game:GetService("Players"):GetPlayers()) do
		if otherPlayer ~= player and otherPlayer.Character then
			local otherRoot = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
			local otherHumanoid = otherPlayer.Character:FindFirstChildOfClass("Humanoid")
			
			if otherRoot and otherHumanoid and otherHumanoid.Health > 0 then
				-- Проверяем расстояние до цели
				local distance = (rootPart.Position - otherRoot.Position).Magnitude
				if distance <= MAX_DISTANCE then
					
					-- Рассчитываем направление (от нас к цели + вверх)
					local direction = (otherRoot.Position - rootPart.Position).Unit
					local pushDirection = (direction + Vector3.new(0, 1.5, 0)).Unit
					
					-- Применяем физический импульс (LinearVelocity)
					local attachment = Instance.new("Attachment")
					attachment.Parent = otherRoot
					
					local linearVelocity = Instance.new("LinearVelocity")
					linearVelocity.MaxForce = math.huge
					linearVelocity.VectorVelocity = pushDirection * PUSH_FORCE
					linearVelocity.Attachment0 = attachment
					linearVelocity.Parent = otherRoot
					
					-- Временно врезаем анимацию падения (Ragdoll/PlatformStand)
					otherHumanoid.PlatformStand = true
					
					-- Удаляем силу через 0.3 секунды, чтобы игрок улетел по инерции
					task.delay(0.3, function()
						linearVelocity:Destroy()
						attachment:Destroy()
					end)
					
					-- Возвращаем управление игроку через 2 секунды
					task.delay(2, function()
						if otherHumanoid then
							otherHumanoid.PlatformStand = false
						end
					end)
				end
			end
		end
	end
end)
