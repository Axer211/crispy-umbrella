print("AXER MUSIC LOADED SUCCESSFULLY⚜️")

-- Services
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")

--// AXER MUSIC ULTIMATE CINEMATIC INTRO

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

--// STORE DISABLED GUIS
local hiddenGuis = {}

--// HIDE ALL CORE ROBLOX UI
pcall(function()
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All,false)
end)

--// HIDE CUSTOM GAME UIS
for _,v in pairs(CoreGui:GetDescendants()) do
	if v:IsA("ScreenGui") then
		if v.Enabled == true then
			table.insert(hiddenGuis,v)
			v.Enabled = false
		end
	end
end

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AxerMusicIntro"
gui.Parent = CoreGui
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

--// BACKGROUND
local bg = Instance.new("Frame")
bg.Parent = gui
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0.25
bg.BorderSizePixel = 0
bg.ZIndex = 999999

--// BLUR
local blur = Instance.new("BlurEffect")
blur.Parent = Lighting
blur.Size = 0

TweenService:Create(
	blur,
	TweenInfo.new(1),
	{Size = 24}
):Play()

--// MAIN FRAME
local main = Instance.new("Frame")
main.Parent = bg
main.AnchorPoint = Vector2.new(0.5,0.5)
main.Position = UDim2.new(0.5,0,0.5,0)
main.Size = UDim2.new(0,340,0,190)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.BackgroundTransparency = 1
main.BorderSizePixel = 0
main.ZIndex = 9999999

--// CAPSULE SHAPE
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1,0)
corner.Parent = main

--// STROKE
local stroke = Instance.new("UIStroke")
stroke.Parent = main
stroke.Thickness = 2.5
stroke.Transparency = 1
stroke.Color = Color3.fromRGB(0,170,255)

--// GLOW
local glow = Instance.new("ImageLabel")
glow.Parent = main
glow.AnchorPoint = Vector2.new(0.5,0.5)
glow.Position = UDim2.new(0.5,0,0.5,0)
glow.Size = UDim2.new(1.12,0,1.12,0)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://5028857084"
glow.ImageColor3 = Color3.fromRGB(0,170,255)
glow.ImageTransparency = 0.88
glow.ZIndex = 9999998

--// TITLE
local title = Instance.new("TextLabel")
title.Parent = main
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,0.2,0)
title.Position = UDim2.new(0,0,0.23,0)
title.Font = Enum.Font.GothamBlack
title.Text = "AXER MUSIC"
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextStrokeTransparency = 0.5
title.TextStrokeColor3 = Color3.fromRGB(0,170,255)
title.TextTransparency = 1
title.ZIndex = 9999999

--// WELCOME
local welcome = Instance.new("TextLabel")
welcome.Parent = main
welcome.BackgroundTransparency = 1
welcome.Size = UDim2.new(1,0,0.08,0)
welcome.Position = UDim2.new(0,0,0.46,0)
welcome.Font = Enum.Font.GothamBold
welcome.Text = "WELCOME " .. string.upper(player.Name)
welcome.TextSize = 13
welcome.TextColor3 = Color3.fromRGB(0,255,170)
welcome.TextTransparency = 1
welcome.ZIndex = 9999999

--// STATUS
local status = Instance.new("TextLabel")
status.Parent = main
status.BackgroundTransparency = 1
status.Size = UDim2.new(1,0,0.08,0)
status.Position = UDim2.new(0,0,0.58,0)
status.Font = Enum.Font.GothamBold
status.Text = "SYSTEM INITIALIZING..."
status.TextSize = 12
status.TextColor3 = Color3.fromRGB(0,170,255)
status.TextTransparency = 1
status.ZIndex = 9999999

--// LOADING BG
local loadBg = Instance.new("Frame")
loadBg.Parent = main
loadBg.Size = UDim2.new(0.58,0,0,6)
loadBg.Position = UDim2.new(0.21,0,0.74,0)
loadBg.BackgroundColor3 = Color3.fromRGB(35,35,35)
loadBg.BorderSizePixel = 0
loadBg.BackgroundTransparency = 1
loadBg.ZIndex = 9999999

local loadCorner = Instance.new("UICorner")
loadCorner.CornerRadius = UDim.new(1,0)
loadCorner.Parent = loadBg

--// LOADING BAR
local loadFill = Instance.new("Frame")
loadFill.Parent = loadBg
loadFill.Size = UDim2.new(0,0,1,0)
loadFill.BackgroundColor3 = Color3.fromRGB(0,170,255)
loadFill.BorderSizePixel = 0
loadFill.BackgroundTransparency = 1
loadFill.ZIndex = 9999999

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1,0)
fillCorner.Parent = loadFill

--// PERCENT
local percent = Instance.new("TextLabel")
percent.Parent = main
percent.BackgroundTransparency = 1
percent.Size = UDim2.new(1,0,0.05,0)
percent.Position = UDim2.new(0,0,0.79,0)
percent.Font = Enum.Font.GothamBold
percent.Text = "0%"
percent.TextSize = 11
percent.TextColor3 = Color3.fromRGB(255,255,255)
percent.TextTransparency = 1
percent.ZIndex = 9999999

--// POP IN
TweenService:Create(
	main,
	TweenInfo.new(
		1,
		Enum.EasingStyle.Exponential,
		Enum.EasingDirection.Out
	),
	{
		Size = UDim2.new(0,420,0,240),
		BackgroundTransparency = 0.18
	}
):Play()

TweenService:Create(
	stroke,
	TweenInfo.new(1),
	{Transparency = 0}
):Play()

task.wait(0.8)

--// FADE IN
TweenService:Create(title,TweenInfo.new(1),{
	TextTransparency = 0
}):Play()

TweenService:Create(welcome,TweenInfo.new(1),{
	TextTransparency = 0
}):Play()

TweenService:Create(status,TweenInfo.new(1),{
	TextTransparency = 0
}):Play()

TweenService:Create(percent,TweenInfo.new(1),{
	TextTransparency = 0
}):Play()

TweenService:Create(loadBg,TweenInfo.new(1),{
	BackgroundTransparency = 0
}):Play()

--// FLOAT EFFECT
task.spawn(function()
	while gui.Parent do
		TweenService:Create(
			main,
			TweenInfo.new(2),
			{
				Position = UDim2.new(0.5,0,0.495,0)
			}
		):Play()
		task.wait(2)
		TweenService:Create(
			main,
			TweenInfo.new(2),
			{
				Position = UDim2.new(0.5,0,0.5,0)
			}
		):Play()
		task.wait(2)
	end
end)

--// GLOW LOOP
task.spawn(function()
	while gui.Parent do
		TweenService:Create(
			glow,
			TweenInfo.new(1.2),
			{
				ImageTransparency = 0.82
			}
		):Play()
		task.wait(1.2)
		TweenService:Create(
			glow,
			TweenInfo.new(1.2),
			{
				ImageTransparency = 0.9
			}
		):Play()
		task.wait(1.2)
	end
end)

--// LOADING
for i = 1,100 do
	loadFill:TweenSize(
		UDim2.new(i/100,0,1,0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Linear,
		0.03,
		true
	)
	loadFill.BackgroundTransparency = 0.9 - ((i/100) * 0.75)
	percent.Text = i .. "%"
	if i < 30 then
		status.Text = "SYSTEM INITIALIZING..."
	elseif i < 60 then
		status.Text = "LOADING MODULES..."
	elseif i < 90 then
		status.Text = "VERIFYING SYSTEM..."
	else
		status.Text = "FINALIZING..."
	end
	task.wait(0.03)
end

status.Text = "LOADED SUCCESSFULLY"
task.wait(1)

--// FADE OUT EVERYTHING TOGETHER
TweenService:Create(bg,TweenInfo.new(1.5),{
	BackgroundTransparency = 1
}):Play()

TweenService:Create(main,TweenInfo.new(1.5),{
	BackgroundTransparency = 1
}):Play()

TweenService:Create(stroke,TweenInfo.new(1.5),{
	Transparency = 1
}):Play()

TweenService:Create(title,TweenInfo.new(1.5),{
	TextTransparency = 1
}):Play()

TweenService:Create(welcome,TweenInfo.new(1.5),{
	TextTransparency = 1
}):Play()

TweenService:Create(status,TweenInfo.new(1.5),{
	TextTransparency = 1
}):Play()

TweenService:Create(percent,TweenInfo.new(1.5),{
	TextTransparency = 1
}):Play()

TweenService:Create(loadBg,TweenInfo.new(1.5),{
	BackgroundTransparency = 1
}):Play()

TweenService:Create(loadFill,TweenInfo.new(1.5),{
	BackgroundTransparency = 1
}):Play()

TweenService:Create(glow,TweenInfo.new(1.5),{
	ImageTransparency = 1
}):Play()

TweenService:Create(blur,TweenInfo.new(1.5),{
	Size = 0
}):Play()

task.wait(1.6)

--// RESTORE ROBLOX UI
pcall(function()
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All,true)
end)

--// RESTORE CUSTOM GAME UIS
for _,v in pairs(hiddenGuis) do
	if v and v.Parent then
		v.Enabled = true
	end
end

--// CLEANUP
blur:Destroy()
gui:Destroy()

local LocalPlayer = Players.LocalPlayer

local RE = ReplicatedStorage:FindFirstChild("RE")
local Remote = RE and RE:FindFirstChild("1RPNam1eTex1t")
local RemoteColor = RE and RE:FindFirstChild("1RPNam1eColo1r")

local RP_SETTINGS = {
    NAME_TEXT = "🎶卂乂乇尺  爪凵丂工匚  卄凵乃🎶",
    BIO_TEXT = "ᴡᴇʟᴄᴏᴍᴇ ᴅᴇᴀʀ " .. LocalPlayer.DisplayName
}

