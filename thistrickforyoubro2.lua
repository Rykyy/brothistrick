-- Variable
local plyr = game:GetService("Players").LocalPlayer
local humpart = plyr.Character.HumanoidRootPart
local gameName = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name


-- Table
local toolTable = {
    "Crowbar",
    "Lockpick",
    "Hammer",
    "Hacking Device",
    "Dynamite",
    "Thermite"
}

local backpackTable = {
    "Bag",
    "Basic bag",
    "Briefcase",
    "Duffel bag",
    "Laptop bag",
    "Large Backpack",
    "Office Bag",
    "Sports Bag",
    "Hiking Bag",
    "Suitcase",
    "Gym Bag"
}

local statsTable = {
    "Stealth",
    "Swipe Speed",
    "Intimidation",
    "Sprint Speed",
    "Strength"
}

local blueprintTable = {
    "Zone 2 Blueprint",
    "Zone 3 Blueprint",
    "Betting Store Blueprint",
    "Tech Store Blueprint",
    "Jewelry Store Blueprint",
    "Bank Blueprint"
}


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
        pesan.msg("Farm Notification!", "Rob People & Rob Atm With Invisible", 2.5)
    end

    humpart.CFrame = CFrame.new(-116.546936, 190.212708, 573.527466, 0.998758256, -6.5053013e-10, -0.0498191454, -3.56683599e-10, 1, -2.02085122e-08, 0.0498191454, 2.02011883e-08, 0.998758256)
    wait(0.3)
    humpart.Parent.LowerTorso.Root:Destroy()

    
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
            if game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams:FindFirstChild("RequestSell_Functionv.08"):InvokeServer() then
                game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams:FindFirstChild("RequestSell_Functionv.08"):InvokeServer()
            else
                game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams:FindFirstChild("RequestSell_Functionv.07"):InvokeServer()
            end
        end
    end
end})

farm:AddToggle({text = "Quest", callback = function(bool)
    getgenv().quest = bool

    while wait() do
        if getgenv().quest == true then
            if game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams:FindFirstChild("UpdateQuests_Eventv.08") then
                game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams:FindFirstChild("UpdateQuests_Eventv.08"):FireServer()
            else
                game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams:FindFirstChild("UpdateQuests_Eventv.07"):FireServer()
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
    local A_2 = selected
    local Event = game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams["RequestPurchase_Functionv.07"]
    Event:InvokeServer(A_1, A_2)
end})


buy:AddList({text = "Upgrades", values = statsTable, callback = function(selected)
    local A_1 = selected
    local Event = game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams["UpgradeStats_Functionv.07"]
    Event:InvokeServer(A_1)
end})

buy:AddList({text = "Blueprints", values = blueprintTable, callback = function(selected)
    local A_1 = "Blueprint"
    local A_2 = selected
    local Event = game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams["RequestPurchase_Functionv.07"]
    Event:InvokeServer(A_1, A_2)
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
