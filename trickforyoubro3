-- Variable

local plyr = game.Players.LocalPlayer
local gameName = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name
local nomor

-- Table


local zoneTable = {}
local plyrTable = {}

for i,v in pairs(game:GetService("Players"):GetChildren()) do
    if v.Name ~= plyr.Name then
        table.insert(plyrTable, v.Name)
    end
end

for i,v in pairs(game:GetService("Workspace").Zones:GetChildren()) do
    if v.ClassName == "Folder" then
        table.insert(zoneTable, v.Name)
    end
end

-- Global
getgenv().zone = "Suburb"

-- UI Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Rykyy/roblox/scripts/uilibrary.lua"))()
local pesan = loadstring(game:HttpGet(("https://raw.githubusercontent.com/Rykyy/roblox/scripts/pesan.lua"),true))()

pesan.msg(gameName, "This Script Made By Rykyy#0001\n".."~"..plyr.DisplayName.."~ Thx For Using My Script.", 10)

local window = library:CreateWindow("Fire Fighter Simulator")

local farm = window:AddFolder("Farm")
local misc = window:AddFolder("Misc")


farm:AddList({text = "Zones List", values = zoneTable, callback = function(selected)
    getgenv().zone = selected
end})

farm:AddToggle({text = "Auto Money", callback = function(bool)
    getgenv().farm = bool

    if bool then
        for i,v in pairs(plyr.leaderstats:GetChildren()) do
            if string.find(v.Name, "Fires") then
                nomor = v.value
            end
        end
        game:GetService("RunService").Heartbeat:Connect(function()
            if getgenv().farm == true then
                local A_1 = getgenv().zone
                local A_2 = nomor
                local A_3 = Vector3.new(9e9, 9e9, 9e9)
                local Event = game:GetService("ReplicatedStorage").Remotes.FireExtinguished
                Event:InvokeServer(A_1, A_2, A_3)
                nomor = nomor+1
            end
        end)
    end
end})

farm:AddToggle({text = "Auto Fuel", callback = function(bool)
    getgenv().fuel = bool
    
    

    while wait() do
        if getgenv().fuel then
            local jauh = math.huge
            local ssrn = nil
            for i,v in pairs(game:GetService("Workspace").FireHydrants:GetChildren()) do
                if v.ClassName == "MeshPart" then
                    if v.Transparency == 0 then
                        local dekat = (plyr.Character.HumanoidRootPart.Position - v.Position).magnitude
                        if dekat < jauh then
                            dekat = jauh
                            ssrn = v
                        end
                    end
                end
            end
            plyr.Character.HumanoidRootPart.CFrame = ssrn.CFrame 
            game:GetService('VirtualInputManager'):SendKeyEvent(true,"E",false,uwu)
        elseif not getgenv().fuel then
            plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").TeleportParts[getgenv().zone].CFrame
            break;
        end
    end
end})


misc:AddLabel({text = "~~Players"})


local plyrList = misc:AddList({text = "Teleport To Players", values = plyrTable, callback = function(selected)
    if selected ~= "Refreshed!!!" then
        plyr.Character.HumanoidRootPart.CFrame = game:GetService("Players")[selected].Character:FindFirstChild("HumanoidRootPart").CFrame
    end
end})


misc:AddSlider({text = "WalkSpeed", min = 16, max = 250, value = 16, callback = function(s)
    plyr.Character.Humanoid.WalkSpeed = s
end})

misc:AddSlider({text = "JumpPower", min = 50, max = 250, value = 50, callback = function(s)
    plyr.Character.Humanoid.JumpPower = s
end})

misc:AddLabel({text = "~~Admin Gui"})

misc:AddButton({text = "Infinite Yield", callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()  
end})

misc:AddLabel({text = "~~Ui Settings"})

misc:AddBind({text = "Ui Toggle", key = Enum.KeyCode.RightAlt, callback = function()
    library:ToggleUi()
end})

misc:AddButton({text = "Destroy UI", callback = function()
    for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if v.ClassName == "TextLabel" and v.Text == "Fire Fighter Simulator" then
            v.Parent:Destroy()
        end
    end
end})

game:GetService("Players").ChildAdded:Connect(function()
    for _,v2 in pairs(plyrTable) do table.remove(plyrTable, _) end 
    for _,v in pairs(game:GetService("Players"):GetChildren()) do 
        if v.Name ~= plyr.Name then
            insert = true
            for _,v2 in pairs(plyrTable) do if v2 == v.Name then insert = false end end
            if insert then table.insert(plyrTable, v.Name) end
        end 
    end
    plyrList:Refresh(plyrTable)
end)
 
game:GetService("Players").ChildRemoved:Connect(function() 
    for _,v2 in pairs(plyrTable) do table.remove(plyrTable, _) end 
    for _,v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Name ~= plyr.Name then 
            insert = true
            for _,v2 in pairs(plyrTable) do if v2 == v.Name then insert = false end end 
            if insert then table.insert(plyrTable, v.Name) end
        end
    end
    plyrList:Refresh(plyrTable)
end)

library:Init()
