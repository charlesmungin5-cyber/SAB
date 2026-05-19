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

            Rayfield:Notify({
               Title = "Spawned!",
               Content = SelectedBrainrot,
               Duration = 3
            })

            local brainrot = Instance.new("Part")
            brainrot.Size = Vector3.new(4, 4, 4)
            brainrot.Anchored = true
            brainrot.CanCollide = false
            brainrot.Material = Enum.Material.Neon
            brainrot.Color = Color3.fromRGB(255, 170, 0)
            brainrot.Name = SelectedBrainrot

            local basePos = hrp.Position + Vector3.new(0, 6, -6)
            brainrot.Position = basePos
            brainrot.Parent = workspace

            -- floating animation (FIXED STABLE)
            task.spawn(function()
               local t = 0
               while brainrot.Parent do
                  t += 0.1
                  brainrot.Position = basePos + Vector3.new(0, math.sin(t) * 1.5, 0)
                  task.wait(0.03)
               end
            end)

            -- KEEP YOUR 600 SECOND TIMER
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