local function AutoFillRP()
    if Remote then
        Remote:FireServer("RolePlayName", RP_SETTINGS.NAME_TEXT, Color3.new(1,1,1))
        Remote:FireServer("RolePlayBio", RP_SETTINGS.BIO_TEXT, Color3.new(1,1,1))
    end
end

task.spawn(function()
    task.wait(1)
    AutoFillRP()
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if RemoteColor then
            local c = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            RemoteColor:FireServer("PickingRPNameColor", c)
            RemoteColor:FireServer("PickingRPBioColor", c)
        end
    end
end)

-- Auto Chat Message on Load
task.spawn(function()
    task.wait(0.5)
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync("⚜️AXER MUSIC LOADED⚜️") end
        else
            local sayEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
            if sayEvent and sayEvent:FindFirstChild("SayMessageRequest") then
                sayEvent.SayMessageRequest:FireServer("⚜️AXER MUSIC LOADED⚜️", "All")
            end
        end
    end)
end)

if CoreGui:FindFirstChild("AxerMusicV1") then
    CoreGui:FindFirstChild("AxerMusicV1"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AxerMusicV1"
ScreenGui.Parent = CoreGui
ScreenGui.DisplayOrder = 999

local Blur = Instance.new("BlurEffect")
Blur.Name = "AxerBlur"
Blur.Size = 10
Blur.Parent = game:GetService("Lighting")

task.delay(0.1, function()
    TweenService:Create(Blur, TweenInfo.new(0.4), { Size = 12 }):Play()
end)

-- #############################################
-- #####  ICE FROSTY GLASSY GUI – SMALLER  #####
-- #############################################

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 420, 0, 320)
Main.Position = UDim2.new(0.5, -210, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(230, 245, 255)
Main.BackgroundTransparency = 0.12
Main.BorderSizePixel = 0
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

-- Frosty strokes
local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromRGB(176, 224, 255)
MainStroke.Transparency = 0.15
MainStroke.Parent = Main
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.LineJoinMode = Enum.LineJoinMode.Round

local GlowStroke = Instance.new("UIStroke")
GlowStroke.Thickness = 4
GlowStroke.Transparency = 0.5
GlowStroke.Color = Color3.fromRGB(176, 224, 255)
GlowStroke.Parent = Main
GlowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
GlowStroke.LineJoinMode = Enum.LineJoinMode.Round

-- Particles (icy)
local ParticleFrame = Instance.new("Frame")
ParticleFrame.Size = UDim2.new(1, 0, 1, 0)
ParticleFrame.BackgroundTransparency = 1
ParticleFrame.ClipsDescendants = true
ParticleFrame.ZIndex = 0
ParticleFrame.Parent = Main
Instance.new("UICorner", ParticleFrame).CornerRadius = UDim.new(0, 14)

task.spawn(function()
    while task.wait(0.4) do
        if not ParticleFrame.Parent then break end
        local particle = Instance.new("Frame")
        local size = math.random(2, 4)
        particle.Size = UDim2.new(0, size, 0, size)
        particle.Position = UDim2.new(math.random(0, 100)/100, 0, 1, 0)
        particle.BackgroundColor3 = Color3.fromRGB(180, 230, 255)
        particle.BackgroundTransparency = math.random(3, 7) / 10
        particle.BorderSizePixel = 0
        particle.ZIndex = 0
        Instance.new("UICorner", particle).CornerRadius = UDim.new(1, 0)
        particle.Parent = ParticleFrame
        local floatDuration = math.random(4, 7)
        local drift = (math.random(-10, 10) / 100)
        local tween = TweenService:Create(particle, TweenInfo.new(floatDuration, Enum.EasingStyle.Linear), {
            Position = UDim2.new(particle.Position.X.Scale + drift, 0, -0.1, 0),
            BackgroundTransparency = 1
        })
        tween:Play()
        tween.Completed:Connect(function() particle:Destroy() end)
    end
end)

-- Popup (confirm close)
local Popup = Instance.new("Frame")
Popup.Size = UDim2.new(1, 0, 1, 0)
Popup.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Popup.BackgroundTransparency = 0.05
Popup.Visible = false
Popup.ZIndex = 50
Popup.Parent = Main
Instance.new("UICorner", Popup).CornerRadius = UDim.new(0, 14)

local PopupText = Instance.new("TextLabel")
PopupText.Size = UDim2.new(1, -20, 0, 40)
PopupText.Position = UDim2.new(0, 10, 0.5, -40)
PopupText.BackgroundTransparency = 1
PopupText.Text = "Are you sure you want to close Axer Music?"
PopupText.TextColor3 = Color3.fromRGB(0, 0, 0)
PopupText.Font = Enum.Font.GothamSemibold
PopupText.TextSize = 12
PopupText.TextWrapped = true
PopupText.ZIndex = 51
PopupText.Parent = Popup

local YesBtn = Instance.new("TextButton")
YesBtn.Size = UDim2.new(0, 80, 0, 25)
YesBtn.Position = UDim2.new(0.5, -85, 0.5, 10)
YesBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
YesBtn.Text = "Yes"
YesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YesBtn.Font = Enum.Font.GothamBold
YesBtn.TextSize = 11
YesBtn.ZIndex = 51
YesBtn.Parent = Popup
Instance.new("UICorner", YesBtn).CornerRadius = UDim.new(0, 4)

local NoBtn = Instance.new("TextButton")
NoBtn.Size = UDim2.new(0, 80, 0, 25)
NoBtn.Position = UDim2.new(0.5, 5, 0.5, 10)
NoBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
NoBtn.Text = "No"
NoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoBtn.Font = Enum.Font.GothamBold
NoBtn.TextSize = 11
NoBtn.ZIndex = 51
NoBtn.Parent = Popup
Instance.new("UICorner", NoBtn).CornerRadius = UDim.new(0, 4)

YesBtn.MouseButton1Click:Connect(function()
    TweenService:Create(Blur, TweenInfo.new(0.25), { Size = 0 }):Play()
    task.delay(0.3, function()
        if Blur then Blur:Destroy() end
        ScreenGui:Destroy()
    end)
end)
NoBtn.MouseButton1Click:Connect(function() Popup.Visible = false end)

-- #####  MINIMIZER ICON – LARGER, VISIBLE ONLY WHEN GUI HIDDEN  #####
local MinimizedIcon = Instance.new("TextButton")
MinimizedIcon.Size = UDim2.new(0, 50, 0, 50)   -- larger
MinimizedIcon.Position = UDim2.new(1, -60, 0, 10)
MinimizedIcon.BackgroundColor3 = Color3.fromRGB(176, 224, 255)
MinimizedIcon.Text = ""
MinimizedIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizedIcon.Font = Enum.Font.GothamBold
MinimizedIcon.TextSize = 20
MinimizedIcon.Visible = false   -- hidden when GUI is open
MinimizedIcon.ZIndex = 100
MinimizedIcon.Parent = ScreenGui

local strokeIcon = Instance.new("UIStroke")
strokeIcon.Thickness = 2
strokeIcon.Color = Color3.fromRGB(176, 224, 255)
strokeIcon.Parent = MinimizedIcon
Instance.new("UICorner", MinimizedIcon).CornerRadius = UDim.new(1, 0)

local IconImage = Instance.new("ImageLabel")
IconImage.Parent = MinimizedIcon
IconImage.Size = UDim2.new(1, -6, 1, -6)
IconImage.Position = UDim2.new(0, 3, 0, 3)
IconImage.BackgroundTransparency = 1
IconImage.Image = "rbxassetid://121213068544360"
IconImage.ScaleType = Enum.ScaleType.Fit
IconImage.ZIndex = 101

-- #############################################
-- #####  HEADER & HORIZONTAL TAB BAR  #####
-- #############################################

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 28)
Header.BackgroundTransparency = 1
Header.ZIndex = 5
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.4, 0, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "❄️ AXER MUSIC"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 13
Title.ZIndex = 5
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Minimize Button (added back)
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 22, 0, 22)
MinimizeBtn.Position = UDim2.new(1, -50, 0, 3)   -- next to close
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 50)
MinimizeBtn.Text = "−"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 16
MinimizeBtn.ZIndex = 5
MinimizeBtn.Parent = Header
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 4)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Position = UDim2.new(1, -26, 0, 3)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 12
CloseBtn.ZIndex = 5
CloseBtn.Parent = Header
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)
CloseBtn.MouseButton1Click:Connect(function() Popup.Visible = true end)

-- Horizontal Tab Bar
local TabBar = Instance.new("ScrollingFrame")
TabBar.Size = UDim2.new(1, -10, 0, 28)
TabBar.Position = UDim2.new(0, 5, 0, 32)
TabBar.BackgroundTransparency = 1
TabBar.ScrollBarThickness = 2
TabBar.AutomaticCanvasSize = Enum.AutomaticSize.X
TabBar.CanvasSize = UDim2.new(0, 0, 0, 0)
TabBar.ZIndex = 4
TabBar.Parent = Main

local TabLayout = Instance.new("UIListLayout")
TabLayout.Padding = UDim.new(0, 4)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Parent = TabBar

-- Content Area (pages container with clipping)
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -10, 1, -68)
ContentArea.Position = UDim2.new(0, 5, 0, 64)
ContentArea.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ContentArea.BackgroundTransparency = 0.1
ContentArea.ClipsDescendants = true   -- to hide sliding pages
ContentArea.ZIndex = 2
ContentArea.Parent = Main
Instance.new("UICorner", ContentArea).CornerRadius = UDim.new(0, 10)

-- Click animation
local function applyClickAnimation(btn)
    local originalSize = btn.Size
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset - 2, originalSize.Y.Scale, originalSize.Y.Offset - 2)}):Play()
        end
    end)
    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            TweenService:Create(btn, TweenInfo.new(0.1), {Size = originalSize}):Play()
        end
    end)
