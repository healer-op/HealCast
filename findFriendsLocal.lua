local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local highlightsEnabled = true  -- Default state: ON
local uiVisible = true          -- UI visibility toggle

-- Function to add or remove highlight
local function toggleHighlight(player, enable)
    if LocalPlayer:IsFriendsWith(player.UserId) then
        local character = player.Character or player.CharacterAdded:Wait()

        local highlight = character:FindFirstChild("FriendHighlight")

        if enable then
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = "FriendHighlight"
                highlight.FillColor = Color3.fromRGB(0, 255, 0)        -- Green (fully transparent)
                highlight.OutlineColor = Color3.fromRGB(0, 255, 0)     -- Green outline
                highlight.FillTransparency = 1                         -- No fill
                highlight.OutlineTransparency = 0                      -- Visible outline
                highlight.Parent = character
            end
        else
            if highlight then
                highlight:Destroy()  -- Remove the highlight when toggled off
            end
        end
    end
end

-- Apply highlight to all current players
local function applyHighlights(enable)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            toggleHighlight(player, enable)
            player.CharacterAdded:Connect(function()
                toggleHighlight(player, enable)
            end)
        end
    end
end

-- UI Creation
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FriendHighlightToggle"
screenGui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 180, 0, 120)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Dark background
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.Parent = screenGui
frame.ClipsDescendants = true
frame.AnchorPoint = Vector2.new(0, 0)
frame.AutomaticSize = Enum.AutomaticSize.None
frame.BackgroundTransparency = 0
frame.SizeConstraint = Enum.SizeConstraint.RelativeXY
frame.AnchorPoint = Vector2.new(0, 0)
frame.ClipsDescendants = true

-- Corner Radius
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 5)
titleLabel.Text = "Friend Finder"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- Subtitle
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, 0, 0, 20)
subtitleLabel.Position = UDim2.new(0, 0, 0, 30)
subtitleLabel.Text = "Made By Healeruff"
subtitleLabel.TextColor3 = Color3.new(1, 1, 1)
subtitleLabel.Font = Enum.Font.SourceSans
subtitleLabel.TextSize = 14
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Parent = frame

-- Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0.8, 0, 0, 40)
toggleButton.Position = UDim2.new(0.1, 0, 0, 60)
toggleButton.Text = "Disable"
toggleButton.BackgroundColor3 = Color3.fromRGB(57, 255, 20)  -- Bright green

toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 18
toggleButton.Parent = frame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = toggleButton

-- Toggle Button Functionality
toggleButton.MouseButton1Click:Connect(function()
    highlightsEnabled = not highlightsEnabled  -- Toggle state

    if highlightsEnabled then
        toggleButton.Text = "Disable"
        toggleButton.BackgroundColor3 = Color3.fromRGB(57, 255, 20)  -- Green when enabled
    else
        toggleButton.Text = "Enable"
        toggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)    -- Red when disabled
    end

    applyHighlights(highlightsEnabled)
end)

-- Keybind to Toggle UI Visibility
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent then
        if input.KeyCode == Enum.KeyCode.H then  -- Press "H" to toggle UI visibility
            uiVisible = not uiVisible
            frame.Visible = uiVisible
        end
    end
end)

-- Initial Highlight Application
applyHighlights(highlightsEnabled)

-- Handle new players joining
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if highlightsEnabled then
            toggleHighlight(player, true)
        end
    end)
end)
