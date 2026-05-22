local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

if game.PlaceId == 109983668079237 then

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- ANTI-PROTECTION VARIABLES
local AntiKickEnabled = false
local AntiBanEnabled = false
local AntiDetectionEnabled = false

-- SETUP ANTI-PROTECTIONS
local function SetupAntiProtections()
	-- Anti-Kick
	local oldKick = Players.LocalPlayer.Kick
	Players.LocalPlayer.Kick = function()
		if AntiKickEnabled then
			warn("🛡️ Anti-Kick: Blocked kick attempt!")
			return
		end
		return oldKick()
	end

	-- Anti-Ban (Block RemoteEvent/RemoteFunction calls)
	local RemoteEvents = {}
	for _, remote in pairs(game:GetDescendants()) do
		if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
			table.insert(RemoteEvents, remote)
		end
	end

	for _, remote in pairs(RemoteEvents) do
		if string.lower(remote.Name):find("ban") or string.lower(remote.Name):find("kick") or string.lower(remote.Name):find("remove") then
			local oldFire = remote.FireServer
			remote.FireServer = function(self, ...)
				if AntiBanEnabled then
					warn("🛡️ Anti-Ban: Blocked " .. remote.Name .. " attempt!")
					return
				end
				return oldFire(self, ...)
			end
		end
	end

	-- Anti-Detection (Hide from server monitoring)
	if AntiDetectionEnabled then
		_G.AntiDetection = true
		local mt = getrawmetatable(game)
		local oldNamecall = mt.__namecall
		mt.__namecall = function(self, ...)
			local args = {...}
			if string.lower(tostring(self)):find("detect") or string.lower(args[1]):find("cheat") then
				return nil
			end
			return oldNamecall(self, ...)
		end
	end
end

SetupAntiProtections()

local MainWindow = Rayfield:CreateWindow({
   Name = "🧠 SAB Spawner",
   Icon = 0,
   LoadingTitle = "Loading...",
   LoadingSubtitle = "Building your Script...",
   ShowText = "Rayfield",
   Theme = "Default",

   ToggleUIKeybind = "T",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "SAB_Spawner"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,

   KeySettings = {
      Title = "Brainrot spawner | Key",
      Subtitle = "KeySystem",
      Note = "Go join the discord server for the link to get the key from pastebin!",
      FileName = "XwareHubKey",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/YCpqJCt4"}
   }
})

-- HOME TAB

local MainTab = MainWindow:CreateTab("🏠 Home", nil)
MainTab:CreateSection("Movement")

Rayfield:Notify({
   Title = "✅ Script Loaded!",
   Content = "Welcome to the Advanced Brainrot Spawner!",
   Duration = 4.5,
})

MainTab:CreateButton({
   Name = "🚀 Fly",
   Callback = function()
      loadstring(game:HttpGet("https://pastefy.app/h8KwvbDk/raw"))()
   end,
})

MainTab:CreateSlider({
   Name = "🏃 Walkspeed",
   Range = {16,250},
   Increment = 1,
   CurrentValue = 16,

   Callback = function(Value)
      local char = LocalPlayer.Character
      if char and char:FindFirstChild("Humanoid") then
         char.Humanoid.WalkSpeed = Value
      end
   end,
})

-- COMPLETE BRAINROT DATABASE

local BrainrotDatabase = {
	-- COMMON TIER
	["Noobini Pizzanini"] = {rarity = "Common", cost = 25, moneySec = 1, color = Color3.fromRGB(255,170,0), emoji = "🍕"},
	["Tim Cheese"] = {rarity = "Common", cost = 500, moneySec = 5, color = Color3.fromRGB(255,255,0), emoji = "🧀"},
	
	-- RARE TIER
	["Trippi Troppi"] = {rarity = "Rare", cost = 2000, moneySec = 15, color = Color3.fromRGB(255,0,255), emoji = "🌈"},
	["Gangster Footera"] = {rarity = "Rare", cost = 4000, moneySec = 30, color = Color3.fromRGB(20,20,20), emoji = "👟"},
	
	-- EPIC TIER
	["Ballerina Cappuccina"] = {rarity = "Epic", cost = 100000, moneySec = 500, color = Color3.fromRGB(255,192,203), emoji = "☕"},
	["Sigma Boy"] = {rarity = "Epic", cost = 325000, moneySec = 1300, color = Color3.fromRGB(0,170,255), emoji = "😎"},
	["Sigma Girl"] = {rarity = "Epic", cost = 340000, moneySec = 1800, color = Color3.fromRGB(255,85,255), emoji = "👑"},
	
	-- LEGENDARY TIER
	["Bombombini Gusini"] = {rarity = "Legendary", cost = 1000000, moneySec = 5000, color = Color3.fromRGB(255,0,0), emoji = "💣"},
	["Tree Tree Tree Sahur"] = {rarity = "Legendary", cost = 4900000, moneySec = 17000, color = Color3.fromRGB(0,255,0), emoji = "🌳"},
	["Piccione Macchina"] = {rarity = "Legendary", cost = 40000000, moneySec = 225000, color = Color3.fromRGB(120,120,120), emoji = "🕊️"},
	
	-- MYTHIC TIER
	["Skibidi Toilet"] = {rarity = "Mythic", cost = 350000000, moneySec = 350000000, color = Color3.fromRGB(255,255,255), emoji = "🚽"},
	["Meowl"] = {rarity = "Mythic", cost = 400000000, moneySec = 400000000, color = Color3.fromRGB(120,0,255), emoji = "🐱"},
	
	-- BRAINROT GOD TIER
	["Strawberry Elephant"] = {rarity = "Brainrot God", cost = 500000000, moneySec = 250000000, color = Color3.fromRGB(255,80,120), emoji = "🍓"},
	["La Vaca Saturno"] = {rarity = "Brainrot God", cost = 600000000, moneySec = 300000000, color = Color3.fromRGB(0,0,0), emoji = "🐄"},
	["Cappuccino Assassino"] = {rarity = "Brainrot God", cost = 550000000, moneySec = 275000000, color = Color3.fromRGB(139,69,19), emoji = "☕"},
	["Tralalero Tralala"] = {rarity = "Brainrot God", cost = 580000000, moneySec = 290000000, color = Color3.fromRGB(0,100,200), emoji = "🦈"},
}