end

-- Drag logic for main window
local dragging, dragInput, dragStart, startPos
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Drag for minimized icon
local draggingIcon, dragInputIcon, dragStartIcon, startPosIcon
MinimizedIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingIcon = true
        dragStartIcon = input.Position
        startPosIcon = MinimizedIcon.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingIcon = false
            end
        end)
    end
end)
MinimizedIcon.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInputIcon = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInputIcon and draggingIcon then
        local delta = input.Position - dragStartIcon
        MinimizedIcon.Position = UDim2.new(
            startPosIcon.X.Scale,
            startPosIcon.X.Offset + delta.X,
            startPosIcon.Y.Scale,
            startPosIcon.Y.Offset + delta.Y
        )
    end
end)

-- #############################################
-- #####  TAB SYSTEM WITH SLIDE ANIMATION  #####
-- #############################################

local activeContent = nil
local slideDuration = 0.3

local function createTab(name, isFirst)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 70, 0, 24)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 60, 80)
    Btn.BackgroundTransparency = isFirst and 0.2 or 0.8
    Btn.Text = name
    Btn.TextColor3 = isFirst and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(80, 80, 80)
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextSize = 10
    Btn.ZIndex = 4
    Btn.Parent = TabBar
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 12)
    applyClickAnimation(Btn)

    local Page = Instance.new("Frame")
    Page.Size = UDim2.new(1, 0, 1, 0)   -- fill content area
    Page.Position = UDim2.new(1, 0, 0, 0)   -- start offscreen right (for slide in)
    Page.BackgroundTransparency = 1
    Page.Visible = true   -- we control visibility via position
    Page.ZIndex = 3
    Page.Parent = ContentArea

    if isFirst then
        Page.Position = UDim2.new(0, 0, 0, 0)   -- visible
        activeContent = Page
    end

    Btn.MouseButton1Click:Connect(function()
        if activeContent == Page then return end
        -- Animate current page out to left
        if activeContent then
            TweenService:Create(activeContent, TweenInfo.new(slideDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Position = UDim2.new(-1, 0, 0, 0)
            }):Play()
        end
        -- Animate new page in from right
        Page.Position = UDim2.new(1, 0, 0, 0)   -- reset to right
        TweenService:Create(Page, TweenInfo.new(slideDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Position = UDim2.new(0, 0, 0, 0)
        }):Play()
        activeContent = Page

        -- Update tab button styles
        for _, child in pairs(TabBar:GetChildren()) do
            if child:IsA("TextButton") then
                TweenService:Create(child, TweenInfo.new(0.2), {BackgroundTransparency = 0.8, TextColor3 = Color3.fromRGB(80, 80, 80)}):Play()
            end
        end
        TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.2, TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
    end)
    return Page
end

local VehiclePage = createTab("🚗", true)
local HitsPage = createTab("HITS", false)
local HindiPage = createTab("HINDI", false)
local RapsPage = createTab("RAPS", false)
local BhojpuriPage = createTab("BHOJP", false)
local PhonkPage = createTab("PHONK", false)
local MultiPage = createTab("MULTI", false)
local SoundsPage = createTab("SOUNDS", false)
local SavedPage = createTab("SAVED", false)
local ShufflePage = createTab("🎲", false)
local PropsPage = createTab("PROPS", false)
local ProtectionPage = createTab("🛡️", false)

-- #############################################
-- #####  MUSIC BACKEND (unchanged)  #####
-- #############################################

local RE = ReplicatedStorage:FindFirstChild("RE") or ReplicatedStorage:WaitForChild("RE", 5)
local VehicleRemote = RE and RE:FindFirstChild("1NoMoto1rVehicle1s")
local ClearRemote = RE and RE:FindFirstChild("1Clea1rTool1s")
local RGBEnabled = false
local SelectedVehicle = "SegwaySmall"

local SavedPlaylist = {}
local MaxSavedSongs = 30
local SaveFileName = "AxerMusicPlaylist.json"

local function LoadSavedPlaylist()
    pcall(function()
        if readfile and isfile and isfile(SaveFileName) then
            local data = readfile(SaveFileName)
            local decoded = HttpService:JSONDecode(data)
            if decoded and type(decoded) == "table" then
                SavedPlaylist = decoded
            end
        end
    end)
end

local function SavePlaylistToFile()
    pcall(function()
        if writefile then
            local encoded = HttpService:JSONEncode(SavedPlaylist)
            writefile(SaveFileName, encoded)
        end
    end)
end

LoadSavedPlaylist()

local function SetVehicleSpeed()
    task.spawn(function()
        pcall(function()
            local RS = ReplicatedStorage
            local GetSpeed, SetSpeed
            if RS:FindFirstChild("Remotes") then
                GetSpeed = RS.Remotes:FindFirstChild("GetNoMotorVehicleSpeed")
                SetSpeed = RS.Remotes:FindFirstChild("SetNoMotorVehicleSpeed")
            elseif RS:FindFirstChild("RE") then
                GetSpeed = RS.RE:FindFirstChild("GetNoMotorVehicleSpeed")
                SetSpeed = RS.RE:FindFirstChild("SetNoMotorVehicleSpeed")
            end
            if GetSpeed and SetSpeed then
                GetSpeed:InvokeServer()
                SetSpeed:InvokeServer(25)
            end
        end)
    end)
end

local function ForcePlayMusic(Remote, ID)
    if not Remote or ID == "" then return end
    Remote:FireServer("PickingScooterMusicText", ID, nil, true)
    Remote:FireServer("PickingScooterMusicText", ID)
    Remote:FireServer("PickingScooterMusicText", tonumber(ID), nil, true)
end

local function StartRGBLoop()
    if RGBEnabled then return end
    RGBEnabled = true
    task.spawn(function()
        local CarRemote = RE and RE:FindFirstChild("1Player1sCa1r")
        while RGBEnabled and task.wait(0.1) do
            local c = Color3.fromHSV(tick()%5/5, 1, 1)
            if CarRemote then CarRemote:FireServer("NoMotorColor", c) end
            pcall(function()
                Players.LocalPlayer.PlayerGui.MainGUIHandler.NoMotorVehicleControl.NoMotorColorPicks.SetColor:FireServer(c)
            end)
        end
    end)
end

local function SmartPlayMusic(id, vehicleType, useRGB)
    if not VehicleRemote or not ClearRemote then return end
    task.spawn(function()
        RGBEnabled = false
        VehicleRemote:FireServer("Delete NoMotorVehicle")
        task.wait(0.1)
        ClearRemote:FireServer("ClearAllTools")
        task.wait(0.15)
        SetVehicleSpeed()
        VehicleRemote:FireServer(vehicleType)
        task.wait(1.0)
        if useRGB then StartRGBLoop() end
        ForcePlayMusic(VehicleRemote, id)
    end)
end

local function StopMusic()
    RGBEnabled = false
    if VehicleRemote then VehicleRemote:FireServer("Delete NoMotorVehicle") end
    task.spawn(function()
        task.wait(0.1)
        if ClearRemote then ClearRemote:FireServer("ClearAllTools") end
    end)
end

-- #############################################
-- #####  PROTECTION ENGINE (unchanged)  #####
-- #############################################

local ProtectionStates = {
    AntiSit = false, Noclip = false, SuperNoclip = false, AntiFling = false, Freeze = false
}
local Cons = {}

local function toggleProtection(feature, state)
    ProtectionStates[feature] = state
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if Cons[feature] then Cons[feature]:Disconnect(); Cons[feature] = nil end
    if feature == "AntiSit" and state then
        if hum and hum.Sit then hum.Sit = false end
        Cons.AntiSit = RunService.Stepped:Connect(function()
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChildOfClass("Humanoid")
            if h and h.Sit then h.Sit = false end
        end)
    elseif feature == "Noclip" and state then
        Cons.Noclip = RunService.Stepped:Connect(function()
            if LocalPlayer.Character then
                for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then
                        if not string.find(v.Name:lower(), "leg") and not string.find(v.Name:lower(), "foot") then
                            v.CanCollide = false
                        end
                    end
                end
            end
        end)
    elseif feature == "SuperNoclip" and state then
        Cons.SuperNoclip = RunService.Stepped:Connect(function()
            if LocalPlayer.Character then
                for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then
                        v.CanCollide = false
                    end
                end
            end
        end)
    elseif feature == "AntiFling" and state then
        Cons.AntiFling = RunService.Stepped:Connect(function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    for _, v in pairs(p.Character:GetDescendants()) do
                        if v:IsA("BasePart") then v.CanCollide = false end
                    end
                end
            end
            local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myRoot and (myRoot.Velocity.Magnitude > 250 or myRoot.RotVelocity.Magnitude > 250) then
                myRoot.Velocity = Vector3.new(0, 0, 0)
                myRoot.RotVelocity = Vector3.new(0, 0, 0)
            end
        end)
    elseif feature == "Freeze" then
        if root then root.Anchored = state end
        if state then
            Cons.Freeze = LocalPlayer.CharacterAdded:Connect(function(newChar)
                local newRoot = newChar:WaitForChild("HumanoidRootPart", 5)
                if newRoot then newRoot.Anchored = true end
            end)
        end
    end
end

-- #############################################
-- #####  PROPS BACKEND (unchanged)  #####
-- #############################################

local activeMode = "None"
local engineLoopActive = false
local currentVis = "Orbital"

local function getMyProps()
    local props = {}
    local wsCom = Workspace:FindFirstChild("WorkspaceCom")
    if wsCom then
        for _, item in pairs(wsCom:GetDescendants()) do
            if item:IsA("Model") and item.Name == "Prop" .. LocalPlayer.Name then
                if item:FindFirstChild("SetCurrentCFrame") then
                    table.insert(props, item)
                end
            end
        end
    end
    return props
