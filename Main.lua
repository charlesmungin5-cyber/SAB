local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

if game.PlaceId == 109983668079237 then

local MainWindow = Rayfield:CreateWindow({
   Name = "Brainrot Spawner",
   Icon = 0,
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by LogicLeafRbx",
   ShowText = "Rayfield",
   Theme = "Default",

   ToggleUIKeybind = "T",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Xware Hub"
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
MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Executed Script!",
   Content = "Have Fun!",
   Duration = 4.5,
})

MainTab:CreateButton({
   Name = "Fly",
   Callback = function()
      loadstring(game:HttpGet("https://pastefy.app/h8KwvbDk/raw"))()
   end,
})

MainTab:CreateSlider({
   Name = "Walkspeed",
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

-- BRAINROT TAB

local Tab = MainWindow:CreateTab("🧠 Brainrot Spawner", nil)
Tab:CreateSection("Spawner")

local Brainrots = {
   "Noobini Pizzanini",
   "Tim Cheese",
   "Trippi Troppi",
   "Gangster Footera",
   "Ballerina Cappuccina",
   "Sigma Boy",
   "Sigma Girl",
   "Bombombini Gusini",
   "Tree Tree Tree Sahur",
   "Piccione Macchina",
   "Skibidi Toilet",
   "Meowl",
   "Strawberry Elephant"
}

local BrainrotStats = {
   ["Noobini Pizzanini"] = {
      cost = 25,
      moneySec = 1,
      color = Color3.fromRGB(255,170,0)
   },

   ["Tim Cheese"] = {
      cost = 500,
      moneySec = 5,
      color = Color3.fromRGB(255,255,0)
   },

   ["Trippi Troppi"] = {
      cost = 2000,
      moneySec = 15,
      color = Color3.fromRGB(255,0,255)
   },

   ["Gangster Footera"] = {
      cost = 4000,
      moneySec = 30,
      color = Color3.fromRGB(20,20,20)
   },

   ["Ballerina Cappuccina"] = {
      cost = 100000,
      moneySec = 500,
      color = Color3.fromRGB(255,192,203)
   },

   ["Sigma Boy"] = {
      cost = 325000,
      moneySec = 1300,
      color = Color3.fromRGB(0,170,255)
   },

   ["Sigma Girl"] = {
      cost = 340000,
      moneySec = 1800,
      color = Color3.fromRGB(255,85,255)
   },

   ["Bombombini Gusini"] = {
      cost = 1000000,
      moneySec = 5000,
      color = Color3.fromRGB(255,0,0)
   },

   ["Tree Tree Tree Sahur"] = {
      cost = 4900000,
      moneySec = 17000,
      color = Color3.fromRGB(0,255,0)
   },

   ["Piccione Macchina"] = {
      cost = 40000000,
      moneySec = 225000,
      color = Color3.fromRGB(120,120,120)
   },

   ["Skibidi Toilet"] = {
      cost = 350000000,
      moneySec = 350000000,
      color = Color3.fromRGB(255,255,255)
   },

   ["Meowl"] = {
      cost = 400000000,
      moneySec = 400000000,
      color = Color3.fromRGB(120,0,255)
   },

   ["Strawberry Elephant"] = {
      cost = 500000000,
      moneySec = 250000000,
      color = Color3.fromRGB(255,80,120)
   }
}

local SelectedBrainrot = nil

Tab:CreateDropdown({
   Name = "Select Brainrot",
   Options = Brainrots,
   CurrentOption = {},
   MultipleOptions = false,

   Callback = function(Option)
      SelectedBrainrot = Option[1]
   end,
})

Tab:CreateButton({
   Name = "Spawn Selected Brainrot",

   Callback = function()

      if not SelectedBrainrot then
         Rayfield:Notify({
            Title = "Error",
            Content = "Select a brainrot first!",
            Duration = 3
         })
         return
      end

      local stats = BrainrotStats[SelectedBrainrot]

      if not stats then
         Rayfield:Notify({
            Title = "Error",
            Content = "No stats found!",
            Duration = 3
         })
         return
      end

      local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
      local hrp = char:WaitForChild("HumanoidRootPart")

      -- MODEL

      local brainrot = Instance.new("Model")
      brainrot.Name = SelectedBrainrot
      brainrot.Parent = workspace

      -- ROOT

      local root = Instance.new("Part")
      root.Name = "HumanoidRootPart"
      root.Size = Vector3.new(2,2,2)
      root.Transparency = 1
      root.Anchored = false
      root.CanCollide = false
      root.Position = hrp.Position + hrp.CFrame.LookVector * 8
      root.Parent = brainrot

      -- HEAD

      local head = Instance.new("Part")
      head.Name = "Head"
      head.Shape = Enum.PartType.Ball
      head.Size = Vector3.new(3,3,3)
      head.Material = Enum.Material.Neon
      head.Color = stats.color
      head.Position = root.Position + Vector3.new(0,3,0)
      head.Parent = brainrot

      -- BODY

      local body = Instance.new("Part")
      body.Name = "Body"
      body.Size = Vector3.new(3,4,2)
      body.Material = Enum.Material.SmoothPlastic
      body.Color = stats.color
      body.Position = root.Position
      body.Parent = brainrot

      -- LEFT LEG

      local leg1 = Instance.new("Part")
      leg1.Size = Vector3.new(1,3,1)
      leg1.Color = stats.color
      leg1.Position = root.Position + Vector3.new(-0.8,-3,0)
      leg1.Parent = brainrot

      -- RIGHT LEG

      local leg2 = Instance.new("Part")
      leg2.Size = Vector3.new(1,3,1)
      leg2.Color = stats.color
      leg2.Position = root.Position + Vector3.new(0.8,-3,0)
      leg2.Parent = brainrot

      -- WELDS

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

      -- HUMANOID

      local humanoid = Instance.new("Humanoid")
      humanoid.Parent = brainrot

      brainrot.PrimaryPart = root

      -- NAME TAG

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
      label.Text = SelectedBrainrot .. "\n$" .. stats.moneySec .. "/s"
      label.Parent = billboard

      -- FLOAT ANIMATION

      task.spawn(function()
         local t = 0

         while brainrot.Parent do
            t += 0.05

            root.CFrame = root.CFrame + Vector3.new(
               0,
               math.sin(t) * 0.03,
               0
            )

            task.wait(0.03)
         end
      end)

      -- NOTIFY

      Rayfield:Notify({
         Title = "Spawned!",
         Content = SelectedBrainrot,
         Duration = 3
      })

      -- 600 SECOND TIMER

      task.delay(600,function()
         if brainrot then
            brainrot:Destroy()
         end
      end)

   end,
})

-- MISC TAB

local MiscTab = MainWindow:CreateTab("🎲 Misc", nil)
MiscTab:CreateSection("Protection")

-- Anti-Kick Setup
local antiKickEnabled = false
local antiKickConnection

local function setupAntiKick()
   local oldKick = LocalPlayer.Kick
   LocalPlayer.Kick = function(reason)
      if antiKickEnabled then
         Rayfield:Notify({
            Title = "✅ Anti-Kick Active",
            Content = "Blocked kick attempt!",
            Duration = 2
         })
         return
      end
      oldKick(reason)
   end
end

-- Anti-Ban Setup
local antiBanEnabled = false

local function setupAntiBan()
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
   local Players = game:GetService("Players")
   
   -- Block ban RemoteEvents
   for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
      if obj:IsA("RemoteEvent") and string.find(obj.Name:lower(), "ban") then
         obj.OnClientEvent:Connect(function()
            if antiBanEnabled then
               Rayfield:Notify({
                  Title = "✅ Anti-Ban Active",
                  Content = "Blocked ban attempt!",
                  Duration = 2
               })
               return
            end
         end)
      end
   end
   
   -- Block disconnect signals
   LocalPlayer:GetPropertyChangedSignal("Parent"):Connect(function()
      if antiBanEnabled and LocalPlayer.Parent == nil then
         Rayfield:Notify({
            Title = "✅ Anti-Ban Active",
            Content = "Blocked removal from game!",
            Duration = 2
         })
      end
   end)
end

setupAntiKick()
setupAntiBan()

-- Anti-Kick Toggle
local Toggle = Tab:CreateToggle({
   Name = "Anti Kick",
   CurrentValue = false,
   Flag = "Antikick",
   Callback = function(Value)
      antiKickEnabled = Value
      if Value then
         Rayfield:Notify({
            Title = "🛡️ Anti-Kick",
            Content = "✅ Enabled",
            Duration = 2
         })
      else
         Rayfield:Notify({
            Title = "🛡️ Anti-Kick",
            Content = "❌ Disabled",
            Duration = 2
         })
      end
   end,
})

-- Anti-Ban Toggle
local Toggle = Tab:CreateToggle({
   Name = "Anti Ban",
   CurrentValue = false,
   Flag = "Antiban",
   Callback = function(Value)
      antiBanEnabled = Value
      if Value then
         Rayfield:Notify({
            Title = "🛡️ Anti-Ban",
            Content = "✅ Enabled",
            Duration = 2
         })
      else
         Rayfield:Notify({
            Title = "🛡️ Anti-Ban",
            Content = "❌ Disabled",
            Duration = 2
         })
      end
   end,
})

end
