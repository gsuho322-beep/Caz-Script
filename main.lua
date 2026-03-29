local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Cazz Script",
   Icon = 0,
   LoadingTitle = "Cazz Script Hub",
   LoadingSubtitle = "by Caz",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "CazzConfig"
   },
   Discord = {
      Enabled = true,
      Invite = "B6jnEvBafe",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Cazz Script Key",
      Subtitle = "Join Discord for Key",
      Note = "Join the community to get your access key",
      FileName = "CazzKey",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/BWxkLALB"}
   }
})

local MainTab = Window:CreateTab("Main", 4483362458)

Rayfield:Notify({
   Title = "Cazz Script Loaded",
   Content = "Success",
   Duration = 5,
   Image = 4483362458,
})

local Tab = Window:CreateTab("Main tab", nil) -- Title, Image
local MainSection = Tab:CreateSection("Main")

Rayfield:Notify({
   Title = "XshadowX V1",
   Content = "XshadowX",
   Duration = 6.5,
   Image = nil,
})

local Button = MainTab:CreateButton({
   Name = "Modern",
   Callback = function()
   loadstring(game:HttpGet'https://exploit.plus/Loader')()
   end,
})

local Button = MainTab:CreateButton({
   Name = "kiciahook V2",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua"))()
   end,
})