end

local function getTargetRoot(targetName)
    if targetName == "Self" then
        return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    else
        local p = Players:FindFirstChild(targetName)
        if p and p.Character then
            return p.Character:FindFirstChild("HumanoidRootPart")
        end
    end
    return nil
end

local function stopPropEngine()
    activeMode = "None"
    engineLoopActive = false
end

local function startPropEngine(mode, targetName, visType)
    stopPropEngine()
    task.wait(0.1)
    activeMode = mode
    engineLoopActive = true
    task.spawn(function()
        while engineLoopActive do
            local root = getTargetRoot(targetName)
            local props = getMyProps()
            if root and #props > 0 then
                local t = tick()
                for i, prop in ipairs(props) do
                    task.spawn(function()
                        local baseCFrame = root.CFrame
                        local finalCFrame = baseCFrame
                        local color = Color3.fromHSV((t * 0.5 + (i/#props)) % 1, 1, 1)
                        if activeMode == "Nuke" then
                            finalCFrame = baseCFrame * CFrame.new(math.random(-2,2), math.random(0,3), math.random(-2,2)) * CFrame.Angles(math.random(), math.random(), math.random())
                        elseif activeMode == "Visualizer" then
                            if visType == "Orbital" then
                                local angle = (t * 3) + ((i / #props) * math.pi * 2)
                                finalCFrame = baseCFrame * CFrame.new(math.cos(angle) * 6, 0, math.sin(angle) * 6)
                            elseif visType == "Tornado" then
                                local angle = (t * 5) + ((i / #props) * math.pi * 2)
                                local heightOffset = (i / #props) * 12
                                local radius = 2 + (i / #props) * 5
                                finalCFrame = baseCFrame * CFrame.new(math.cos(angle) * radius, heightOffset - 4, math.sin(angle) * radius)
                            elseif visType == "Swarm" then
                                local offsetX = math.noise(t, i, 0) * 8
                                local offsetY = math.noise(t, 0, i) * 6
                                local offsetZ = math.noise(0, t, i) * 8
                                finalCFrame = baseCFrame * CFrame.new(offsetX, offsetY + 2, offsetZ)
                            elseif visType == "Grid" then
                                local spacing = 5
                                local cols = math.ceil(math.sqrt(#props))
                                local row = math.floor((i-1) / cols)
                                local col = (i-1) % cols
                                finalCFrame = baseCFrame * CFrame.new((col - cols/2)*spacing, 0, (row - cols/2)*spacing)
                            end
                        end
                        pcall(function()
                            prop.SetCurrentCFrame:InvokeServer(finalCFrame)
                            if prop:FindFirstChild("ChangePropColor") then
                                prop.ChangePropColor:InvokeServer(color)
                            end
                        end)
                    end)
                end
            end
            task.wait(0.08)
        end
    end)
end

-- #############################################
-- #####  VEHICLE TAB  #####
-- #############################################

local function buildVehicleUI(parentFrame)
    local IDBox = Instance.new("TextBox")
    IDBox.Size = UDim2.new(1, 0, 0, 24)
    IDBox.Position = UDim2.new(0, 0, 0, 5)
    IDBox.BackgroundColor3 = Color3.fromRGB(220, 235, 245)
    IDBox.PlaceholderText = "Enter Audio ID..."
    IDBox.Text = ""
    IDBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    IDBox.Font = Enum.Font.Gotham
    IDBox.TextSize = 11
    IDBox.ClearTextOnFocus = true
    IDBox.ZIndex = 4
    IDBox.Parent = parentFrame
    Instance.new("UICorner", IDBox).CornerRadius = UDim.new(0, 4)

    local VehicleLabel = Instance.new("TextLabel")
    VehicleLabel.Size = UDim2.new(1, 0, 0, 18)
    VehicleLabel.Position = UDim2.new(0, 0, 0, 34)
    VehicleLabel.BackgroundTransparency = 1
    VehicleLabel.Text = "Select Vehicle:"
    VehicleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    VehicleLabel.Font = Enum.Font.Gotham
    VehicleLabel.TextSize = 10
    VehicleLabel.ZIndex = 4
    VehicleLabel.Parent = parentFrame

    local SkateBtn = Instance.new("TextButton")
    SkateBtn.Size = UDim2.new(0.48, 0, 0, 22)
    SkateBtn.Position = UDim2.new(0, 0, 0, 54)
    SkateBtn.BackgroundColor3 = SelectedVehicle == "SkateBoard" and Color3.fromRGB(0, 180, 80) or Color3.fromRGB(35, 40, 50)
    SkateBtn.Text = "Skateboard"
    SkateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SkateBtn.Font = Enum.Font.GothamBold
    SkateBtn.TextSize = 9
    SkateBtn.ZIndex = 4
    SkateBtn.Parent = parentFrame
    Instance.new("UICorner", SkateBtn).CornerRadius = UDim.new(0, 4)

    local HoverBtn = Instance.new("TextButton")
    HoverBtn.Size = UDim2.new(0.48, 0, 0, 22)
    HoverBtn.Position = UDim2.new(0.52, 0, 0, 54)
    HoverBtn.BackgroundColor3 = SelectedVehicle == "SegwaySmall" and Color3.fromRGB(0, 180, 80) or Color3.fromRGB(35, 40, 50)
    HoverBtn.Text = "Hoverboard"
    HoverBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    HoverBtn.Font = Enum.Font.GothamBold
    HoverBtn.TextSize = 9
    HoverBtn.ZIndex = 4
    HoverBtn.Parent = parentFrame
    Instance.new("UICorner", HoverBtn).CornerRadius = UDim.new(0, 4)

    SkateBtn.MouseButton1Click:Connect(function()
        SelectedVehicle = "SkateBoard"
        SkateBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        HoverBtn.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
    end)
    HoverBtn.MouseButton1Click:Connect(function()
        SelectedVehicle = "SegwaySmall"
        HoverBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        SkateBtn.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
    end)

    local ScrollList = Instance.new("ScrollingFrame")
    ScrollList.Size = UDim2.new(1, 0, 1, -85)
    ScrollList.Position = UDim2.new(0, 0, 0, 82)
    ScrollList.BackgroundTransparency = 1
    ScrollList.BorderSizePixel = 0
    ScrollList.ScrollBarThickness = 2
    ScrollList.ZIndex = 4
    ScrollList.Parent = parentFrame
    Instance.new("UIListLayout", ScrollList).Padding = UDim.new(0, 4)

    local function makeBtn(text, color, useRGB)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(1, -5, 0, 24)
        Btn.BackgroundColor3 = color
        Btn.Text = text
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Btn.Font = Enum.Font.GothamBold
        Btn.TextSize = 10
        Btn.ZIndex = 4
        Btn.Parent = ScrollList
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
        Btn.MouseButton1Click:Connect(function()
            SmartPlayMusic(IDBox.Text, SelectedVehicle, useRGB)
        end)
    end

    makeBtn("Play Music", Color3.fromRGB(0, 120, 255), false)
    makeBtn("Play with RGB", Color3.fromRGB(150, 50, 255), true)

    local StopBtn = Instance.new("TextButton")
    StopBtn.Size = UDim2.new(1, -5, 0, 24)
    StopBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    StopBtn.Text = "Stop Music"
    StopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    StopBtn.Font = Enum.Font.GothamBold
    StopBtn.TextSize = 10
    StopBtn.ZIndex = 4
    StopBtn.Parent = ScrollList
    Instance.new("UICorner", StopBtn).CornerRadius = UDim.new(0, 4)
    StopBtn.MouseButton1Click:Connect(StopMusic)

    ScrollList.CanvasSize = UDim2.new(0, 0, 0, 100)
end

-- #############################################
-- #####  MUSIC TAB BUILDER (smart save)  #####
-- #############################################

local function buildMusicTab(parentFrame, songList)
    local SearchBox = Instance.new("TextBox")
    SearchBox.Size = UDim2.new(1, 0, 0, 24)
    SearchBox.Position = UDim2.new(0, 0, 0, 5)
    SearchBox.BackgroundColor3 = Color3.fromRGB(220, 235, 245)
    SearchBox.PlaceholderText = "🔍 Search..."
    SearchBox.Text = ""
    SearchBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.TextSize = 11
    SearchBox.ClearTextOnFocus = false
    SearchBox.ZIndex = 4
    SearchBox.Parent = parentFrame
    Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0, 4)

    local ScrollList = Instance.new("ScrollingFrame")
    ScrollList.Size = UDim2.new(1, 0, 1, -38)
    ScrollList.Position = UDim2.new(0, 0, 0, 34)
    ScrollList.BackgroundTransparency = 1
    ScrollList.BorderSizePixel = 0
    ScrollList.ScrollBarThickness = 3
    ScrollList.ZIndex = 4
    ScrollList.Parent = parentFrame
    Instance.new("UIListLayout", ScrollList).Padding = UDim.new(0, 4)

    local uiItems = {}

    local function CreateSongEntry(name, id)
        local Entry = Instance.new("Frame")
        Entry.Size = UDim2.new(1, -5, 0, 28)
        Entry.BackgroundColor3 = Color3.fromRGB(230, 240, 250)
        Entry.BackgroundTransparency = 0.2
        Entry.ZIndex = 4
        Entry.Parent = ScrollList
        Instance.new("UICorner", Entry).CornerRadius = UDim.new(0, 4)
        table.insert(uiItems, {frame = Entry, name = string.lower(name)})

        local NameLbl = Instance.new("TextLabel")
        NameLbl.Size = UDim2.new(0.45, 0, 1, 0)
        NameLbl.Position = UDim2.new(0, 5, 0, 0)
        NameLbl.BackgroundTransparency = 1
        NameLbl.Text = name
        NameLbl.TextColor3 = Color3.fromRGB(0, 0, 0)
        NameLbl.Font = Enum.Font.Gotham
        NameLbl.TextSize = 9
        NameLbl.TextXAlignment = Enum.TextXAlignment.Left
        NameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        NameLbl.ZIndex = 5
        NameLbl.Parent = Entry

        local IdLbl = Instance.new("TextLabel")
        IdLbl.Size = UDim2.new(0.25, 0, 1, 0)
        IdLbl.Position = UDim2.new(0.45, 0, 0, 0)
        IdLbl.BackgroundTransparency = 1
        IdLbl.Text = "ID:" .. tostring(id)
        IdLbl.TextColor3 = Color3.fromRGB(0, 80, 0)
        IdLbl.Font = Enum.Font.Gotham
        IdLbl.TextSize = 8
        IdLbl.TextXAlignment = Enum.TextXAlignment.Left
        IdLbl.ZIndex = 5
        IdLbl.Parent = Entry

        local PlayBtn = Instance.new("TextButton")
        PlayBtn.Size = UDim2.new(0, 22, 0, 18)
        PlayBtn.Position = UDim2.new(1, -52, 0.5, -9)
        PlayBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 50)
        PlayBtn.Text = "▶"
        PlayBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        PlayBtn.Font = Enum.Font.GothamBold
        PlayBtn.TextSize = 10
        PlayBtn.ZIndex = 5
        PlayBtn.Parent = Entry
        Instance.new("UICorner", PlayBtn).CornerRadius = UDim.new(0, 4)

        local SaveBtn = Instance.new("TextButton")
        SaveBtn.Size = UDim2.new(0, 22, 0, 18)
        SaveBtn.Position = UDim2.new(1, -28, 0.5, -9)
        local alreadySaved = false
        for _, s in ipairs(SavedPlaylist) do
            if tostring(s.id) == tostring(id) then
                alreadySaved = true
                break
            end
        end
        if alreadySaved then
            SaveBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 80)
            SaveBtn.Text = "✔️"
            SaveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            SaveBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
            SaveBtn.Text = "💾"
            SaveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        SaveBtn.Font = Enum.Font.GothamBold
        SaveBtn.TextSize = 10
        SaveBtn.ZIndex = 5
        SaveBtn.Parent = Entry
        Instance.new("UICorner", SaveBtn).CornerRadius = UDim.new(0, 4)

        PlayBtn.MouseButton1Click:Connect(function()
            local char = LocalPlayer.Character
            local alreadyOnVehicle = false
            if char then
                for _, v in pairs(char:GetChildren()) do
                    if v.Name == "SegwaySmall" or v.Name == "SkateBoard" then
                        alreadyOnVehicle = true
                        break
                    end
                end
            end
            if alreadyOnVehicle then
                if VehicleRemote then
                    StartRGBLoop()
                    ForcePlayMusic(VehicleRemote, tostring(id))
                end
            else
                SmartPlayMusic(tostring(id), SelectedVehicle, false)
            end
        end)

        SaveBtn.MouseButton1Click:Connect(function()
            local exists = false
            for _, s in ipairs(SavedPlaylist) do
                if tostring(s.id) == tostring(id) then
                    exists = true
                    break
                end
            end
            if not exists and #SavedPlaylist < MaxSavedSongs then
                table.insert(SavedPlaylist, {name = name, id = tostring(id)})
                SavePlaylistToFile()
                SaveBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 80)
                SaveBtn.Text = "✔️"
                buildSavedUI(SavedPage)
            end
        end)
    end

    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = string.lower(SearchBox.Text)
        local visibleCount = 0
        for _, item in ipairs(uiItems) do
            if searchText == "" or string.find(item.name, searchText, 1, true) then
                item.frame.Visible = true
                visibleCount = visibleCount + 1
            else
                item.frame.Visible = false
            end
        end
        ScrollList.CanvasSize = UDim2.new(0, 0, 0, visibleCount * 32)
    end)

    for _, song in ipairs(songList) do
        CreateSongEntry(song[1], song[2])
    end
    ScrollList.CanvasSize = UDim2.new(0, 0, 0, #songList * 32)
end

-- #############################################
-- #####  SAVED PLAYLIST UI  #####
-- #############################################

function buildSavedUI(parentFrame)
    for _, child in pairs(parentFrame:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("TextBox") or child:IsA("ScrollingFrame") then
            child:Destroy()
        end
    end

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 20)
    Title.Position = UDim2.new(0, 0, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = "📁 Saved Songs (" .. #SavedPlaylist .. "/" .. MaxSavedSongs .. ")"
    Title.TextColor3 = Color3.fromRGB(0, 80, 0)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 11
    Title.ZIndex = 4
    Title.Parent = parentFrame

    local ClearAllBtn = Instance.new("TextButton")
    ClearAllBtn.Size = UDim2.new(1, -10, 0, 22)
    ClearAllBtn.Position = UDim2.new(0, 5, 0, 30)
    ClearAllBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    ClearAllBtn.Text = "Clear All Saved"
    ClearAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ClearAllBtn.Font = Enum.Font.GothamBold
    ClearAllBtn.TextSize = 10
    ClearAllBtn.ZIndex = 4
    ClearAllBtn.Parent = parentFrame
    Instance.new("UICorner", ClearAllBtn).CornerRadius = UDim.new(0, 4)
    ClearAllBtn.MouseButton1Click:Connect(function()
        SavedPlaylist = {}
        SavePlaylistToFile()
        buildSavedUI(parentFrame)
    end)

    local ScrollList = Instance.new("ScrollingFrame")
    ScrollList.Size = UDim2.new(1, 0, 1, -65)
    ScrollList.Position = UDim2.new(0, 0, 0, 58)
    ScrollList.BackgroundTransparency = 1
    ScrollList.BorderSizePixel = 0
    ScrollList.ScrollBarThickness = 3
    ScrollList.ZIndex = 4
    ScrollList.Parent = parentFrame
    Instance.new("UIListLayout", ScrollList).Padding = UDim.new(0, 4)

    if #SavedPlaylist == 0 then
        local EmptyLabel = Instance.new("TextLabel")
        EmptyLabel.Size = UDim2.new(1, 0, 0, 40)
        EmptyLabel.BackgroundTransparency = 1
        EmptyLabel.Text = "No saved songs yet!\nClick 💾 on any song to save it."
        EmptyLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        EmptyLabel.Font = Enum.Font.Gotham
        EmptyLabel.TextSize = 10
        EmptyLabel.TextWrapped = true
        EmptyLabel.ZIndex = 4
        EmptyLabel.Parent = ScrollList
        ScrollList.CanvasSize = UDim2.new(0, 0, 0, 50)
        return
    end

    for i, song in ipairs(SavedPlaylist) do
        local Entry = Instance.new("Frame")
        Entry.Size = UDim2.new(1, -5, 0, 28)
        Entry.BackgroundColor3 = Color3.fromRGB(230, 240, 250)
        Entry.BackgroundTransparency = 0.2
        Entry.ZIndex = 4
        Entry.Parent = ScrollList
        Instance.new("UICorner", Entry).CornerRadius = UDim.new(0, 4)

        local NameLbl = Instance.new("TextLabel")
        NameLbl.Size = UDim2.new(0.45, 0, 1, 0)
        NameLbl.Position = UDim2.new(0, 5, 0, 0)
        NameLbl.BackgroundTransparency = 1
        NameLbl.Text = song.name
        NameLbl.TextColor3 = Color3.fromRGB(0, 0, 0)
        NameLbl.Font = Enum.Font.Gotham
        NameLbl.TextSize = 9
        NameLbl.TextXAlignment = Enum.TextXAlignment.Left
        NameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        NameLbl.ZIndex = 5
        NameLbl.Parent = Entry

        local IdLbl = Instance.new("TextLabel")
        IdLbl.Size = UDim2.new(0.25, 0, 1, 0)
        IdLbl.Position = UDim2.new(0.45, 0, 0, 0)
        IdLbl.BackgroundTransparency = 1
        IdLbl.Text = "ID:" .. song.id
        IdLbl.TextColor3 = Color3.fromRGB(0, 80, 0)
        IdLbl.Font = Enum.Font.Gotham
        IdLbl.TextSize = 8
        IdLbl.TextXAlignment = Enum.TextXAlignment.Left
        IdLbl.ZIndex = 5
        IdLbl.Parent = Entry

        local PlayBtn = Instance.new("TextButton")
        PlayBtn.Size = UDim2.new(0, 22, 0, 18)
        PlayBtn.Position = UDim2.new(1, -52, 0.5, -9)
        PlayBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 50)
        PlayBtn.Text = "▶"
        PlayBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        PlayBtn.Font = Enum.Font.GothamBold
        PlayBtn.TextSize = 10
        PlayBtn.ZIndex = 5
        PlayBtn.Parent = Entry
        Instance.new("UICorner", PlayBtn).CornerRadius = UDim.new(0, 4)

        local RemoveBtn = Instance.new("TextButton")
        RemoveBtn.Size = UDim2.new(0, 22, 0, 18)
        RemoveBtn.Position = UDim2.new(1, -28, 0.5, -9)
        RemoveBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        RemoveBtn.Text = "✕"
        RemoveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        RemoveBtn.Font = Enum.Font.GothamBold
        RemoveBtn.TextSize = 10
        RemoveBtn.ZIndex = 5
        RemoveBtn.Parent = Entry
        Instance.new("UICorner", RemoveBtn).CornerRadius = UDim.new(0, 4)

        PlayBtn.MouseButton1Click:Connect(function()
            local char = LocalPlayer.Character
            local alreadyOnVehicle = false
            if char then
                for _, v in pairs(char:GetChildren()) do
                    if v.Name == "SegwaySmall" or v.Name == "SkateBoard" then
                        alreadyOnVehicle = true
                        break
                    end
                end
            end
            if alreadyOnVehicle then
                if VehicleRemote then
                    StartRGBLoop()
                    ForcePlayMusic(VehicleRemote, song.id)
                end
            else
                SmartPlayMusic(song.id, SelectedVehicle, false)
            end
        end)

        RemoveBtn.MouseButton1Click:Connect(function()
            table.remove(SavedPlaylist, i)
            SavePlaylistToFile()
            buildSavedUI(parentFrame)
        end)
    end
    ScrollList.CanvasSize = UDim2.new(0, 0, 0, #SavedPlaylist * 32)
end

-- #############################################
-- #####  SONG LISTS (unchanged)  #####
-- #############################################

local HitsSongs = {
    {"Epstein Music", 139601415006173}, {"Macarena", 1846690636},
    {"Soft Skies & You", 140736931153864}, {"Blue Young Kai", 84729628311938}, {"Summertime Sadness", 107887768910692},
    {"Love Story", 135528953872601}, {"Mommyy", 112429422439068}, {"I Got You Baby", 115492336583856},
    {"Alone", 105512964264815}, {"Another World", 111351357978027}, {"Isekai", 131874270028720},
    {"StarsMoon", 112355709978731}, {"Meow Meow", 99034537604129}, {"Under the influence", 103222441664136},
    {"Sadness", 128159342762162}, {"Sweater Weather", 75254239320157}, {"Doraemon", 121640028060880},
    {"Baby Shark", 126462032038855}, {"So Clean", 93958751571254}, {"NoCopyrightSound", 72031945149756},
    {"LegendNeverDies", 112738519477450}, {"Thought", 87373439541502}, {"Confess You Love", 87559737835956},
    {"SetMcMn", 78631447496051}, {"The Weeknd - Blinding Lights", 1842805773}, {"Dua Lipa - Levitating", 6606223788},
    {"Harry Styles - As It Was", 8915577374}, {"Taylor Swift - Anti-Hero", 11098454532}, {"Miley Cyrus - Flowers", 12211382345},
    {"Doja Cat - Paint The Town Red", 14372520607}, {"Olivia Rodrigo - Vampire", 14019995782}, {"SZA - Kill Bill", 12046416989},
    {"Beyoncé - CUFF IT", 10131382078}, {"Sabrina Carpenter - Espresso", 16789123456},
}

local HindiSongs = {
    {"HE RANGLO", 128232876294868}, {"Akhiyan", 104380086210152}, {"Aalu Kachlu Beta", 138396893861830},
    {"Bada Pachtaoge", 79561785821029}, {"Saiyara", 110710316953203}, {"Unke Andaz Karam", 95589943778476},
    {"Hai Dill Yein Mera", 113792808283128}, {"Dhun Female", 129981117529204}, {"Manja", 83325283987770},
    {"Aaj Mangalwar Hai", 98606901625415}, {"Majisa", 91368973732735}, {"Pal Pal", 77002121761232},
    {"Nacho Saare", 108968616078928}, {"Tumse Mil Kar", 133053501453467}, {"Pyar Ka Ehsas", 105568083374120},
    {"Ladki Badi Anjani Hai", 128892246666972}, {"Dil Ne Ye Kaha", 113554906905279}, {"Gulabi Gulabi", 102924925389960},
    {"Addat", 94103203628909}, {"Naddiyaaa", 128688756073670}, {"Kabhi Kabhi", 101068303675725},
    {"Jhol", 121180010622504}, {"Maula Mere", 105017950345985}, {"Mann Mera", 140298499491642},
    {"Deewana", 88345320570909}, {"Naini Se Baan", 108734798852042}, {"Saawre", 111219978139804},
    {"Kesariya", 10059668834}, {"Apna Bana Le", 11005590115}, {"Raataan Lambiyan", 7384523412},
    {"Ranjha", 9102384756}, {"Shayad", 6521458932}, {"Tujhe Kitna Chahne Lage", 5432678901},
}

local RapsSongs = {
    {"Drake - God's Plan", 1665926924}, {"Kanye West - Stronger", 136209425}, {"Coolio - Gangsta's Paradise", 6070263388},
    {"Lil Nas X - Industry Baby", 7253841629}, {"Wiz Khalifa - Black and Yellow", 139235100}, {"A Roblox Rap", 1259050178},
    {"Polo G - RAPSTAR", 6678031214}, {"Childish Gambino - This Is America", 2062482384},
    {"Snoop Dogg - Drop It Like It's Hot", 292861322}, {"Eminem - Without Me", 6689996382},
    {"Eminem - Lose Yourself", 142297926}, {"Eminem - Rap God", 163169183}, {"Eminem - Not Afraid", 289230995},
    {"Drake - In My Feelings", 2153662828}, {"Drake - One Dance", 1102847415}, {"Kendrick Lamar - HUMBLE.", 6568276171},
    {"Travis Scott - SICKO MODE", 2153662828}, {"Post Malone - Circles", 3951656337}, {"50 Cent - In Da Club", 142305215},
    {"Cardi B - WAP", 6568276789}, {"Juice WRLD - Lucid Dreams", 289232456}, {"XXXTentacion - SAD!", 289232789},
    {"Pop Smoke - Dior", 6568279012}, {"Lil Baby - Drip Too Hard", 289233012},
}

local BhojpuriSongs = {
    {"Lamba Lamba Ghughat", 78431826650714}, {"Balam Ke Pichkari", 89700384406008}, {"Moh Lelo", 95909411418420},
    {"Sunny Dancer", 133421259018974}, {"TakTaki Bhojpuri", 78735782383680}, {"Ladki Deewani", 102511873453786},
    {"Bansuri", 79568658897083}, {"Sejiya Pe Piya", 87577798625777}, {"Nimbu Kharbuja", 87577798625777},
    {"Sadi Ladki", 104574653065736}, {"Dar Lage", 128470232274219}, {"Hamra Mard", 131679833636653},
    {"Video Calling", 126309103230345}, {"Lollypop Lagelu", 1834567890}, {"Pawan Singh - Chhalakata", 2945678901},
    {"Khesari Lal - Dulha", 3056789012}, {"Ritesh Pandey - Hello Koun", 4167890123}, {"Shilpi Raj - Kamar Dab", 5278901234},
    {"Aamrapali Dubey - Patna Se", 6389012345}, {"Antra Singh - Sarkar", 7490123456},
}

local PhonkSongs = {
    {"TribalDrums", 119454163125856}, {"Senor Phonk", 113425320169497},
    {"Jet 2 Holiday", 135701361688935}, {"VERTIGO FUNK", 100243051031264}, {"haha (NGI)", 122114766584918},
    {"MAMMA MIA FUNK", 134153043498082}, {"MONTAGEM DRESCE", 134687778902887}, {"spooky scary lol", 100828050594137},
    {"DARE", 139188421510869}, {"Montagem Vida", 79889952866985}, {"Montagem Balada", 83797836818857},
    {"BRAZILIAN PHONK NEW", 85635811474451}, {"Gangstas Paradise", 6070263388}, {"FISSION", 118349786848415},
    {"Escalate", 85306184126616}, {"METAMORPHOSIS", 12345678901}, {"MIDNIGHT PHONK", 13456789012},
    {"NEON BLADE", 14567890123}, {"RAVE PHONK", 15678901234}, {"GOTH FUNK", 140704128008979},
    {"CRYSTAL FUNK!", 103445348511856}, {"HEAVENLY JUMPSTYLE", 102332883378771}, {"MONTAGEM PROBIDO", 134236660588170},
    {"MONTAGEM NADA TROPICA", 88663628557954}, {"MONTAGEM OLHOS DE ANJO", 131815578325786},
    {"MONTAGEM BALANCA REGGAETON SLOWED", 90178859879528}, {"MONTAGEM BALANCA REGGAETON", 130346287902949},
    {"7 WEEK FUNK",82149511707056}, {"BEAUTY FUNK", 96760299701814}, {"BASSBOOSTED",136893418307185},
    {"IM SO LUCKY", 120785124326826}, {"BUMBLE BEE FUNK", 128961712071619}, {"FD1", 124958445624871},
    {"MONTAGEM CONMIDO", 93461183313089}, {"MELODIA DE VERÃO", 72844613532784}, {"TOMA FUNK SLOW", 129098116998483},
    {"TOMA FUNK", 126291069838831}, {"TRIPI TROPI", 101241740024903}, {"SOLO ANA NOCHE", 111205815697819},
    {"LALALA", 83315524711012}
}

local MultiSongs = {
    {"Chhogada", 132817140436217}, {"He Ranglo", 128232876294868}, {"Maa Durga", 82446868166514},
    {"Jaago Maa Durga", 89047007812046}, {"Shree Durga", 135346318153434}, {"Jay Matadi", 101446595061046},
    {"Tunak Tunak", 117542440446894}, {"Swaad", 125800612683016}, {"Balle Balle", 101682048332257},
    {"Diljit Dosanjh - Born To Shine", 1122334455}, {"AP Dhillon - Excuses", 2233445566}, {"Karan Aujla - On Top", 3344556677},
    {"Sidhu Moose Wala - 295", 4455667788}, {"Shubh - No Love", 5566778899}, {"Guru Randhawa - Lahore", 6677889900},
    {"Badshah - Genda Phool", 7788990011}, {"Raftaar - Dhaakad", 8899001122}, {"Divine - Kohinoor", 9900112233},
}

local SoundsSongs = {
    {"UwU", 105577043687038}, {"Senpai", 115498703521334}, {"Kiss", 118235447189969},
    {"Anime Ahh", 119651952208423}, {"Ah", 121259252258118}, {"18+ Girl", 131014261385625},
    {"Girl Evil Laugh", 134548905274433}, {"Tom", 139694892021582}, {"Slayy", 139740597178232},
    {"Vine Boom", 2614753599}, {"Bruh Sound Effect", 4567890123}, {"Fart Sound", 5678901234},
    {"Screaming", 6789012345}, {"Anime Wow", 7890123456}, {"Sad Violin", 8901234567},
    {"Taco Bell", 9012345678}, {"Roblox Death Sound", 1223456789}, {"Mario Jump", 2334567890},
    {"Among Us Emergency", 3445678901}, {"Jumpscare", 6201427049}, {"Desi Gun", 3177712713},
    {"Laughing", 4767799547}, {"CID", 105096889615032},
}

local AllSongs = {}
for _, song in ipairs(HitsSongs) do table.insert(AllSongs, song) end
for _, song in ipairs(HindiSongs) do table.insert(AllSongs, song) end
for _, song in ipairs(RapsSongs) do table.insert(AllSongs, song) end
for _, song in ipairs(BhojpuriSongs) do table.insert(AllSongs, song) end
for _, song in ipairs(PhonkSongs) do table.insert(AllSongs, song) end
for _, song in ipairs(MultiSongs) do table.insert(AllSongs, song) end

-- #############################################
-- #####  SHUFFLE UI  #####
-- #############################################

local currentShuffleSong = nil

local function buildShuffleUI(parentFrame)
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = "🎲 Random Shuffle Mix"
    Title.TextColor3 = Color3.fromRGB(0, 80, 0)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.ZIndex = 4
    Title.Parent = parentFrame

    local ShuffleBtn = Instance.new("TextButton")
    ShuffleBtn.Size = UDim2.new(1, -10, 0, 35)
    ShuffleBtn.Position = UDim2.new(0, 5, 0, 50)
    ShuffleBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 255)
    ShuffleBtn.Text = "🔀 Play Random Mix"
    ShuffleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ShuffleBtn.Font = Enum.Font.GothamBold
    ShuffleBtn.TextSize = 12
    ShuffleBtn.ZIndex = 4
    ShuffleBtn.Parent = parentFrame
    Instance.new("UICorner", ShuffleBtn).CornerRadius = UDim.new(0, 6)

    local CurrentSongLabel = Instance.new("TextLabel")
    CurrentSongLabel.Size = UDim2.new(1, -10, 0, 50)
    CurrentSongLabel.Position = UDim2.new(0, 5, 0, 95)
    CurrentSongLabel.BackgroundTransparency = 1
    CurrentSongLabel.Text = "Click Shuffle to start!"
    CurrentSongLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    CurrentSongLabel.Font = Enum.Font.Gotham
    CurrentSongLabel.TextSize = 10
    CurrentSongLabel.TextWrapped = true
    CurrentSongLabel.ZIndex = 4
    CurrentSongLabel.Parent = parentFrame

    local function PlayRandomSong()
        if #AllSongs == 0 then return end
        local randomSong = AllSongs[math.random(1, #AllSongs)]
        currentShuffleSong = randomSong
        CurrentSongLabel.Text = "🎵 Now Playing:\n" .. randomSong[1] .. "\nID: " .. randomSong[2]
        local char = LocalPlayer.Character
        local alreadyOnVehicle = false
        if char then
            for _, v in pairs(char:GetChildren()) do
                if v.Name == "SegwaySmall" or v.Name == "SkateBoard" then
                    alreadyOnVehicle = true
                    break
                end
            end
        end
        if alreadyOnVehicle then
            if VehicleRemote then
                StartRGBLoop()
                ForcePlayMusic(VehicleRemote, tostring(randomSong[2]))
            end
        else
            SmartPlayMusic(tostring(randomSong[2]), SelectedVehicle, false)
        end
    end

    ShuffleBtn.MouseButton1Click:Connect(PlayRandomSong)

    local NextBtn = Instance.new("TextButton")
    NextBtn.Size = UDim2.new(1, -10, 0, 30)
    NextBtn.Position = UDim2.new(0, 5, 0, 155)
    NextBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    NextBtn.Text = "⏭ Next Random Song"
    NextBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    NextBtn.Font = Enum.Font.GothamBold
    NextBtn.TextSize = 11
    NextBtn.ZIndex = 4
    NextBtn.Parent = parentFrame
    Instance.new("UICorner", NextBtn).CornerRadius = UDim.new(0, 6)
    NextBtn.MouseButton1Click:Connect(PlayRandomSong)

    local SaveCurrentBtn = Instance.new("TextButton")
    SaveCurrentBtn.Size = UDim2.new(1, -10, 0, 30)
    SaveCurrentBtn.Position = UDim2.new(0, 5, 0, 195)
    SaveCurrentBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    SaveCurrentBtn.Text = "💾 Save Current to Playlist"
    SaveCurrentBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SaveCurrentBtn.Font = Enum.Font.GothamBold
    SaveCurrentBtn.TextSize = 11
    SaveCurrentBtn.ZIndex = 4
    SaveCurrentBtn.Parent = parentFrame
    Instance.new("UICorner", SaveCurrentBtn).CornerRadius = UDim.new(0, 6)
    SaveCurrentBtn.MouseButton1Click:Connect(function()
        if currentShuffleSong then
            local exists = false
            for _, s in ipairs(SavedPlaylist) do
                if tostring(s.id) == tostring(currentShuffleSong[2]) then
                    exists = true
                    break
                end
            end
            if not exists and #SavedPlaylist < MaxSavedSongs then
                table.insert(SavedPlaylist, {name = currentShuffleSong[1], id = tostring(currentShuffleSong[2])})
                SavePlaylistToFile()
                buildSavedUI(SavedPage)
            end
        end
    end)
end

-- #############################################
-- #####  PROPS UI  #####
-- #############################################

local function buildPropsUI(parentFrame)
    local Warning = Instance.new("TextLabel")
    Warning.Size = UDim2.new(1, 0, 0, 28)
    Warning.Position = UDim2.new(0, 0, 0, 0)
    Warning.BackgroundTransparency = 1
    Warning.Text = "⚠️ Place all props manually before executing! ⚠️"
    Warning.TextColor3 = Color3.fromRGB(200, 0, 0)
    Warning.Font = Enum.Font.GothamBold
    Warning.TextSize = 9
    Warning.TextWrapped = true
    Warning.ZIndex = 4
    Warning.Parent = parentFrame

    local currentTarget = "Self"
    local TargetBtn = Instance.new("TextButton")
    TargetBtn.Size = UDim2.new(1, 0, 0, 22)
    TargetBtn.Position = UDim2.new(0, 0, 0, 32)
    TargetBtn.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
    TargetBtn.Text = "Target: Self ▼"
    TargetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TargetBtn.Font = Enum.Font.Gotham
    TargetBtn.TextSize = 11
    TargetBtn.ZIndex = 4
    TargetBtn.Parent = parentFrame
    Instance.new("UICorner", TargetBtn).CornerRadius = UDim.new(0, 4)

    local TargetScroll = Instance.new("ScrollingFrame")
    TargetScroll.Size = UDim2.new(1, 0, 0, 80)
    TargetScroll.Position = UDim2.new(0, 0, 0, 56)
    TargetScroll.BackgroundColor3 = Color3.fromRGB(20, 25, 30)
    TargetScroll.BorderSizePixel = 0
    TargetScroll.ZIndex = 15
    TargetScroll.Visible = false
    TargetScroll.ScrollBarThickness = 3
    TargetScroll.Parent = parentFrame

    local TargetLayout = Instance.new("UIListLayout", TargetScroll)
    TargetLayout.SortOrder = Enum.SortOrder.Name

    local VisScroll = Instance.new("ScrollingFrame")

    local function refreshPlayers()
        for _, child in pairs(TargetScroll:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        local function addPlayerOpt(name)
            local Opt = Instance.new("TextButton")
            Opt.Size = UDim2.new(1, 0, 0, 18)
            Opt.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
            Opt.Text = " " .. name
            Opt.TextColor3 = Color3.fromRGB(255, 255, 255)
            Opt.Font = Enum.Font.Gotham
            Opt.TextSize = 10
            Opt.TextXAlignment = Enum.TextXAlignment.Left
            Opt.ZIndex = 16
            Opt.Parent = TargetScroll
            Opt.MouseButton1Click:Connect(function()
                currentTarget = name
                TargetBtn.Text = "Target: " .. name .. " ▼"
                TargetScroll.Visible = false
                if activeMode ~= "None" then
                    startPropEngine(activeMode, currentTarget, currentVis)
                end
            end)
        end
        addPlayerOpt("Self")
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then addPlayerOpt(p.Name) end
        end
        TargetScroll.CanvasSize = UDim2.new(0, 0, 0, TargetLayout.AbsoluteContentSize.Y)
    end

    refreshPlayers()
    Players.PlayerAdded:Connect(refreshPlayers)
    Players.PlayerRemoving:Connect(refreshPlayers)

    TargetBtn.MouseButton1Click:Connect(function()
        TargetScroll.Visible = not TargetScroll.Visible
        VisScroll.Visible = false
    end)

    local NukeBtn = Instance.new("TextButton")
    NukeBtn.Size = UDim2.new(1, 0, 0, 22)
    NukeBtn.Position = UDim2.new(0, 0, 0, 59)
    NukeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 50)
    NukeBtn.Text = "NUKE PROPS"
    NukeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    NukeBtn.Font = Enum.Font.GothamBold
    NukeBtn.TextSize = 11
    NukeBtn.ZIndex = 4
    NukeBtn.Parent = parentFrame
    Instance.new("UICorner", NukeBtn).CornerRadius = UDim.new(0, 4)

    local VisBtn = Instance.new("TextButton")
    VisBtn.Size = UDim2.new(0.65, 0, 0, 22)
    VisBtn.Position = UDim2.new(0, 0, 0, 86)
    VisBtn.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
    VisBtn.Text = "Visualizer: Orbital ▼"
    VisBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VisBtn.Font = Enum.Font.Gotham
    VisBtn.TextSize = 10
    VisBtn.ZIndex = 4
    VisBtn.Parent = parentFrame
    Instance.new("UICorner", VisBtn).CornerRadius = UDim.new(0, 4)

    local VisToggleBtn = Instance.new("TextButton")
    VisToggleBtn.Size = UDim2.new(0.32, 0, 0, 22)
    VisToggleBtn.Position = UDim2.new(0.68, 0, 0, 86)
    VisToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    VisToggleBtn.Text = "START"
    VisToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VisToggleBtn.Font = Enum.Font.GothamBold
    VisToggleBtn.TextSize = 10
    VisToggleBtn.ZIndex = 4
    VisToggleBtn.Parent = parentFrame
    Instance.new("UICorner", VisToggleBtn).CornerRadius = UDim.new(0, 4)

    NukeBtn.MouseButton1Click:Connect(function()
        if activeMode == "Nuke" then
            stopPropEngine()
            NukeBtn.Text = "NUKE PROPS"
            NukeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 50)
        else
            startPropEngine("Nuke", currentTarget, currentVis)
            NukeBtn.Text = "STOP NUKE"
            NukeBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
            VisToggleBtn.Text = "START"
            VisToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        end
    end)

    VisToggleBtn.MouseButton1Click:Connect(function()
        if activeMode == "Visualizer" then
            stopPropEngine()
            VisToggleBtn.Text = "START"
            VisToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        else
            startPropEngine("Visualizer", currentTarget, currentVis)
            VisToggleBtn.Text = "STOP"
            VisToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            NukeBtn.Text = "NUKE PROPS"
            NukeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 50)
        end
    end)

    VisScroll.Size = UDim2.new(0.65, 0, 0, 60)
    VisScroll.Position = UDim2.new(0, 0, 0, 110)
    VisScroll.BackgroundColor3 = Color3.fromRGB(20, 25, 30)
    VisScroll.BorderSizePixel = 0
    VisScroll.ZIndex = 15
    VisScroll.Visible = false
    VisScroll.ScrollBarThickness = 3
    VisScroll.Parent = parentFrame

    local VisLayout = Instance.new("UIListLayout", VisScroll)
    VisLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local visOptions = {"Orbital", "Swarm", "Tornado", "Grid"}
    for _, opt in ipairs(visOptions) do
        local OptBtn = Instance.new("TextButton")
        OptBtn.Size = UDim2.new(1, 0, 0, 18)
        OptBtn.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
        OptBtn.Text = " " .. opt
        OptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptBtn.Font = Enum.Font.Gotham
        OptBtn.TextSize = 10
        OptBtn.TextXAlignment = Enum.TextXAlignment.Left
        OptBtn.ZIndex = 16
        OptBtn.Parent = VisScroll
        OptBtn.MouseButton1Click:Connect(function()
            currentVis = opt
            VisBtn.Text = "Visualizer: " .. opt .. " ▼"
            VisScroll.Visible = false
            if activeMode == "Visualizer" then
                startPropEngine("Visualizer", currentTarget, currentVis)
            end
        end)
    end
    VisScroll.CanvasSize = UDim2.new(0, 0, 0, #visOptions * 18)

    VisBtn.MouseButton1Click:Connect(function()
        VisScroll.Visible = not VisScroll.Visible
        TargetScroll.Visible = false
    end)
end

-- #############################################
-- #####  PROTECTION UI  #####
-- #############################################

local function buildProtectionUI(parentFrame)
    local ScrollList = Instance.new("ScrollingFrame")
    ScrollList.Size = UDim2.new(1, 0, 1, -10)
    ScrollList.Position = UDim2.new(0, 0, 0, 5)
    ScrollList.BackgroundTransparency = 1
    ScrollList.BorderSizePixel = 0
    ScrollList.ScrollBarThickness = 3
    ScrollList.ZIndex = 4
    ScrollList.Parent = parentFrame
    Instance.new("UIListLayout", ScrollList).Padding = UDim.new(0, 6)

    local function createToggleUI(name, featureKey)
        local Container = Instance.new("Frame")
        Container.Size = UDim2.new(1, -5, 0, 32)
        Container.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
        Container.ZIndex = 4
        Container.Parent = ScrollList
        Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 6)

        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0.6, 0, 1, 0)
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.BackgroundTransparency = 1
        Label.Text = name
        Label.TextColor3 = Color3.fromRGB(0, 0, 0)
        Label.Font = Enum.Font.GothamSemibold
        Label.TextSize = 11
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.ZIndex = 5
        Label.Parent = Container

        local ToggleBtn = Instance.new("TextButton")
        ToggleBtn.Size = UDim2.new(0, 45, 0, 20)
        ToggleBtn.Position = UDim2.new(1, -55, 0.5, -10)
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        ToggleBtn.Text = "OFF"
        ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleBtn.Font = Enum.Font.GothamBold
        ToggleBtn.TextSize = 10
        ToggleBtn.ZIndex = 5
        ToggleBtn.Parent = Container
        Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 4)

        ToggleBtn.MouseButton1Click:Connect(function()
            local newState = not ProtectionStates[featureKey]
            toggleProtection(featureKey, newState)
            if newState then
                TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 180, 80)}):Play()
                ToggleBtn.Text = "ON"
            else
                TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 60, 60)}):Play()
                ToggleBtn.Text = "OFF"
            end
        end)
    end

    createToggleUI("Anti-Sit", "AntiSit")
    createToggleUI("Anti-Fling", "AntiFling")
    createToggleUI("Noclip", "Noclip")
    createToggleUI("Super Noclip", "SuperNoclip")
    createToggleUI("Freeze Self", "Freeze")
    ScrollList.CanvasSize = UDim2.new(0, 0, 0, 5 * 38)