local BrainrotList = {}
for name, _ in pairs(BrainrotDatabase) do
	table.insert(BrainrotList, name)
end
table.sort(BrainrotList)

-- BRAINROT SPAWNER TAB

local SpawnerTab = MainWindow:CreateTab("🧠 Brainrot Spawner", nil)
SpawnerTab:CreateSection("Spawn Controls")

local SelectedBrainrot = nil
local SpawnCount = 1

SpawnerTab:CreateDropdown({
   Name = "Select Brainrot",
   Options = BrainrotList,
   CurrentOption = {},
   MultipleOptions = false,

   Callback = function(Option)
      SelectedBrainrot = Option[1]
   end,
})

SpawnerTab:CreateSlider({
   Name = "Spawn Count",
   Range = {1, 50},
   Increment = 1,
   CurrentValue = 1,

   Callback = function(Value)
      SpawnCount = Value
   end,
})

local function SpawnBrainrot(name, count)
	if not name or not BrainrotDatabase[name] then
		Rayfield:Notify({
			Title = "❌ Error",
			Content = "Select a valid Brainrot!",
			Duration = 3
		})
		return
	end

	local stats = BrainrotDatabase[name]
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	for i = 1, count do
		task.spawn(function()
			local brainrot = Instance.new("Model")
			brainrot.Name = name
			brainrot.Parent = workspace

			local root = Instance.new("Part")
			root.Name = "HumanoidRootPart"
			root.Size = Vector3.new(2,2,2)
			root.Transparency = 1
			root.Anchored = false
			root.CanCollide = false
			root.Position = hrp.Position + hrp.CFrame.LookVector * (8 + i * 3)
			root.Parent = brainrot

			local head = Instance.new("Part")
			head.Name = "Head"
			head.Shape = Enum.PartType.Ball
			head.Size = Vector3.new(3,3,3)
			head.Material = Enum.Material.Neon
			head.Color = stats.color
			head.Position = root.Position + Vector3.new(0,3,0)
			head.Parent = brainrot

			local body = Instance.new("Part")
			body.Name = "Body"
			body.Size = Vector3.new(3,4,2)
			body.Material = Enum.Material.SmoothPlastic
			body.Color = stats.color
			body.Position = root.Position
			body.Parent = brainrot

			local leg1 = Instance.new("Part")
			leg1.Size = Vector3.new(1,3,1)
			leg1.Color = stats.color
			leg1.Position = root.Position + Vector3.new(-0.8,-3,0)
			leg1.Parent = brainrot

			local leg2 = Instance.new("Part")
			leg2.Size = Vector3.new(1,3,1)
			leg2.Color = stats.color
			leg2.Position = root.Position + Vector3.new(0.8,-3,0)
			leg2.Parent = brainrot

			local function weld(a,b)
				local w = Instance.new("WeldConstraint")
				w.Part0 = a
				w.Part1 = b
				w.Parent = a
			end

			weld(root,head)
			weld(root,body)
			weld(root,leg1)
			weld(root,leg2)

			local humanoid = Instance.new("Humanoid")
			humanoid.Parent = brainrot

			brainrot.PrimaryPart = root

			local billboard = Instance.new("BillboardGui")
			billboard.Size = UDim2.new(0,200,0,50)
			billboard.AlwaysOnTop = true
			billboard.StudsOffset = Vector3.new(0,5,0)
			billboard.Parent = head

			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1,0,1,0)
			label.BackgroundTransparency = 1
			label.TextScaled = true
			label.TextColor3 = Color3.new(1,1,1)
			label.TextStrokeTransparency = 0
			label.Font = Enum.Font.GothamBold
			label.Text = stats.emoji .. " " .. name .. "\n💰 $" .. tostring(stats.moneySec) .. "/s\n⭐ " .. stats.rarity
			label.Parent = billboard

			task.spawn(function()
				local t = 0
				while brainrot.Parent do
					t += 0.05
					root.CFrame = root.CFrame + Vector3.new(0, math.sin(t) * 0.03, 0)
					task.wait(0.03)
				end
			end)

			task.delay(600, function()
				if brainrot then brainrot:Destroy() end
			end)
		end)
	end

	Rayfield:Notify({
		Title = "✅ Spawned!",
		Content = stats.emoji .. " " .. name .. " x" .. count .. " | $" .. tostring(stats.moneySec * count) .. "/s",
		Duration = 3
	})
