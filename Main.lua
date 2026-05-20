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
   Range = {16, 250},
   Increment = 1,
   CurrentValue = 16,

   Callback = function(Value)
      local char = game.Players.LocalPlayer.Character
      if char and char:FindFirstChild("Humanoid") then
         char.Humanoid.WalkSpeed = Value
      end
   end
})

-- Brainrot Tab
local Tab = MainWindow:CreateTab("🧠 Brainrot Spawner", nil)
Tab:CreateSection("Spawner")

local Brainrots = {
    "Noobini Pizzanini","Lirili Larilà","Tim Cheese","Fluriflura","Talpa Di Fero",
    "Svinina Bombardino","Pipi Kiwi","Tartaragno","Pipi Corni","Trippi Troppi",
    "Gangster Footera","Bandito Bobritto","Boneca Ambalabu","Cacto Hipopotamo",
    "Ta Ta Ta Ta Sahur","Tric Trac Baraboom","Pipi Avocado","Cappuccino Assassino",
    "Brr Brr Patapim","Avocadini Antilopini","Salamino Penguino","Penguino Cocosino",
    "Mummio Rappitto","Burbaloni Loliloli","Chimpanzini Bananini","Ballerina Cappuccina",
    "Glorbo Fruttodrillo","Sigma Boy","Sigma Girl","Frigo Camelo","Orangutini Ananassini",
    "Bombombini Gusini","Tree Tree Tree Sahur","Cocofanto Elefanto","Gattatino Nyanino",
    "Trenostruzzo Turbo 3000","Piccione Macchina","Bambu Bambu Sahur",
    "La Vacca Saturno Saturnita","Nuclearo Dinossauro","Garama & Madundung",
    "La Grande Combinasion","Spaghetti Tualetti","Strawberry Elephant","Meowl","Skibidi Toilet"
}

-- KEEP YOUR FULL DATABASE HERE
local BrainrotStats = {
    ["Noobini Pizzanini"] = {cost = 25, moneySec = 1},
    ["Lirili Larila"] = {cost = 250, moneySec = 3},
    ["Tim Cheese"] = {cost = 500, moneySec = 5},
    ["FluriFlura"] = {cost = 750, moneySec = 7},
    ["Talpa Di Fero"] = {cost = 1000, moneySec = 9},
    ["Svinina Bombardino"] = {cost = 1200, moneySec = 10},
    ["Pipi Kiwi"] = {cost = 1500, moneySec = 13},
    ["Tartaragno"] = {cost = 1500, moneySec = 13},
    ["Pipi Corni"] = {cost = 1700, moneySec = 14},
    ["Trippi Troppi"] = {cost = 2000, moneySec = 15},
    ["Gangster Footera"] = {cost = 4000, moneySec = 30},
    ["Bandito Bobritto"] = {cost = 4500, moneySec = 35},
    ["Boneca Ambalabu"] = {cost = 5000, moneySec = 40},
    ["Cacto Hipopotamo"] = {cost = 6500, moneySec = 50},
    ["Ta Ta Ta Ta Sahur"] = {cost = 7500, moneySec = 55},
    ["Tric Trac Baraboom"] = {cost = 9000, moneySec = 65},
    ["Pipi Avocado"] = {cost = 9500, moneySec = 70},
    ["Cappuccino Assassino"] = {cost = 10000, moneySec = 75},
    ["Brr Brr Patapim"] = {cost = 15000, moneySec = 100},
    ["Avocadini Antilopini"] = {cost = 17500, moneySec = 115},
    ["Salamino Penguino"] = {cost = 40000, moneySec = 250},
    ["Penguino Cocosino"] = {cost = 45000, moneySec = 300},
    ["Mummio Rappitto"] = {cost = 47500, moneySec = 325},
    ["Burbaloni Loliloli"] = {cost = 35000, moneySec = 200},
    ["Chimpanzini Bananini"] = {cost = 50000, moneySec = 300},
    ["Ballerina Cappuccina"] = {cost = 100000, moneySec = 500},
    ["Glorbo Fruttodrillo"] = {cost = 200000, moneySec = 750},
    ["Sigma Boy"] = {cost = 325000, moneySec = 1300},
    ["Sigma Girl"] = {cost = 340000, moneySec = 1800},
    ["Frigo Camelo"] = {cost = 300000, moneySec = 1200},
    ["Orangutini Ananassini"] = {cost = 400000, moneySec = 1700},
    ["Bombombini Gusini"] = {cost = 1000000, moneySec = 5000},
    ["Tree Tree Tree Sahur"] = {cost = 4900000, moneySec = 17000},
    ["Piccione Macchina"] = {cost = 40000000, moneySec = 225000},
    ["Nuclearo Dinossauro"] = {cost = 2500000000, moneySec = 15000000},
    ["Strawberry Elephant"] = {cost = 500000000, moneySec = 250000000},
    ["Meowl"] = {cost = 400000000, moneySec = 400000000},
    ["Skibidi Toilet"] = {cost = 350000000, moneySec = 350000000},
}