end

-- #############################################
-- #####  BUILD ALL TABS  #####
-- #############################################

buildVehicleUI(VehiclePage)
buildMusicTab(HitsPage, HitsSongs)
buildMusicTab(HindiPage, HindiSongs)
buildMusicTab(RapsPage, RapsSongs)
buildMusicTab(BhojpuriPage, BhojpuriSongs)
buildMusicTab(PhonkPage, PhonkSongs)
buildMusicTab(MultiPage, MultiSongs)
buildMusicTab(SoundsPage, SoundsSongs)
buildSavedUI(SavedPage)
buildShuffleUI(ShufflePage)
buildPropsUI(PropsPage)
buildProtectionUI(ProtectionPage)

-- #############################################
-- #####  MINIMIZE / RESTORE WITH FULL FADE  #####
-- #############################################

-- Helper to collect all objects with transparency properties
local function getAllTransparentObjects(obj, list)
    list = list or {}
    for _, child in ipairs(obj:GetChildren()) do
        local props = {}
        if child:IsA("Frame") or child:IsA("ScrollingFrame") then
            props.BackgroundTransparency = child.BackgroundTransparency
        end
        if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
            props.TextTransparency = child.TextTransparency
        end
        if child:IsA("ImageLabel") then
            props.ImageTransparency = child.ImageTransparency
        end
        if child:IsA("UIStroke") then
            props.Transparency = child.Transparency
        end
        if next(props) then
            table.insert(list, {object = child, props = props})
        end
        getAllTransparentObjects(child, list)
    end
    return list
