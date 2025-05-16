-- AnTay Hub GUI
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnTayHub"
screenGui.Parent = player.PlayerGui

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 150)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Enable Dragging
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -30, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "AnTay Hub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 16
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Loading Bar
local loadingBarBackground = Instance.new("Frame")
loadingBarBackground.Size = UDim2.new(0.8, 0, 0, 20)
loadingBarBackground.Position = UDim2.new(0.1, 0, 0.4, 0)
loadingBarBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
loadingBarBackground.BorderSizePixel = 0
loadingBarBackground.Parent = mainFrame

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingBarBackground

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0, 20)
loadingText.Position = UDim2.new(0, 0, -1, -5)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading Config..."
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.TextSize = 14
loadingText.Font = Enum.Font.SourceSans
loadingText.Parent = loadingBarBackground

-- Username
local usernameLabel = Instance.new("TextLabel")
usernameLabel.Size = UDim2.new(1, 0, 0, 20)
usernameLabel.Position = UDim2.new(0, 0, 0.8, 0)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Text = "Username: " .. player.Name
usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameLabel.TextSize = 14
usernameLabel.Font = Enum.Font.SourceSans
usernameLabel.Parent = mainFrame

-- Simulate Loading
local function simulateLoading()
    for i = 1, 100 do
        loadingBar.Size = UDim2.new(i / 100, 0, 1, 0)
        if i == 100 then
            loadingText.Text = "Ok!"
        end
        task.wait(0.05)
    end
end

simulateLoading()
