local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "XshadowX",
   Icon = 0,
   LoadingTitle = "Wait...",
   LoadingSubtitle = "by XshadowX",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "XshadowX Config"
   },
   Discord = {
      Enabled = true,
      Invite = "B6jnEvBafe",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "XshadowX Key🔒",
      Subtitle = "keyyyyy",
      Note = "XshadowX key",
      FileName = "shadow Key",
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
   loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.luau"))()
   end,
})
