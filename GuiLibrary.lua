-- LocalScript placed in StarterPlayer -> StarterPlayerScripts

-- Création du GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Création de l'écran GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Création des éléments TextLabel avec la police GothamBold
local textLabels = {}
local labelNames = {"Combat", "Blatant", "Render", "World"}
local labelWidth = 171
local labelHeight = 50
local labelSpacing = 0.02  -- Espacement entre les TextLabel (2%)

-- Création des TextLabels de manière dynamique
for i, name in ipairs(labelNames) do
	local textLabel = Instance.new("TextLabel")
	textLabel.Parent = screenGui
	textLabel.Size = UDim2.new(0, labelWidth, 0, labelHeight)
	textLabel.BackgroundColor3 = Color3.fromRGB(20, 48, 172)
	textLabel.Text = name
	textLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	textLabel.TextSize = 14
	textLabel.Font = Enum.Font.GothamBold
	textLabel.Position = UDim2.new(0.2027 + (i - 1) * (labelWidth / screenGui.AbsoluteSize.X + labelSpacing), 0, 0.0974, 0)

	table.insert(textLabels, textLabel)
end

-- Création de la Frame
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Position = UDim2.new(0.0068, 0, 0.0172, 0)
frame.Size = UDim2.new(0, 198, 0, 74)
frame.BackgroundColor3 = Color3.fromRGB(41, 21, 154)

local TextLabel6 = Instance.new("TextLabel")
TextLabel6.Parent = frame
TextLabel6.Position = UDim2.new(-0.01, 0, 0.18, 0)
TextLabel6.Size = UDim2.new(0, 200, 0, 50)
TextLabel6.BackgroundTransparency = 1
TextLabel6.Font = Enum.Font.GothamBold
TextLabel6.Text = "😈"
TextLabel6.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel6.TextSize = 60

-- Par défaut, le GUI est caché
screenGui.Enabled = false

-- Fonction pour afficher/masquer le GUI
local guiVisible = false
local function toggleGUI()
	guiVisible = not guiVisible
	screenGui.Enabled = guiVisible
end

-- Utiliser UserInputService pour détecter les entrées clavier
local userInputService = game:GetService("UserInputService")

-- Détecter la pression de la touche RightShift
userInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.RightShift then
		toggleGUI()
	end
end)
