-- Variable
local plyr = game:GetService("Players").LocalPlayer
local humpart = plyr.Character.HumanoidRootPart
local gameName = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name


-- Table
local backpackTable = {}
local statsTable = {"Stealth", "Swipe Speed", "Intimidation", "Sprint Speed", "Strength"}
local toolTable = {"Crowbar", "Lockpick", "Hammer", "Hacking Device", "Dynamite", "Thermite"}

for i,v in pairs(game:GetService("ReplicatedStorage").FrameworkReplicated.Metadata.Backpacks:GetChildren()) do
    if v.Name ~= "Bag" then
        table.insert(backpackTable, v.Name)
    end
end


-- UI Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Rykyy/roblox/scripts/uilibrary.lua"))()
local pesan = loadstring(game:HttpGet(("https://raw.githubusercontent.com/Rykyy/roblox/scripts/pesan.lua"),true))()


local window = library:CreateWindow("Thief Simulator")

local farm = window:AddFolder("Farm")
local buy = window:AddFolder("Buys")
local teleports = window:AddFolder("Teleports")
local misc = window:AddFolder("Misc")

pesan.msg(gameName, "This Script Made By Rykyy#0001\n".."~"..plyr.DisplayName.."~ Thx For Using My Script.", 10)

farm:AddToggle({text = "Farm", callback = function(bool)
    getgenv().thieffarm = bool

    if bool then
        pesan.msg("Farm Notification!", "Rob People & Rob Atm", 2.5)
    end
    
    while wait() do
        if getgenv().thieffarm == true then 
            for i,atm in pairs(game:GetService("Workspace").Map.ATMs:GetChildren()) do
                if atm:FindFirstChild("Part") and atm:FindFirstChild("HealthValue") then
                    humpart.CFrame = atm.Part.CFrame
                    local args = {[1] = atm}
                    game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams:FindFirstChild("GameTaskCompleted_Functionv.07"):InvokeServer(unpack(args))
                else
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") then
                            if v.HumanoidRootPart:FindFirstChild("ProximityPrompt") and getgenv().thieffarm == true then
                                repeat
                                    humpart.CFrame = v.HumanoidRootPart.CFrame
                                    fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                                    wait()
                                until getgenv().thieffarm == false or not v:FindFirstChild("HumanoidRootPart") or not v.HumanoidRootPart:FindFirstChild("ProximityPrompt")
                            end
                        end
                    end
                end
            end
        end
    end
end})

farm:AddToggle({text = "Sell", callback =  function(bool)
    getgenv().sell = bool

    while wait() do
        if getgenv().sell then
            firetouchinterest(humpart ,game:GetService("Workspace").Sells.World1.Sell, 0)
            firetouchinterest(humpart ,game:GetService("Workspace").Sells.World1.Sell, 1)
        end
    end
end})

farm:AddToggle({text = "Quest", callback = function(bool)
    getgenv().quest = bool

    while wait() do
        if getgenv().quest == true then
            for i,v in pairs(plyr.PlayerGui.Menu.SideTasks:GetChildren()) do
                if v.Name ~= "Task" then
                    if v:FindFirstChild("Reward") then
                        if v.Reward.Text == "Completed" then
                            humpart.CFrame = game:GetService("Workspace").Jobs.World1.Jobs.CFrame
                        end
                    end
                end
            end
        end
    end
end})

buy:AddList({text = "Tool", values = toolTable, callback = function(selected)

    local A_1 = "Tool"
    local A_2 = selected
    local Event = game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams["RequestPurchase_Functionv.07"]
    Event:InvokeServer(A_1, A_2)
end})

buy:AddList({text = "Backpack", values = backpackTable, callback = function(selected)
    local A_1 = "Backpack"
    local A_2 = getgenv().selected
    local Event = game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams["RequestPurchase_Functionv.07"]
    Event:InvokeServer(A_1, A_2)
end})

buy:AddList({text = "Upgrades", values = statsTable, callback = function(selected)
    local A_1 = selected
    local Event = game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams["UpgradeStats_Functionv.07"]
    Event:InvokeServer(A_1)
end})

teleports:AddButton({text = "Quest", callback = function()
    humpart.CFrame = game:GetService("Workspace").Jobs.World1.Jobs.CFrame
end})

teleports:AddButton({text = "Sell", callback = function()
    humpart.CFrame = game:GetService("Workspace").Sells.World1.Sell.CFrame
end})

teleports:AddButton({text = "Shop", callback = function()
    humpart.CFrame = game:GetService("Workspace").Shops.Spawn.Shop.CFrame
end})

teleports:AddButton({text = "Group And Vip Chest", callback = function()
    humpart.CFrame = game:GetService("Workspace").Chests["Group Reward"].Ring.CFrame * CFrame.new(-2,0,0)
end})

teleports:AddButton({text = "Skins", callback = function()
    humpart.CFrame = game:GetService("Workspace").Skins.Spawn.Skins.CFrame 
end})            

misc:AddLabel({text = "~~Players"})

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
        if v.ClassName == "TextLabel" and v.Text == "Thief Simulator" then
            v.Parent:Destroy()
        end
    end
end})


library:Init()