local SelectedBrainrot = nil

Tab:CreateDropdown({
   Name = "Select Brainrot",
   Options = Brainrots,
   CurrentOption = {},
   MultipleOptions = false,

   Callback = function(Option)
      SelectedBrainrot = Option[1]
      print("Selected:", SelectedBrainrot)
   end,
})

Tab:CreateButton({
    Name = "Spawn Selected Brainrot",

    Callback = function()

        if SelectedBrainrot then

            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")

            local stats = BrainrotStats[SelectedBrainrot]

            if not stats then
                stats = {
                    cost = 1000,
                    moneySec = 10
                }
            end

            -- MODEL
            local brainrot = Instance.new("Model")
            brainrot.Name = SelectedBrainrot
            brainrot.Parent = workspace

            -- ROOT
            local humanoidRootPart = Instance.new("Part")
            humanoidRootPart.Name = "HumanoidRootPart"
            humanoidRootPart.Shape = Enum.PartType.Ball
            humanoidRootPart.Size = Vector3.new(3,3,3)
            humanoidRootPart.Material = Enum.Material.Neon
            humanoidRootPart.Color = Color3.fromRGB(255,170,0)
            humanoidRootPart.Anchored = true
            humanoidRootPart.CanCollide = false
            humanoidRootPart.Parent = brainrot

            humanoidRootPart.CFrame =
                hrp.CFrame * CFrame.new(0,3,-6)

            -- HEAD
            local head = Instance.new("Part")
            head.Name = "Head"
            head.Shape = Enum.PartType.Ball
            head.Size = Vector3.new(2,2,2)
            head.Material = Enum.Material.SmoothPlastic
            head.Color = Color3.fromRGB(255,255,255)
            head.Anchored = true
            head.CanCollide = false
            head.Parent = brainrot

            head.Position =
                humanoidRootPart.Position + Vector3.new(0,3,0)

            -- FACE
            local face = Instance.new("Decal")
            face.Texture = "rbxasset://textures/face.png"
            face.Face = Enum.NormalId.Front
            face.Parent = head

            -- HUMANOID
            local humanoid = Instance.new("Humanoid")
            humanoid.Parent = brainrot

            local animator = Instance.new("Animator")
            animator.Parent = humanoid

            -- LABEL
            local billboard = Instance.new("BillboardGui")
            billboard.Size = UDim2.new(0,220,0,60)
            billboard.StudsOffset = Vector3.new(0,5,0)
            billboard.AlwaysOnTop = true
            billboard.Parent = humanoidRootPart

            local text = Instance.new("TextLabel")
            text.Size = UDim2.new(1,0,1,0)
            text.BackgroundTransparency = 1
            text.TextScaled = true
            text.Font = Enum.Font.GothamBold
            text.TextStrokeTransparency = 0
            text.TextColor3 = Color3.fromRGB(255,255,255)

            text.Text =
                SelectedBrainrot ..
                "\n$" .. stats.moneySec .. "/s"

            text.Parent = billboard

            -- FLOAT
            task.spawn(function()

                local startPos = humanoidRootPart.Position
                local t = 0

                while brainrot.Parent do

                    t += 0.05

                    local offset = math.sin(t) * 0.8

                    humanoidRootPart.Position =
                        startPos + Vector3.new(0,offset,0)

                    head.Position =
                        humanoidRootPart.Position + Vector3.new(0,3,0)

                    task.wait(0.03)
                end
            end)

            Rayfield:Notify({
               Title = "Spawned!",
               Content = SelectedBrainrot ..
                    " - $" .. stats.moneySec .. "/s",
               Duration = 3
            })

            -- 600 SECOND TIMER
            task.delay(600, function()
               if brainrot then
                  brainrot:Destroy()
               end
            end)

        else

            Rayfield:Notify({
               Title = "Error",
               Content = "Select a brainrot first!",
               Duration = 3
            })

        end
    end,
})

end
