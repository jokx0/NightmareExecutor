local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nightmare Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Nightmare.",
   LoadingSubtitle = "nightmare.one",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Nightmare Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "wwww", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Nightmare.",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local InfoTab = Window:CreateTab("❗ Info", nil) -- Title, Image

local Label = InfoTab:CreateLabel("Developer : JoKx", nil) -- Title, Icon, Color, IgnoreTheme
local Label = InfoTab:CreateLabel("Discord Server : discord.gg/wwww", nil) -- Title, Icon, Color, IgnoreTheme
local Label = InfoTab:CreateLabel("Website : nightmare.one", nil) -- Title, Icon, Color, IgnoreTheme
local Paragraph = InfoTab:CreateParagraph({Title = "Who Are We?", Content = "test 123"})


Rayfield:Notify({
    Title = "Nightmare Notify",
    Content = "🔗 discord.gg/wwww",
    Duration = 6.5,
    Image = nil,
 })

 local MainTab = Window:CreateTab("🏃‍♀️ Player", nil) -- Title, Image

 local Button = MainTab:CreateButton({
    Name = "Infinite Jump",
    Callback = function()
        _G.infinjump = not _G.infinjump

        if _G.infinJumpStarted == nil then
            --Ensures this only runs once to save resources
            _G.infinJumpStarted = true
            
            --Notifies readiness
        
            --The actual infinite jump
            local plr = game:GetService('Players').LocalPlayer
            local m = plr:GetMouse()
            m.KeyDown:connect(function(k)
                if _G.infinjump then
                    if k:byte() == 32 then
                    humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                    humanoid:ChangeState('Jumping')
                    wait()
                    humanoid:ChangeState('Seated')
                    end
                end
            end)
        end
    end,
 })

 local Slider = MainTab:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 300},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
    end,
 })

 local Input = MainTab:CreateInput({
    Name = "Jump Power",
    PlaceholderText = "Enter Jump Power Here!",
    NumbersOnly = true, -- If the user can only type numbers. Remove or set to false if none.
    CharacterLimit = 15, --max character limit. Remove or set to false
    OnEnter = true, -- Will callback only if the user pressed ENTER while being focused on the the box.
    RemoveTextAfterFocusLost = false, -- Speaks for itself.
    Callback = function(Text)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Text)
    end,
 })