end

SpawnerTab:CreateButton({
   Name = "🎯 Spawn Brainrot(s)",

   Callback = function()
      SpawnBrainrot(SelectedBrainrot, SpawnCount)
   end,
})

SpawnerTab:CreateSection("Quick Spawn")

for _, brainrotName in ipairs(BrainrotList) do
	local stats = BrainrotDatabase[brainrotName]
	SpawnerTab:CreateButton({
		Name = stats.emoji .. " " .. brainrotName,
		Callback = function()
			SpawnBrainrot(brainrotName, 1)
		end,
	})
end

-- STATS TAB

local StatsTab = MainWindow:CreateTab("📊 Stats", nil)
StatsTab:CreateSection("Spawned Brainrots")

local StatsLabel = StatsTab:CreateLabel("Total Spawned: 0")
local TotalCash = StatsTab:CreateLabel("Estimated Cash/sec: $0")
local RarityLabel = StatsTab:CreateLabel("Rarity Distribution: None")

local function UpdateStats()
	local totalSpawned = 0
	local totalCash = 0
	local rarityCount = {}

	for _, brainrot in pairs(workspace:GetDescendants()) do
		if brainrot:IsA("Model") and BrainrotDatabase[brainrot.Name] then
			totalSpawned += 1
			local stats = BrainrotDatabase[brainrot.Name]
			totalCash += stats.moneySec
			rarityCount[stats.rarity] = (rarityCount[stats.rarity] or 0) + 1
		end
	end

	StatsLabel:Set("📈 Total Spawned: " .. totalSpawned)
	TotalCash:Set("💰 Estimated Cash/sec: $" .. tostring(totalCash))
	
	local rarityText = ""
	for rarity, count in pairs(rarityCount) do
		rarityText = rarityText .. rarity .. ": " .. count .. " | "
	end
	RarityLabel:Set("⭐ Rarity: " .. (rarityText ~= "" and rarityText or "None"))
end

StatsTab:CreateButton({
   Name = "🔄 Refresh Stats",
   Callback = function()
      UpdateStats()
   end,
})

-- MISC TAB (Anti-Protection)

local MiscTab = MainWindow:CreateTab("🎲 Misc", nil)
MiscTab:CreateSection("Protection Suite")

local AntiKickToggle = MiscTab:CreateToggle({
   Name = "🛡️ Anti-Kick",
   CurrentValue = false,
   Flag = "AntiKick",
   Callback = function(Value)
      AntiKickEnabled = Value
      local status = Value and "✅ ENABLED" or "❌ DISABLED"
      Rayfield:Notify({
         Title = "Anti-Kick: " .. status,
         Content = "Kick protection is now " .. (Value and "active" or "inactive"),
         Duration = 2
      })
   end,
})

local AntiBanToggle = MiscTab:CreateToggle({
   Name = "🚫 Anti-Ban",
   CurrentValue = false,
   Flag = "AntiBan",
   Callback = function(Value)
      AntiBanEnabled = Value
      local status = Value and "✅ ENABLED" or "❌ DISABLED"
      Rayfield:Notify({
         Title = "Anti-Ban: " .. status,
         Content = "Ban protection is now " .. (Value and "active" or "inactive"),
         Duration = 2
      })
   end,
})

local AntiDetectionToggle = MiscTab:CreateToggle({
   Name = "👻 Anti-Detection",
   CurrentValue = false,
   Flag = "AntiDetection",
   Callback = function(Value)
      AntiDetectionEnabled = Value
      local status = Value and "✅ ENABLED" or "❌ DISABLED"
      Rayfield:Notify({
         Title = "Anti-Detection: " .. status,
         Content = "Detection evasion is now " .. (Value and "active" or "inactive"),
         Duration = 2
      })
   end,
})

MiscTab:CreateSection("Status")

local ProtectionStatus = MiscTab:CreateLabel("🟢 All Systems Ready")

RunService.Heartbeat:Connect(function()
	local status = ""
	if AntiKickEnabled then status = status .. "🛡️ " end
	if AntiBanEnabled then status = status .. "🚫 " end
	if AntiDetectionEnabled then status = status .. "👻 " end
	
	if status == "" then
		status = "🟢 Protections Ready"
	else
		status = "🔴 Active: " .. status
	end
	
	ProtectionStatus:Set(status)
end)

end
