-- Services
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Constants
local SECRET_KEY = "giabao14072013"
local SCRIPT_NAME = "giabaomaidinh01"

-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomInterface_" .. SCRIPT_NAME
ScreenGui.ResetOnSpawn = false

-- Attach GUI safely to CoreGui or PlayerGui
local success, _ = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not success then
    ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

-- Main Frame (Window)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 260)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 28, 38)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(15, 20, 28)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -20, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = SCRIPT_NAME
TitleLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleLabel.TextSize = 18
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

---------------------------------------------------------
-- 1. Loading Animation Screen
---------------------------------------------------------
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Size = UDim2.new(1, 0, 1, -40)
LoadingFrame.Position = UDim2.new(0, 0, 0, 40)
LoadingFrame.BackgroundTransparency = 1
LoadingFrame.Parent = MainFrame

local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, 0, 0, 30)
LoadingText.Position = UDim2.new(0, 0, 0.3, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "Initializing Interface..."
LoadingText.TextColor3 = Color3.fromRGB(220, 220, 220)
LoadingText.TextSize = 16
LoadingText.Font = Enum.Font.Gotham
LoadingText.Parent = LoadingFrame

local ProgressBarBackground = Instance.new("Frame")
ProgressBarBackground.Size = UDim2.new(0.8, 0, 0, 8)
ProgressBarBackground.Position = UDim2.new(0.1, 0, 0.5, 10)
ProgressBarBackground.BackgroundColor3 = Color3.fromRGB(35, 45, 60)
ProgressBarBackground.BorderSizePixel = 0
ProgressBarBackground.Parent = LoadingFrame

local ProgressBGCorner = Instance.new("UICorner")
ProgressBGCorner.CornerRadius = UDim.new(0, 4)
ProgressBGCorner.Parent = ProgressBarBackground

local ProgressBarFill = Instance.new("Frame")
ProgressBarFill.Size = UDim2.new(0, 0, 1, 0)
ProgressBarFill.BackgroundColor3 = Color3.fromRGB(0, 180, 240)
ProgressBarFill.BorderSizePixel = 0
ProgressBarFill.Parent = ProgressBarBackground

local ProgressFillCorner = Instance.new("UICorner")
ProgressFillCorner.CornerRadius = UDim.new(0, 4)
ProgressFillCorner.Parent = ProgressBarFill

---------------------------------------------------------
-- 2. Key Input Screen
---------------------------------------------------------
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Size = UDim2.new(1, 0, 1, -40)
KeyFrame.Position = UDim2.new(0, 0, 0, 40)
KeyFrame.BackgroundTransparency = 1
KeyFrame.Visible = false
KeyFrame.Parent = MainFrame

local KeyInstruction = Instance.new("TextLabel")
KeyInstruction.Size = UDim2.new(1, 0, 0, 30)
KeyInstruction.Position = UDim2.new(0, 0, 0.15, 0)
KeyInstruction.BackgroundTransparency = 1
KeyInstruction.Text = "Enter Access Key:"
KeyInstruction.TextColor3 = Color3.fromRGB(200, 200, 200)
KeyInstruction.TextSize = 15
KeyInstruction.Font = Enum.Font.Gotham
KeyInstruction.Parent = KeyFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.7, 0, 0, 35)
KeyBox.Position = UDim2.new(0.15, 0, 0.35, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(30, 40, 55)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderText = "Paste key here..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(120, 130, 145)
KeyBox.Text = ""
KeyBox.TextSize = 14
KeyBox.Font = Enum.Font.Gotham
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = KeyFrame

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 6)
KeyBoxCorner.Parent = KeyBox

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0.7, 0, 0, 35)
SubmitButton.Position = UDim2.new(0.15, 0, 0.62, 0)
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
SubmitButton.Text = "Verify Key"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.TextSize = 14
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Parent = KeyFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = SubmitButton

---------------------------------------------------------
-- 3. Execution & Animation Logic
---------------------------------------------------------
local function RunLoadingAnimation()
    local tweenInfo = TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(ProgressBarFill, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})
    
    tween:Play()
    tween.Completed:Wait()
    
    LoadingFrame.Visible = false
    KeyFrame.Visible = true
end

SubmitButton.MouseButton1Click:Connect(function()
    if KeyBox.Text == SECRET_KEY then
        SubmitButton.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
        SubmitButton.Text = "Access Granted"
        
        task.wait(1)
        
        -- Safe completion transition
        KeyFrame.Visible = false
        
        local WelcomeLabel = Instance.new("TextLabel")
        WelcomeLabel.Size = UDim2.new(1, 0, 1, -40)
        WelcomeLabel.Position = UDim2.new(0, 0, 0, 40)
        WelcomeLabel.BackgroundTransparency = 1
        WelcomeLabel.Text = "Welcome to " .. SCRIPT_NAME
        WelcomeLabel.TextColor3 = Color3.fromRGB(0, 220, 150)
        WelcomeLabel.TextSize = 20
        WelcomeLabel.Font = Enum.Font.GothamBold
        WelcomeLabel.Parent = MainFrame
    else
        SubmitButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        SubmitButton.Text = "Invalid Key"
        task.wait(1.5)
        SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
        SubmitButton.Text = "Verify Key"
    end
end)

-- Start Sequence
task.spawn(RunLoadingAnimation)