local VisualsTab = Window:CreateTab("🎯 Visuals", nil) -- Title, Image
local Button = VisualsTab:CreateButton({
    Name = "ESP",
    Callback = function()
        _G.FriendColor = Color3.fromRGB(0, 0, 255)
_G.EnemyColor = Color3.fromRGB(255, 0, 0)
_G.UseTeamColor = true

--------------------------------------------------------------------
local Holder = Instance.new("Folder", game.CoreGui)
Holder.Name = "ESP"

local Box = Instance.new("BoxHandleAdornment")
Box.Name = "nilBox"
Box.Size = Vector3.new(1, 2, 1)
Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Box.Transparency = 0.7
Box.ZIndex = 0
Box.AlwaysOnTop = false
Box.Visible = false

local NameTag = Instance.new("BillboardGui")
NameTag.Name = "nilNameTag"
NameTag.Enabled = false
NameTag.Size = UDim2.new(0, 200, 0, 50)
NameTag.AlwaysOnTop = true
NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
local Tag = Instance.new("TextLabel", NameTag)
Tag.Name = "Tag"
Tag.BackgroundTransparency = 1
Tag.Position = UDim2.new(0, -50, 0, 0)
Tag.Size = UDim2.new(0, 300, 0, 20)
Tag.TextSize = 15
Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
Tag.TextStrokeTransparency = 0.4
Tag.Text = "nil"
Tag.Font = Enum.Font.SourceSansBold
Tag.TextScaled = false

local LoadCharacter = function(v)
	repeat wait() until v.Character ~= nil
	v.Character:WaitForChild("Humanoid")
	local vHolder = Holder:FindFirstChild(v.Name)
	vHolder:ClearAllChildren()
	local b = Box:Clone()
	b.Name = v.Name .. "Box"
	b.Adornee = v.Character
	b.Parent = vHolder
	local t = NameTag:Clone()
	t.Name = v.Name .. "NameTag"
	t.Enabled = true
	t.Parent = vHolder
	t.Adornee = v.Character:WaitForChild("Head", 5)
	if not t.Adornee then
		return UnloadCharacter(v)
	end
	t.Tag.Text = v.Name
	b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	local Update
	local UpdateNameTag = function()
		if not pcall(function()
			v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			local maxh = math.floor(v.Character.Humanoid.MaxHealth)
			local h = math.floor(v.Character.Humanoid.Health)
		end) then
			Update:Disconnect()
		end
	end
	UpdateNameTag()
	Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
end

local UnloadCharacter = function(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
		vHolder:ClearAllChildren()
	end
end

local LoadPlayer = function(v)
	local vHolder = Instance.new("Folder", Holder)
	vHolder.Name = v.Name
	v.CharacterAdded:Connect(function()
		pcall(LoadCharacter, v)
	end)
	v.CharacterRemoving:Connect(function()
		pcall(UnloadCharacter, v)
	end)
	v.Changed:Connect(function(prop)
		if prop == "TeamColor" then
			UnloadCharacter(v)
			wait()
			LoadCharacter(v)
		end
	end)
	LoadCharacter(v)
end

local UnloadPlayer = function(v)
	UnloadCharacter(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder then
		vHolder:Destroy()
	end
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	spawn(function() pcall(LoadPlayer, v) end)
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	pcall(LoadPlayer, v)
end)

game:GetService("Players").PlayerRemoving:Connect(function(v)
	pcall(UnloadPlayer, v)
end)

game:GetService("Players").LocalPlayer.NameDisplayDistance = 0

if _G.Reantheajfdfjdgs then
    return
end

_G.Reantheajfdfjdgs = ":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"

local players = game:GetService("Players")
local plr = players.LocalPlayer

function esp(target, color)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local highlight = Instance.new("Highlight")
            highlight.RobloxLocked = true
            highlight.Name = "GetReal"
            highlight.Adornee = target.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = color
            highlight.Parent = target.Character
        else
            target.Character.GetReal.FillColor = color
        end
    end
end

while task.wait() do
    for i, v in pairs(players:GetPlayers()) do
        if v ~= plr then
            esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
        end
    end
end
    end,
 })

 local Input = MainTab:CreateInput({
    Name = "TP TO PLAYER",
    PlaceholderText = "Player Name",
    NumbersOnly = false, -- Allow any characters (set to true if you only want numbers)
    CharacterLimit = 20, -- Maximum character limit
    OnEnter = true, -- Trigger when ENTER is pressed
    RemoveTextAfterFocusLost = false, -- Keep text after losing focus
    Callback = function(Text)
        local player = game.Players.LocalPlayer
        local targetPlayer = game.Players:FindFirstChild(Text) -- Find the player by name

        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                -- Teleport the local player to the target player's position
                player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            else
                warn("")
            end
        else
            warn("")
        end
    end
})

local Input = MainTab:CreateInput({
    Name = "BRING PLAYER",
    PlaceholderText = "Player Name",
    NumbersOnly = false, -- Allow any characters (set to true if you only want numbers)
    CharacterLimit = 20, -- Maximum character limit
    OnEnter = true, -- Trigger when ENTER is pressed
    RemoveTextAfterFocusLost = false, -- Keep text after losing focus
    Callback = function(Text)
        local player = game.Players.LocalPlayer
        local targetPlayer = game.Players:FindFirstChild(Text) -- Find the player by name

        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                -- Move the target player to the local player's position
                targetPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            else
                warn("Your character is missing a HumanoidRootPart!")
            end
        else
            warn("Player not found or their character hasn't loaded!")
        end
    end
})

local Input = MainTab:CreateInput({
    Name = "KILL PLAYER",
    PlaceholderText = "Player Name",
    NumbersOnly = false, -- Allow any characters (set to true if you only want numbers)
    CharacterLimit = 20, -- Maximum character limit
    OnEnter = true, -- Trigger when ENTER is pressed
    RemoveTextAfterFocusLost = false, -- Keep text after losing focus
    Callback = function(Text)
        local targetPlayer = game.Players:FindFirstChild(Text) -- Find the player by name

        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
            -- Set player's health to 0 (instantly kills them)
            targetPlayer.Character.Humanoid.Health = 0
        else
            warn("Player not found or their character hasn't loaded!")
        end
    end
})

local Camera = game.Workspace.CurrentCamera
local LocalPlayer = game.Players.LocalPlayer
local isSpectating = false  -- Track whether the player is spectating
local currentTarget = nil   -- Store the current target player

-- Create the input field for player name (this will be used when spectating)
local Input = MainTab:CreateInput({
    Name = "SPECTATE PLAYER",
    PlaceholderText = "Player Name",
    NumbersOnly = false, -- Allow any characters
    CharacterLimit = 20, -- Max character limit
    OnEnter = true, -- Trigger when ENTER is pressed
    RemoveTextAfterFocusLost = false, -- Keep text after losing focus
    Callback = function(Text)
        local targetPlayer = game.Players:FindFirstChild(Text) -- Find the player by name

        if targetPlayer then
            local targetCharacter = targetPlayer.Character or targetPlayer.CharacterAdded:Wait() -- Wait for character to load if not available
            local humanoidRootPart = targetCharacter:WaitForChild("HumanoidRootPart") -- Ensure the character has loaded the HumanoidRootPart

            if humanoidRootPart then
                currentTarget = targetPlayer  -- Store the target player for later use
                Camera.CameraSubject = targetCharacter.Humanoid -- Change camera focus to target player's humanoid
                isSpectating = true  -- Set the spectating state to true
            else
                warn("Target player does not have a valid HumanoidRootPart!")
            end
        else
            warn("Player not found!")
        end
    end
})

-- Create the button to disable spectating
local DisableSpectateButton = MainTab:CreateButton({
    Name = "Disable Spectate",  -- Name of the button
    Callback = function()
        -- When the button is clicked, disable spectating
        if isSpectating then
            Camera.CameraSubject = LocalPlayer.Character:WaitForChild("Humanoid") -- Reset to the local player's humanoid
            isSpectating = false
            currentTarget = nil
        else
            warn("You are not spectating anyone!")
        end
    end,
})

-- **Reset Camera when player respawns**
LocalPlayer.CharacterAdded:Connect(function()
    wait(0.5) -- Wait to ensure the character loads properly
    if not isSpectating then
        Camera.CameraSubject = LocalPlayer.Character:WaitForChild("Humanoid") -- Reset to the local player's humanoid if not spectating
    end
end)

local TrollingTab = Window:CreateTab("🤡 Trolling", nil) -- Title, Image

local KillAllButton = TrollingTab:CreateButton({
    Name = "Kill All",  -- Name of the button
    Callback = function()
        -- When the button is clicked, kill all players
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                humanoid.Health = 0 -- Set the health to 0 to kill the player
            end
        end
    end,
})

local Button = TrollingTab:CreateButton({
    Name = "Bring All Players",
    Callback = function()
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character

        if character and character:FindFirstChild("HumanoidRootPart") then
            local position = character.HumanoidRootPart.Position
            
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(math.random(-5,5), 3, math.random(-5,5)))
                end
            end
        end
    end,
})
