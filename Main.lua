--Abaixo estará o lab da UI

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()

local UI = Lib:Create{
   Theme = "Dark", -- or any other theme
   Size = UDim2.new(0, 555, 0, 400) -- default
}

local Main = UI:Tab{
   Name = "Main"
}

local Divider = Main:Divider{
   Name = "Main shit"
}

local QuitDivider = Main:Divider{
   Name = "Quit"
}

-- Definindo as cores dos jogadores (você pode mudar conforme sua preferência)
local teamColors = {
    ["TeamName1"] = Color3.fromRGB(255, 0, 0), -- Vermelho
    ["TeamName2"] = Color3.fromRGB(0, 0, 255), -- Azul
}

-- Função para criar uma linha de ESP
local function createESP(player)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = player.Character.Head
    billboardGui.Size = UDim2.new(2, 0, 2, 0)
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.Enabled = true

    local espText = Instance.new("TextLabel")
    espText.BackgroundTransparency = 1
    espText.Size = UDim2.new(1, 0, 1, 0)
    espText.TextScaled = true
    espText.Text = player.Name
    espText.Font = Enum.Font.SourceSansBold
    espText.TextColor3 = teamColors[player.Team.Name] or Color3.fromRGB(255, 255, 255)
    espText.Parent = billboardGui

    billboardGui.Parent = game.CoreGui
end

-- Atualiza o ESP para todos os jogadores
local function updateESP()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            if not player:FindFirstChild("ESP") then
                createESP(player)
            end
        end
    end
end

-- Atualiza o ESP periodicamente
while true do
    updateESP()
    wait(1) -- Ajuste o intervalo conforme necessário para reduzir a carga no servidor
end