-- Variable
local plyr = game.Players.LocalPlayer
local gameName = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name
local remote = game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams


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

farm:AddToggle({text = "Auto Farm", callback = function(bool)
    getgenv().thieffarm = bool

    if bool then
        pesan.msg("Farm Notification!", "Rob NPC & Rob ATM With Invisible", 2.5)
    end
    
    while wait() do
        if getgenv().thieffarm then 
            if not plyr.Character:FindFirstChild("ForceField") then
                if plyr.Character:FindFirstChild("LowerTorso") and plyr.Character:FindFirstChild("HumanoidRootPart") then
                    if plyr.Character.LowerTorso:FindFirstChild("Root") then
                        plyr.Character.HumanoidRootPart.CFrame = CFrame.new(-116.546936, 190.212708, 573.527466)
                        wait(0.3)
                        plyr.Character.LowerTorso.Root:Destroy()
                    else
                        for i,atm in pairs(game:GetService("Workspace").Map.ATMs:GetChildren()) do
                            if atm:FindFirstChild("Part") and atm:FindFirstChild("HealthValue") and getgenv().thieffarm then
                                plyr.Character.HumanoidRootPart.CFrame = atm.Part.CFrame
                                local args = {[1] = atm}
                                if remote:FindFirstChild("GameTaskCompleted_Functionv.08") then
                                    remote:FindFirstChild("GameTaskCompleted_Functionv.08"):InvokeServer(unpack(args))
                                else
                                    remote:FindFirstChild("GameTaskCompleted_Functionv.07"):InvokeServer(unpack(args))
                                end
                            else
                                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        if v.HumanoidRootPart:FindFirstChild("ProximityPrompt") and getgenv().thieffarm then
                                            repeat
                                                plyr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
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
            end
        end
    end
end})

farm:AddToggle({text = "Auto Sell", callback =  function(bool)
    getgenv().sell = bool

    while wait() do
        if getgenv().sell then
            firetouchinterest(plyr.Character.HumanoidRootPart, game:GetService("Workspace").Sells.World1.Sell, 0)
            firetouchinterest(plyr.Character.HumanoidRootPart, game:GetService("Workspace").Sells.World1.Sell, 1)
        end
    end
end})

farm:AddToggle({text = "Auto Quest", callback = function(bool)
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

farm:AddToggle({text = "Upgrade Cash Making", callback = function(bool)
    getgenv().moneyxp = bool

    if bool then
        pesan.msg("Cash/Xp Making Notification!", "This function aims to increase the amount of cash/xp you get from robbing NPC [Upgrade Intimidation Stat!]", 10)
    end

    while wait() do
        if getgenv().moneyxp == true then
            local A_1 = "Intimidation"
            if remote:FindFirstChild("UpgradeStats_Functionv.08") then
                remote:FindFirstChild("UpgradeStats_Functionv.08"):InvokeServer(A_1)
            else
                remote:FindFirstChild("UpgradeStats_Functionv.07"):InvokeServer(A_1)
            end
        end
    end
end})

buy:AddList({text = "Tool", values = toolTable, callback = function(selected)
    local A_1 = "Tool"
    local A_2 = selected
    if remote:FindFirstChild("RequestPurchase_Functionv.08") then
        remote:FindFirstChild("RequestPurchase_Functionv.08"):InvokeServer(A_1,A_2)
    else
        remote:FindFirstChild("RequestPurchase_Functionv.07"):InvokeServer(A_1,A_2)
    end
    
end})

buy:AddList({text = "Backpack", values = backpackTable, callback = function(selected)
    local A_1 = "Backpack"
    local A_2 = selected
    if remote:FindFirstChild("RequestPurchase_Functionv.08") then
        remote:FindFirstChild("RequestPurchase_Functionv.08"):InvokeServer(A_1,A_2)
    else
        remote:FindFirstChild("RequestPurchase_Functionv.07"):InvokeServer(A_1,A_2)
    end
end})


buy:AddList({text = "Upgrades", values = statsTable, callback = function(selected)
    local A_1 = selected
    if remote:FindFirstChild("UpgradeStats_Functionv.08") then
        remote:FindFirstChild("UpgradeStats_Functionv.08"):InvokeServer(A_1)
    else
        remote:FindFirstChild("UpgradeStats_Functionv.07"):InvokeServer(A_1)
    end
end})

buy:AddList({text = "Blueprints", values = blueprintTable, callback = function(selected)
    local A_1 = "Blueprint"
    local A_2 = selected
    if remote:FindFirstChild("RequestPurchase_Functionv.08") then
        remote:FindFirstChild("RequestPurchase_Functionv.08"):InvokeServer(A_1,A_2)
    else
        remote:FindFirstChild("RequestPurchase_Functionv.07"):InvokeServer(A_1,A_2)
    end
end})

teleports:AddButton({text = "Quest", callback = function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Jobs.World1.Jobs.CFrame
end})

teleports:AddButton({text = "Sell", callback = function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Sells.World1.Sell.CFrame
end})

teleports:AddButton({text = "Shop", callback = function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Shops.Spawn.Shop.CFrame
end})

teleports:AddButton({text = "Group And Vip Chest", callback = function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Chests["Group Reward"].Ring.CFrame * CFrame.new(-2,0,0)
end})

teleports:AddButton({text = "Skins", callback = function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Skins.Spawn.Skins.CFrame 
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