end

local FADE_DURATION = 0.3

local function getTransparentList()
    local list = {}
    table.insert(list, {object = Main, props = {BackgroundTransparency = Main.BackgroundTransparency}})
    for _, item in ipairs(getAllTransparentObjects(Main)) do
        table.insert(list, item)
    end
    return list
end

-- Minimize: fade out, hide Main, show icon
local function minimizeGUI()
    local transList = getTransparentList()
    for _, item in ipairs(transList) do
        for prop, defaultVal in pairs(item.props) do
            if prop == "BackgroundTransparency" or prop == "TextTransparency" or prop == "ImageTransparency" or prop == "Transparency" then
                TweenService:Create(item.object, TweenInfo.new(FADE_DURATION), {[prop] = 1}):Play()
            end
        end
    end
    -- Fade out blur
    TweenService:Create(Blur, TweenInfo.new(FADE_DURATION), {Size = 0}):Play()
    task.wait(FADE_DURATION)
    Main.Visible = false
    MinimizedIcon.Visible = true
end

-- Restore: show Main, set all transparencies to 1, fade in
local function restoreGUI()
    Main.Visible = true
    local transList = getTransparentList()
    -- Set all to 1 instantly
    for _, item in ipairs(transList) do
        for prop, defaultVal in pairs(item.props) do
            if prop == "BackgroundTransparency" or prop == "TextTransparency" or prop == "ImageTransparency" or prop == "Transparency" then
                item.object[prop] = 1
            end
        end
    end
    -- Fade in to default values
    for _, item in ipairs(transList) do
        for prop, defaultVal in pairs(item.props) do
            if prop == "BackgroundTransparency" or prop == "TextTransparency" or prop == "ImageTransparency" or prop == "Transparency" then
                TweenService:Create(item.object, TweenInfo.new(FADE_DURATION), {[prop] = defaultVal}):Play()
            end
        end
    end
    -- Fade in blur
    TweenService:Create(Blur, TweenInfo.new(FADE_DURATION), {Size = 12}):Play()
    MinimizedIcon.Visible = false
end

-- Connect the "-" button to minimize
MinimizeBtn.MouseButton1Click:Connect(function()
    if Main.Visible then
        minimizeGUI()
    end
end)

-- Connect the icon to restore
MinimizedIcon.MouseButton1Click:Connect(function()
    if not Main.Visible then
        restoreGUI()
    end
end)

-- End of script