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
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Executed Script!",
   Content = "Have Fun!",
   Duration = 4.5,
   Image = nil,
})

local Button = MainTab:CreateButton({
   Name = "Fly",
   Callback = function()
      loadstring(game:HttpGet("https://pastefy.app/h8KwvbDk/raw"))()
   end,
})

-- Walkspeed slider
local WalkSpeedSlider = MainTab:CreateSlider({
   Name = "Walkspeed",
   Range = {16, 250},
   Increment = 1,
   CurrentValue = 16,
   Flag = "WalkSpeed",

   Callback = function(Value)
      local char = game.Players.LocalPlayer.Character
      if char and char:FindFirstChild("Humanoid") then
         char.Humanoid.WalkSpeed = Value
      end
   end
})

-- Brainrot Tab (FIXED: correct window reference)
local Tab = MainWindow:CreateTab("🧠 Brainrot Spawner", nil)
local Section = Tab:CreateSection("Spawner")

local Brainrots = {
    "Noobini Pizzanini",
    "Lirili Larilà",
    "Tim Cheese",
    "Fluriflura",
    "Talpa Di Fero",
    "Svinina Bombardino",
    "Pipi Kiwi",
    "Tartaragno",
    "Pipi Corni",
    "Trippi Troppi",
    "Gangster Footera",
    "Bandito Bobritto",
    "Boneca Ambalabu",
    "Cacto Hipopotamo",
    "Ta Ta Ta Ta Sahur",
    "Tric Trac Baraboom",
    "Pipi Avocado",
    "Cappuccino Assassino",
    "Brr Brr Patapim",
    "Avocadini Antilopini",
    "Salamino Penguino",
    "Penguino Cocosino",
    "Mummio Rappitto",
    "Burbaloni Loliloli",
    "Chimpanzini Bananini",
    "Ballerina Cappuccina",
    "Glorbo Fruttodrillo",
    "Sigma Boy",
    "Sigma Girl",
    "Frigo Camelo",
    "Orangutini Ananassini",
    "Bombombini Gusini",
    "Tree Tree Tree Sahur",
    "Cocofanto Elefanto",
    "Gattatino Nyanino",
    "Trenostruzzo Turbo 3000",
    "Piccione Macchina",
    "Bambu Bambu Sahur",
    "La Vacca Saturno Saturnita",
    "Nuclearo Dinossauro",
    "Garama & Madundung",
    "La Grande Combinasion",
    "Spaghetti Tualetti",
    "Strawberry Elephant",
    "Meowl",
    "Skibidi Toilet"
}

local SelectedBrainrot = nil

Tab:CreateDropdown({
   Name = "Select Brainrot",
   Options = Brainrots,
   CurrentOption = {},
   MultipleOptions = false,
   Flag = "BrainrotDropdown",

   Callback = function(Option)
      SelectedBrainrot = Option[1]
      print("Selected:", SelectedBrainrot)
   end,
})

Tab:CreateButton({
    Name = "Spawn Selected Brainrot",

    Callback = function()
        if SelectedBrainrot then
            print("Spawned "..SelectedBrainrot)

            Rayfield:Notify({
               Title = "Spawned!",
               Content = "Spawned "..SelectedBrainrot,
               Duration = 3,
               Image = nil,
            })

        else
            Rayfield:Notify({
               Title = "Error",
               Content = "Select a brainrot first!",
               Duration = 3,
               Image = nil,
            })
        end
    end,
})

end
