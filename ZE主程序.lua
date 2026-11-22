local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/maotiandi/Cat-script/refs/heads/main/CatUI.lua"))()
local lc = game:GetService("Players").LocalPlayer
local group = 811082013
local grouplink = "ZE脚本"
local creds = "ZE脚本"
local function checkGroupVerified()
    local ok, result = pcall(function()
        return lc:IsInGroup(group)
    end)
    if ok then
        return result
    end
    return nil
end
local verified = checkGroupVerified()
if verified == nil then
    task.wait(1)
    verified = checkGroupVerified()
end
if verified == nil then
    task.wait(2)
    verified = checkGroupVerified()
end
if verified == nil then
    verified = true
    warn("群组验证接口异常，已临时放行")
end
if verified then
    print("ZE验证通过，欢迎使用！")
else
    local FailWindow = WindUI:CreateWindow({
        Title = "ZE - 验证失败",
        Author = "请先加入群组",
        Folder = "ZE",
        Size = UDim2.fromOffset(390, 460),
        Transparent = false,
        Theme = "Dark",
        SideBarWidth = 150,
        ScrollBarEnabled = true,
        Background = "",
        BackgroundImageTransparency = 0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 165, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203))
        }),
        User = { Enabled = false },
    })
    FailWindow:EditOpenButton({
        Title = "ZE",
        CornerRadius = UDim.new(0, 10),
        StrokeThickness = 2.5,
        Color = ColorSequence.new(Color3.fromRGB(255, 100, 100)),
        Draggable = true,
        OnlyMobile = false,
    })
    FailWindow.ToggleKey = Enum.KeyCode.RightShift
    local FailTab = FailWindow:Tab({ Title = "验证失败", Icon = "alert-triangle" })
    FailTab:Paragraph({ Title = "问: 为什么我在这里？", Desc = "答: 因为你没加入ZE群组" })
    FailTab:Paragraph({ Title = "问: 什么是ZE群组？", Desc = "答: 是Roblox里的一个名为ZE脚本的群组" })
    FailTab:Paragraph({ Title = "问: 手机怎么加入群组", Desc = "答: Roblox主界面→更多→社区→更多群组→搜索ZE群组→加入" })
    FailTab:Paragraph({ Title = "问: 电脑怎么加入群组", Desc = "答: Roblox主界面→更多→社区→更多群组→搜索ZE脚本→加入" })
    FailTab:Paragraph({ Title = "问: 我电脑是网页版的怎么办", Desc = "答: 在你Roblox大厅有个叫(群组)的 点进去然后点击(更多群组)然后搜索(ZE群组)加入就行了" })
    setclipboard(grouplink)
    wait(999999999)
end
local currentPlaceId = game.PlaceId
local gameName = "未知"
local scriptUrl = nil
if currentPlaceId == 3623096087 then
    gameName = "力量传奇 Muscle Legends"
    scriptUrl = "https://raw.githubusercontent.com/maotiandi/Ling-script/refs/heads/ZE/ZE.lua"
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "该服务器还为制作\n若需要请联系作者\n作者QQ:3931554043",
        Text = "",
        Duration = 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
    })
    return
end
local ok, err = pcall(function()
    loadstring(game:HttpGet(scriptUrl))("ZE")
end)
if not ok then
    warn("脚本加载失败: " .. tostring(err))
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "脚本加载失败",
        Text = tostring(err),
        Duration = 8
    })
end