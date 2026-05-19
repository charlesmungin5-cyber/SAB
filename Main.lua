local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Ray = loadstring(game:HttpGet('https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/Ray.lua'))()

if game.PlaceId == 109983668079237 then

local MainWindow = Rayfield:CreateWindow({
   Name = "Brainrot Spawner",
   Icon = 0,
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by LogicLeafRbx",
   ShowText = "Rayfield",
   Theme = "Default",

   ToggleUIKeybind = "K",

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
      Note = "Go join pastebin for the key",
      FileName = "XwareHubKey",
      SaveKey = false,
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/MkzqUH8T"}
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

-- Spawn Configuration
local SpawnLocations = {
   Vector3.new(0, 5, 0),
   Vector3.new(10, 5, 0),
   Vector3.new(-10, 5, 0),
   Vector3.new(0, 5, 10),
}

-- Spawn single brainrot button
local SpawnButton = MainTab:CreateButton({
   Name = "Spawn Brainrot",
   Callback = function()
      local randomPos = SpawnLocations[math.random(1, #SpawnLocations)]
      Ray:SpawnBrainrot(randomPos, "Brainrot")
      Rayfield:Notify({
         Title = "Spawned!",
         Content = "Brainrot spawned at position",
         Duration = 2,
      })
   end
})

-- Spawn multiple brainrots
local MultiSpawnButton = MainTab:CreateButton({
   Name = "Spawn 5 Brainrots",
   Callback = function()
      Ray:SpawnMultiple(SpawnLocations, 5)
      Rayfield:Notify({
         Title = "Spawned Multiple!",
         Content = "5 Brainrots spawned",
         Duration = 2,
      })
   end
})

-- Clear all button
local ClearButton = MainTab:CreateButton({
   Name = "Clear All",
   Callback = function()
      Ray:ClearAll()
      Rayfield:Notify({
         Title = "Cleared!",
         Content = "All brainrots removed",
         Duration = 2,
      })
   end
})

-- Spawn rate slider
local SpeedSlider = MainTab:CreateSlider({
   Name = "Spawn Cooldown",
   Range = {0.1, 2},
   Increment = 0.1,
   CurrentValue = 0.5,
   Flag = "SpawnSpeed",

   Callback = function(Value)
      Ray:SetConfig("SpawnCooldown", Value)
   end
})

-- Walkspeed slider
local WalkSpeedSlider = MainTab:CreateSlider({
   Name = "Walkspeed",
   Range = {16, 250},
   Increment = 1,
   CurrentValue = 16,
   Flag = "WalkSpeed",

   Callback = function(Value)
      if game.Players.LocalPlayer.Character then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end
})

end