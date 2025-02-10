local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local highlightsEnabled = true  -- Default state: ON

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

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 150, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10) -- Top-left corner
toggleButton.Text = "Disable Friend Outline"
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 18
toggleButton.Parent = screenGui

-- Toggle Button Functionality
toggleButton.MouseButton1Click:Connect(function()
    highlightsEnabled = not highlightsEnabled  -- Toggle state
    
    if highlightsEnabled then
        toggleButton.Text = "Disable Friend Outline"
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)  -- Green when enabled
    else
        toggleButton.Text = "Enable Friend Outline"
        toggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)  -- Red when disabled
    end
    
    applyHighlights(highlightsEnabled)
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
