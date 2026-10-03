-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Create Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GiabaoMaiDinhUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame (Blue to Purple Aesthetic)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Allows dragging in standard Roblox UI
MainFrame.Parent = ScreenGui

-- UICorner for Smooth Edges
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- Gradient (Blue to Purple)
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 80, 220)),  -- Electric Blue
    ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 30, 210))  -- Deep Purple
})
UIGradient.Rotation = 45
UIGradient.Parent = MainFrame

-- Header Bar
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

-- Logo Icon "G"
local LogoLabel = Instance.new("TextLabel")
LogoLabel.Name = "Logo"
LogoLabel.Size = UDim2.new(0, 40, 0, 40)
LogoLabel.Position = UDim2.new(0, 8, 0, 5)
LogoLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
LogoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoLabel.Text = "G"
LogoLabel.Font = Enum.Font.FredokaOne
LogoLabel.TextSize = 24
LogoLabel.Parent = Header

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 8)
LogoCorner.Parent = LogoLabel

-- Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, -60, 0, 40)
TitleLabel.Position = UDim2.new(0, 55, 0, 5)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "giabaomaidinh01"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 20
TitleLabel.Parent = Header

-- Content Container
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "Content"
ContentFrame.Size = UDim2.new(1, -20, 1, -70)
ContentFrame.Position = UDim2.new(0, 10, 0, 60)
ContentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
ContentFrame.BackgroundTransparency = 0.2
ContentFrame.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

-- Example Interactive Button
local ActionButton = Instance.new("TextButton")
ActionButton.Name = "ActionButton"
ActionButton.Size = UDim2.new(0.8, 0, 0, 40)
ActionButton.Position = UDim2.new(0.1, 0, 0.2, 0)
ActionButton.BackgroundColor3 = Color3.fromRGB(40, 90, 230)
ActionButton.Text = "Activate Feature"
ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ActionButton.Font = Enum.Font.SourceSansBold
ActionButton.TextSize = 16
ActionButton.Parent = ContentFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = ActionButton

-- Button Click Handling
ActionButton.MouseButton1Click:Connect(function()
    print("Action executed safely within legal Roblox Studio guidelines, boss man.")
    ActionButton.Text = "Executed!"
    task.wait(1)
    ActionButton.Text = "Activate Feature"
end)