function GetUi() 
    if getgenv().perfect then
    if game.CoreGui:FindFirstChild("Perfect Hub GUI") then
        for a, v in ipairs(game.CoreGui:GetChildren()) do
            if v.Name == "Perfect Hub GUI" then
                v:Destroy()
            end
        end
    end
end
getgenv().perfect = true
getgenv().hub = true

local oldcolor = {
    ["Border Color"] = Color3.fromRGB(131, 181, 255),
    ["Click Effect Color"] = Color3.fromRGB(230, 230, 230),
    ["Setting Icon Color"] = Color3.fromRGB(230, 230, 230),
    ["Logo Image"] = "rbxassetid://6248942117",
    ["Search Icon Color"] = Color3.fromRGB(255, 255, 255),
    ["Search Icon Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["GUI Text Color"] = Color3.fromRGB(230, 230, 230),
    ["Text Color"] = Color3.fromRGB(230, 230, 230),
    ["Placeholder Text Color"] = Color3.fromRGB(178, 178, 178),
    ["Title Text Color"] = Color3.fromRGB(131, 181, 255),
    ["Background 1 Color"] = Color3.fromRGB(43, 43, 43),
    ["Background 1 Transparency"] = 0,
    ["Background 2 Color"] = Color3.fromRGB(90, 90, 90),
    ["Background 3 Color"] = Color3.fromRGB(53, 53, 53),
    ["Background Image"] = "",
    ["Page Selected Color"] = Color3.fromRGB(131, 181, 255),
    ["Section Text Color"] = Color3.fromRGB(131, 181, 255),
    ["Section Underline Color"] = Color3.fromRGB(131, 181, 255),
    ["Toggle Border Color"] = Color3.fromRGB(131, 181, 255),
    ["Toggle Checked Color"] = Color3.fromRGB(230, 230, 230),
    ["Toggle Desc Color"] = Color3.fromRGB(185, 185, 185),
    ["Button Color"] = Color3.fromRGB(131, 181, 255),
    ["Label Color"] = Color3.fromRGB(101, 152, 220),
    ["Dropdown Icon Color"] = Color3.fromRGB(230, 230, 230),
    ["Dropdown Selected Color"] = Color3.fromRGB(131, 181, 255),
    ["Textbox Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["Box Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["Slider Line Color"] = Color3.fromRGB(75, 75, 75),
    ["Slider Highlight Color"] = Color3.fromRGB(59, 82, 115),
    ["Tween Animation 1 Speed"] = 0.25,
    ["Tween Animation 2 Speed"] = 0.5,
    ["Tween Animation 3 Speed"] = 0.1
}

local b = {
    ["Border Color"] = Color3.fromRGB(131, 181, 255),
    ["Click Effect Color"] = Color3.fromRGB(230, 230, 230),
    ["Setting Icon Color"] = Color3.fromRGB(230, 230, 230),
    ["Logo Image"] = "rbxassetid://6248942117",
    ["Search Icon Color"] = Color3.fromRGB(255, 255, 255),
    ["Search Icon Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["GUI Text Color"] = Color3.fromRGB(230, 230, 230),
    ["Text Color"] = Color3.fromRGB(230, 230, 230),
    ["Placeholder Text Color"] = Color3.fromRGB(178, 178, 178),
    ["Title Text Color"] = Color3.fromRGB(131, 181, 255),
    ["Background Main Color"] = Color3.fromRGB(131, 181, 255),
    ["Background 1 Color"] = Color3.fromRGB(43, 43, 43),
    ["Background 1 Transparency"] = 0,
    ["Background 2 Color"] = Color3.fromRGB(90, 90, 90),
    ["Background 3 Color"] = Color3.fromRGB(53, 53, 53),
    ["Background Image"] = "",
    ["Page Selected Color"] = Color3.fromRGB(131, 181, 255),
    ["Section Text Color"] = Color3.fromRGB(131, 181, 255),
    ["Section Underline Color"] = Color3.fromRGB(131, 181, 255),
    ["Toggle Border Color"] = Color3.fromRGB(131, 181, 255),
    ["Toggle Checked Color"] = Color3.fromRGB(230, 230, 230),
    ["Toggle Desc Color"] = Color3.fromRGB(185, 185, 185),
    ["Button Color"] = Color3.fromRGB(131, 181, 255),
    ["Label Color"] = Color3.fromRGB(101, 152, 220),
    ["Dropdown Icon Color"] = Color3.fromRGB(230, 230, 230),
    ["Dropdown Selected Color"] = Color3.fromRGB(131, 181, 255),
    ["Textbox Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["Box Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["Slider Line Color"] = Color3.fromRGB(75, 75, 75),
    ["Slider Highlight Color"] = Color3.fromRGB(59, 82, 115),
    ["Tween Animation 1 Speed"] = 0.25,
    ["Tween Animation 2 Speed"] = 0.5,
    ["Tween Animation 3 Speed"] = 0.1
}

local c = {}
for d, v in pairs(b) do
    c[d] = {}
end
local e = {}
for d, v in pairs(b) do
    e[d] = {Color = v, Rainbow = false, Breathing = {Toggle = false, Color1 = Color3.new(), Color2 = Color3.new()}}
end
local function f(g)
    return {math.floor(g.r * 255), math.floor(g.g * 255), math.floor(g.b * 255), "Dit"}
end
function CorrectTable(h)
    local i = {}
    for d, v in pairs(h) do
        if typeof(v) == "Color3" then
            i[d] = f(v)
        elseif type(v) == "table" then
            i[d] = CorrectTable(v)
        else
            i[d] = v
        end
    end
    return i
end
function DCorrectTable(h)
    local i = {}
    for d, v in pairs(h) do
        if type(v) == "table" and v[4] == "Dit" then
            i[d] = Color3.fromRGB(unpack(v))
        elseif type(v) == "table" then
            i[d] = DCorrectTable(v)
        else
            i[d] = v
        end
    end
    return i
end
local j = game:GetService("HttpService")
local k = "!CustomUI.json"
function SaveCustomUISettings()
    local j = game:GetService("HttpService")
    if not isfolder("Perfect Hub") then
        makefolder("Perfect Hub")
    end
    writefile("Perfect Hub/" .. k, j:JSONEncode(CorrectTable(e)))
end
function ReadCustomUISetting()
    local l, m =
        pcall(
        function()
            local j = game:GetService("HttpService")
            if not isfolder("Perfect Hub") then
                makefolder("Perfect Hub")
            end
            local n = j:JSONDecode(readfile("Perfect Hub/" .. k))
            for d, v in pairs(n) do
                local function o()
                    if v.Color == nil then
                        return
                    end
                    if v.Rainbow == nil then
                        return
                    end
                    if v.Breathing == nil then
                        return
                    end
                    if v.Breathing.Color1 == nil then
                        return
                    end
                    if v.Breathing.Color2 == nil then
                        return
                    end
                    return true
                end
                if not o() then
                    SaveCustomUISettings()
                    return ReadCustomUISetting()
                end
            end
            return n
        end
    )
    if l then
        return m
    else
        SaveCustomUISettings()
        return ReadCustomUISetting()
    end
end
if not getgenv().hub then 
    e = DCorrectTable(ReadCustomUISetting())
    for d, v in pairs(e) do
        b[d] = v.Color
    end
end
if not getgenv().ractvkretarddumb then
    spawn(
        function()
            while wait(1) do
                SaveCustomUISettings()
            end
        end
    )
    getgenv().ractvkretarddumb = true
end
getgenv().UIColor = b
    setmetatable(
    {},
    {__newindex = function(p, q, r)
            if c[q] then
                for d, v in pairs(c[q]) do
                    v()
                end
            end
            rawset(b, q, r)
            if not e[q] then
                e[q] = {
                    Color = v,
                    Rainbow = false,
                    Breathing = {Toggle = false, Color1 = Color3.new(), Color2 = Color3.new()}
                }
            end
            e[q].Color = r
        end, __index = b}
)
local s = {}
local t = {}
local u = {}
local w = game:GetService("TweenService")
local x = game:GetService("UserInputService")
function u.ButtonEffect()
    local y = game:GetService("Players").LocalPlayer:GetMouse()
    local z = Drawing.new("Circle")
    z.Visible = true
    z.Radius = 10
    z.Filled = true
    z.Color = getgenv().UIColor["Click Effect Color"]
    z.Position = Vector2.new(y.X, y.Y + 35)
    local A = Instance.new("Folder")
    A.Parent = u.gui
    A.Name = "Game nhu buoi"
    local n = Instance.new("NumberValue")
    n.Value = 10
    n.Parent = A
    n.Name = "Rua nhu buoi"
    local B = Instance.new("NumberValue")
    B.Value = 1
    B.Parent = A
    B.Name = "Rua nhu buoi 2"
    w:Create(n, TweenInfo.new(.25), {Value = 25}):Play()
    w:Create(B, TweenInfo.new(.25), {Value = 0}):Play()
    n:GetPropertyChangedSignal("Value"):Connect(
        function()
            z.Radius = n.Value
        end
    )
    B:GetPropertyChangedSignal("Value"):Connect(
        function()
            z.Transparency = B.Value
        end
    )
    wait(.5)
    A:Destroy()
end
u.GetIMG = function(C)
    local D = "SynAsset ["
    local E = ""
    if string.find(C, "rbxassetid://") then
        E = C
    else
        pcall(
            function()
                if C and type(C) == "string" and tostring(game:HttpGet(C)):find("PNG") then
                    for a = 1, 5 do
                        D = tostring(D .. string.char(math.random(65, 122)))
                    end
                    D = D .. "].png"
                    writefile(D, game:HttpGet(C))
                    spawn(
                        function()
                            wait(5)
                            delfile(D)
                        end
                    )
                    E = getsynasset(D)
                end
            end
        )
    end
    return E
end
u.Gui = Instance.new("ScreenGui")
u.Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
u.Gui.Name = "Perfect Hub GUI"
getgenv().ReadyForGuiLoaded = false
spawn(
    function()
        u.Gui.Enabled = false
        repeat
            wait()
        until getgenv().ReadyForGuiLoaded
        u.Gui.Enabled = true
    end
)
u.NotiGui = Instance.new("ScreenGui")
u.NotiGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
u.NotiGui.Name = "Perfect Hub Notification"
local F = Instance.new("Frame")
local G = Instance.new("UIListLayout")
F.Name = "NotiContainer"
F.Parent = u.NotiGui
F.AnchorPoint = Vector2.new(1, 1)
F.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
F.BackgroundTransparency = 1.000
F.Position = UDim2.new(1, -5, 1, -5)
F.Size = UDim2.new(0, 350, 1, -10)
G.Name = "NotiList"
G.Parent = F
G.SortOrder = Enum.SortOrder.LayoutOrder
G.VerticalAlignment = Enum.VerticalAlignment.Bottom
G.Padding = UDim.new(0, 5)
wait()
getgenv().GUI = u.Gui

u.Gui.Parent = game:GetService("CoreGui")
u.NotiGui.Parent = game:GetService("CoreGui")

function u.Getcolor(g)
    return {math.floor(g.r * 255), math.floor(g.g * 255), math.floor(g.b * 255)}
end
function t.CreateNoti(H)
    getgenv().TitleNameNoti = H.Title or ""
    local I = H.Desc
    local J = H.ShowTime or 10
    local K = Instance.new("Frame")
    local L = Instance.new("Frame")
    local M = Instance.new("UICorner")
    local N = Instance.new("Frame")
    local O = Instance.new("ImageLabel")
    local P = Instance.new("UICorner")
    local Q = Instance.new("TextLabel")
    local R = Instance.new("Frame")
    local S = Instance.new("ImageLabel")
    local T = Instance.new("TextButton")
    local U = Instance.new("TextLabel")
    K.Name = "NotiFrame"
    K.Parent = F
    K.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    K.BackgroundTransparency = 1.000
    K.ClipsDescendants = true
    K.Position = UDim2.new(0, 0, 0, 0)
    K.Size = UDim2.new(1, 0, 0, 0)
    K.AutomaticSize = Enum.AutomaticSize.Y
    L.Name = "Noticontainer"
    L.Parent = K
    L.Position = UDim2.new(1, 0, 0, 0)
    L.Size = UDim2.new(1, 0, 1, 6)
    L.AutomaticSize = Enum.AutomaticSize.Y
    L.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
    table.insert(
        c["Background 3 Color"],
        function()
            L.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
        end
    )
    M.CornerRadius = UDim.new(0, 4)
    M.Parent = L
    N.Name = "Topnoti"
    N.Parent = L
    N.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    N.BackgroundTransparency = 1.000
    N.Position = UDim2.new(0, 0, 0, 5)
    N.Size = UDim2.new(1, 0, 0, 25)
    O.Name = "Ruafimg"
    O.Parent = N
    O.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    O.BackgroundTransparency = 1.000
    O.Position = UDim2.new(0, 10, 0, 0)
    O.Size = UDim2.new(0, 25, 0, 25)
    O.Image = getgenv().UIColor["Logo Image"]
    table.insert(
        c["Logo Image"],
        function()
            O.Image = u.GetIMG(getgenv().UIColor["Logo Image"])
        end
    )
    P.CornerRadius = UDim.new(1, 0)
    P.Name = "RuafimgCorner"
    P.Parent = O
    local V = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[1])
    local W = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[2])
    local X = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[3])
    local g = V .. "," .. W .. "," .. X
    Q.Text = '<font color="rgb(' .. g .. ')">Perfect Hub</font> ' .. getgenv().TitleNameNoti
    table.insert(
        c["Title Text Color"],
        function()
            local V = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[1])
            local W = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[2])
            local X = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[3])
            local g = V .. "," .. W .. "," .. X
            Q.Text = '<font color="rgb(' .. g .. ')">Perfect Hub</font> ' .. getgenv().TitleNameNoti
        end
    )
    Q.Name = "TextLabelNoti"
    Q.Parent = N
    Q.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    Q.BackgroundTransparency = 1.000
    Q.Position = UDim2.new(0, 40, 0, 0)
    Q.Size = UDim2.new(1, -40, 1, 0)
    Q.Font = Enum.Font.GothamBold
    Q.TextSize = 14.000
    Q.TextWrapped = true
    Q.TextXAlignment = Enum.TextXAlignment.Left
    Q.RichText = true
    Q.TextColor3 = getgenv().UIColor["GUI Text Color"]
    table.insert(
        c["GUI Text Color"],
        function()
            Q.TextColor3 = getgenv().UIColor["GUI Text Color"]
        end
    )
    R.Name = "CloseContainer"
    R.Parent = N
    R.AnchorPoint = Vector2.new(1, 0.5)
    R.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    R.BackgroundTransparency = 1.000
    R.Position = UDim2.new(1, -4, 0.5, 0)
    R.Size = UDim2.new(0, 22, 0, 22)
    S.Name = "CloseImage"
    S.Parent = R
    S.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    S.BackgroundTransparency = 1.000
    S.Size = UDim2.new(1, 0, 1, 0)
    S.Image = "rbxassetid://3926305904"
    S.ImageRectOffset = Vector2.new(284, 4)
    S.ImageRectSize = Vector2.new(24, 24)
    S.ImageColor3 = getgenv().UIColor["Search Icon Color"]
    table.insert(
        c["Search Icon Color"],
        function()
            S.ImageColor3 = getgenv().UIColor["Search Icon Color"]
        end
    )
    T.Parent = R
    T.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    T.BackgroundTransparency = 1.000
    T.Size = UDim2.new(1, 0, 1, 0)
    T.Font = Enum.Font.SourceSans
    T.Text = ""
    T.TextColor3 = Color3.fromRGB(0, 0, 0)
    T.TextSize = 14.000
    if I then
        U.Name = "TextColor"
        U.Parent = L
        U.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        U.BackgroundTransparency = 1.000
        U.Position = UDim2.new(0, 10, 0, 35)
        U.Size = UDim2.new(1, -15, 0, 0)
        U.Font = Enum.Font.GothamBold
        U.Text = I
        U.TextSize = 14.000
        U.TextXAlignment = Enum.TextXAlignment.Left
        U.RichText = true
        U.TextColor3 = getgenv().UIColor["Text Color"]
        U.AutomaticSize = Enum.AutomaticSize.Y
        U.TextWrapped = true
        table.insert(
            c["Text Color"],
            function()
                U.TextColor3 = getgenv().UIColor["Text Color"]
            end
        )
    end
    local function Y()
        w:Create(L, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Position = UDim2.new(1, 0, 0, 0)}):Play(

        )
        wait(.25)
        K:Destroy()
    end
    w:Create(L, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Position = UDim2.new(0, 0, 0, 0)}):Play()
    T.MouseEnter:Connect(
        function()
            w:Create(
                S,
                TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
                {ImageColor3 = getgenv().UIColor["Search Icon Highlight Color"]}
            ):Play()
        end
    )
    T.MouseLeave:Connect(
        function()
            w:Create(
                S,
                TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
                {ImageColor3 = getgenv().UIColor["Search Icon Color"]}
            ):Play()
        end
    )
    T.MouseButton1Click:Connect(
        function()
            spawn(
                function()
                    u.ButtonEffect()
                end
            )
            wait(.25)
            Y()
        end
    )
    spawn(
        function()
            wait(J)
            Y()
        end
    )
end
function t.CreateMain(H)
    local Z = tostring(H.Title) or "Perfect Hub"
    getgenv().MainDesc = H.Desc or ""
    local _ = false
    cac = false
    local function a0(a1, a2)
        local a3 = nil
        local a4 = nil
        local a5 = nil
        local a6 = nil
        a1.InputBegan:Connect(
            function(a7)
                if a7.UserInputType == Enum.UserInputType.MouseButton1 or a7.UserInputType == Enum.UserInputType.Touch then
                    a3 = true
                    a5 = a7.Position
                    a6 = a2.Position
                    a7.Changed:Connect(
                        function()
                            if a7.UserInputState == Enum.UserInputState.End then
                                a3 = false
                            end
                        end
                    )
                end
            end
        )
        a1.InputChanged:Connect(
            function(a7)
                if a7.UserInputType == Enum.UserInputType.MouseMovement or a7.UserInputType == Enum.UserInputType.Touch then
                    a4 = a7
                end
            end
        )
        x.InputChanged:Connect(
            function(a7)
                if a7 == a4 and a3 then
                    local a8 = a7.Position - a5
                    if not _ and cac then
                        w:Create(
                            a2,
                            TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Position = UDim2.new(a6.X.Scale, a6.X.Offset + a8.X, a6.Y.Scale, a6.Y.Offset + a8.Y)}
                        ):Play()
                    elseif not _ and not cac then
                        a2.Position = UDim2.new(a6.X.Scale, a6.X.Offset + a8.X, a6.Y.Scale, a6.Y.Offset + a8.Y)
                    end
                end
            end
        )
    end
    local a9 = Instance.new("Frame")
    local aa = Instance.new("ImageLabel")
    local ab = Instance.new("UICorner")
    local ac = Instance.new("Frame")
    local O = Instance.new("ImageLabel")
    local ad = Instance.new("TextLabel")
    local ae = Instance.new("Frame")
    local M = Instance.new("UICorner")
    local af = Instance.new("ScrollingFrame")
    local ag = Instance.new("UIListLayout")
    local ah = Instance.new("TextLabel")
    local ai = Instance.new("Frame")
    local aj = Instance.new("UIPageLayout")
    local ak = Instance.new("Frame")
    local al = Instance.new("TextButton")
    local am = Instance.new("ImageLabel")
    local an = Instance.new("Frame")
    local ao = Instance.new("Frame")
    local ap = Instance.new("Frame")
    local aq = Instance.new("UIPageLayout")
    local ar
    a9.Name = "Main"
    a9.Parent = u.Gui
    a9.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
    a9.BackgroundTransparency = 1.000
    a9.Position = UDim2.new(0.5, 0, 0.5, 0)
    a9.AnchorPoint = Vector2.new(0.5, 0.5)
    a9.Size = UDim2.new(0, 629, 0, 359)
    a0(a9, a9)
    aa.Name = "maingui"
    aa.Parent = a9
    aa.AnchorPoint = Vector2.new(0.5, 0.5)
    aa.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    aa.BackgroundTransparency = 1.000
    aa.Position = UDim2.new(0.5, 0, 0.5, 0)
    aa.Selectable = true
    aa.Size = UDim2.new(1, 30, 1, 30)
    aa.Image = "rbxassetid://8068653048"
    aa.ScaleType = Enum.ScaleType.Slice
    aa.SliceCenter = Rect.new(15, 15, 175, 175)
    aa.SliceScale = 1.300
    aa.ImageColor3 = getgenv().UIColor["Border Color"]
    table.insert(
        c["Border Color"],
        function()
            aa.ImageColor3 = getgenv().UIColor["Border Color"]
        end
    )
    function u.ReloadMain(v)
        aa.ImageColor3 = getgenv().UIColor["Title Text Color"]
        local V = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[1])
        local W = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[2])
        local X = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[3])
        local g = V .. "," .. W .. "," .. X
        ad.Text = '<font color="rgb(' .. g .. ')">Perfect Hub</font> ' .. getgenv().MainDesc
        table.insert(
            c["Title Text Color"],
            function()
                aa.ImageColor3 = getgenv().UIColor["Title Text Color"]
                local V = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[1])
                local W = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[2])
                local X = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[3])
                local g = V .. "," .. W .. "," .. X
                ad.Text = '<font color="rgb(' .. g .. ')">Perfect Hub</font> ' .. getgenv().MainDesc
            end
        )
        local as
        if
            v ~= "" and type(v) == "string" and string.find(v:lower(), ".webm") and
                pcall(
                    function()
                        writefile("seahub.webm", syn.request({Url = v}).Body)
                    end
                )
         then
            wait(.25)
            local at = isfile("seahub.webm")
            wait(.25)
            if at then
                as = Instance.new("VideoFrame")
                as.Name = "MainContainer"
                as.Parent = a9
                as.BackgroundColor3 = getgenv().UIColor["Background Main Color"]
                as.Size = UDim2.new(1, 0, 1, 0)
                as.Video = getsynasset("seahub.webm")
                as.Looped = true
                as:Play()
                wait(.5)
                delfile("seahub.webm")
            end
        else
            as = Instance.new("ImageLabel")
            as.Name = "MainContainer"
            as.Parent = a9
            as.BackgroundColor3 = getgenv().UIColor["Background Main Color"]
            as.Size = UDim2.new(1, 0, 1, 0)
            as.Image = u.GetIMG(v)
        end
        MainCorner_ = Instance.new("UICorner")
        MainCorner_.CornerRadius = UDim.new(0, 4)
        MainCorner_.Name = "MainCorner"
        MainCorner_.Parent = as
        for a, m in next, a9:GetChildren() do
            if m.Name == "MainContainer" then
                for a, v in next, m:GetChildren() do
                    v.Parent = as
                end
                wait()
                m:Destroy()
                break
            end
        end
        table.insert(
            c["Background 3 Color"],
            function()
                as.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
            end
        )
    end
    aa.ImageColor3 = getgenv().UIColor["Title Text Color"]
    local V = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[1])
    local W = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[2])
    local X = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[3])
    local g = V .. "," .. W .. "," .. X
    ad.Text = '<font color="rgb(' .. g .. ')">Perfect Hub</font> ' .. getgenv().MainDesc
    table.insert(
        c["Title Text Color"],
        function()
            aa.ImageColor3 = getgenv().UIColor["Title Text Color"]
            local V = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[1])
            local W = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[2])
            local X = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[3])
            local g = V .. "," .. W .. "," .. X
            ad.Text = '<font color="rgb(' .. g .. ')">Perfect Hub</font> ' .. getgenv().MainDesc
        end
    )
    local ar
    local au = getgenv().UIColor["Background Image"]
    if
        au ~= "" and type(au) == "string" and string.find(au:lower(), ".webm") and
            pcall(
                function()
                    writefile("seahub.webm", syn.request({Url = au}).Body)
                end
            )
     then
        wait(.25)
        local at = isfile("seahub.webm")
        wait(.25)
        if at then
            ar = Instance.new("VideoFrame")
            ar.Name = "MainContainer"
            ar.Parent = a9
            ar.BackgroundColor3 = getgenv().UIColor["Background Main Color"]
            ar.Size = UDim2.new(1, 0, 1, 0)
            ar.Video = getsynasset("seahub.webm")
            ar.Looped = true
            ar:Play()
            wait(.5)
            delfile("seahub.webm")
        end
    else
        ar = Instance.new("ImageLabel")
        ar.Name = "MainContainer"
        ar.Parent = a9
        ar.BackgroundColor3 = getgenv().UIColor["Background Main Color"]
        ar.Size = UDim2.new(1, 0, 1, 0)
        ar.Image = u.GetIMG(au)
    end
    table.insert(
        c["Background 3 Color"],
        function()
            ar.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
        end
    )
    getgenv().ReadyForGuiLoaded = true
    ab.CornerRadius = UDim.new(0, 4)
    ab.Name = "MainCorner"
    ab.Parent = ar
    an.Name = "Concacontainer"
    an.Parent = ar
    an.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    an.BackgroundTransparency = 1.000
    an.ClipsDescendants = true
    an.Position = UDim2.new(0, 0, 0, 30)
    an.Size = UDim2.new(1, 0, 1, -30)
    ao.Name = "Concacmain"
    ao.Parent = an
    ao.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ao.BackgroundTransparency = 1.000
    ao.Selectable = true
    ao.Size = UDim2.new(1, 0, 1, 0)
    ap.Name = "Background1"
    ap.Parent = an
    ap.LayoutOrder = 1
    ap.Selectable = true
    ap.Size = UDim2.new(1, 0, 1, 0)
    ap.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
    table.insert(
        c["Background 1 Transparency"],
        function()
            ap.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
        end
    )
    ap.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
    table.insert(
        c["Background 1 Color"],
        function()
            ap.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
        end
    )
    aq.Name = "Concacpage"
    aq.Parent = an
    aq.SortOrder = Enum.SortOrder.LayoutOrder
    aq.EasingDirection = Enum.EasingDirection.InOut
    aq.EasingStyle = Enum.EasingStyle.Quad
    aq.TweenTime = getgenv().UIColor["Tween Animation 1 Speed"]
    table.insert(
        c["Tween Animation 1 Speed"],
        function()
            aq.TweenTime = getgenv().UIColor["Tween Animation 1 Speed"]
        end
    )
    ac.Name = "TopMain"
    ac.Parent = ar
    ac.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ac.BackgroundTransparency = 1.000
    ac.Size = UDim2.new(1, 0, 0, 25)
    O.Name = "Ruafimg"
    O.Parent = ac
    O.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    O.BackgroundTransparency = 1.000
    O.Position = UDim2.new(0, 5, 0, 0)
    O.Size = UDim2.new(0, 25, 0, 25)
    O.Image = getgenv().UIColor["Logo Image"]
    table.insert(
        c["Logo Image"],
        function()
            O.Image = getgenv().UIColor["Logo Image"]
        end
    )
    ad.Name = "TextLabelMain"
    ad.Parent = ac
    ad.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    ad.BackgroundTransparency = 1.000
    ad.Position = UDim2.new(0, 35, 0, 0)
    ad.Size = UDim2.new(1, -35, 1, 0)
    ad.Font = Enum.Font.GothamBold
    ad.RichText = true
    ad.TextSize = 16.000
    ad.TextWrapped = true
    ad.TextXAlignment = Enum.TextXAlignment.Left
    ad.TextColor3 = getgenv().UIColor["GUI Text Color"]
    table.insert(
        c["GUI Text Color"],
        function()
            ad.TextColor3 = getgenv().UIColor["GUI Text Color"]
        end
    )
    local V = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[1])
    local W = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[2])
    local X = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[3])
    local g = V .. "," .. W .. "," .. X
    ad.Text = '<font color="rgb(' .. g .. ')">Perfect Hub</font> ' .. getgenv().MainDesc
    table.insert(
        c["Title Text Color"],
        function()
            local V = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[1])
            local W = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[2])
            local X = tostring(u.Getcolor(getgenv().UIColor["Title Text Color"])[3])
            local g = V .. "," .. W .. "," .. X
            ad.Text = '<font color="rgb(' .. g .. ')">Perfect Hub</font> ' .. getgenv().MainDesc
        end
    )
    ak.Name = "SettionMain"
    ak.Parent = ac
    ak.AnchorPoint = Vector2.new(1, 0)
    ak.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ak.BackgroundTransparency = 1.000
    ak.Position = UDim2.new(1, 0, 0, 0)
    ak.Size = UDim2.new(0, 30, 0, 30)
    al.Name = "SettionButton"
    al.Parent = ak
    al.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    al.BackgroundTransparency = 1.000
    al.BorderColor3 = Color3.fromRGB(27, 42, 53)
    al.Size = UDim2.new(1, 0, 1, 0)
    al.Font = Enum.Font.SourceSans
    al.Text = ""
    al.TextColor3 = Color3.fromRGB(0, 0, 0)
    al.TextSize = 14.000
    al.Visible = true
    am.Name = "SettingIcon"
    am.Parent = ak
    am.AnchorPoint = Vector2.new(0.5, 0.5)
    am.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    am.BackgroundTransparency = 1.000
    am.Position = UDim2.new(0.5, 0, 0.5, 0)
    am.Size = UDim2.new(1, -10, 1, -10)
    am.Image = "rbxassetid://7397332215"
    am.Visible = true
    am.ImageColor3 = getgenv().UIColor["Setting Icon Color"]
    table.insert(
        c["Setting Icon Color"],
        function()
            am.ImageColor3 = getgenv().UIColor["Setting Icon Color"]
        end
    )
    ae.Name = "Background1"
    ae.Parent = ao
    ae.Position = UDim2.new(0, 5, 0, 0)
    ae.Size = UDim2.new(0, 180, 0, 325)
    ae.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
    table.insert(
        c["Background 1 Transparency"],
        function()
            ae.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
        end
    )
    ae.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
    table.insert(
        c["Background 1 Color"],
        function()
            ae.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
        end
    )
    M.CornerRadius = UDim.new(0, 4)
    M.Parent = ae
    af.Name = "ControlList"
    af.Parent = ae
    af.Active = true
    af.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    af.BackgroundTransparency = 1.000
    af.BorderColor3 = Color3.fromRGB(27, 42, 53)
    af.BorderSizePixel = 0
    af.Position = UDim2.new(0, 0, 0, 30)
    af.Size = UDim2.new(1, -5, 1, -30)
    af.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    af.CanvasSize = UDim2.new(0, 0, 0, 0)
    af.ScrollBarThickness = 5
    af.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    ag.Parent = af
    ag.SortOrder = Enum.SortOrder.LayoutOrder
    ag.Padding = UDim.new(0, 5)
    ah.Name = "GUITextColor"
    ah.Parent = ae
    ah.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    ah.BackgroundTransparency = 1.000
    ah.Position = UDim2.new(0, 5, 0, 0)
    ah.Size = UDim2.new(1, 0, 0, 25)
    ah.Font = Enum.Font.GothamBold
    ah.Text = Z
    ah.TextSize = 14.000
    ah.TextXAlignment = Enum.TextXAlignment.Left
    ah.TextColor3 = getgenv().UIColor["GUI Text Color"]
    table.insert(
        c["GUI Text Color"],
        function()
            ah.TextColor3 = getgenv().UIColor["GUI Text Color"]
        end
    )
    ai.Name = "MainPage"
    ai.Parent = ao
    ai.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    ai.BackgroundTransparency = 1.000
    ai.ClipsDescendants = true
    ai.Position = UDim2.new(0, 190, 0, 0)
    ai.Size = UDim2.new(0, 435, 0, 325)
    aj.Name = "UIPage"
    aj.Parent = ai
    aj.FillDirection = Enum.FillDirection.Vertical
    aj.SortOrder = Enum.SortOrder.LayoutOrder
    aj.EasingDirection = Enum.EasingDirection.InOut
    aj.EasingStyle = Enum.EasingStyle.Quart
    aj.Padding = UDim.new(0, 10)
    aj.TweenTime = getgenv().UIColor["Tween Animation 1 Speed"]
    aj.ScrollWheelInputEnabled = false
    table.insert(
        c["Tween Animation 1 Speed"],
        function()
            aj.TweenTime = getgenv().UIColor["Tween Animation 1 Speed"]
        end
    )
    ag:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        function()
            af.CanvasSize = UDim2.new(0, 0, 0, ag.AbsoluteContentSize.Y + 5)
        end
    )
    local av = false
    al.MouseButton1Click:Connect(
        function()
            u.ButtonEffect()
        end
    )
    al.MouseButton1Click:Connect(
        function()
            av = not av
            pa = av and 1 or 0
            ro = av and 180 or 0
            game.TweenService:Create(am, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Rotation = ro}):Play(

            )
        end
    )
    local aw = Instance.new("ScrollingFrame")
    local ax = Instance.new("UIListLayout")
    aw.Name = "CustomList"
    aw.Parent = ap
    aw.Active = true
    aw.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    aw.BackgroundTransparency = 1.000
    aw.BorderColor3 = Color3.fromRGB(27, 42, 53)
    aw.BorderSizePixel = 0
    aw.Position = UDim2.new(0, 5, 0, 30)
    aw.Size = UDim2.new(1, -10, 1, -30)
    aw.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    aw.ScrollBarThickness = 5
    aw.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    ax.Name = "CustomListLayout"
    ax.Parent = aw
    ax.SortOrder = Enum.SortOrder.LayoutOrder
    ax.Padding = UDim.new(0, 5)
    ax:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        function()
            aw.CanvasSize = UDim2.new(0, 0, 0, ax.AbsoluteContentSize.Y + 5)
        end
    )
    local ay = Instance.new("TextLabel")
    ay.Name = "GUITextColor"
    ay.Parent = ap
    ay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ay.BackgroundTransparency = 1.000
    ay.Position = UDim2.new(0, 15, 0, 0)
    ay.Size = UDim2.new(1, -15, 0, 25)
    ay.Font = Enum.Font.GothamBold
    ay.Text = ""
    ay.TextSize = 16.000
    ay.TextXAlignment = Enum.TextXAlignment.Left
    ay.TextColor3 = getgenv().UIColor["GUI Text Color"]
    table.insert(
        c["GUI Text Color"],
        function()
            ay.TextColor3 = getgenv().UIColor["GUI Text Color"]
        end
    )
    local az = Instance.new("Frame")
    local aA = Instance.new("UICorner")
    local aB = Instance.new("Frame")
    local aC = Instance.new("ImageLabel")
    local aD = Instance.new("TextButton")
    local aE = Instance.new("TextBox")
    az.Name = "Background2"
    az.Parent = ap
    az.AnchorPoint = Vector2.new(1, 0)
    az.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
    az.ClipsDescendants = true
    az.Position = UDim2.new(1, -5, 0, 5)
    az.Size = UDim2.new(0, 20, 0, 20)
    az.ClipsDescendants = true
    table.insert(
        c["Background 2 Color"],
        function()
            az.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
        end
    )
    aA.CornerRadius = UDim.new(0, 2)
    aA.Name = "PageSearchCorner"
    aA.Parent = az
    aB.Name = "SearchFrame"
    aB.Parent = az
    aB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    aB.BackgroundTransparency = 1.000
    aB.Size = UDim2.new(0, 20, 0, 20)
    aC.Name = "SearchIcon"
    aC.Parent = aB
    aC.AnchorPoint = Vector2.new(0.5, 0.5)
    aC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    aC.BackgroundTransparency = 1.000
    aC.Position = UDim2.new(0.5, 0, 0.5, 0)
    aC.Size = UDim2.new(0, 16, 0, 16)
    aC.Image = "rbxassetid://8154282545"
    aC.ImageColor3 = getgenv().UIColor["Search Icon Color"]
    table.insert(
        c["Search Icon Color"],
        function()
            aC.ImageColor3 = getgenv().UIColor["Search Icon Color"]
        end
    )
    aD.Name = "active"
    aD.Parent = aB
    aD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    aD.BackgroundTransparency = 1.000
    aD.Size = UDim2.new(1, 0, 1, 0)
    aD.Font = Enum.Font.SourceSans
    aD.Text = ""
    aD.TextColor3 = Color3.fromRGB(0, 0, 0)
    aD.TextSize = 14.000
    aE.Name = "TextColorPlaceholder"
    aE.Parent = az
    aE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    aE.BackgroundTransparency = 1.000
    aE.Position = UDim2.new(0, 30, 0, 0)
    aE.Size = UDim2.new(1, -30, 1, 0)
    aE.Font = Enum.Font.GothamBold
    aE.Text = ""
    aE.TextSize = 14.000
    aE.TextXAlignment = Enum.TextXAlignment.Left
    aE.PlaceholderText = "Search Section name"
    aE.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
    aE.TextColor3 = getgenv().UIColor["Text Color"]
    table.insert(
        c["Placeholder Text Color"],
        function()
            aE.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
        end
    )
    table.insert(
        c["Text Color"],
        function()
            aE.TextColor3 = getgenv().UIColor["Text Color"]
        end
    )
    local aF = false
    aD.MouseEnter:Connect(
        function()
            w:Create(
                aC,
                TweenInfo.new(getgenv().UIColor["Tween Animation 3 Speed"]),
                {ImageColor3 = getgenv().UIColor["Search Icon Highlight Color"]}
            ):Play()
        end
    )
    aD.MouseLeave:Connect(
        function()
            w:Create(
                aC,
                TweenInfo.new(getgenv().UIColor["Tween Animation 3 Speed"]),
                {ImageColor3 = getgenv().UIColor["Search Icon Color"]}
            ):Play()
        end
    )
    aD.MouseButton1Click:Connect(
        function()
            u.ButtonEffect()
        end
    )
    aE.Focused:Connect(
        function()
            u.ButtonEffect()
        end
    )
    aD.MouseButton1Click:Connect(
        function()
            aF = not aF
            local aG = aF and UDim2.new(0, 175, 0, 20) or UDim2.new(0, 20, 0, 20)
            game.TweenService:Create(az, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = aG}):Play(

            )
        end
    )
    local function aH()
        for a, v in next, aw:GetChildren() do
            if not v:IsA("UIListLayout") then
                v.Visible = false
            end
        end
    end
    local function aI()
        for n, B in pairs(aw:GetChildren()) do
            if not B:IsA("UIListLayout") then
                if string.find(string.lower(B.Name), string.lower(aE.Text)) then
                    B.Visible = true
                end
            end
        end
    end
    aE:GetPropertyChangedSignal("Text"):Connect(
        function()
            aH()
            aI()
        end
    )
    function t.CreateCustomColor(aJ)
        ay.Text = aJ or "Custom GUI"
        local aK = {}
        function aK.CreateSection(aL)
            local aM = Instance.new("Frame")
            local M = Instance.new("UICorner")
            local aN = Instance.new("Frame")
            local aO = Instance.new("TextLabel")
            local aP = Instance.new("Frame")
            local aQ = Instance.new("UIGradient")
            local aR = Instance.new("UIListLayout")
            local aS = aL or "Section"
            aM.Name = aL .. "Section"
            aM.Parent = aw
            aM.Size = UDim2.new(1, 0, 0, 285)
            aM.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
            table.insert(
                c["Background 3 Color"],
                function()
                    aM.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
                end
            )
            aM.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
            table.insert(
                c["Background 1 Transparency"],
                function()
                    aM.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                end
            )
            M.CornerRadius = UDim.new(0, 4)
            M.Parent = aM
            aN.Name = "Topsec"
            aN.Parent = aM
            aN.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            aN.BackgroundTransparency = 1.000
            aN.Size = UDim2.new(1, 0, 0, 27)
            aO.Name = "Sectiontitle"
            aO.Parent = aN
            aO.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            aO.BackgroundTransparency = 1.000
            aO.Size = UDim2.new(1, 0, 1, 0)
            aO.Font = Enum.Font.GothamBold
            aO.Text = aL
            aO.TextSize = 14.000
            aO.TextColor3 = getgenv().UIColor["Section Text Color"]
            table.insert(
                c["Section Text Color"],
                function()
                    aO.TextColor3 = getgenv().UIColor["Section Text Color"]
                end
            )
            aP.Name = "Linesec"
            aP.Parent = aN
            aP.AnchorPoint = Vector2.new(0.5, 1)
            aP.BorderSizePixel = 0
            aP.Position = UDim2.new(0.5, 0, 1, -2)
            aP.Size = UDim2.new(1, -10, 0, 2)
            aP.BackgroundColor3 = getgenv().UIColor["Section Underline Color"]
            table.insert(
                c["Section Underline Color"],
                function()
                    aP.BackgroundColor3 = getgenv().UIColor["Section Underline Color"]
                end
            )
            aQ.Transparency =
                NumberSequence.new {
                NumberSequenceKeypoint.new(0.00, 1.00),
                NumberSequenceKeypoint.new(0.50, 0.00),
                NumberSequenceKeypoint.new(0.51, 0.02),
                NumberSequenceKeypoint.new(1.00, 1.00)
            }
            aQ.Parent = aP
            aR.Name = "SectionList"
            aR.Parent = aM
            aR.SortOrder = Enum.SortOrder.LayoutOrder
            aR.Padding = UDim.new(0, 5)
            aR:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                function()
                    aM.Size = UDim2.new(1, 0, 0, aR.AbsoluteContentSize.Y + 5)
                end
            )
            local aT = {}
            function aT.CreateColorPicker(H)
                local aU =
                    setmetatable(
                    {},
                    {__index = function(p, q)
                            if q == "Cungroi" then
                                return e[H.Type].Rainbow
                            end
                        end, __newindex = function(p, q, r)
                            if q == "Cungroi" then
                                e[H.Type].Rainbow = r
                            end
                        end}
                )
                local aV, aW, aX
                local aY = H.Title or "Color Picker"
                local aZ = e[H.Type].Color or Color3.fromRGB(255, 255, 255)
                local a_ = H.Type
                local b0 = Instance.new("Frame")
                local b1 = Instance.new("UICorner")
                local b2 = Instance.new("Frame")
                local b3 = Instance.new("UICorner")
                local b4 = Instance.new("TextLabel")
                local b5 = Instance.new("Frame")
                local b6 = Instance.new("UICorner")
                local b7 = Instance.new("TextButton")
                local b8 = Instance.new("Frame")
                local b9 = Instance.new("UIGradient")
                local ba = Instance.new("Frame")
                local M = Instance.new("UICorner")
                local bb = Instance.new("Frame")
                local bc = Instance.new("Frame")
                local bd = Instance.new("TextLabel")
                local be = Instance.new("TextBox")
                local bf = Instance.new("Frame")
                local bg = Instance.new("TextLabel")
                local bh = Instance.new("TextBox")
                local bi = Instance.new("Frame")
                local bj = Instance.new("TextLabel")
                local bk = Instance.new("TextBox")
                local ag = Instance.new("UIListLayout")
                local bl = Instance.new("Frame")
                local bm = Instance.new("TextLabel")
                local bn = Instance.new("TextBox")
                local aP = Instance.new("Frame")
                local aQ = Instance.new("UIGradient")
                local bo = Instance.new("Frame")
                local bp = Instance.new("Frame")
                local bq = Instance.new("TextLabel")
                local br = Instance.new("ImageLabel")
                local bs = Instance.new("ImageLabel")
                local bt = Instance.new("TextButton")
                local bu = Instance.new("ImageLabel")
                local bv = Instance.new("Frame")
                local bw = Instance.new("UICorner")
                local bx = Instance.new("Frame")
                local by = Instance.new("Frame")
                local bz = Instance.new("TextLabel")
                local bA = Instance.new("ImageLabel")
                local bB = Instance.new("ImageLabel")
                local bC = Instance.new("TextButton")
                local bD = Instance.new("Frame")
                local bE = Instance.new("UIListLayout")
                local bF = Instance.new("Frame")
                local bG = Instance.new("UICorner")
                local bH = Instance.new("TextButton")
                local bI = Instance.new("Frame")
                local bJ = Instance.new("UICorner")
                local bK = Instance.new("TextButton")
                b0.Name = "ColorPick"
                b0.Parent = aM
                b0.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                b0.BackgroundTransparency = 1.000
                b0.ClipsDescendants = true
                b0.Position = UDim2.new(0, 0, 0.112280704, 0)
                b0.Size = UDim2.new(1, 0, 0, 35)
                b1.CornerRadius = UDim.new(0, 4)
                b1.Name = "ColorPickCorner"
                b1.Parent = b0
                b2.Name = "Background1"
                b2.Parent = b0
                b2.AnchorPoint = Vector2.new(0.5, 0.5)
                b2.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                b2.Position = UDim2.new(0.5, 0, 0.5, 0)
                b2.Size = UDim2.new(1, -10, 1, 0)
                table.insert(
                    c["Background 1 Color"],
                    function()
                        b2.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                    end
                )
                b2.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        b2.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                b3.CornerRadius = UDim.new(0, 4)
                b3.Name = "ColorpickBGCorner"
                b3.Parent = b2
                b4.Name = "TextColor"
                b4.Parent = b2
                b4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                b4.BackgroundTransparency = 1.000
                b4.Position = UDim2.new(0, 10, 0, 0)
                b4.Size = UDim2.new(1, -10, 0, 35)
                b4.Font = Enum.Font.GothamBlack
                b4.Text = aY
                b4.TextSize = 14.000
                b4.TextXAlignment = Enum.TextXAlignment.Left
                b4.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        b4.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                b5.Name = "ColorVal"
                b5.Parent = b0
                b5.AnchorPoint = Vector2.new(1, 0)
                b5.BackgroundColor3 = e[a_].Color
                b5.Position = UDim2.new(1, -10, 0, 5)
                b5.Size = UDim2.new(0, 150, 0, 25)
                b6.CornerRadius = UDim.new(0, 4)
                b6.Name = "ColorValCorner"
                b6.Parent = b5
                b7.Name = "ColorValButton"
                b7.Parent = b5
                b7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                b7.BackgroundTransparency = 1.000
                b7.Size = UDim2.new(1, 0, 1, 0)
                b7.Font = Enum.Font.SourceSans
                b7.Text = ""
                b7.TextColor3 = Color3.fromRGB(0, 0, 0)
                b7.TextSize = 14.000
                b8.Name = "Hue"
                b8.Parent = b0
                b8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                b8.BorderSizePixel = 0
                b8.Position = UDim2.new(0, 460, 0, 40)
                b8.Size = UDim2.new(0, 25, 0, 200)
                b9.Color =
                    ColorSequence.new {
                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
                    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(235, 7, 255)),
                    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 9, 189)),
                    ColorSequenceKeypoint.new(0.49, Color3.fromRGB(0, 193, 196)),
                    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 255, 0)),
                    ColorSequenceKeypoint.new(0.84, Color3.fromRGB(255, 247, 0)),
                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
                }
                b9.Rotation = 90
                b9.Name = "HueGra"
                b9.Parent = b8
                ba.Parent = b8
                ba.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ba.Position = UDim2.new(0, 0, 1, 0)
                ba.Size = UDim2.new(1, 0, 0, 2)
                M.CornerRadius = UDim.new(0, 4)
                M.Parent = b8
                bb.Name = "Concac"
                bb.Parent = b0
                bb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bb.BackgroundTransparency = 1.000
                bb.Position = UDim2.new(0, 495, 0, 40)
                bb.Size = UDim2.new(0, 115, 0, 100)
                bc.Name = "RFrame"
                bc.Parent = bb
                bc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bc.BackgroundTransparency = 1.000
                bc.Size = UDim2.new(1, 0, 0, 25)
                bc.LayoutOrder = 0
                bd.Name = "RText"
                bd.Parent = bc
                bd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bd.BackgroundTransparency = 1.000
                bd.Size = UDim2.new(0, 25, 0, 25)
                bd.Font = Enum.Font.GothamBold
                bd.Text = "R:"
                bd.TextColor3 = Color3.fromRGB(115, 115, 115)
                bd.TextSize = 14.000
                bd.TextXAlignment = Enum.TextXAlignment.Left
                be.Name = "RBox"
                be.Parent = bc
                be.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                be.BackgroundTransparency = 1.000
                be.Position = UDim2.new(0, 25, 0, 0)
                be.Size = UDim2.new(1, -25, 1, 0)
                be.ClearTextOnFocus = false
                be.Font = Enum.Font.GothamBold
                be.Text = "255"
                be.TextColor3 = Color3.fromRGB(255, 255, 255)
                be.TextSize = 14.000
                be.TextXAlignment = Enum.TextXAlignment.Left
                bf.Name = "GFrame"
                bf.Parent = bb
                bf.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bf.BackgroundTransparency = 1.000
                bf.Size = UDim2.new(1, 0, 0, 25)
                bf.LayoutOrder = 1
                bg.Name = "GText"
                bg.Parent = bf
                bg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bg.BackgroundTransparency = 1.000
                bg.Size = UDim2.new(0, 25, 0, 25)
                bg.Font = Enum.Font.GothamBold
                bg.Text = "G:"
                bg.TextColor3 = Color3.fromRGB(115, 115, 115)
                bg.TextSize = 14.000
                bg.TextXAlignment = Enum.TextXAlignment.Left
                bh.Name = "GBox"
                bh.Parent = bf
                bh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bh.BackgroundTransparency = 1.000
                bh.Position = UDim2.new(0, 25, 0, 0)
                bh.Size = UDim2.new(1, -25, 1, 0)
                bh.ClearTextOnFocus = false
                bh.Font = Enum.Font.GothamBold
                bh.Text = "255"
                bh.TextColor3 = Color3.fromRGB(255, 255, 255)
                bh.TextSize = 14.000
                bh.TextXAlignment = Enum.TextXAlignment.Left
                bi.Name = "BFrame"
                bi.Parent = bb
                bi.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bi.BackgroundTransparency = 1.000
                bi.Size = UDim2.new(1, 0, 0, 25)
                bi.LayoutOrder = 2
                bj.Name = "BText"
                bj.Parent = bi
                bj.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bj.BackgroundTransparency = 1.000
                bj.Size = UDim2.new(0, 25, 0, 25)
                bj.Font = Enum.Font.GothamBold
                bj.Text = "B:"
                bj.TextColor3 = Color3.fromRGB(115, 115, 115)
                bj.TextSize = 14.000
                bj.TextXAlignment = Enum.TextXAlignment.Left
                bk.Name = "BBox"
                bk.Parent = bi
                bk.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bk.BackgroundTransparency = 1.000
                bk.Position = UDim2.new(0, 25, 0, 0)
                bk.Size = UDim2.new(1, -25, 1, 0)
                bk.ClearTextOnFocus = false
                bk.Font = Enum.Font.GothamBold
                bk.Text = "255"
                bk.TextColor3 = Color3.fromRGB(255, 255, 255)
                bk.TextSize = 14.000
                bk.TextXAlignment = Enum.TextXAlignment.Left
                ag.Parent = bb
                ag.SortOrder = Enum.SortOrder.LayoutOrder
                bl.Name = "HexFrame"
                bl.Parent = bb
                bl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bl.BackgroundTransparency = 1.000
                bl.Size = UDim2.new(1, 0, 0, 25)
                bl.LayoutOrder = 3
                bm.Name = "HexText"
                bm.Parent = bl
                bm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bm.BackgroundTransparency = 1.000
                bm.Size = UDim2.new(0, 25, 0, 25)
                bm.Font = Enum.Font.GothamBold
                bm.Text = "#"
                bm.TextColor3 = Color3.fromRGB(115, 115, 115)
                bm.TextSize = 14.000
                bm.TextXAlignment = Enum.TextXAlignment.Left
                bn.Name = "HexBox"
                bn.Parent = bl
                bn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bn.BackgroundTransparency = 1.000
                bn.Position = UDim2.new(0, 25, 0, 0)
                bn.Size = UDim2.new(1, -25, 1, 0)
                bn.ClearTextOnFocus = false
                bn.Font = Enum.Font.GothamBold
                bn.Text = "FFFFFF"
                bn.TextColor3 = Color3.fromRGB(255, 255, 255)
                bn.TextSize = 14.000
                bn.TextXAlignment = Enum.TextXAlignment.Left
                aP.Name = "Linesec"
                aP.Parent = bb
                aP.AnchorPoint = Vector2.new(0.5, 1)
                aP.BorderSizePixel = 0
                aP.Position = UDim2.new(0.5, 0, 1, -2)
                aP.Size = UDim2.new(1, -10, 0, 2)
                aP.LayoutOrder = 4
                aP.BackgroundColor3 = getgenv().UIColor["Section Underline Color"]
                table.insert(
                    c["Section Underline Color"],
                    function()
                        aP.BackgroundColor3 = getgenv().UIColor["Section Underline Color"]
                    end
                )
                aQ.Transparency =
                    NumberSequence.new {
                    NumberSequenceKeypoint.new(0.00, 1.00),
                    NumberSequenceKeypoint.new(0.30, 0.25),
                    NumberSequenceKeypoint.new(0.70, 0.25),
                    NumberSequenceKeypoint.new(1.00, 1.00)
                }
                aQ.Parent = aP
                bo.Name = "CungroiF"
                bo.Parent = b0
                bo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bo.BackgroundTransparency = 1.000
                bo.Position = UDim2.new(0, 495, 0, 145)
                bo.Size = UDim2.new(0, 115, 0, 25)
                bp.Name = "CungroiFF"
                bp.Parent = bo
                bp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bp.BackgroundTransparency = 1.000
                bp.Size = UDim2.new(1, 0, 0, 25)
                bp.LayoutOrder = 4
                bq.Name = "TextColor"
                bq.Parent = bp
                bq.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bq.BackgroundTransparency = 1.000
                bq.Size = UDim2.new(0, 85, 0, 25)
                bq.Font = Enum.Font.GothamBold
                bq.Text = "Rainbow"
                bq.TextSize = 14.000
                bq.TextXAlignment = Enum.TextXAlignment.Left
                bq.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        bq.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                br.Name = "Setting_checkbox"
                br.Parent = bp
                br.AnchorPoint = Vector2.new(1, 0.5)
                br.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                br.BackgroundTransparency = 1.000
                br.Position = UDim2.new(1, -5, 0.5, 0)
                br.Size = UDim2.new(0, 25, 0, 25)
                br.Image = "rbxassetid://4552505888"
                br.ImageColor3 = getgenv().UIColor["Toggle Border Color"]
                table.insert(
                    c["Toggle Border Color"],
                    function()
                        br.ImageColor3 = getgenv().UIColor["Toggle Border Color"]
                    end
                )
                bs.Name = "Setting_check"
                bs.Parent = br
                bs.AnchorPoint = Vector2.new(0, 1)
                bs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bs.BackgroundTransparency = 1.000
                bs.Position = UDim2.new(0, 0, 1, 0)
                bs.Image = "rbxassetid://4555411759"
                bs.ImageColor3 = getgenv().UIColor["Toggle Checked Color"]
                table.insert(
                    c["Toggle Checked Color"],
                    function()
                        bs.ImageColor3 = getgenv().UIColor["Toggle Checked Color"]
                    end
                )
                bt.Name = "Cungroitog"
                bt.Parent = bp
                bt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bt.BackgroundTransparency = 1.000
                bt.Size = UDim2.new(1, 0, 1, 0)
                bt.Font = Enum.Font.SourceSans
                bt.Text = ""
                bt.TextColor3 = Color3.fromRGB(0, 0, 0)
                bt.TextSize = 14.000
                bu.Name = "Color"
                bu.Parent = b0
                bu.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                bu.BorderSizePixel = 0
                bu.Position = UDim2.new(0, 10, 0, 40)
                bu.Size = UDim2.new(0, 440, 0, 200)
                bu.Image = "rbxassetid://4155801252"
                bv.Name = "SelectorColor"
                bv.Parent = bu
                bv.AnchorPoint = Vector2.new(0.5, 0.5)
                bv.BackgroundColor3 = Color3.fromRGB(203, 203, 203)
                bv.BorderColor3 = Color3.fromRGB(70, 70, 70)
                bv.Position = UDim2.new(1, 0, 0, 0)
                bv.Size = UDim2.new(0, 4, 0, 4)
                bw.CornerRadius = UDim.new(0, 4)
                bw.Parent = bu
                bx.Name = "HoithoF"
                bx.Parent = b0
                bx.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bx.BackgroundTransparency = 1.000
                bx.Position = UDim2.new(0, 495, 0, 175)
                bx.Size = UDim2.new(0, 115, 0, 25)
                bx.LayoutOrder = 5
                by.Name = "HoithoF"
                by.Parent = bx
                by.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                by.BackgroundTransparency = 1.000
                by.Size = UDim2.new(1, 0, 1, 25)
                bz.Name = "TextColor"
                bz.Parent = by
                bz.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bz.BackgroundTransparency = 1.000
                bz.Size = UDim2.new(0, 85, 0, 25)
                bz.Font = Enum.Font.GothamBold
                bz.Text = "Breathing"
                bz.TextSize = 14.000
                bz.TextXAlignment = Enum.TextXAlignment.Left
                bz.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        bz.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                bA.Name = "setting_checkbox"
                bA.Parent = by
                bA.AnchorPoint = Vector2.new(1, 0)
                bA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bA.BackgroundTransparency = 1.000
                bA.Position = UDim2.new(1, -5, 0, 0)
                bA.Size = UDim2.new(0, 25, 0, 25)
                bA.Image = "rbxassetid://4552505888"
                bA.ImageColor3 = Color3.fromRGB(131, 181, 255)
                bA.ImageColor3 = getgenv().UIColor["Toggle Border Color"]
                table.insert(
                    c["Toggle Border Color"],
                    function()
                        bA.ImageColor3 = getgenv().UIColor["Toggle Border Color"]
                    end
                )
                bB.Name = "setting_check"
                bB.Parent = bA
                bB.AnchorPoint = Vector2.new(0, 1)
                bB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bB.BackgroundTransparency = 1.000
                bB.Position = UDim2.new(0, 0, 1, 0)
                bB.Image = "rbxassetid://4555411759"
                bB.ImageColor3 = getgenv().UIColor["Toggle Checked Color"]
                table.insert(
                    c["Toggle Checked Color"],
                    function()
                        bB.ImageColor3 = getgenv().UIColor["Toggle Checked Color"]
                    end
                )
                bC.Name = "Hoithoitog"
                bC.Parent = by
                bC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bC.BackgroundTransparency = 1.000
                bC.Size = UDim2.new(1, 0, 0, 25)
                bC.Font = Enum.Font.SourceSans
                bC.Text = ""
                bC.TextColor3 = Color3.fromRGB(0, 0, 0)
                bC.TextSize = 14.000
                bD.Parent = by
                bD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bD.BackgroundTransparency = 1.000
                bD.Position = UDim2.new(0, 0, 0, 30)
                bD.Size = UDim2.new(1, 0, 0, 25)
                bE.Parent = bD
                bE.FillDirection = Enum.FillDirection.Horizontal
                bE.SortOrder = Enum.SortOrder.LayoutOrder
                bE.Padding = UDim.new(0, 5)
                bF.Name = "Cor1"
                bF.Parent = bD
                bF.BackgroundColor3 = e[a_].Breathing.Color1
                bF.Selectable = true
                bF.Size = UDim2.new(0, 25, 0, 25)
                bG.CornerRadius = UDim.new(1, 0)
                bG.Parent = bF
                bH.Name = "BCor1"
                bH.Parent = bF
                bH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bH.BackgroundTransparency = 1.000
                bH.Size = UDim2.new(1, 0, 1, 0)
                bH.Font = Enum.Font.SourceSans
                bH.Text = ""
                bH.TextColor3 = Color3.fromRGB(0, 0, 0)
                bH.TextSize = 14.000
                bI.Name = "Cor2"
                bI.Parent = bD
                bI.BackgroundColor3 = e[a_].Breathing.Color2
                bI.Selectable = true
                bI.Size = UDim2.new(0, 25, 0, 25)
                bJ.CornerRadius = UDim.new(1, 0)
                bJ.Parent = bI
                bK.Name = "BCor2"
                bK.Parent = bI
                bK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bK.BackgroundTransparency = 1.000
                bK.Size = UDim2.new(1, 0, 1, 0)
                bK.Font = Enum.Font.SourceSans
                bK.Text = ""
                bK.TextColor3 = Color3.fromRGB(0, 0, 0)
                bK.TextSize = 14.000
                local bL = false
                b7.MouseButton1Click:Connect(
                    function()
                        bL = not bL
                        local bM = bL and UDim2.new(1, 0, 0, 255) or UDim2.new(1, 0, 0, 35)
                        w:Create(b0, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Size = bM}):Play()
                    end
                )
                b7.MouseButton1Click:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                local bN = game:GetService("UserInputService")
                local bO = game:GetService("RunService")
                local bP = game.Players.LocalPlayer
                local y = bP:GetMouse()
                local bQ, bR = nil, nil
                local bS = true
                local bT = 0
                local function bU(...)
                    if bS then
                        return wait(...)
                    else
                        wait()
                        return false
                    end
                end
                local function bV(g)
                    return {math.floor(g.r * 255), math.floor(g.g * 255), math.floor(g.b * 255)}
                end
                local function bW(bX)
                    bX = bX:gsub("#", ""):upper():gsub("0X", "")
                    return Color3.fromRGB(
                        tonumber(bX:sub(1, 2), 16),
                        tonumber(bX:sub(3, 4), 16),
                        tonumber(bX:sub(5, 6), 16)
                    )
                end
                local function bY(g)
                    local bZ, b_, B =
                        string.format("%X", math.floor(g.R * 255)),
                        string.format("%X", math.floor(g.G * 255)),
                        string.format("%X", math.floor(g.B * 255))
                    if #bZ < 2 then
                        bZ = "0" .. bZ
                    end
                    if #b_ < 2 then
                        b_ = "0" .. b_
                    end
                    if #B < 2 then
                        B = "0" .. B
                    end
                    return string.format("%s%s%s", bZ, b_, B)
                end
                aV, aW, aX = 1, 1, 1
                local function c0(n, B)
                    if n > B then
                        return n, B
                    else
                        return B, n
                    end
                end
                local function c1(n, B)
                    if n + B > 255 then
                        local c2, c3 = c0(n, B)
                        local a8 = 255 - c2
                        local c4, c5 = c0(a8, c3)
                        return c4 - c5
                    else
                        return n + B
                    end
                end
                function CongColor(n, B)
                    local c6, c7 = n, B
                    local c8 = math.sqrt
                    local c9 = {}
                    c9.R = 255 - c8(((255 - c6.R) ^ 2 + (255 - c7.R) ^ 2) / 2)
                    c9.G = 255 - c8(((255 - c6.G) ^ 2 + (255 - c7.G) ^ 2) / 2)
                    c9.B = 255 - c8(((255 - c6.B) ^ 2 + (255 - c7.B) ^ 2) / 2)
                    return Color3.new(c9.R, c9.G, c9.B)
                end
                local function ca(cb)
                    local c9 = cb or Color3.fromHSV(aV, aW, aX)
                    if not c9 then
                        aW, aV, aX = cb:ToHSV()
                    end
                    bn.Text = bY(c9)
                    bu.BackgroundColor3 = Color3.fromHSV(aV, 1, 1)
                    if cb then
                        bu.BackgroundColor3 = cb
                        bv.Position = UDim2.new(cb and select(3, Color3.toHSV(cb)))
                    end
                    local cc = 1 - Color3.toHSV(c9)
                    local cd = b8.Frame.Position.Y.Scale
                    if cd ~= cc and not ((cc == 0 or cc == 1) and (cd == 1 or cd == 0)) then
                        b8.Frame.Position = UDim2.fromScale(0, cc)
                    end
                    be.Text, bh.Text, bk.Text = bV(c9)[1], bV(c9)[2], bV(c9)[3]
                    b5.BackgroundColor3 = c9
                    local ce = {}
                    getgenv().UIColor[a_] = c9
                end
                ca(e[a_].Color)
                local function cf(cg)
                    if bQ then
                        bQ = bQ:Disconnect() and nil or nil
                    end
                    if bR then
                        bR = bR:Disconnect() and nil or nil
                    end
                    if cg then
                        pcall(
                            function()
                                local ch = 1 / 255
                                while bU() and aU.Cungroi do
                                    bT = ch + bT
                                    if bT > 1 then
                                        bT = 0
                                    end
                                    aV = bT
                                    ca(Color3.fromHSV(bT, 1, 1))
                                end
                            end
                        )
                    end
                end
                local ci = aU.Cungroi and UDim2.new(1, -4, 1, -4) or UDim2.new(0, 0, 0, 0)
                local cc = aU.Cungroi and UDim2.new(.5, 0, .5, 0) or UDim2.new(0, 0, 1, 0)
                local cj = aU.Cungroi and Vector2.new(.5, .5) or Vector2.new(0, 1)
                bs.Size = ci
                bs.Position = cc
                bs.AnchorPoint = cj
                spawn(
                    function()
                        cf(aU.Cungroi)
                    end
                )
                bt.MouseButton1Click:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                bt.MouseButton1Click:Connect(
                    function()
                        aU.Cungroi = not aU.Cungroi
                        ci = aU.Cungroi and UDim2.new(1, -4, 1, -4) or UDim2.new(0, 0, 0, 0)
                        cc = aU.Cungroi and UDim2.new(.5, 0, .5, 0) or UDim2.new(0, 0, 1, 0)
                        cj = aU.Cungroi and Vector2.new(.5, .5) or Vector2.new(0, 1)
                        game.TweenService:Create(
                            bs,
                            TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
                            {Size = ci, Position = cc, AnchorPoint = cj}
                        ):Play()
                        cf(aU.Cungroi)
                    end
                )
                bn.FocusLost:Connect(
                    function()
                        if #bn.Text > 5 then
                            local ck, cl = pcall(bW, bn.Text)
                            ca(ck and cl)
                        end
                    end
                )
                be.FocusLost:Connect(
                    function()
                        if tonumber(be.Text) > 255 then
                            be.Text = 255
                        elseif tonumber(be.Text) < 0 then
                            be.Text = 0
                        end
                        local ck, cl = pcall(Color3.fromRGB, tonumber(be.Text), tonumber(bk.Text), tonumber(bh.Text))
                        ca(ck and cl)
                    end
                )
                bh.FocusLost:Connect(
                    function()
                        if tonumber(bh.Text) > 255 then
                            bh.Text = 255
                        elseif tonumber(bh.Text) < 0 then
                            bh.Text = 0
                        end
                        local ck, cl = pcall(Color3.fromRGB, tonumber(be.Text), tonumber(bk.Text), tonumber(bh.Text))
                        ca(ck and cl)
                    end
                )
                bk.FocusLost:Connect(
                    function()
                        if tonumber(bk.Text) > 255 then
                            bk.Text = 255
                        elseif tonumber(bk.Text) < 0 then
                            bk.Text = 0
                        end
                        local ck, cl = pcall(Color3.fromRGB, tonumber(be.Text), tonumber(bk.Text), tonumber(bh.Text))
                        ca(ck and cl)
                    end
                )
                aV =
                    1 -
                    math.clamp(b8.Frame.AbsolutePosition.Y - b8.AbsolutePosition.Y, 0, b8.AbsoluteSize.Y) /
                        b8.AbsoluteSize.Y
                aW =
                    math.clamp(bu.SelectorColor.AbsolutePosition.X - bu.AbsolutePosition.X, 0, bu.AbsoluteSize.X) /
                    bu.AbsoluteSize.X
                aX =
                    1 -
                    math.clamp(bu.SelectorColor.AbsolutePosition.Y - bu.AbsolutePosition.Y, 0, bu.AbsoluteSize.Y) /
                        bu.AbsoluteSize.Y
                bu.InputBegan:Connect(
                    function(a7)
                        if a7.UserInputType == Enum.UserInputType.MouseButton1 then
                            if bQ then
                                bQ:Disconnect()
                            end
                            _ = true
                            bQ =
                                bO.RenderStepped:Connect(
                                function()
                                    local cm =
                                        math.clamp(y.X - bu.AbsolutePosition.X, 0, bu.AbsoluteSize.X) /
                                        bu.AbsoluteSize.X
                                    local cn =
                                        math.clamp(y.Y - bu.AbsolutePosition.Y, 0, bu.AbsoluteSize.Y) /
                                        bu.AbsoluteSize.Y
                                    bv.Position = UDim2.fromScale(cm, cn)
                                    aW = cm
                                    aX = 1 - cn
                                    ca()
                                end
                            )
                        end
                    end
                )
                bu.InputEnded:Connect(
                    function(a7)
                        if a7.UserInputType == Enum.UserInputType.MouseButton1 then
                            if bQ then
                                _ = false
                                bQ:Disconnect()
                            end
                        end
                    end
                )
                b8.InputBegan:Connect(
                    function(a7)
                        if a7.UserInputType == Enum.UserInputType.MouseButton1 then
                            if bR then
                                bR:Disconnect()
                            end
                            _ = true
                            bR =
                                bO.RenderStepped:Connect(
                                function()
                                    local co =
                                        math.clamp(y.Y - b8.AbsolutePosition.Y, 0, b8.AbsoluteSize.Y) /
                                        b8.AbsoluteSize.Y
                                    b8.Frame.Position = UDim2.fromScale(0, co)
                                    aV = 1 - co
                                    ca()
                                end
                            )
                        end
                    end
                )
                b8.InputEnded:Connect(
                    function(a7)
                        if a7.UserInputType == Enum.UserInputType.MouseButton1 then
                            if bR then
                                _ = false
                                bR:Disconnect()
                            end
                        end
                    end
                )
                bH.MouseButton1Click:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                bK.MouseButton1Click:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                bH.MouseButton1Click:Connect(
                    function()
                        bF.BackgroundColor3 = b5.BackgroundColor3
                        e[a_].Breathing.Color1 = b5.BackgroundColor3
                    end
                )
                bK.MouseButton1Click:Connect(
                    function()
                        bI.BackgroundColor3 = b5.BackgroundColor3
                        e[a_].Breathing.Color2 = b5.BackgroundColor3
                    end
                )
                bC.MouseButton1Click:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                local cp = false
                spawn(
                    function()
                        while wait() do
                            if e[a_].Breathing.Toggle then
                                ca(b5.BackgroundColor3)
                            end
                        end
                    end
                )
                local function cq()
                    local cr, cs = bI.BackgroundColor3, bF.BackgroundColor3
                    local ci = e[a_].Breathing.Toggle and UDim2.new(1, -4, 1, -4) or UDim2.new(0, 0, 0, 0)
                    local cc = e[a_].Breathing.Toggle and UDim2.new(.5, 0, .5, 0) or UDim2.new(0, 0, 1, 0)
                    local cj = e[a_].Breathing.Toggle and Vector2.new(.5, .5) or Vector2.new(0, 1)
                    game.TweenService:Create(
                        bB,
                        TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
                        {Size = ci, Position = cc, AnchorPoint = cj}
                    ):Play()
                    if e[a_].Breathing.Toggle then
                        local ct = game.TweenService:Create(b5, TweenInfo.new(2), {BackgroundColor3 = cs})
                        local cu = game.TweenService:Create(bu, TweenInfo.new(2), {BackgroundColor3 = cs})
                        ct:Play()
                        cu:Play()
                        ct.Completed:Connect(
                            function()
                                if e[a_].Breathing.Toggle then
                                    local cv = game.TweenService:Create(b5, TweenInfo.new(2), {BackgroundColor3 = cr})
                                    local cw = game.TweenService:Create(bu, TweenInfo.new(2), {BackgroundColor3 = cr})
                                    cv:Play()
                                    cw:Play()
                                    if e[a_].Breathing.Toggle then
                                        cv.Completed:Connect(
                                            function()
                                                ct:Play()
                                                cu:Play()
                                            end
                                        )
                                    end
                                end
                            end
                        )
                    end
                end
                spawn(
                    function()
                        cq()
                    end
                )
                bC.MouseButton1Click:Connect(
                    function()
                        e[a_].Breathing.Toggle = not e[a_].Breathing.Toggle
                        cq()
                    end
                )
            end
            function aT.CreateBox(H)
                local cx = tostring(H.Title) or ""
                local cy = tostring(H.Placeholder) or ""
                local aZ = getgenv().UIColor[H.Type] or ""
                local cz = Instance.new("Frame")
                local cA = Instance.new("UICorner")
                local cB = Instance.new("Frame")
                local cC = Instance.new("UICorner")
                local cD = Instance.new("TextLabel")
                local cE = Instance.new("Frame")
                local cF = Instance.new("UICorner")
                local cG = Instance.new("TextBox")
                local cH = Instance.new("Frame")
                cz.Name = "BoxFrame"
                cz.Parent = aM
                cz.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                cz.BackgroundTransparency = 1.000
                cz.Position = UDim2.new(0, 0, 0.208333328, 0)
                cz.Size = UDim2.new(1, 0, 0, 60)
                cA.CornerRadius = UDim.new(0, 4)
                cA.Name = "BoxCorner"
                cA.Parent = cz
                cB.Name = "Background1"
                cB.Parent = cz
                cB.AnchorPoint = Vector2.new(0.5, 0.5)
                cB.Position = UDim2.new(0.5, 0, 0.5, 0)
                cB.Size = UDim2.new(1, -10, 1, 0)
                cB.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                table.insert(
                    c["Background 1 Color"],
                    function()
                        cB.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                    end
                )
                cB.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        cB.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                cC.CornerRadius = UDim.new(0, 4)
                cC.Name = "ButtonCorner"
                cC.Parent = cB
                cD.Name = "TextColor"
                cD.Parent = cB
                cD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                cD.BackgroundTransparency = 1.000
                cD.Position = UDim2.new(0, 10, 0, 0)
                cD.Size = UDim2.new(1, -10, 0.5, 0)
                cD.Font = Enum.Font.GothamBlack
                cD.Text = cx
                cD.TextSize = 14.000
                cD.TextXAlignment = Enum.TextXAlignment.Left
                cD.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        cD.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                cE.Name = "Background2"
                cE.Parent = cB
                cE.AnchorPoint = Vector2.new(1, 0.5)
                cE.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                cE.ClipsDescendants = true
                cE.Position = UDim2.new(1, -5, 0, 40)
                cE.Size = UDim2.new(1, -10, 0, 25)
                table.insert(
                    c["Text Color"],
                    function()
                        cE.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                    end
                )
                cF.CornerRadius = UDim.new(0, 4)
                cF.Name = "ButtonCorner"
                cF.Parent = cE
                cG.Name = "TextColorPlaceholder"
                cG.Parent = cE
                cG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                cG.BackgroundTransparency = 1.000
                cG.Position = UDim2.new(0, 5, 0, 0)
                cG.Size = UDim2.new(1, -5, 1, 0)
                cG.Font = Enum.Font.GothamBold
                cG.PlaceholderText = cy
                cG.Text = ""
                cG.TextSize = 14.000
                cG.TextXAlignment = Enum.TextXAlignment.Left
                cG.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                cG.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Placeholder Text Color"],
                    function()
                        cG.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                    end
                )
                table.insert(
                    c["Text Color"],
                    function()
                        cG.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                cH.Name = "Setting_Lineeeee"
                cH.Parent = cE
                cH.BackgroundTransparency = 1.000
                cH.Position = UDim2.new(0, 0, 1, -2)
                cH.Size = UDim2.new(1, 0, 0, 6)
                cH.BackgroundColor3 = getgenv().UIColor["Textbox Highlight Color"]
                table.insert(
                    c["Textbox Highlight Color"],
                    function()
                        cH.BackgroundColor3 = getgenv().UIColor["Textbox Highlight Color"]
                    end
                )
                cG.Focused:Connect(
                    function()
                        w:Create(
                            cH,
                            TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),
                            {BackgroundTransparency = 0}
                        ):Play()
                    end
                )
                cG.Focused:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                cG.FocusLost:Connect(
                    function()
                        w:Create(
                            cH,
                            TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),
                            {BackgroundTransparency = 1}
                        ):Play()
                        if cG.Text ~= "" then
                            getgenv().UIColor[H.Type] = cG.Text
                            if H.Type == "Background Image" then
                                u.ReloadMain(cG.Text)
                            end
                        end
                    end
                )
                local cI = {}
                if aZ then
                    cG.Text = aZ
                    getgenv().UIColor[H.Type] = aZ
                end
                function cI.SetValue(r)
                    cG.Text = r
                    getgenv().UIColor[H.Type] = r
                end
                return cI
            end
            function aT.CreateSlider(H)
                local cx = tostring(H.Title) or ""
                local cJ = tonumber(H.Min) or 0
                local cK = tonumber(H.Max) or 100
                local cL = H.Precise or false
                local cM = getgenv().UIColor[H.Type] or 0
                local cN = function(v)
                    getgenv().UIColor[H.Type] = v
                end
                local cO = 600
                local cP = Instance.new("Frame")
                local cQ = Instance.new("UICorner")
                local cR = Instance.new("Frame")
                local cS = Instance.new("UICorner")
                local cT = Instance.new("TextLabel")
                local cU = Instance.new("Frame")
                local cV = Instance.new("TextButton")
                local cW = Instance.new("UICorner")
                local cX = Instance.new("Frame")
                local cY = Instance.new("UICorner")
                local cZ = Instance.new("Frame")
                local c_ = Instance.new("UICorner")
                local d0 = Instance.new("TextBox")
                cP.Name = cx .. "buda"
                cP.Parent = aM
                cP.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                cP.BackgroundTransparency = 1.000
                cP.Position = UDim2.new(0, 0, 0.208333328, 0)
                cP.Size = UDim2.new(1, 0, 0, 50)
                cQ.CornerRadius = UDim.new(0, 4)
                cQ.Name = "SliderCorner"
                cQ.Parent = cP
                cR.Name = "Background1"
                cR.Parent = cP
                cR.AnchorPoint = Vector2.new(0.5, 0.5)
                cR.Position = UDim2.new(0.5, 0, 0.5, 0)
                cR.Size = UDim2.new(1, -10, 1, 0)
                cR.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                table.insert(
                    c["Background 1 Color"],
                    function()
                        cR.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                    end
                )
                cR.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        cR.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                cS.CornerRadius = UDim.new(0, 4)
                cS.Name = "SliderBGCorner"
                cS.Parent = cR
                cT.Name = "TextColor"
                cT.Parent = cR
                cT.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                cT.BackgroundTransparency = 1.000
                cT.Position = UDim2.new(0, 10, 0, 0)
                cT.Size = UDim2.new(1, -10, 0, 25)
                cT.Font = Enum.Font.GothamBlack
                cT.Text = cx
                cT.TextSize = 14.000
                cT.TextXAlignment = Enum.TextXAlignment.Left
                cT.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        cT.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                cU.Name = "SliderBar"
                cU.Parent = cP
                cU.AnchorPoint = Vector2.new(.5, 0.5)
                cU.Position = UDim2.new(.5, 0, 0.5, 14)
                cU.Size = UDim2.new(0, 600, 0, 6)
                cU.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                table.insert(
                    c["Background 2 Color"],
                    function()
                        cU.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                    end
                )
                cV.Name = "SliderButton "
                cV.Parent = cU
                cV.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                cV.BackgroundTransparency = 1.000
                cV.Size = UDim2.new(1, 0, 1, 0)
                cV.Font = Enum.Font.GothamBold
                cV.Text = ""
                cV.TextColor3 = Color3.fromRGB(230, 230, 230)
                cV.TextSize = 14.000
                cW.CornerRadius = UDim.new(1, 0)
                cW.Name = "SliderBarCorner"
                cW.Parent = cU
                cX.Name = "Bar"
                cX.BorderSizePixel = 0
                cX.Parent = cU
                cX.Size = UDim2.new(0, 0, 1, 0)
                cX.BackgroundColor3 = getgenv().UIColor["Slider Line Color"]
                table.insert(
                    c["Slider Line Color"],
                    function()
                        cX.BackgroundColor3 = getgenv().UIColor["Slider Line Color"]
                    end
                )
                cY.CornerRadius = UDim.new(1, 0)
                cY.Name = "BarCorner"
                cY.Parent = cX
                cZ.Name = "Background2"
                cZ.Parent = cP
                cZ.AnchorPoint = Vector2.new(1, 0)
                cZ.Position = UDim2.new(1, -10, 0, 5)
                cZ.Size = UDim2.new(0, 150, 0, 25)
                cZ.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                table.insert(
                    c["Background 2 Color"],
                    function()
                        cZ.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                    end
                )
                c_.CornerRadius = UDim.new(0, 4)
                c_.Name = "Sliderbox"
                c_.Parent = cZ
                d0.Name = "TextColor"
                d0.Parent = cZ
                d0.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                d0.BackgroundTransparency = 1.000
                d0.Size = UDim2.new(1, 0, 1, 0)
                d0.Font = Enum.Font.GothamBold
                d0.Text = ""
                d0.TextSize = 14.000
                d0.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        d0.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                cV.MouseEnter:Connect(
                    function()
                        w:Create(
                            cX,
                            TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),
                            {BackgroundColor3 = getgenv().UIColor["Slider Highlight Color"]}
                        ):Play()
                    end
                )
                cV.MouseLeave:Connect(
                    function()
                        w:Create(
                            cX,
                            TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),
                            {BackgroundColor3 = getgenv().UIColor["Slider Line Color"]}
                        ):Play()
                    end
                )
                local y = game.Players.LocalPlayer:GetMouse()
                if cM then
                    if cM <= cJ then
                        cM = cJ
                    elseif cM >= cK then
                        cM = cK
                    end
                    cX.Size = UDim2.new(1 - (cK - cM) / (cK - cJ), 0, 0, 6)
                    d0.Text = cM
                    cN(cM)
                end
                cV.MouseButton1Down:Connect(
                    function()
                        local d1 =
                            cL and
                            tonumber(
                                string.format(
                                    "%.1f",
                                    (tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ)
                                )
                            ) or
                            math.floor((tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ))
                        pcall(
                            function()
                                cN(d1)
                                d0.Text = d1
                            end
                        )
                        cX.Size = UDim2.new(0, math.clamp(y.X - cX.AbsolutePosition.X, 0, cO), 0, 6)
                        moveconnection =
                            y.Move:Connect(
                            function()
                                local d1 =
                                    cL and
                                    tonumber(
                                        string.format(
                                            "%.1f",
                                            (tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ)
                                        )
                                    ) or
                                    math.floor((tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ))
                                pcall(
                                    function()
                                        cN(d1)
                                        d0.Text = d1
                                    end
                                )
                                cX.Size = UDim2.new(0, math.clamp(y.X - cX.AbsolutePosition.X, 0, cO), 0, 6)
                            end
                        )
                        releaseconnection =
                            x.InputEnded:Connect(
                            function(d2)
                                if d2.UserInputType == Enum.UserInputType.MouseButton1 then
                                    local d1 =
                                        cL and
                                        tonumber(
                                            string.format(
                                                "%.1f",
                                                (tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ)
                                            )
                                        ) or
                                        math.floor(
                                            (tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ)
                                        )
                                    pcall(
                                        function()
                                            cN(d1)
                                            d0.Text = d1
                                        end
                                    )
                                    cX.Size = UDim2.new(0, math.clamp(y.X - cX.AbsolutePosition.X, 0, cO), 0, 6)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end
                        )
                    end
                )
                local function d3(r)
                    if tonumber(r) <= cJ then
                        cX.Size = UDim2.new(0, 0 * cO, 0, 6)
                        d0.Text = cJ
                        cN(tonumber(cJ))
                    elseif tonumber(r) >= cK then
                        cX.Size = UDim2.new(0, cK / cK * cO, 0, 6)
                        d0.Text = cK
                        cN(tonumber(cK))
                    else
                        cX.Size = UDim2.new(1 - (cK - r) / (cK - cJ), 0, 0, 6)
                        cN(tonumber(r))
                    end
                end
                d0.FocusLost:Connect(
                    function()
                        d3(d0.Text)
                    end
                )
                local d4 = {}
                function d4.SetValue(r)
                    d3(r)
                end
                return d4
            end
            return aT
        end
        return aK
    end
    local d5 = t.CreateCustomColor()
    local d6 = d5.CreateSection("Main")
    d6.CreateColorPicker({Title = "Border Color", Type = "Border Color"})
    d6.CreateColorPicker({Title = "Click Effect Color", Type = "Click Effect Color"})
    d6.CreateColorPicker({Title = "Setting Icon Color", Type = "Setting Icon Color"})
    d6.CreateBox({Title = "Logo Image", Placeholder = "URL Here (PNG only), Recommended 128x128", Type = "Logo Image"})
    local d7 = d5.CreateSection("Search")
    d7.CreateColorPicker({Title = "Search Icon Color", Type = "Search Icon Color"})
    d7.CreateColorPicker({Title = "Search Icon Highlight Color", Type = "Search Icon Highlight Color"})
    local d8 = d5.CreateSection("Text")
    d8.CreateColorPicker({Title = "GUI Text Color", Type = "GUI Text Color"})
    d8.CreateColorPicker({Title = "Text Color", Type = "Text Color"})
    d8.CreateColorPicker({Title = "Placeholder Text Color", Type = "Placeholder Text Color"})
    d8.CreateColorPicker({Title = "Title Text Color", Type = "Title Text Color"})
    local d9 = d5.CreateSection("Background")
    d9.CreateColorPicker({Title = "Background 1 Color", Type = "Background 1 Color"})
    d9.CreateSlider(
        {
            Title = "Background 1 Transparency",
            Type = "Background 1 Transparency",
            Min = 0,
            Max = 1,
            Default = 0,
            Precise = true
        }
    )
    d9.CreateColorPicker({Title = "Background 2 Color", Type = "Background 2 Color"})
    d9.CreateColorPicker({Title = "Background 3 Color", Type = "Background 3 Color"})
    d9.CreateBox(
        {
            Title = "Background Image",
            Placeholder = "URL Here (WEBM / PNG only), Recommended 1280x720",
            Type = "Background Image"
        }
    )
    local da = d5.CreateSection("Page")
    da.CreateColorPicker({Title = "Page Selected Color", Type = "Page Selected Color"})
    local db = d5.CreateSection("Section")
    db.CreateColorPicker({Title = "Section Text Color", Type = "Section Text Color"})
    db.CreateColorPicker({Title = "Section Underline Color", Type = "Section Underline Color"})
    local dc = d5.CreateSection("Toggle")
    dc.CreateColorPicker({Title = "Toggle Border Color", Type = "Toggle Border Color"})
    dc.CreateColorPicker({Title = "Toggle Checked Color", Type = "Toggle Checked Color"})
    dc.CreateColorPicker({Title = "Toggle Desc Color", Type = "Toggle Desc Color"})
    local dd = d5.CreateSection("Button")
    dd.CreateColorPicker({Title = "Button Color", Type = "Button Color"})
    local dd = d5.CreateSection("Label")
    dd.CreateColorPicker({Title = "Label Color", Type = "Label Color"})
    local de = d5.CreateSection("Dropdown")
    de.CreateColorPicker({Title = "Dropdown Icon Color", Type = "Dropdown Icon Color"})
    de.CreateColorPicker({Title = "Dropdown Selected Color", Type = "Dropdown Selected Color"})
    local df = d5.CreateSection("Textbox")
    df.CreateColorPicker({Title = "Textbox Highlight Color", Type = "Textbox Highlight Color"})
    local dg = d5.CreateSection("Box")
    dg.CreateColorPicker({Title = "Box Highlight Color", Type = "Box Highlight Color"})
    local dh = d5.CreateSection("Slider")
    dh.CreateColorPicker({Title = "Slider Line Color", Type = "Slider Line Color"})
    dh.CreateColorPicker({Title = "Slider Highlight Color", Type = "Slider Highlight Color"})
    local di = d5.CreateSection("Animation")
    di.CreateSlider(
        {
            Title = "Tween Animation 1 Speed",
            Type = "Tween Animation 1 Speed",
            Min = 0,
            Max = 0.75,
            Default = 0.25,
            Precise = true
        }
    )
    di.CreateSlider(
        {
            Title = "Tween Animation 2 Speed",
            Type = "Tween Animation 2 Speed",
            Min = 0,
            Max = 1,
            Default = 0.5,
            Precise = true
        }
    )
    di.CreateSlider(
        {
            Title = "Tween Animation 3 Speed",
            Type = "Tween Animation 3 Speed",
            Min = 0,
            Max = 0.5,
            Default = 0.1,
            Precise = true
        }
    )
    local dj = {}
    local dk = -1
    local dl = -1
    local dm = 1
    function dj.CreatePage(H)
        local dn = tostring(H.Page_Name)
        local dp = tostring(H.Page_Title)
        dl = dl + 1
        dk = dk + 1
        local dq = Instance.new("Frame")
        local ba = Instance.new("Frame")
        local dr = Instance.new("UICorner")
        local ds = Instance.new("Frame")
        local dt = Instance.new("Frame")
        local du = Instance.new("UICorner")
        local dv = Instance.new("Frame")
        local dw = Instance.new("TextLabel")
        local dx = Instance.new("TextButton")
        dq.Name = dn .. "_Control"
        dq.Parent = af
        dq.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        dq.BackgroundTransparency = 1.000
        dq.Size = UDim2.new(1, -10, 0, 25)
        dq.LayoutOrder = dk
        ba.Parent = dq
        ba.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        ba.BackgroundTransparency = 1.000
        ba.Position = UDim2.new(0, 5, 0, 0)
        ba.Size = UDim2.new(1, -5, 1, 0)
        dr.CornerRadius = UDim.new(0, 4)
        dr.Name = "TabNameCorner"
        dr.Parent = ba
        ds.Name = "Line"
        ds.Parent = ba
        ds.AnchorPoint = Vector2.new(0, 0.5)
        ds.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        ds.BackgroundTransparency = 1.000
        ds.Position = UDim2.new(0, 0, 0.5, 0)
        ds.Size = UDim2.new(0, 14, 1, 0)
        dt.Name = "PageInLine"
        dt.Parent = ds
        dt.AnchorPoint = Vector2.new(0.5, 0.5)
        dt.BorderSizePixel = 0
        dt.Position = UDim2.new(0.5, 0, 0.5, 0)
        dt.Size = UDim2.new(1, -10, 0, 0)
        dt.BackgroundColor3 = getgenv().UIColor["Page Selected Color"]
        table.insert(
            c["Page Selected Color"],
            function()
                dt.BackgroundColor3 = getgenv().UIColor["Page Selected Color"]
            end
        )
        du.Name = "LineCorner"
        du.Parent = dt
        dv.Name = "TabTitleContainer"
        dv.Parent = ba
        dv.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        dv.BackgroundTransparency = 1.000
        dv.Position = UDim2.new(0, 15, 0, 0)
        dv.Size = UDim2.new(1, -15, 1, 0)
        dw.Name = "GUITextColor"
        dw.Parent = dv
        dw.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        dw.BackgroundTransparency = 1.000
        dw.Size = UDim2.new(1, 0, 1, 0)
        dw.Font = Enum.Font.GothamBold
        dw.Text = dn
        dw.TextColor3 = Color3.fromRGB(230, 230, 230)
        dw.TextSize = 14.000
        dw.TextXAlignment = Enum.TextXAlignment.Left
        dw.TextColor3 = getgenv().UIColor["GUI Text Color"]
        table.insert(
            c["GUI Text Color"],
            function()
                dw.TextColor3 = getgenv().UIColor["GUI Text Color"]
            end
        )
        dx.Name = "PageButton"
        dx.Parent = dq
        dx.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        dx.BackgroundTransparency = 1.000
        dx.Size = UDim2.new(1, 0, 1, 0)
        dx.Font = Enum.Font.SourceSans
        dx.Text = ""
        dx.TextColor3 = Color3.fromRGB(0, 0, 0)
        dx.TextSize = 14.000
        local dy = Instance.new("Frame")
        local M = Instance.new("UICorner")
        local dz = Instance.new("TextLabel")
        local dA = Instance.new("ScrollingFrame")
        local dB = Instance.new("UIListLayout")
        local dC = dm
        dm = dm + 1
        dy.Name = "Page" .. dC
        dy.Parent = ai
        dy.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
        dy.Position = UDim2.new(0, 190, 0, 30)
        dy.Size = UDim2.new(0, 435, 0, 325)
        dy.LayoutOrder = dl
        table.insert(
            c["Background 1 Color"],
            function()
                dy.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
            end
        )
        dy.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
        table.insert(
            c["Background 1 Transparency"],
            function()
                dy.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
            end
        )
        M.CornerRadius = UDim.new(0, 4)
        M.Parent = dy
        dz.Name = "GUITextColor"
        dz.Parent = dy
        dz.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        dz.BackgroundTransparency = 1.000
        dz.Position = UDim2.new(0, 5, 0, 0)
        dz.Size = UDim2.new(1, 0, 0, 25)
        dz.Font = Enum.Font.GothamBold
        dz.Text = dp
        dz.TextSize = 16.000
        dz.TextXAlignment = Enum.TextXAlignment.Left
        dz.TextColor3 = getgenv().UIColor["GUI Text Color"]
        table.insert(
            c["GUI Text Color"],
            function()
                dz.TextColor3 = getgenv().UIColor["GUI Text Color"]
            end
        )
        dA.Name = "PageList"
        dA.Parent = dy
        dA.Active = true
        dA.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        dA.BackgroundTransparency = 1.000
        dA.BorderColor3 = Color3.fromRGB(27, 42, 53)
        dA.BorderSizePixel = 0
        dA.Position = UDim2.new(0, 5, 0, 30)
        dA.Size = UDim2.new(1, -10, 1, -30)
        dA.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        dA.ScrollBarThickness = 5
        dA.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        dB.Name = "Pagelistlayout"
        dB.Parent = dA
        dB.SortOrder = Enum.SortOrder.LayoutOrder
        dB.Padding = UDim.new(0, 5)
        dB:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                dA.CanvasSize = UDim2.new(0, 0, 0, dB.AbsoluteContentSize.Y + 5)
            end
        )
        local dD = Instance.new("Frame")
        local aA = Instance.new("UICorner")
        local aB = Instance.new("Frame")
        local aC = Instance.new("ImageLabel")
        local aD = Instance.new("TextButton")
        local dE = Instance.new("TextBox")
        dD.Name = "Background2"
        dD.Parent = dy
        dD.AnchorPoint = Vector2.new(1, 0)
        dD.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
        dD.Position = UDim2.new(1, -5, 0, 5)
        dD.Size = UDim2.new(0, 20, 0, 20)
        dD.ClipsDescendants = true
        table.insert(
            c["Background 2 Color"],
            function()
                dD.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
            end
        )
        aA.CornerRadius = UDim.new(0, 2)
        aA.Name = "PageSearchCorner"
        aA.Parent = dD
        aB.Name = "SearchFrame"
        aB.Parent = dD
        aB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        aB.BackgroundTransparency = 1.000
        aB.Size = UDim2.new(0, 20, 0, 20)
        aC.Name = "SearchIcon"
        aC.Parent = aB
        aC.AnchorPoint = Vector2.new(0.5, 0.5)
        aC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        aC.BackgroundTransparency = 1.000
        aC.Position = UDim2.new(0.5, 0, 0.5, 0)
        aC.Size = UDim2.new(0, 16, 0, 16)
        aC.Image = "rbxassetid://8154282545"
        aC.ImageColor3 = getgenv().UIColor["Search Icon Color"]
        table.insert(
            c["Search Icon Color"],
            function()
                aC.ImageColor3 = getgenv().UIColor["Search Icon Color"]
            end
        )
        aD.Name = "active"
        aD.Parent = aB
        aD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        aD.BackgroundTransparency = 1.000
        aD.Size = UDim2.new(1, 0, 1, 0)
        aD.Font = Enum.Font.SourceSans
        aD.Text = ""
        aD.TextColor3 = Color3.fromRGB(0, 0, 0)
        aD.TextSize = 14.000
        dE.Name = "TextColorPlaceholder"
        dE.Parent = dD
        dE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        dE.BackgroundTransparency = 1.000
        dE.Position = UDim2.new(0, 30, 0, 0)
        dE.Size = UDim2.new(1, -30, 1, 0)
        dE.Font = Enum.Font.GothamBold
        dE.Text = ""
        dE.TextSize = 14.000
        dE.TextXAlignment = Enum.TextXAlignment.Left
        dE.PlaceholderText = "Search Section name"
        dE.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
        dE.TextColor3 = getgenv().UIColor["Text Color"]
        table.insert(
            c["Placeholder Text Color"],
            function()
                dE.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
            end
        )
        table.insert(
            c["Text Color"],
            function()
                dE.TextColor3 = getgenv().UIColor["Text Color"]
            end
        )
        local dF = false
        aD.MouseEnter:Connect(
            function()
                w:Create(
                    aC,
                    TweenInfo.new(getgenv().UIColor["Tween Animation 3 Speed"]),
                    {ImageColor3 = getgenv().UIColor["Search Icon Highlight Color"]}
                ):Play()
            end
        )
        aD.MouseLeave:Connect(
            function()
                w:Create(
                    aC,
                    TweenInfo.new(getgenv().UIColor["Tween Animation 3 Speed"]),
                    {ImageColor3 = getgenv().UIColor["Search Icon Color"]}
                ):Play()
            end
        )
        aD.MouseButton1Click:Connect(
            function()
                u.ButtonEffect()
            end
        )
        dE.Focused:Connect(
            function()
                u.ButtonEffect()
            end
        )
        aD.MouseButton1Click:Connect(
            function()
                dF = not dF
                local aG = dF and UDim2.new(0, 175, 0, 20) or UDim2.new(0, 20, 0, 20)
                game.TweenService:Create(dD, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = aG}):Play(

                )
            end
        )
        local function dG()
            for a, v in next, dA:GetChildren() do
                if not v:IsA("UIListLayout") then
                    v.Visible = false
                end
            end
        end
        local function dH()
            for n, B in pairs(dA:GetChildren()) do
                if not B:IsA("UIListLayout") then
                    if string.find(string.lower(B.Name), string.lower(dE.Text)) then
                        B.Visible = true
                    end
                end
            end
        end
        dE:GetPropertyChangedSignal("Text"):Connect(
            function()
                dG()
                dH()
            end
        )
        for a, v in pairs(af:GetChildren()) do
            if not v:IsA("UIListLayout") then
                if a == 2 then
                    v.Frame.Line.PageInLine.Size = UDim2.new(1, -10, 1, -10)
                    oldlay = v.LayoutOrder
                    oldobj = v
                end
            end
        end
        dx.MouseButton1Click:Connect(
            function()
                spawn(
                    function()
                        u.ButtonEffect()
                    end
                )
                if tostring(aj.CurrentPage) == dy.Name then
                    return
                end
                for a, v in pairs(ai:GetChildren()) do
                    if not v:IsA("UIPageLayout") and not v:IsA("UICorner") then
                        v.Visible = false
                    end
                end
                dy.Visible = true
                aj:JumpTo(dy)
                for a, v in next, af:GetChildren() do
                    if not v:IsA("UIListLayout") then
                        if v.Name == dn .. "_Control" then
                            if v.LayoutOrder > oldlay then
                                oldobj.Active = false
                                w:Create(
                                    oldobj.Frame.Line.PageInLine,
                                    TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
                                    {
                                        Size = UDim2.new(1, -10, 0, 0),
                                        Position = UDim2.new(0.5, 0, 1, 0),
                                        AnchorPoint = Vector2.new(.5, 1)
                                    }
                                ):Play()
                                v.Frame.Line.PageInLine.Position = UDim2.new(0.5, 0, 0, 0)
                                v.Frame.Line.PageInLine.AnchorPoint = Vector2.new(.5, 0)
                                wait(getgenv().UIColor["Tween Animation 1 Speed"])
                                w:Create(
                                    v.Frame.Line.PageInLine,
                                    TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
                                    {
                                        Size = UDim2.new(1, -10, 1, -10),
                                        Position = UDim2.new(0.5, 0, .5, 0),
                                        AnchorPoint = Vector2.new(.5, .5)
                                    }
                                ):Play()
                                v.Active = true
                                oldobj = v
                                oldlay = v.LayoutOrder
                            else
                                oldobj.Active = false
                                w:Create(
                                    oldobj.Frame.Line.PageInLine,
                                    TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
                                    {
                                        Size = UDim2.new(1, -10, 0, 0),
                                        Position = UDim2.new(0.5, 0, 0, 0),
                                        AnchorPoint = Vector2.new(.5, 0)
                                    }
                                ):Play()
                                v.Frame.Line.PageInLine.Position = UDim2.new(0.5, 0, 1, 0)
                                v.Frame.Line.PageInLine.AnchorPoint = Vector2.new(.5, 1)
                                wait(getgenv().UIColor["Tween Animation 1 Speed"])
                                w:Create(
                                    v.Frame.Line.PageInLine,
                                    TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
                                    {
                                        Size = UDim2.new(1, -10, 1, -10),
                                        Position = UDim2.new(0.5, 0, .5, 0),
                                        AnchorPoint = Vector2.new(.5, .5)
                                    }
                                ):Play()
                                v.Active = true
                                oldobj = v
                                oldlay = v.LayoutOrder
                            end
                        end
                    end
                end
            end
        )
        local dI = {}
        function dI.CreateSection(aL)
            local aM = Instance.new("Frame")
            local M = Instance.new("UICorner")
            local aN = Instance.new("Frame")
            local aO = Instance.new("TextLabel")
            local aP = Instance.new("Frame")
            local aQ = Instance.new("UIGradient")
            local aR = Instance.new("UIListLayout")
            aM.Name = aL .. "_Dot"
            aM.Parent = dA
            aM.Size = UDim2.new(0, 415, 0, 100)
            aM.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
            table.insert(
                c["Background 3 Color"],
                function()
                    aM.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
                end
            )
            aM.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
            table.insert(
                c["Background 1 Transparency"],
                function()
                    aM.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                end
            )
            M.CornerRadius = UDim.new(0, 4)
            M.Parent = aM
            aN.Name = "Topsec"
            aN.Parent = aM
            aN.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            aN.BackgroundTransparency = 1.000
            aN.Size = UDim2.new(0, 415, 0, 30)
            aO.Name = "Sectiontitle"
            aO.Parent = aN
            aO.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            aO.BackgroundTransparency = 1.000
            aO.Size = UDim2.new(1, 0, 1, 0)
            aO.Font = Enum.Font.GothamBold
            aO.Text = aL
            aO.TextSize = 14.000
            aO.TextColor3 = getgenv().UIColor["Section Text Color"]
            table.insert(
                c["Section Text Color"],
                function()
                    aO.TextColor3 = getgenv().UIColor["Section Text Color"]
                end
            )
            aP.Name = "Linesec"
            aP.Parent = aN
            aP.AnchorPoint = Vector2.new(0.5, 1)
            aP.BorderSizePixel = 0
            aP.Position = UDim2.new(0.5, 0, 1, -2)
            aP.Size = UDim2.new(1, -10, 0, 2)
            aP.BackgroundColor3 = getgenv().UIColor["Section Underline Color"]
            table.insert(
                c["Section Underline Color"],
                function()
                    aP.BackgroundColor3 = getgenv().UIColor["Section Underline Color"]
                end
            )
            aQ.Transparency =
                NumberSequence.new {
                NumberSequenceKeypoint.new(0.00, 1.00),
                NumberSequenceKeypoint.new(0.50, 0.00),
                NumberSequenceKeypoint.new(0.51, 0.02),
                NumberSequenceKeypoint.new(1.00, 1.00)
            }
            aQ.Parent = aP
            aR.Name = "SectionList"
            aR.Parent = aM
            aR.SortOrder = Enum.SortOrder.LayoutOrder
            aR.Padding = UDim.new(0, 5)
            aR:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                function()
                    aM.Size = UDim2.new(1, -5, 0, aR.AbsoluteContentSize.Y + 5)
                end
            )
            local dJ = {}
            function dJ.CreateToggle(H, cN)
                local aY = tostring(H.Title)
                local I = H.Desc
                local aZ = H.Default
                local cN = cN or function()
                    end
                local dK = Instance.new("Frame")
                local dL = Instance.new("Frame")
                local br = Instance.new("ImageLabel")
                local bs = Instance.new("ImageLabel")
                local dM = Instance.new("TextLabel")
                local dN = Instance.new("TextLabel")
                local dO = Instance.new("Frame")
                local dP = Instance.new("UICorner")
                local dQ = Instance.new("TextButton")
                local dR = Instance.new("UIListLayout")
                dK.Name = "ToggleFrame"
                dK.Parent = aM
                dK.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                dK.BackgroundTransparency = 1.000
                dK.Position = UDim2.new(0, 0, 0.300000012, 0)
                dK.Size = UDim2.new(1, 0, 0, 0)
                dK.AutomaticSize = Enum.AutomaticSize.Y
                dL.Name = "TogFrame1"
                dL.Parent = dK
                dL.AnchorPoint = Vector2.new(0.5, 0.5)
                dL.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                dL.BackgroundTransparency = 1.000
                dL.Position = UDim2.new(0.5, 0, 0.5, 0)
                dL.Size = UDim2.new(1, -10, 0, 0)
                dL.AutomaticSize = Enum.AutomaticSize.Y
                br.Name = "checkbox"
                br.Parent = dL
                br.AnchorPoint = Vector2.new(1, 0.5)
                br.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                br.BackgroundTransparency = 1.000
                br.Position = UDim2.new(1, -5, 0.5, 3)
                br.Size = UDim2.new(0, 25, 0, 25)
                br.Image = "rbxassetid://4552505888"
                br.ImageColor3 = getgenv().UIColor["Toggle Border Color"]
                table.insert(
                    c["Toggle Border Color"],
                    function()
                        br.ImageColor3 = getgenv().UIColor["Toggle Border Color"]
                    end
                )
                bs.Name = "check"
                bs.Parent = br
                bs.AnchorPoint = Vector2.new(0, 1)
                bs.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                bs.BackgroundTransparency = 1.000
                bs.Position = UDim2.new(0, 0, 1, 0)
                bs.Image = "rbxassetid://4555411759"
                bs.ImageColor3 = getgenv().UIColor["Toggle Checked Color"]
                table.insert(
                    c["Toggle Checked Color"],
                    function()
                        bs.ImageColor3 = getgenv().UIColor["Toggle Checked Color"]
                    end
                )
                local cac = 5
                if I then
                    cac = 0
                    dM.Name = "ToggleDesc"
                    dM.Parent = dL
                    dM.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                    dM.BackgroundTransparency = 1.000
                    dM.Position = UDim2.new(0, 15, 0, 20)
                    dM.Size = UDim2.new(1, -50, 0, 0)
                    dM.Font = Enum.Font.GothamBlack
                    dM.Text = I
                    dM.TextSize = 13.000
                    dM.TextWrapped = true
                    dM.TextXAlignment = Enum.TextXAlignment.Left
                    dM.RichText = true
                    dM.AutomaticSize = Enum.AutomaticSize.Y
                    dM.TextColor3 = getgenv().UIColor["Toggle Desc Color"]
                    table.insert(
                        c["Toggle Desc Color"],
                        function()
                            dM.TextColor3 = getgenv().UIColor["Toggle Desc Color"]
                        end
                    )
                else
                    dM.Text = ""
                end
                dN.Name = "TextColor"
                dN.Parent = dL
                dN.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                dN.BackgroundTransparency = 1.000
                dN.Position = UDim2.new(0, 10, 0, cac)
                dN.Size = UDim2.new(1, -10, 0, 20)
                dN.Font = Enum.Font.GothamBlack
                dN.Text = aY
                dN.TextSize = 14.000
                dN.TextXAlignment = Enum.TextXAlignment.Left
                dN.TextYAlignment = Enum.TextYAlignment.Center
                dN.RichText = true
                dN.AutomaticSize = Enum.AutomaticSize.Y
                dN.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        dN.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                dO.Name = "Background1"
                dO.Parent = dL
                dO.Size = UDim2.new(1, 0, 1, 6)
                dO.ZIndex = 0
                dO.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                table.insert(
                    c["Background 1 Color"],
                    function()
                        dO.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                    end
                )
                dO.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        dO.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                dP.CornerRadius = UDim.new(0, 4)
                dP.Name = "ToggleCorner"
                dP.Parent = dO
                dQ.Name = "ToggleButton"
                dQ.Parent = dL
                dQ.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                dQ.BackgroundTransparency = 1.000
                dQ.Size = UDim2.new(1, 0, 1, 6)
                dQ.Font = Enum.Font.SourceSans
                dQ.Text = ""
                dQ.TextColor3 = Color3.fromRGB(0, 0, 0)
                dQ.TextSize = 14.000
                dR.Name = "ToggleList"
                dR.Parent = dK
                dR.HorizontalAlignment = Enum.HorizontalAlignment.Center
                dR.SortOrder = Enum.SortOrder.LayoutOrder
                dR.VerticalAlignment = Enum.VerticalAlignment.Center
                dR.Padding = UDim.new(0, 5)
                local function dS(dT)
                    local ci = dT and UDim2.new(1, -4, 1, -4) or UDim2.new(0, 0, 0, 0)
                    local cc = dT and UDim2.new(.5, 0, .5, 0) or UDim2.new(0, 0, 1, 0)
                    local cj = dT and Vector2.new(.5, .5) or Vector2.new(0, 1)
                    game.TweenService:Create(
                        bs,
                        TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
                        {Size = ci, Position = cc, AnchorPoint = cj}
                    ):Play()
                    cN(dT)
                end
                if cN then
                    dS(aZ)
                end
                dQ.MouseButton1Click:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                dQ.MouseButton1Down:Connect(
                    function()
                        aZ = not aZ
                        dS(aZ)
                    end
                )
                local dU = {}
                function dU.SetStage(d1)
                    dS(d1)
                end
                return dU
            end
            function dJ.CreateButton(H, cN)
                local aY = H.Title
                local cN = cN or function()
                    end
                local dV = Instance.new("Frame")
                local dW = Instance.new("Frame")
                local cC = Instance.new("UICorner")
                local dX = Instance.new("TextLabel")
                local dY = Instance.new("TextButton")
                dV.Name = aY .. "dot"
                dV.Parent = aM
                dV.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                dV.BackgroundTransparency = 1.000
                dV.Position = UDim2.new(0, 0, 0.300000012, 0)
                dV.Size = UDim2.new(1, 0, 0, 25)
                dW.Name = "ButtonBG"
                dW.Parent = dV
                dW.AnchorPoint = Vector2.new(0.5, 0.5)
                dW.Position = UDim2.new(0.5, 0, 0.5, 0)
                dW.Size = UDim2.new(1, -10, 1, 0)
                dW.BackgroundColor3 = getgenv().UIColor["Button Color"]
                table.insert(
                    c["Button Color"],
                    function()
                        dW.BackgroundColor3 = getgenv().UIColor["Button Color"]
                    end
                )
                dW.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        dW.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                cC.CornerRadius = UDim.new(0, 4)
                cC.Name = "ButtonCorner"
                cC.Parent = dW
                dX.Name = "TextColor"
                dX.Parent = dW
                dX.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                dX.BackgroundTransparency = 1.000
                dX.Position = UDim2.new(0, 10, 0, 0)
                dX.Size = UDim2.new(1, -10, 1, 0)
                dX.Font = Enum.Font.GothamBlack
                dX.Text = aY
                dX.TextSize = 14.000
                dX.TextXAlignment = Enum.TextXAlignment.Left
                dX.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        dX.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                dY.Name = "Button"
                dY.Parent = dW
                dY.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                dY.BackgroundTransparency = 1.000
                dY.Size = UDim2.new(1, 0, 1, 0)
                dY.Font = Enum.Font.SourceSans
                dY.Text = ""
                dY.TextColor3 = Color3.fromRGB(0, 0, 0)
                dY.TextSize = 14.000
                dY.MouseButton1Click:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                dY.MouseButton1Down:Connect(
                    function()
                        cN()
                    end
                )
            end
            function dJ.CreateLabel(H)
                local aY = tostring(H.Title)
                local dZ = Instance.new("Frame")
                local d_ = Instance.new("Frame")
                local e0 = Instance.new("UICorner")
                local e1 = Instance.new("TextLabel")
                dZ.Name = "LabelFrame"
                dZ.Parent = aM
                dZ.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                dZ.BackgroundTransparency = 1.000
                dZ.Position = UDim2.new(0, 0, 0, 0)
                dZ.Size = UDim2.new(1, 0, 0, 0)
                dZ.AutomaticSize = Enum.AutomaticSize.Y
                d_.Name = "LabelBG"
                d_.Parent = dZ
                d_.AnchorPoint = Vector2.new(0.5, 0)
                d_.Position = UDim2.new(0.5, 0, 0, 0)
                d_.Size = UDim2.new(1, -10, 0, -10)
                d_.BackgroundColor3 = getgenv().UIColor["Label Color"]
                d_.AutomaticSize = Enum.AutomaticSize.Y
                table.insert(
                    c["Label Color"],
                    function()
                        d_.BackgroundColor3 = getgenv().UIColor["Label Color"]
                    end
                )
                d_.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        d_.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                e0.CornerRadius = UDim.new(0, 4)
                e0.Name = "LabelCorner"
                e0.Parent = d_
                e1.Name = "TextColor"
                e1.Parent = d_
                e1.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                e1.BackgroundTransparency = 1.000
                e1.Position = UDim2.new(0, 10, 0, 3)
                e1.Size = UDim2.new(1, -20, 1, 0)
                e1.Font = Enum.Font.GothamBlack
                e1.Text = aY
                e1.TextSize = 14.000
                e1.TextXAlignment = Enum.TextXAlignment.Left
                e1.AutomaticSize = Enum.AutomaticSize.Y
                e1.TextWrapped = true
                e1.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        e1.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                local e2 = {}
                function e2.SetText(e3)
                    e1.Text = e3
                end
                function e2.SetColor(g)
                    e1.TextColor3 = g
                end
                return e2
            end
            function dJ.CreateDropdown(H, cN)
                local aY = tostring(H.Title)
                local e4 = H.List
                local e5 = H.Search or false
                local e6 = H.Selected or false
                local aZ = H.Default
                local cN = cN or function()
                    end
                local e7 = Instance.new("Frame")
                local e8 = Instance.new("Frame")
                local e9 = Instance.new("UICorner")
                local ea = Instance.new("Frame")
                local M = Instance.new("UICorner")
                local eb = Instance.new("ImageLabel")
                local ec = Instance.new("TextButton")
                local ed = Instance.new("Frame")
                local ee = Instance.new("ScrollingFrame")
                local ef = Instance.new("Frame")
                local eg = Instance.new("UIListLayout")
                local eh
                if e5 then
                    eh = Instance.new("TextBox")
                    ec.Visible = false
                else
                    eh = Instance.new("TextLabel")
                end
                e7.Name = aY .. "DropdownFrame"
                e7.Parent = aM
                e7.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                e7.BackgroundTransparency = 1.000
                e7.Position = UDim2.new(0, 0, 0.473684222, 0)
                e7.Size = UDim2.new(1, 0, 0, 25)
                e8.Name = "Background1"
                e8.Parent = e7
                e8.AnchorPoint = Vector2.new(0.5, 0.5)
                e8.Position = UDim2.new(0.5, 0, 0.5, 0)
                e8.Size = UDim2.new(1, -10, 1, 0)
                e8.ClipsDescendants = true
                e8.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                table.insert(
                    c["Background 1 Color"],
                    function()
                        e8.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                    end
                )
                e8.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        e8.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                e9.CornerRadius = UDim.new(0, 4)
                e9.Name = "Dropdowncorner"
                e9.Parent = e8
                ea.Name = "Background2"
                ea.Parent = e8
                ea.Size = UDim2.new(1, 0, 0, 25)
                ea.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                table.insert(
                    c["Background 2 Color"],
                    function()
                        ea.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                    end
                )
                ea.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        ea.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                M.CornerRadius = UDim.new(0, 4)
                M.Parent = ea
                eh.Name = "TextColorPlaceholder"
                eh.Parent = ea
                eh.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                eh.BackgroundTransparency = 1.000
                eh.Position = UDim2.new(0, 10, 0, 0)
                eh.Size = UDim2.new(1, -40, 1, 0)
                eh.Font = Enum.Font.GothamBlack
                eh.Text = ""
                eh.TextSize = 14.000
                eh.TextXAlignment = Enum.TextXAlignment.Left
                eh.ClipsDescendants = true
                local ei = Instance.new("IntValue", eh)
                ei.Value = -1
                if aZ and table.find(e4, aZ) then
                    ei.Value = table.find(e4, aZ)
                end
                if not e6 then
                    if e5 then
                        eh.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                        eh.PlaceholderText = aY .. ": " .. tostring(aZ)
                        table.insert(
                            c["Placeholder Text Color"],
                            function()
                                eh.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                            end
                        )
                    else
                        eh.Text = aY .. ": " .. tostring(aZ)
                    end
                else
                    if e5 then
                        eh.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                        eh.PlaceholderText = aY .. ": " .. tostring(aZ)
                        table.insert(
                            c["Placeholder Text Color"],
                            function()
                                eh.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                            end
                        )
                    else
                        eh.Text = aY .. ": " .. tostring(aZ)
                    end
                end
                eh.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        eh.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                eb.Name = "ImgDrop"
                eb.Parent = ea
                eb.AnchorPoint = Vector2.new(1, 0.5)
                eb.BackgroundTransparency = 1.000
                eb.BorderColor3 = Color3.fromRGB(27, 42, 53)
                eb.Position = UDim2.new(1, -6, 0.5, 0)
                eb.Size = UDim2.new(0, 15, 0, 15)
                eb.Image = "rbxassetid://6954383209"
                eb.ImageColor3 = getgenv().UIColor["Dropdown Icon Color"]
                table.insert(
                    c["Dropdown Icon Color"],
                    function()
                        eb.ImageColor3 = getgenv().UIColor["Dropdown Icon Color"]
                    end
                )
                ec.Name = "DropdownButton"
                ec.Parent = ea
                ec.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                ec.BackgroundTransparency = 1.000
                ec.Size = UDim2.new(1, 0, 1, 0)
                ec.Font = Enum.Font.GothamBold
                ec.Text = ""
                ec.TextColor3 = Color3.fromRGB(230, 230, 230)
                ec.TextSize = 14.000
                ed.Name = "Dropdownlisttt"
                ed.Parent = e8
                ed.BackgroundTransparency = 1.000
                ed.BorderSizePixel = 0
                ed.Position = UDim2.new(0, 0, 0, 25)
                ed.Size = UDim2.new(1, 0, 0, 25)
                ed.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                ee.Name = "DropdownScroll"
                ee.Parent = ed
                ee.Active = true
                ee.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                ee.BackgroundTransparency = 1.000
                ee.BorderSizePixel = 0
                ee.Size = UDim2.new(1, 0, 1, 0)
                ee.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                ee.CanvasSize = UDim2.new(0, 0, 0, 0)
                ee.ScrollBarThickness = 5
                ee.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                ef.Name = "ScrollContainer"
                ef.Parent = ee
                ef.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                ef.BackgroundTransparency = 1.000
                ef.Position = UDim2.new(0, 5, 0, 5)
                ef.Size = UDim2.new(1, -15, 1, -5)
                eg.Name = "ScrollContainerList"
                eg.Parent = ef
                eg.SortOrder = Enum.SortOrder.LayoutOrder
                eg:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                    function()
                        ee.CanvasSize = UDim2.new(0, 0, 0, 10 + eg.AbsoluteContentSize.Y + 5)
                    end
                )
                local ej = false
                local ek = {}
                local el = {}
                local function em()
                    for a in pairs(ek) do
                        ek[a] = nil
                    end
                    for en, eo in pairs(ef:GetChildren()) do
                        if not eo:IsA("UIListLayout") and not eo:IsA("UIPadding") and not eo:IsA("UIGridLayout") then
                            eo.Visible = false
                        end
                    end
                    eh.Text = string.lower(eh.Text)
                end
                local function ep()
                    local eq = {}
                    for a, v in pairs(el) do
                        if string.find(v, eh.Text) then
                            table.insert(ek, v)
                        end
                    end
                    for n, B in pairs(ef:GetChildren()) do
                        for er, es in pairs(ek) do
                            if es == B.Name then
                                B.Visible = true
                            end
                        end
                    end
                end
                local function et()
                    for a, v in next, ef:GetChildren() do
                        if v:IsA("Frame") then
                            v:Destroy()
                        end
                    end
                end
                local eu = e4
                local function ev()
                    et()
                    el = {}
                    for a, v in pairs(eu) do
                        if not e6 then
                            table.insert(el, string.lower(v))
                        else
                            table.insert(el, string.lower(a))
                        end
                    end
                    if not e6 then
                        for a, v in pairs(eu) do
                            local ew = Instance.new("Frame")
                            local ex = Instance.new("UICorner")
                            local ds = Instance.new("Frame")
                            local dt = Instance.new("Frame")
                            local du = Instance.new("UICorner")
                            local ey = Instance.new("Frame")
                            local ez = Instance.new("TextButton")
                            ew.Name = string.lower(v)
                            ew.Parent = ef
                            ew.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            ew.BackgroundTransparency = 1.000
                            ew.Size = UDim2.new(1, 0, 0, 25)
                            ex.CornerRadius = UDim.new(0, 4)
                            ex.Name = "DropvalCorner"
                            ex.Parent = ew
                            ds.Name = "Line"
                            ds.Parent = ew
                            ds.AnchorPoint = Vector2.new(0, 0.5)
                            ds.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            ds.BackgroundTransparency = 1.000
                            ds.Position = UDim2.new(0, 0, 0.5, 0)
                            ds.Size = UDim2.new(0, 14, 1, 0)
                            dt.Name = "InLine"
                            dt.Parent = ds
                            dt.AnchorPoint = Vector2.new(0.5, 0.5)
                            dt.BorderSizePixel = 0
                            dt.Position = UDim2.new(0.5, 0, 0.5, 0)
                            dt.Size = UDim2.new(1, -10, 1, -10)
                            dt.BackgroundTransparency = 1
                            dt.BackgroundColor3 = getgenv().UIColor["Dropdown Selected Color"]
                            table.insert(
                                c["Dropdown Selected Color"],
                                function()
                                    dt.BackgroundColor3 = getgenv().UIColor["Dropdown Selected Color"]
                                end
                            )
                            du.Name = "LineCorner"
                            du.Parent = dt
                            ey.Name = "Dropvalcontainer"
                            ey.Parent = ew
                            ey.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            ey.BackgroundTransparency = 1.000
                            ey.Position = UDim2.new(0, 15, 0, 0)
                            ey.Size = UDim2.new(1, -15, 1, 0)
                            ez.Name = "TextColor"
                            ez.Parent = ey
                            ez.Active = false
                            ez.BackgroundTransparency = 1.000
                            ez.Selectable = false
                            ez.Size = UDim2.new(1, 0, 1, 0)
                            ez.Font = Enum.Font.GothamBold
                            ez.Text = v
                            ez.TextSize = 14.000
                            ez.TextWrapped = true
                            ez.TextXAlignment = Enum.TextXAlignment.Left
                            ez.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            ez.TextColor3 = getgenv().UIColor["Text Color"]
                            table.insert(
                                c["Text Color"],
                                function()
                                    ez.TextColor3 = getgenv().UIColor["Text Color"]
                                end
                            )
                            if e5 then
                                if ei.Value == a then
                                    dt.BackgroundTransparency = 0
                                end
                            else
                                if ei.Value == a then
                                    dt.BackgroundTransparency = 0
                                end
                            end
                            ez.MouseButton1Click:Connect(
                                function()
                                    if e5 then
                                        eh.PlaceholderText = aY .. ": " .. v
                                        ei.Value = a
                                    else
                                        eh.Text = aY .. ": " .. v
                                        ei.Value = a
                                    end
                                    ev()
                                    if cN then
                                        cN(v, a)
                                    end
                                end
                            )
                            ez.MouseButton1Click:Connect(
                                function()
                                    u.ButtonEffect()
                                end
                            )
                        end
                    else
                        for a, v in pairs(eu) do
                            local eA = v and 0 or 1
                            local ew = Instance.new("Frame")
                            local ex = Instance.new("UICorner")
                            local ds = Instance.new("Frame")
                            local dt = Instance.new("Frame")
                            local du = Instance.new("UICorner")
                            local ey = Instance.new("Frame")
                            local ez = Instance.new("TextButton")
                            ew.Name = string.lower(a)
                            ew.Parent = ef
                            ew.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            ew.BackgroundTransparency = 1.000
                            ew.Size = UDim2.new(1, 0, 0, 25)
                            ex.CornerRadius = UDim.new(0, 4)
                            ex.Name = "DropvalCorner"
                            ex.Parent = ew
                            ds.Name = "Line"
                            ds.Parent = ew
                            ds.AnchorPoint = Vector2.new(0, 0.5)
                            ds.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            ds.BackgroundTransparency = 1
                            ds.Position = UDim2.new(0, 0, 0.5, 0)
                            ds.Size = UDim2.new(0, 14, 1, 0)
                            dt.Name = "InLine"
                            dt.Parent = ds
                            dt.AnchorPoint = Vector2.new(0.5, 0.5)
                            dt.BorderSizePixel = 0
                            dt.Position = UDim2.new(0.5, 0, 0.5, 0)
                            dt.Size = UDim2.new(1, -10, 1, -10)
                            dt.BackgroundTransparency = eA
                            dt.BackgroundColor3 = getgenv().UIColor["Dropdown Selected Color"]
                            table.insert(
                                c["Dropdown Selected Color"],
                                function()
                                    dt.BackgroundColor3 = getgenv().UIColor["Dropdown Selected Color"]
                                end
                            )
                            du.Name = "LineCorner"
                            du.Parent = dt
                            ey.Name = "Dropvalcontainer"
                            ey.Parent = ew
                            ey.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            ey.BackgroundTransparency = 1.000
                            ey.Position = UDim2.new(0, 15, 0, 0)
                            ey.Size = UDim2.new(1, -15, 1, 0)
                            ez.Name = "TextColor"
                            ez.Parent = ey
                            ez.Active = false
                            ez.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            ez.BackgroundTransparency = 1.000
                            ez.Selectable = false
                            ez.Size = UDim2.new(1, 0, 1, 0)
                            ez.Font = Enum.Font.GothamBold
                            ez.Text = a
                            ez.TextSize = 14.000
                            ez.TextWrapped = true
                            ez.TextXAlignment = Enum.TextXAlignment.Left
                            ez.TextColor3 = getgenv().UIColor["Text Color"]
                            table.insert(
                                c["Text Color"],
                                function()
                                    ez.TextColor3 = getgenv().UIColor["Text Color"]
                                end
                            )
                            ez.MouseButton1Click:Connect(
                                function()
                                    u.ButtonEffect()
                                end
                            )
                            ez.MouseButton1Click:Connect(
                                function()
                                    v = not v
                                    local eA = v and 0 or 1
                                    w:Create(
                                        dt,
                                        TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),
                                        {BackgroundTransparency = eA}
                                    ):Play()
                                    if cN then
                                        cN(a, v)
                                        eu[a] = v
                                    end
                                end
                            )
                        end
                    end
                end
                if e5 then
                    eh.Changed:Connect(
                        function()
                            em()
                            ep()
                        end
                    )
                end
                if typeof(aZ) ~= "table" then
                    cN(aZ)
                    if e5 then
                        eh.PlaceholderText = aY .. ": " .. tostring(aZ)
                    else
                        eh.Text = aY .. ": " .. tostring(aZ)
                    end
                elseif e6 then
                    for a, v in next, aZ do
                        eu[a] = v
                        cN(a, v)
                    end
                    eh.Text = ""
                    eh.PlaceholderText = aY .. ": "
                end
                ec.MouseButton1Click:Connect(
                    function()
                        ev()
                        ej = not ej
                        local eB = ej and UDim2.new(1, 0, 0, 170) or UDim2.new(1, 0, 0, 0)
                        local eC = ej and UDim2.new(1, 0, 0, 200) or UDim2.new(1, 0, 0, 25)
                        local eD = ej and 90 or 0
                        w:Create(ed, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = eB}):Play()
                        w:Create(e7, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = eC}):Play()
                        w:Create(eb, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Rotation = eD}):Play(

                        )
                    end
                )
                ec.MouseButton1Click:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                if e5 then
                    eh.Focused:Connect(
                        function()
                            ev()
                            ej = not ej
                            local eB = ej and UDim2.new(1, 0, 0, 170) or UDim2.new(1, 0, 0, 0)
                            local eC = ej and UDim2.new(1, 0, 0, 200) or UDim2.new(1, 0, 0, 25)
                            local eD = ej and 90 or 0
                            w:Create(ed, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = eB}):Play(

                            )
                            w:Create(e7, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = eC}):Play(

                            )
                            w:Create(eb, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Rotation = eD}):Play(

                            )
                        end
                    )
                    eh.Focused:Connect(
                        function()
                            u.ButtonEffect()
                        end
                    )
                end
                local eE = {rf = ev}
                function eE:ClearText()
                    if not e6 then
                        if e5 then
                            eh.PlaceholderText = aY .. ": "
                        else
                            eh.Text = aY .. ": "
                        end
                    else
                        eh.Text = aY .. ": "
                    end
                end
                function eE:GetNewList(e4)
                    ev()
                    ej = false
                    local eB = ej and UDim2.new(1, 0, 0, 170) or UDim2.new(1, 0, 0, 0)
                    local eC = ej and UDim2.new(1, 0, 0, 200) or UDim2.new(1, 0, 0, 25)
                    local eD = ej and 90 or 0
                    w:Create(ed, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = eB}):Play()
                    w:Create(e7, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = eC}):Play()
                    w:Create(eb, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Rotation = eD}):Play()
                    eu = {}
                    eu = e4
                    for a, v in next, eu do
                        if e6 then
                            cN(a, v)
                        end
                    end
                end
                return eE
            end
            function dJ.CreateBind(H, cN)
                local cx = tostring(H.Title) or ""
                local eF = H.Key
                local aZ = H.Default or H.Key
                local a_ = tostring(aZ):match("UserInputType") and "UserInputType" or "KeyCode"
                local cN = cN or function()
                    end
                eF = tostring(eF):gsub("Enum.UserInputType.", "")
                eF = tostring(eF):gsub("Enum.KeyCode.", "")
                local eG = Instance.new("Frame")
                local eH = Instance.new("UICorner")
                local eI = Instance.new("Frame")
                local cC = Instance.new("UICorner")
                local eJ = Instance.new("TextLabel")
                local dY = Instance.new("TextButton")
                local eK = Instance.new("Frame")
                local cF = Instance.new("UICorner")
                local eL = Instance.new("TextButton")
                eG.Name = cx .. "bguvl"
                eG.Parent = aM
                eG.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                eG.BackgroundTransparency = 1.000
                eG.Position = UDim2.new(0, 0, 0.208333328, 0)
                eG.Size = UDim2.new(1, 0, 0, 35)
                eH.CornerRadius = UDim.new(0, 4)
                eH.Name = "BindCorner"
                eH.Parent = eG
                eI.Name = "Background1"
                eI.Parent = eG
                eI.AnchorPoint = Vector2.new(0.5, 0.5)
                eI.Position = UDim2.new(0.5, 0, 0.5, 0)
                eI.Size = UDim2.new(1, -10, 1, 0)
                eI.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                table.insert(
                    c["Background 1 Color"],
                    function()
                        eI.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                    end
                )
                eI.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        eI.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                cC.CornerRadius = UDim.new(0, 4)
                cC.Name = "ButtonCorner"
                cC.Parent = eI
                eJ.Name = "TextColor"
                eJ.Parent = eI
                eJ.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                eJ.BackgroundTransparency = 1.000
                eJ.Position = UDim2.new(0, 10, 0, 0)
                eJ.Size = UDim2.new(1, -10, 1, 0)
                eJ.Font = Enum.Font.GothamBlack
                eJ.Text = cx
                eJ.TextSize = 14.000
                eJ.TextXAlignment = Enum.TextXAlignment.Left
                eJ.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        eJ.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                eK.Name = "Background2"
                eK.Parent = eI
                eK.AnchorPoint = Vector2.new(1, 0.5)
                eK.Position = UDim2.new(1, -5, 0.5, 0)
                eK.Size = UDim2.new(0, 150, 0, 25)
                eK.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                table.insert(
                    c["Background 2 Color"],
                    function()
                        eK.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                    end
                )
                cF.CornerRadius = UDim.new(0, 4)
                cF.Name = "ButtonCorner"
                cF.Parent = eK
                eL.Name = "Bindkey"
                eL.Parent = eK
                eL.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                eL.BackgroundTransparency = 1.000
                eL.Size = UDim2.new(1, 0, 1, 0)
                eL.Font = Enum.Font.GothamBold
                eL.Text = tostring(aZ):gsub("Enum.KeyCode.", "")
                eL.TextSize = 14.000
                eL.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        eL.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                local eM = {
                    [Enum.UserInputType.MouseButton1] = "Mouse1",
                    [Enum.UserInputType.MouseButton2] = "Mouse2",
                    [Enum.UserInputType.MouseButton3] = "Mouse3"
                }
                eL.MouseButton1Click:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                eL.MouseButton1Click:Connect(
                    function()
                        local eN
                        eL.Text = "..."
                        eN =
                            game:GetService("UserInputService").InputBegan:Connect(
                            function(a)
                                if eM[a.UserInputType] then
                                    eL.Text = eM[a.UserInputType]
                                    spawn(
                                        function()
                                            wait(0.1)
                                            aZ = a.UserInputType
                                            a_ = "UserInputType"
                                        end
                                    )
                                elseif a.KeyCode ~= Enum.KeyCode.Unknown then
                                    eL.Text = tostring(a.KeyCode):gsub("Enum.KeyCode.", "")
                                    spawn(
                                        function()
                                            wait(0.1)
                                            aZ = a.KeyCode
                                            a_ = "KeyCode"
                                        end
                                    )
                                end
                                eN:Disconnect()
                            end
                        )
                    end
                )
                game:GetService("UserInputService").InputBegan:Connect(
                    function(a)
                        if aZ == a.UserInputType or aZ == a.KeyCode then
                            cN(aZ)
                        end
                    end
                )
            end
            function dJ.CreateBox(H, cN)
                local cx = tostring(H.Title) or ""
                local cy = tostring(H.Placeholder) or ""
                local aZ = H.Default or false
                local eO = H.Number or false
                local cN = cN or function()
                    end
                local cz = Instance.new("Frame")
                local cA = Instance.new("UICorner")
                local cB = Instance.new("Frame")
                local cC = Instance.new("UICorner")
                local cD = Instance.new("TextLabel")
                local cE = Instance.new("Frame")
                local cF = Instance.new("UICorner")
                local eP = Instance.new("TextBox")
                local cH = Instance.new("Frame")
                local M = Instance.new("UICorner")
                cz.Name = "BoxFrame"
                cz.Parent = aM
                cz.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                cz.BackgroundTransparency = 1.000
                cz.Position = UDim2.new(0, 0, 0.208333328, 0)
                cz.Size = UDim2.new(1, 0, 0, 60)
                cA.CornerRadius = UDim.new(0, 4)
                cA.Name = "BoxCorner"
                cA.Parent = cz
                cB.Name = "Background1"
                cB.Parent = cz
                cB.AnchorPoint = Vector2.new(0.5, 0.5)
                cB.Position = UDim2.new(0.5, 0, 0.5, 0)
                cB.Size = UDim2.new(1, -10, 1, 0)
                cB.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                table.insert(
                    c["Background 1 Color"],
                    function()
                        cB.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                    end
                )
                cB.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        cB.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                cC.CornerRadius = UDim.new(0, 4)
                cC.Name = "ButtonCorner"
                cC.Parent = cB
                cD.Name = "TextColor"
                cD.Parent = cB
                cD.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                cD.BackgroundTransparency = 1.000
                cD.Position = UDim2.new(0, 10, 0, 0)
                cD.Size = UDim2.new(1, -10, 0.5, 0)
                cD.Font = Enum.Font.GothamBlack
                cD.Text = cx
                cD.TextSize = 14.000
                cD.TextXAlignment = Enum.TextXAlignment.Left
                cD.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        cD.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                cE.Name = "Background2"
                cE.Parent = cB
                cE.AnchorPoint = Vector2.new(1, 0.5)
                cE.ClipsDescendants = true
                cE.Position = UDim2.new(1, -5, 0, 40)
                cE.Size = UDim2.new(1, -10, 0, 25)
                cE.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                table.insert(
                    c["Background 2 Color"],
                    function()
                        cE.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                    end
                )
                cF.CornerRadius = UDim.new(0, 4)
                cF.Name = "ButtonCorner"
                cF.Parent = cE
                eP.Name = "TextColorPlaceholder"
                eP.Parent = cE
                eP.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                eP.BackgroundTransparency = 1.000
                eP.Position = UDim2.new(0, 5, 0, 0)
                eP.Size = UDim2.new(1, -5, 1, 0)
                eP.Font = Enum.Font.GothamBold
                eP.PlaceholderText = cy
                eP.Text = ""
                eP.TextSize = 14.000
                eP.TextXAlignment = Enum.TextXAlignment.Left
                eP.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                eP.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Placeholder Text Color"],
                    function()
                        eP.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                    end
                )
                table.insert(
                    c["Text Color"],
                    function()
                        eP.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                cH.Name = "TextNSBoxLineeeee"
                cH.Parent = cE
                cH.BackgroundTransparency = 1.000
                cH.Position = UDim2.new(0, 0, 1, -2)
                cH.Size = UDim2.new(1, 0, 0, 6)
                cH.BackgroundColor3 = getgenv().UIColor["Box Highlight Color"]
                table.insert(
                    c["Box Highlight Color"],
                    function()
                        cH.BackgroundColor3 = getgenv().UIColor["Box Highlight Color"]
                    end
                )
                M.CornerRadius = UDim.new(1, 0)
                M.Parent = cH
                eP.Focused:Connect(
                    function()
                        w:Create(
                            cH,
                            TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),
                            {BackgroundTransparency = 0}
                        ):Play()
                    end
                )
                eP.Focused:Connect(
                    function()
                        u.ButtonEffect()
                    end
                )
                if eO then
                    eP:GetPropertyChangedSignal("Text"):Connect(
                        function()
                            if tonumber(eP.Text) then
                            else
                                eP.PlaceholderText = cy
                                eP.Text = ""
                            end
                        end
                    )
                end
                eP.FocusLost:Connect(
                    function()
                        w:Create(
                            cH,
                            TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),
                            {BackgroundTransparency = 1}
                        ):Play()
                        if eP.Text ~= "" then
                            cN(eP.Text)
                        end
                    end
                )
                local cI = {}
                if aZ then
                    eP.Text = aZ
                    cN(aZ)
                end
                function cI.SetValue(r)
                    eP.Text = r
                    cN(r)
                end
                return cI
            end
            function dJ.CreateSlider(H, cN)
                local cx = tostring(H.Title) or ""
                local cJ = tonumber(H.Min) or 0
                local cK = tonumber(H.Max) or 100
                local cL = H.Precise or false
                local cM = tonumber(H.Default) or 0
                local cN = cN or function()
                    end
                local cO = 400
                local cN = cN or function()
                    end
                local cP = Instance.new("Frame")
                local cQ = Instance.new("UICorner")
                local cR = Instance.new("Frame")
                local cS = Instance.new("UICorner")
                local cT = Instance.new("TextLabel")
                local cU = Instance.new("Frame")
                local cV = Instance.new("TextButton")
                local cW = Instance.new("UICorner")
                local cX = Instance.new("Frame")
                local cY = Instance.new("UICorner")
                local cZ = Instance.new("Frame")
                local c_ = Instance.new("UICorner")
                local d0 = Instance.new("TextBox")
                cP.Name = cx .. "buda"
                cP.Parent = aM
                cP.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                cP.BackgroundTransparency = 1.000
                cP.Position = UDim2.new(0, 0, 0.208333328, 0)
                cP.Size = UDim2.new(1, 0, 0, 50)
                cQ.CornerRadius = UDim.new(0, 4)
                cQ.Name = "SliderCorner"
                cQ.Parent = cP
                cR.Name = "Background1"
                cR.Parent = cP
                cR.AnchorPoint = Vector2.new(0.5, 0.5)
                cR.Position = UDim2.new(0.5, 0, 0.5, 0)
                cR.Size = UDim2.new(1, -10, 1, 0)
                cR.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                table.insert(
                    c["Background 1 Color"],
                    function()
                        cR.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                    end
                )
                cR.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                table.insert(
                    c["Background 1 Transparency"],
                    function()
                        cR.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    end
                )
                cS.CornerRadius = UDim.new(0, 4)
                cS.Name = "SliderBGCorner"
                cS.Parent = cR
                cT.Name = "TextColor"
                cT.Parent = cR
                cT.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                cT.BackgroundTransparency = 1.000
                cT.Position = UDim2.new(0, 10, 0, 0)
                cT.Size = UDim2.new(1, -10, 0, 25)
                cT.Font = Enum.Font.GothamBlack
                cT.Text = cx
                cT.TextSize = 14.000
                cT.TextXAlignment = Enum.TextXAlignment.Left
                cT.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        cT.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                cU.Name = "SliderBar"
                cU.Parent = cP
                cU.AnchorPoint = Vector2.new(.5, 0.5)
                cU.Position = UDim2.new(.5, 0, 0.5, 14)
                cU.Size = UDim2.new(0, 400, 0, 6)
                cU.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                table.insert(
                    c["Background 2 Color"],
                    function()
                        cU.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                    end
                )
                cV.Name = "SliderButton "
                cV.Parent = cU
                cV.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                cV.BackgroundTransparency = 1.000
                cV.Size = UDim2.new(1, 0, 1, 0)
                cV.Font = Enum.Font.GothamBold
                cV.Text = ""
                cV.TextColor3 = Color3.fromRGB(230, 230, 230)
                cV.TextSize = 14.000
                cW.CornerRadius = UDim.new(1, 0)
                cW.Name = "SliderBarCorner"
                cW.Parent = cU
                cX.Name = "Bar"
                cX.BorderSizePixel = 0
                cX.Parent = cU
                cX.Size = UDim2.new(0, 0, 1, 0)
                cX.BackgroundColor3 = getgenv().UIColor["Slider Line Color"]
                table.insert(
                    c["Slider Line Color"],
                    function()
                        cX.BackgroundColor3 = getgenv().UIColor["Slider Line Color"]
                    end
                )
                cY.CornerRadius = UDim.new(1, 0)
                cY.Name = "BarCorner"
                cY.Parent = cX
                cZ.Name = "Background2"
                cZ.Parent = cP
                cZ.AnchorPoint = Vector2.new(1, 0)
                cZ.Position = UDim2.new(1, -10, 0, 5)
                cZ.Size = UDim2.new(0, 150, 0, 25)
                cZ.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                table.insert(
                    c["Background 2 Color"],
                    function()
                        cZ.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                    end
                )
                c_.CornerRadius = UDim.new(0, 4)
                c_.Name = "Sliderbox"
                c_.Parent = cZ
                d0.Name = "TextColor"
                d0.Parent = cZ
                d0.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                d0.BackgroundTransparency = 1.000
                d0.Size = UDim2.new(1, 0, 1, 0)
                d0.Font = Enum.Font.GothamBold
                d0.Text = ""
                d0.TextSize = 14.000
                d0.TextColor3 = getgenv().UIColor["Text Color"]
                table.insert(
                    c["Text Color"],
                    function()
                        d0.TextColor3 = getgenv().UIColor["Text Color"]
                    end
                )
                cV.MouseEnter:Connect(
                    function()
                        w:Create(
                            cX,
                            TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),
                            {BackgroundColor3 = getgenv().UIColor["Slider Highlight Color"]}
                        ):Play()
                    end
                )
                cV.MouseLeave:Connect(
                    function()
                        w:Create(
                            cX,
                            TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),
                            {BackgroundColor3 = getgenv().UIColor["Slider Line Color"]}
                        ):Play()
                    end
                )
                local y = game.Players.LocalPlayer:GetMouse()
                if cM then
                    if cM <= cJ then
                        cM = cJ
                    elseif cM >= cK then
                        cM = cK
                    end
                    cX.Size = UDim2.new(1 - (cK - cM) / (cK - cJ), 0, 0, 6)
                    d0.Text = cM
                    cN(cM)
                end
                cV.MouseButton1Down:Connect(
                    function()
                        local d1 =
                            cL and
                            tonumber(
                                string.format(
                                    "%.1f",
                                    (tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ)
                                )
                            ) or
                            math.floor((tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ))
                        pcall(
                            function()
                                cN(d1)
                                d0.Text = d1
                            end
                        )
                        cX.Size = UDim2.new(0, math.clamp(y.X - cX.AbsolutePosition.X, 0, cO), 0, 6)
                        moveconnection =
                            y.Move:Connect(
                            function()
                                local d1 =
                                    cL and
                                    tonumber(
                                        string.format(
                                            "%.1f",
                                            (tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ)
                                        )
                                    ) or
                                    math.floor((tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ))
                                pcall(
                                    function()
                                        cN(d1)
                                        d0.Text = d1
                                    end
                                )
                                cX.Size = UDim2.new(0, math.clamp(y.X - cX.AbsolutePosition.X, 0, cO), 0, 6)
                            end
                        )
                        releaseconnection =
                            x.InputEnded:Connect(
                            function(d2)
                                if d2.UserInputType == Enum.UserInputType.MouseButton1 then
                                    local d1 =
                                        cL and
                                        tonumber(
                                            string.format(
                                                "%.1f",
                                                (tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ)
                                            )
                                        ) or
                                        math.floor(
                                            (tonumber(cK) - tonumber(cJ)) / cO * cX.AbsoluteSize.X + tonumber(cJ)
                                        )
                                    pcall(
                                        function()
                                            cN(d1)
                                            d0.Text = d1
                                        end
                                    )
                                    cX.Size = UDim2.new(0, math.clamp(y.X - cX.AbsolutePosition.X, 0, cO), 0, 6)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end
                        )
                    end
                )
                local function d3(r)
                    if tonumber(r) <= cJ then
                        cX.Size = UDim2.new(0, 0 * cO, 0, 6)
                        d0.Text = cJ
                        cN(tonumber(cJ))
                    elseif tonumber(r) >= cK then
                        cX.Size = UDim2.new(0, cK / cK * cO, 0, 6)
                        d0.Text = cK
                        cN(tonumber(cK))
                    else
                        cX.Size = UDim2.new(1 - (cK - r) / (cK - cJ), 0, 0, 6)
                        cN(tonumber(r))
                    end
                end
                d0.FocusLost:Connect(
                    function()
                        d3(d0.Text)
                    end
                )
                local d4 = {}
                function d4.SetValue(r)
                    d3(r)
                end
                return d4
            end
            return dJ
        end
        return dI
    end
    return dj
end
return t end

local VirtualInputManager = game:GetService('VirtualInputManager')
local PathfindingService = game:GetService('PathfindingService')
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local UserService = game:GetService("UserService")
local HttpService = game:GetService('HttpService')
local VirtualUser = game:GetService('VirtualUser')
local RunService = game:GetService('RunService')
local Workspace = game:GetService('Workspace')
local Lighting = game:GetService('Lighting')
local CoreGui = game:GetService('CoreGui')
local Players = game:GetService('Players')

local RoboBear = Workspace.NPCs:WaitForChild("Robo Bear")
local dupedTokensFolder = Workspace.Camera.DupedTokens
local EventsDir = ReplicatedStorage.Events
local FlowerZones = Workspace.FlowerZones
local Flowers = Workspace.Flowers

local Activatables = ReplicatedStorage.Activatables
local MemoryMatchManager = ReplicatedStorage.MemoryMatchManager
local MemoryMatchGui = ReplicatedStorage.Gui.MemoryMatch

-- Modules
local ActivatablesHives = require(ReplicatedStorage.Activatables.Hives)
local ActivatablesToys = require(ReplicatedStorage.Activatables.Toys)
local ActivatablesNPC = require(ReplicatedStorage.Activatables.NPCs)
local ActivatablesPlanters = require(ReplicatedStorage.Activatables.Planter)

local ScreenInfo = require(ReplicatedStorage.ScreenInfo)
local Events = require(ReplicatedStorage.Events)
local Quests = require(ReplicatedStorage.Quests)
local RoboBearGui = require(game.ReplicatedStorage.Gui.RoboBearGui)

local PlanterTypes = require(ReplicatedStorage.PlanterTypes)
local NectarTypes = require(ReplicatedStorage.NectarTypes)
local EggTypes = require(ReplicatedStorage.EggTypes)
local BeeTypes = require(ReplicatedStorage.BeeTypes)

local LocalPlanters = require(ReplicatedStorage.LocalPlanters)
local Accessories = require(ReplicatedStorage.Accessories)
local Collectors = require(ReplicatedStorage.Collectors)

local checkAccessory = require(ReplicatedStorage.ItemPackages.Accessory).PlayerHas
local checkTool = require(ReplicatedStorage.ItemPackages.Collector).PlayerHas
local BuffTileModule = require(ReplicatedStorage.Gui.TileDisplay.BuffTile)
local ClientMonsterTools = require(ReplicatedStorage.ClientMonsterTools)
local MemoryMatchModule = require(ReplicatedStorage.Gui.MemoryMatch)
local ClientStatCache = require(ReplicatedStorage.ClientStatCache)
local MinigameGui = require(ReplicatedStorage.Gui.MinigameGui)
local MonsterTypes = require(ReplicatedStorage.MonsterTypes)
local timeToString = require(ReplicatedStorage.TimeString)
local AlertBoxes = require(ReplicatedStorage.AlertBoxes)
local StatTools = require(ReplicatedStorage.StatTools)
local StatReqs = require(ReplicatedStorage.StatReqs)
local ServerTime = require(ReplicatedStorage.OsTime)

local PlayerActivesCommand = ReplicatedStorage.Events.PlayerActivesCommand
local RetrievePlayerStats = ReplicatedStorage.Events.RetrievePlayerStats

local ScreenGui = ScreenInfo:GetScreenGui()

local bssapi = loadstring(game:HttpGet("https://raw.githubusercontent.com/7BioHazard/mv3/main/bssapi.lua"))()
local api

local vitaly = {}
	vitaly['generaterandomstring'] = function(a)
		local let = ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'):split('')
		local string = '' 
		for i = 1, a do 
			string = string..let[math.random(1, #let)]
		end 
		return string 
	end
	vitaly["humanoidrootpart"] = function()
		return game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	end
	vitaly["humanoid"] = function() 
		return game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
	end
	vitaly["tween"] = function(speed, pos)
		if vitaly.humanoidrootpart() then
			if typeof(pos) == "CFrame" then pos = pos.p end
			local speed = (vitaly.humanoidrootpart().Position - pos).Magnitude / speed
			game:GetService("TweenService"):Create(vitaly.humanoidrootpart(), TweenInfo.new(speed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(pos)}):Play() task.wait(speed)
		end
	end
	vitaly["walkTo"] = function(Pos)
		if mv2.humanoid() then
			mv2.humanoid():MoveTo(Pos)
		end
	end
	vitaly["isExist"] = function(obj)
		NewObjName = vitaly.generaterandomstring(10)
		oldObjName = obj and obj.Name
		obj.Name = NewObjName
		if obj ~= nil or obj.Parent:FindFirstChild(NewObjName) then
			obj.Name = oldObjName
			return true
		else
			return false
		end
	end
	vitaly["player"] = game.Players.LocalPlayer
	vitaly["notify"] = function(title, description, duration)
		pcall(function()
			game.StarterGui:SetCore("SendNotification", {
				Title = title;
				Text = description;
				Duration = duration;
			})
		end)
	end

    vitaly["getField"] = function(part)
		part = part or vitaly.humanoidrootpart()
		local ray = Ray.new(part.Position+Vector3.new(0, -35, 0), Vector3.new(0,100, 0))
		local hit, hitPos = workspace:FindPartOnRayWithWhitelist(ray, {game.Workspace.FlowerZones})
		if hit and hit.Parent.Name == "FlowerZones" then
			return hit
		else
			return nil
		end
	end

	vitaly['tableFind'] = function(tt, va)
		for i,v in pairs(tt) do
			if v == va then
				return i
			end
		end
	end

	vitaly['findValue'] = function(Table, Value)
		if type(Table) == "table" then
			for index, value in pairs(Table) do
				if value == Value then
					return true
				end
			end
		else
			return false
		end
		return false
	end
	vitaly['returnValue'] = function(tab, val)
		ok = false
		for i,v in pairs(tab) do
			if string.match(val, v) then
				ok = v
				break
			end
		end
		return ok
	end

    local player = Players.LocalPlayer

    local plantersCacheFilePath = "vitaly/plantercache/"..player.Name.."_customPlantersCache.json"
    if not isfolder("vitaly") then makefolder("vitaly") end
    if not isfolder("vitaly/plantercache") then makefolder("vitaly/plantercache") end
    if gethui then
        for i, v in pairs(gethui():GetDescendants()) do
            if v:IsA("TextLabel") then
                if v.Name:find("vitaly") then
                    v.Parent.Parent.Parent.Parent.Parent:Destroy()
                end
            end
        end
    else
        for i, v in pairs(CoreGui:GetDescendants()) do
            if v:IsA("TextLabel") then
                if v.Name:find("vitaly") then
                    v.Parent.Parent.Parent.Parent.Parent:Destroy()
                end
            end
        end    
    end
    
    local currentvitalyLoadedAt = tick()
    getgenv().vitalyLoadedAt = currentvitalyLoadedAt
    
    plrHive = nil
    httpreq = (syn and syn.request) or http_request or (http and http.request) or request
    setIdentity = (syn and syn.set_thread_identity) or setthreadcontodo or setidentity or setthreadidentity or set_thread_identity
    getIdentity = (syn and syn.get_thread_identity) or getidentity or getthreadidentity or get_thread_identity
    local origThreadIdentity = getIdentity and getIdentity() or 8
    
    local Tasks = {_LIST={}}
    function Tasks:Add(taskName, taskFunction, isLuraphNoVirtualize)
        local spawnedtask
        if isLuraphNoVirtualize then
            spawnedtask = task.spawn(function() 
                LPH_NO_VIRTUALIZE(function() taskFunction() end)()
            end)
        else
            spawnedtask = task.spawn(taskFunction)
        end
        if spawnedtask then
            Tasks._LIST[taskName] = spawnedtask
        end
    end
    
    function Tasks:Cancel(taskName)
        if Tasks._LIST[taskName] ~= nil then
            pcall(function()
                task.cancel(Tasks._LIST[taskName])
            end)
            Tasks._LIST[taskName] = nil 
        end
    end
    function Tasks:Get(taskName)
        if Tasks._LIST[taskName] ~= nil then
            return Tasks._LIST[taskName]
        end
    end
    function Tasks:CancelAll()
        for i,v in pairs(Tasks._LIST) do
            pcall(function() 
                task.cancel(v)
            end)
        end
    end
    
    getgenv().vitaly = {
        toggles = {
            autodispensers = false,
            autoboosters = false,
            automemorymatch = false,
    
            autofarm = false,
            autodig = false,
            converthiveballoon = false,
            convertHoney = true,
    
            autoPlanters = false,
    
            speedhack = false,
    
            autoMotherHouse = false,
            autoWealthClock = false,
            autoHoneystorm = false,
            autoFreeAntPass = false,
            autoFreeRoboPass = false,
            autoSamovar = false,
            autoStockings = false,
            autoOnettArt = false,
            autoCandles = false,
            autoFeast = false,
            autoSnowMachine = false,
            autoHoneyWreath = false,
            farmrares = false,
            AutoHoneyM = false,
            autoFireFly = false
        },
        vars = {
            equipAccessoryMethod = "Tween",
            defaultmask = "None",
            rares = {},
        },
        autoFarmSettings = {
            field = "Dandelion Field",
    
            autoSprinkler = true,
    
            farmShower = false,
            farmCoconuts = false,
            farmBubbles = false,
            farmFlames = false,
            farmUnderClouds = false,
            farmUnderBalloons = false,
            farmFuzzyBombs = false,
            farmDupedTokens = false,
    
            smartBubbleBloat = false,
            smartPreciseCrosshair = false,
            smartPreciseMethod = "Fast Tween "..Danger,
            ignoreHoneyTokens = false,
            farmSprouts = false,
    
            faceBalloons = false,
            faceFlames = false,
            faceCenter = false,
        },
        convertSettings = {
            secondsBeforeConvert = 0,
            convertat = 100,
            convertballoonat = 0,
            instantToggle = false,
            selectedInstant = {},
        },
        autodispensersettings = {
            treatDispenser = false,
            royalJellyDispenser = false,
            blueberryDispenser = false,
            strawberryDispenser = false,
            coconutDispenser = false,
            glueDispenser = false,
            freerobopass = false,
            freeantpass = false
        },
        autoboostersettings = {
            whiteBooster = false,
            redBooster = false,
            blueBooster = false
        },
        rares = {},
        autoQuestSettings = {
            doQuests = false,
            doRepeatables = true,
            acceptAllQuests = false,
    
            BlackBearQuests = false,
            BrownBearQuests = false,
            PandaBearQuests = false,
            ScienceBearQuests = false,
            PolarBearQuests = false,
            SpiritsBearQuests = false,
            BuckoBeeQuests = false,
            RileyBeeQuests = false,
            HoneyBeeQuests = false,
            OnettQuests = false,
    
            -- 
            enablePriorities = false,
            prioritizeMobKill = true,
    
            BlackBearPriority = 1,
            BrownBearPriority = 1,
            PandaBearPriority = 1,
            ScienceBearPriority = 1,
            PolarBearPriority = 1,
            SpiritBearPriority = 1,
            BuckoBeePriority = 1,
            RileyBeePriority = 1,
            HoneyBeePriority = 1,
            OnettPriority = 1,
            BeeBearPriority = 1,
    
            BeeBearQuests = false,
    
            farmPollen = false,
            farmGoo = false,
            killMobs = false,
            feedBees = false,
            useToys = false,
            useMemoryMatch = false,
            doQuestQuests = false,
    
    
            tpToNPC = false,
            doAnts = false,
    
            bestBlueField = "Pine Tree Forest",
            bestRedField = "Rose Field",
            bestWhiteField = "Pumpkin Patch"
    
        },
        webhookSettings = {
            useWebhook = false,
            onlyTruncated = false,
            showTotalHoney = false,
            showHoneyPerHour = false,
            showDailyHoney = false,
            showPlanters = false,
            showNectars = false,
            showItems = false,
            sendQuests = false,
    
            discordId = "0",
            webhookUrl = "",
            webhookColor = "0xfcdf03",
            pingUser = false,
            messageFrequency = 30,
    
            itemsList = {},
        },
        autoPlantersSettings = {
            doPlanters = false,
            planterHarvestAt = 20,
            doCustomPlanters = false,
            blacklistedNectars = {},
            blacklistedPlanters = {}
        },
        autoPuffshroomSettings = {
            farmPuffshrooms = false,
            farmRemaining = true,
            rarityPriority = "Mythic > Common",
            levelPriority = "High > Low",
            minimumLevel = 1,
            maximumLevel = 16
        },
        localPlayerSettings = {
            walkSpeed = 60,
            tweenSpeed = 7
        },
        combatSettings = {
            trainCrab = false,
            trainKingBeetle = false,
            trainTunnelBear = false,
            trainStumpSnail = false,
            snailConvertHoney = false,
            killVicious = false,
            viciousMinLevel = 1,
            viciousMaxLevel = 12,
    
            killSpidor = false,
            killMantis = false,
            killScorpion = false,
            killWerewolf = false
        },
        customPlanterSettings = {
            customPlanters1 = {
                [1] = {planter = "", field = "", harvestAmount = 75},
                [2] = {planter = "", field = "", harvestAmount = 75},
                [3] = {planter = "", field = "", harvestAmount = 75},
                [4] = {planter = "", field = "", harvestAmount = 75},
                [5] = {planter = "", field = "", harvestAmount = 75}
            },
            customPlanters2 = {
                [1] = {planter = "", field = "", harvestAmount = 75},
                [2] = {planter = "", field = "", harvestAmount = 75},
                [3] = {planter = "", field = "", harvestAmount = 75},
                [4] = {planter = "", field = "", harvestAmount = 75},
                [5] = {planter = "", field = "", harvestAmount = 75}
            },
            customPlanters3 = {
                [1] = {planter = "", field = "", harvestAmount = 75},
                [2] = {planter = "", field = "", harvestAmount = 75},
                [3] = {planter = "", field = "", harvestAmount = 75},
                [4] = {planter = "", field = "", harvestAmount = 75},
                [5] = {planter = "", field = "", harvestAmount = 75}
            },
        },
        alertSettings = {
            viciousAlert = true
        },
        RoboBearChallangeSettings = {
            autoRBC = false
        },
        raresList = {}
    }
    
    
    getgenv().temptable = {
        version = "0.1",
        convertingHoney = false,
        stopAll = false,
        activeMemoryMatch = nil,
    
        honeyAtStart = ClientStatCache.Get(nil,{"Totals", "Honey"}),
        lastWebhookSent = 0,
    
        tokenpath = Workspace.Collectibles,
        fieldDecosFolder = Workspace:FindFirstChild("FieldDecos") or ReplicatedStorage:FindFirstChild("FieldDecos"),
        lastWalkToNearest = 0,
    
        fieldSelected,
        fieldPosition,
        floversRow = {},
    
        customWalkSpeed = {enabled = false, speed = 50},
    
        plantingPlanter = false,
    
        detected = {
            vicious = false,
            windy = false
        },
    
        doingShower = false,
        doingMonster = false,
        doingTokens = false,
    
        stopAutofarm = false,
    
        autoRJSettings = {
            requireGifted = false,
            requireAnyGifted = false,
            xCoord = 3,
            yCoord = 1,
            runningAutoRJ = false,
            selectedBees = {},
            selectedRarities = {}
        },
        showersTable = {},
        coconutsTable = {},
        lastShowerRegistered = 0,
    
        sproutsTable = {},
        susTokenPositions = {},
    
        leafTable = {},
        sparklesTable = {},
        balloonsTable = {},
    
        FieldBalloons = nil,
    
        codesTable = {
            "Wax",
            "Roof",
            "Nectar",
            "Crawlers",
            "Connoisseur",
            "Cog",
            "Buzz",
            "Bopmaster",
            "38217",
            "GumdropsForScience",
            "ClubConverters",
            "BeesBuzz123",
            "PlushFriday",
        }, codesActivated = false,
    
        stopEverything = false,
    
        puffsDetected = false,
        popStarActive = false,
    
        lastConvertAtHive = 0,
        lastFullBag = 0,
    
        MConverterUsedAt = 0,
        IConverterUsedAt = 0,
    
        tokensTable = {},
        lastTweenToRare = 0,
    
        selectedPriorityNpc = "Black Bear",
        npcPrioLabel = nil,
        npcPrioSlider = nil,
    
        autoRBC = {
            isActive = false,
            isUnlocked = nil,
            latestRBC = 0
        },
    
        questUseItemCooldown = false,
        questFeedCooldown = false,
        questUseToyCooldown = false,
    
        dupedTokensTable = {},
        EquippedCollector = "Not loaded"
    }
    
    local cocoPad = Instance.new("Part")
    cocoPad.Position = Workspace.Territories.CoconutTerritory.Position + Vector3.new(0,15,0)
    cocoPad.Size = Workspace.Territories.CoconutTerritory.Size * Vector3.new(1,0,1) + Vector3.new(0,1,0)
    cocoPad.Anchored = true
    cocoPad.CanCollide = false
    cocoPad.Transparency = 1
    cocoPad.Parent = Workspace
    
    local tunnelPart = Instance.new("Part")
    tunnelPart.Anchored = true
    tunnelPart.CanCollide = true
    tunnelPart.Position = Vector3.new(410, 27, -48)
    tunnelPart.Size = Vector3.new(10,1,10)
    tunnelPart.Transparency = 1
    tunnelPart.Parent = Workspace
    Workspace.Decorations.TrapTunnel["Tunnel Ceiling"].CanCollide = false
    
    if not Workspace:FindFirstChild("Cave") then
        local CaveFolder = Instance.new("Folder", Workspace)
        CaveFolder.Name = "Cave"
    
        local FillPart = Instance.new("Part", CaveFolder)
        FillPart.Name = "FillPart"
        FillPart.Position = Vector3.new(-29.765, 70.252, -144)
        FillPart.Size = Vector3.new(149.529, 10.607, 89.198)
        FillPart.Transparency = 1
    end
    
    function removeFromTable(Table, element)
        return table.remove(Table, table.find(Table, element))
    end
    
    function getTweenSpeed()
        return (vitaly.localPlayerSettings.tweenSpeed * 10) or 70
    end
    
    function bssAlert(style, text)
        secureCall(AlertBoxes.Push, player.PlayerScripts.AlertBoxes, nil, text, nil, style)
    end
    
    function checkCave(startPos, endPos)
        local direction = (endPos - startPos).Unit
        local ray = Ray.new(startPos, direction * (endPos - startPos).magnitude)
        local part = Workspace:FindPartOnRayWithWhitelist(ray, {Workspace.Cave})
        if part then return true else return false end
    end
    
    getgenv().TweenNoclip = nil
    function stopTween()
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character.PrimaryPart
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
    
        if getgenv().TweenNoclip then 
            pcall(function() TweenNoclip:Disconnect() end) 
            TweenNoclip = nil 
        end
    
        if humanoidRootPart then
            for i,v in pairs(humanoidRootPart:GetChildren()) do
                if v:IsA("AlignPosition") or v:IsA("AlignOrientation") then
                    v:Destroy()
                end
            end
        end
    
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Freefall) end
    end
    
    function tween(pos, speed, caveAvoid)
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local humanoidRootPart = character.PrimaryPart
        local b = false
        if checkCave(humanoidRootPart.Position, pos) and not caveAvoid then
            tween(Vector3.new(8, 90, -140), speed, true)
            character = player.Character or player.CharacterAdded:Wait()
            humanoid = character:WaitForChild("Humanoid")
            humanoidRootPart = character.PrimaryPart
        end
    
        stopTween()
        local fixedSpeed = false
        if speed then fixedSpeed = true end
    
        local alignPos = Instance.new("AlignPosition")
        alignPos.Mode = Enum.PositionAlignmentMode.OneAttachment
        alignPos.Attachment0 = humanoidRootPart.RootAttachment
        alignPos.MaxForce = math.huge
        alignPos.MaxVelocity = (fixedSpeed and speed) or getTweenSpeed()
        alignPos.Position = pos
        alignPos.Parent = humanoidRootPart
    
        local alignOrientation = Instance.new("AlignOrientation")
        alignOrientation.Attachment0 = humanoidRootPart.RootAttachment
        alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
        alignOrientation.RigidityEnabled = true
        alignOrientation.CFrame = humanoidRootPart.CFrame
        alignOrientation.Parent = humanoidRootPart
    
        -- humanoid:ChangeState(Enum.HumanoidStateType.Landed)
        -- task.wait()
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    
        getgenv().TweenNoclip = RunService.PostSimulation:Connect(function()
            for _, part in character:GetDescendants() do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end)
    
        local startTimestamp = tick()
        local playerDied = false
        local a = humanoid.Died:Connect(function() 
            playerDied = true
        end)
    
        local tempNoClip = getgenv().TweenNoclip
    
        repeat 
            task.wait()
            if not fixedSpeed then
                alignPos.MaxVelocity = getTweenSpeed()
            end
        until 
        player:DistanceFromCharacter(pos) <= 5
            or tempNoClip ~= getgenv().TweenNoclip 
            or playerDied
            or (tick() - startTimestamp) > 30
    
        a:Disconnect()
        if playerDied then
            stopTween()
            warn("ok1")
            player.CharacterAdded:Wait()
            task.wait(0.5)
            if caveAvoid then return end
            return false, tween(pos, speed)
        end
    
        if (tick() - startTimestamp) > 45 then 
            error("[Macro V3] (%s) | An error has occurred: %s"):format(temptable.version, "Tween timed out.") 
        end
    
        if tempNoClip == TweenNoclip then
            return true, stopTween()
        end
    
        return false
    end
    
    function startTween(pos, speed)
        local tweenCompleted = nil
        coroutine.wrap(function() 
            tweenCompleted = pcall(function() 
                tween(pos, speed)
            end)
            if tweenCompleted == nil then tweenCompleted = false end
        end)()
        repeat task.wait() until tweenCompleted ~= nil
    end
    
    getgenv().moveTo = function(pos)
        startTween(pos + Vector3.new(0,3,0))
    end
    
    function jsonEncode(tbl)
        local jsonString
        pcall(function() jsonString = HttpService:JSONEncode(tbl) end)
        return jsonString
    end
    
    function jsonDecode(json)
        local luaTable
        local a,s = pcall(function() luaTable = HttpService:JSONDecode(json) end)
        return luaTable
    end
    
    function getPartsFromRay(ray, whitelist)
        if typeof(whitelist) == "Instance" then whitelist = whitelist:GetDescendants() 
        elseif typeof(whitelist) == "nil"  then whitelist = {} end
    
        local Parts = {}
        local LastPart
    
        repeat
            LastPart = workspace:FindPartOnRayWithIgnoreList(ray, Parts)
            table.insert(Parts, LastPart)
        until LastPart == nil
    
        for i,v in pairs(Parts) do
            if not table.find(whitelist, v) then table.remove(Parts, i) continue end
        end
    
        return Parts
    end
    
    function walkTo(pos, timeout)
        timeout = timeout or 30
        local startedWalking = tick()
        local walkFinished = false
        player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
        api.humanoid():MoveTo(pos)
        local walkFinishedSignal = api.humanoid().MoveToFinished:Connect(function() walkFinished = true end)
    
        repeat 
            task.wait()
        until walkFinished or (tick() - startedWalking) > timeout
        pcall(function() walkFinishedSignal:Disconnect() end)
        api.humanoid():MoveTo(api.humanoidrootpart().Position)
        player.DevComputerMovementMode = Enum.DevComputerMovementMode.UserChoice
        return walkFinished
    end
    
    while not player:FindFirstChild("Honeycomb") do 
        for i = 8,3,-1 do
            local hive = Workspace.Honeycombs:FindFirstChild("Hive"..i)
            if hive and not hive.Owner.Value then
                repeat
                    if api.magnitude(hive.SpawnPos.Value.p, api.humanoidrootpart().Position) < 10 then
                        secureCall(ActivatablesHives.ButtonEffect, Activatables, player, hive.Platform.Value)
    
                        task.wait(.75)
                    else 
                        moveTo(hive.SpawnPos.Value.p - Vector3.new(0,2,0))
                    end
                    task.wait()
                until hive.Owner.Value or player:FindFirstChild("Honeycomb")
                if player:FindFirstChild("Honeycomb") then break end
            end
        end
    end
    
    plrHive = player:FindFirstChild("Honeycomb").Value
    
    function isBeesmas()
        local active = Workspace:WaitForChild"Toys":FindFirstChild"Beesmas Tree" and true
    
        return active
    end
    
    
    function findField(position)
        local ray = Ray.new(position+Vector3.new(0, -35, 0), Vector3.new(0,100, 0))
        local hit, hitPos = workspace:FindPartOnRayWithWhitelist(ray, {game.Workspace.FlowerZones})
        if hit and hit.Parent.Name == "FlowerZones" then
            return hit
        else
            return nil
        end
    end
    
    function getNumbers(str)
        local nums = {}
        for num in str:gmatch("%d+") do
            table.insert(nums, tonumber(num))
        end
        return nums
    end
    
    function truncate(num)
        num = tonumber(math.round(num))
        if num <= 0 then
            return 0
        end
        local savenum = ""
        local i = 0
        local suff = ""
        local suffixes = {"k","M","B","T","qd","Qn","sx","Sp","O","N"}
        local length = math.floor(math.log10(num)+1)
        while num > 999 do
            i = i + 1
            suff = suffixes[i] or "???"
            num = num/1000
            savenum = (math.floor(num*100)/100)..suff
        end
        if i == 0 then
            return num
        end
        return savenum
    end
    
    function truncatetime(sec)
        local second = tostring(sec%60)
        local minute = tostring(math.floor(sec / 60 - math.floor(sec / 3600) * 60))
        local hour = tostring(math.floor(sec / 3600))
    
        return (#hour == 1 and "0"..hour or hour)..":"..(#minute == 1 and "0"..minute or minute)..":"..(#second == 1 and "0"..second or second)
    end
    
    function pressButton(button)
        VirtualInputManager:SendKeyEvent(true, button, false, game)
        game:GetService("RunService").Heartbeat:Wait()
        VirtualInputManager:SendKeyEvent(false, button, false, game)
    end
    
    function addcommas(num)
        local str = tostring(num):reverse():gsub("(%d%d%d)", "%1,"):reverse()
        if str:sub(1,1) == "," then
            str = str:sub(2)
        end
        return str
    end
    
    function getTokenId(token)
        local id = "0"
        if token and token.Parent and token:FindFirstChildOfClass("Decal") then
            local texture = token:FindFirstChildOfClass("Decal").Texture
            local tempId = tonumber(tostring(texture):match("%d+"))
            if tempId then id = tempId end
        end
        return id
    end
    
    local accessoryShopsLocations = {
        ["Diamond Mask Shop"] = Vector3.new(-335, 132, -391),
        ["Demon Mask Shop"] = Vector3.new(297, 27, 274),
        ["Master Shop"] = Vector3.new(-486, 69, 0)
    }
    
    local accessoryShops = {
        ["Diamond Mask"] = accessoryShopsLocations["Diamond Mask Shop"],
        ["Demon Mask"] = accessoryShopsLocations["Demon Mask Shop"],
        ["Honey Mask"] = accessoryShopsLocations["Master Shop"]
    }
    
    function remoteEquipAccessory(accessory)
        Events.ClientCall("ItemPackageEvent", "Equip", {
            Mute = false,
            Type = accessory,
            Category = "Accessory"
        })
    end
    
    function requestAccessoryEquip(accessory)
        local shopPosition = accessoryShops[accessory]
        if not shopPosition then
            return false, "Invalid input!"
        end
    
        local accessoryType = accessoriesTable[accessory]
        if not accessoryType then
            return false, "Accessory not found!"
        end
    
    
        if not checkAccessory({Type = accessory}, getClientStatCache()) then 
            return false, "Player does not have "..accessory
        end
    
        local currentAccessory = updateClientStatCache("EquippedAccessories", accessoryType)
    
    
        if currentAccessory == accessory then
            return false, "Already equipped " .. accessory
        end
    
        if vitaly.vars.equipAccessoryMethod == "Tween" then
            moveTo(shopPosition)
        elseif vitaly.vars.equipAccessoryMethod == "Teleport" then
            api.humanoidrootpart().CFrame = CFrame.new(shopPosition)
        end
    
        task.wait(0.1)
        if (api.magnitude(shopPosition) < 25) or vitaly.vars.equipAccessoryMethod == "Remote" then
            remoteEquipAccessory(accessory)
            return true
        else
            return false
        end
    end
    
    function getRandomRareToken()
        for i=#temptable.tokensTable, 1, -1 do
            local token = temptable.tokensTable[i]
            if not token or not token.Parent then continue end
    
            local tokenId = tostring(getTokenId(token))
            if table.find(vitaly.vars.raresList, tokenId) then
                return token
            end
        end
    end
    
    function getMinePlanters()
        local minePlantersTable = {}
        pcall(function()
            local plantedPlanters = debug.getupvalues(LocalPlanters.LoadPlanter)[4]
            for i, v in pairs(plantedPlanters) do
                if v.IsMine and v.PotModel and v.Active and not v.Collected then
                    table.insert(minePlantersTable,v)
                end
            end
        end)
        return minePlantersTable
    end
    
    function updateClientStatCache(...)
        return ClientStatCache:Update({...})
    end
    
    function getClientStatCache(...)
        return ClientStatCache:Get({...})
    end
    
    function getDailyHoney()
        return ClientStatCache.GetDailyTotal(nil, "Honey") - (ClientStatCache.GetDailyTotal(nil, "ChallengeHoney") - (ClientStatCache.GetDailyTotal(nil, {"EggsReceived","SysHoney"})))
    end
    
    function getWarningDisks()
        local warningDisks = {}
        for i,v in pairs(game.Workspace.Particles:GetChildren()) do
            if v.Name == "WarningDisk" or v.Name == "Thorn" then 
                table.insert(warningDisks,v) 
            end
        end
        return warningDisks
    end
    
    if _G.debugging then
        warn("Tables init.")
    end
    
    --Tables
    
    local npcIconsEndpoint = "https://static.wikia.nocookie.net/bee-swarm-simulator/images/"
    local npcsIcons = {
        ["Polar Bear"]   = npcIconsEndpoint.."2/23/Polar.png",
        ["Bucko Bee"]    = npcIconsEndpoint.."3/3d/GiftedBuckoBeeNPCTransparent.png",
        ["Black Bear"]   = npcIconsEndpoint.."7/71/Black.png",
        ["Mother Bear"]  = npcIconsEndpoint.."a/af/MotherBearTrans.png",
        ["Brown Bear"]   = npcIconsEndpoint.."0/06/Brown.png",
        ["Panda Bear"]   = npcIconsEndpoint.."0/00/Panda.png",
        ["Science Bear"] = npcIconsEndpoint.."a/a5/Science.png",
        ["Dapper Bear"]  = npcIconsEndpoint.."4/4b/DapperBear.png",
        ["Spirit Bear"]  = npcIconsEndpoint.."2/21/Spirit_bear333.png",
        ["Riley Bee"]    = npcIconsEndpoint.."b/b0/GiftedRileyBeeNPCTransparent.png"
    }
    
    local miscEmojis = {
        ["Polar Power"] = "<:PolarPower:1080979354030444594>"
    }
    
    local nectarEmojis = {
        ["Refreshing Nectar"]   = "<:Refreshing:1080956994070007818>",
        ["Invigorating Nectar"] = "<:Invigorating:1080967902800392354>",
        ["Comforting Nectar"]   = "<:Comforting:1080968750888652960>",
        ["Motivating Nectar"]   = "<:Motivating:1080969173536096357>",
        ["Satisfying Nectar"]   = "<:Satisfying:1080969460288073748>"
    }
    
    local plantersEmojis = {
        ["Paper Planter"]         = "<:PaperPlanter:1084965375965405265>",
        ["Plastic Planter"]       = "<:PlasticPlanter:1084965381711597598>",
        ["Candy Planter"]         = "<:CandyPlanter:1084965368147226716>",
    }
    
    AllToysTable = {
        ["toysTable"] = {
            ['autoWealthClock'] = "Wealth Clock",
            ['autoHoneystorm'] = "Honeystorm",
            ['autoFreeAntPass'] = "Free Ant Pass Dispenser",
            ['autoFreeRoboPass'] = "Free Robo Pass Dispenser"
        },
        ["boostersTable"] = {
            ['whiteBooster'] = 'Field Booster',
            ['redBooster'] = 'Red Field Booster',
            ['blueBooster'] = 'Blue Field Booster'
        },
        ["dispensersTable"] = {
            ['treatDispenser'] = "Treat Dispenser",
            ['royalJellyDispenser'] = "Free Royal Jelly Dispenser",
            ['blueberryDispenser'] = "Blueberry Dispenser",
            ['strawberryDispenser'] = "Strawberry Dispenser",
            ['coconutDispenser'] = "Coconut Dispenser",
            ["glueDispenser"] = "Glue Dispenser"
        },
        ["memoryMatchTable"] = {}
    }
    
    if isBeesmas() then
        AllToysTable["beesmasToysTable"] = {
            ['autoSamovar'] = "Samovar",
            ['autoStockings'] = "Stockings",
            ['autoOnettArt'] = "Onett's Lid Art",
            ['autoCandles'] = "Honeyday Candles",
            ['autoFeast'] = "Beesmas Feast",
            ['autoSnowMachine'] = "Snow Machine",
            ['autoHoneyWreath'] = "Honey Wreath"
        }
        AllToysTable["toysTable"]["autoMotherHouse"] = "Gingerbread House"
    end
    
    fieldsTable = {}
    blueFields = {}
    redFields = {}
    whiteFields = {}
    
    monstersTable = {}
    plantersTable = {}
    plantersDropdownTable = {}
    nectarsTable = {}
    accessoriesTable = {}
    
    sproutRarities = {
        [Color3.fromRGB(103,162,201)] = "Moon",
        [Color3.fromRGB(180, 190, 186)] = "Common",
    
    }
    
    showerTable = {}
    beesTable = {namesOnly = {}, fullData = {}, raritiesTable = {"Any Common", "Any Rare", "Any Epic", "Any Legendary", "Any Mythic"}}
    npcsTable = {"Black Bear", "Brown Bear", "Panda Bear", "Science Bear", "Polar Bear", "Spirit Bear", "Bucko Bee", "Riley Bee", "Honey Bee", "Onett", "Bee Bear 5"}
    
    nectarsDropdownTable = {
        "Comforting Nectar",
        "Satisfying Nectar",
        "Invigorating Nectar",
        "Refreshing Nectar",
        "Motivating Nectar"
    }
    
    if _G.debugging then
        warn("Tables init done. Waiting 1 second")
        task.wait(1)
    end
    
    if _G.debugging then
        warn("Tables init 2.")
    end
    
    --Tables init
    for fieldIndex, field in pairs(Workspace.FlowerZones:GetChildren()) do
        table.insert(fieldsTable, field.Name)
        if not field:FindFirstChild("ColorGroup") then
            local colorGroup = Instance.new("StringValue")
            colorGroup.Name = "ColorGroup"
            colorGroup.Value = "White"
            colorGroup.Parent = field
        end
        if field.ColorGroup.Value == "Blue" then table.insert(blueFields, field.Name)
        elseif field.ColorGroup.Value == "Red" then table.insert(redFields, field.Name)
        elseif field.ColorGroup.Value == "White" then table.insert(whiteFields, field.Name)
        end
    end
    
    for i,v in pairs(Accessories.GetTypes()) do
        if v.Slot then
            accessoriesTable[i] = v.Slot
        end
    end
    
    for i,v in pairs(PlanterTypes.GetTypes()) do
        if v.Description == "Test planter." or i == "Ticket" or i == "Festive" then continue end
        local planterData = {
            systemName = v.Name,
            displayName = v.DisplayName,
            nectarMultipliers = v.NectarMultipliers,
            pollenMultipliers = v.PollenMultipliers
        }
        plantersTable[v.Name] = planterData
        table.insert(plantersDropdownTable, v.DisplayName)
    end
    
    writefile("newPlanters.json", game.HttpService:JSONEncode(plantersTable))
    
    for i,v in pairs(NectarTypes.GetTypes()) do
        nectarsTable[i] = v.Fields
    end
    
    for i,v in pairs(temptable.tokenpath:GetChildren()) do
        table.insert(temptable.susTokenPositions, v.Position)
    end
    
    
    for i,v in pairs(Workspace.MonsterSpawners:GetChildren()) do
        monstersTable[v.Name] = {RespawnCooldown = 0, MonsterType = nil}
        monstersTable[v.Name].MonsterType = v.MonsterType.Value
        monstersTable[v.Name].RespawnCooldown = MonsterTypes.Get(v.MonsterType.Value).Stats.RespawnCooldown
        monstersTable[v.Name].Spawner = v
        if v.Name == "WerewolfCave" then
            monstersTable[v.Name].Territory = v.Territory.Value.w
        elseif v.Name == "MushroomBush" then
            monstersTable[v.Name].Territory = v.Territory.Value.Part
        else
            monstersTable[v.Name].Territory = v.Territory.Value
        end
    end
    
    for i,v in pairs(Workspace.Toys:GetChildren()) do
        if v.Name:find("Memory Match") then table.insert(AllToysTable["memoryMatchTable"], v.Name) end
    end
    
    for i,v in pairs(require(game:GetService("ReplicatedStorage").BeeTypes).GetTypes()) do
        table.insert(beesTable.namesOnly, i.." Bee")
        beesTable.fullData[i] = {Rarity = v.Rarity}
    end
    
    if _G.debugging then
        warn("Tables init 2. Waiting 1 second")
        task.wait(1)
    end
    
    --Functions
    
    function markAsCollected(object)
        local collectedCache = Instance.new("Folder")
        collectedCache.Name = "Collected"
        collectedCache.Parent = object
    end
    
    local cachedFieldFlowers = {}
    
    function getAllFlowers(field)
        local fieldId = field.ID.Value
        local fieldFlowers
        if cachedFieldFlowers[field.Name] then
            fieldFlowers = cachedFieldFlowers[field.Name]
        else
            fieldFlowers = {}
            for flowerIndex, flower in pairs(Workspace.Flowers:GetChildren()) do
                local flowerInfo = getNumbers(flower.Name)
                if #flowerInfo == 3 and flowerInfo[1] == fieldId then
                    table.insert(fieldFlowers, flower)
                end
            end
            if not (#fieldFlowers <= 1) then 
                cachedFieldFlowers[field.Name] = fieldFlowers 
            else
                return 
            end
        end
        return fieldFlowers
    end
    
    function getRandomFlower(field)
        local fieldId = field.ID.Value
        local fieldFlowers
        if cachedFieldFlowers[field.Name] then
            fieldFlowers = cachedFieldFlowers[field.Name]
        else
            fieldFlowers = {}
            for flowerIndex, flower in pairs(Workspace.Flowers:GetChildren()) do
                local flowerInfo = getNumbers(flower.Name)
                if #flowerInfo == 3 and flowerInfo[1] == fieldId then
                    table.insert(fieldFlowers, flower)
                end
            end
            if not (#fieldFlowers <= 1) then 
                cachedFieldFlowers[field.Name] = fieldFlowers 
            else
                return 
            end
        end
        return fieldFlowers[math.random(1,#fieldFlowers)]
    end
    
    local cachedFieldCenters = {farm = {}, sprinkler = {}}
    
    function getNewFarmCenter(field, sprinkler)
        if not (field:FindFirstChild("ColorGroup") and field.ColorGroup.Value == "Blue") then return end
        if sprinkler and cachedFieldCenters["sprinkler"][field.Name] then 
            return cachedFieldCenters["sprinkler"][field.Name] 
        elseif not sprinkler and cachedFieldCenters["farm"][field.Name] then
            return cachedFieldCenters["farm"][field.Name] 
        end
        local flowers = getAllFlowers(field)
        local minX = math.huge
        local minY = math.huge
        local maxX = -math.huge
        local maxY = -math.huge
    
        for i, flower in ipairs(flowers) do
            local flowerSettings = getNumbers(flower.Name)
            minX = math.min(minX, flowerSettings[2])
            minY = math.min(minY, flowerSettings[3])
            maxX = math.max(maxX, flowerSettings[2])
            maxY = math.max(maxY, flowerSettings[3])
        end
    
        local flowerCenter 
        if maxX - minX >= maxY - minY then -- x is longer
            local centerFlowerX = sprinkler and maxX - 5 or maxX
            local centerFlowerY = sprinkler and maxY - 5 or maxY --math.floor((minY + maxY) / 2 + 0.5)
            for i,v in pairs(flowers) do
                if v.Name == "FP"..field.ID.Value.."-"..centerFlowerX.."-"..centerFlowerY then
                    flowerCenter = v
                    break
                end
            end
        else -- y is longer
            local centerFlowerX = sprinkler and maxX - 5 or maxX --math.floor((minX + maxX) / 2 + 0.5)
            local centerFlowerY = sprinkler and maxY - 5 or maxY
            for i,v in pairs(flowers) do
                if v.Name == "FP"..field.ID.Value.."-"..centerFlowerX.."-"..centerFlowerY then
                    flowerCenter = v
                    break
                end
            end
        end
        if flowerCenter then
            if sprinkler and not cachedFieldCenters["sprinkler"][field.Name] then 
                cachedFieldCenters["sprinkler"][field.Name] = flowerCenter
            elseif not sprinkler and not cachedFieldCenters["farm"][field.Name] then
                cachedFieldCenters["farm"][field.Name] = flowerCenter
            end
        end
        return flowerCenter
    end
    
    
    
    function jump()
        if not player.Character.Humanoid.Jump then
            player.Character.Humanoid.Jump = true
        end
    end
    
    function getPlanterData(planterName)
        local planterData
        if plantersTable[planterName] then 
            planterData = plantersTable[planterName] 
        else
            for i,v in pairs(plantersTable) do
                if v.displayName == planterName then
                    planterData = v
                    break
                end
            end
        end
        return planterData
    end
    
    function gethiveballoon()
        for _,balloon in pairs(Workspace.Balloons.HiveBalloons:GetChildren()) do
            if balloon:FindFirstChild("BalloonRoot") then
                if balloon.BalloonRoot.CFrame.p.X == player.SpawnPos.Value.p.X then
                    return true
                end
            end
        end
        return false
    end
    
    function getBuffTime(buffName, convertToHMS)
        local buff = BuffTileModule.GetBuffTile(buffName)
        if not buff or not buff.TimerDur or not buff.TimerStart then 
            return 0 
        end
    
        local toReturn = buff.TimerDur - (math.floor(ServerTime()) - buff.TimerStart)
        if convertToHMS then 
            toReturn = timeToString(toReturn) 
        end
    
        return toReturn
    end
    
    function getBuffStack(buffName)
        local buff = BuffTileModule.GetBuffTile(buffName)
    
        return (buff and tostring(buff.Combo)) or 0
    end
    
    function getCurrentTime()
        local CurrentTime = Lighting.ClockTime
        return (CurrentTime > 10 and "Day") or "Night"
    end
    
    function disableall()
        temptable.disableAll = true
    end
    
    function enableall()
        temptable.disableAll = false
    end
    
    function isFieldSame(pos1, pos2)
        return findField(pos1) == findField(pos2)
    end
    
    if _G.debugging then
        warn("Functions init.")
    end
    
    function canTaskBeSpawned(taskName)
        if taskName == "getToys" then
            if temptable.puffsDetected and vitaly.autoPuffshroomSettings.farmPuffshrooms then return false end
    
            return true
        elseif taskName == "farmPlanters" then
            if temptable.puffsDetected and vitaly.autoPuffshroomSettings.farmPuffshrooms then return false end
    
            return true
        elseif taskName == "killVicious" then
    
            return true
        elseif taskName == "trainBosses" then
            if temptable.puffsDetected and vitaly.autoPuffshroomSettings.farmPuffshrooms then return false end
    
            return true
        end
    end
    
    function canCollectToken(token)
        return 
            token.Parent and 
            ((api.humanoidrootpart().Position * Vector3.new(0,1,0)) - (token.Position * Vector3.new(0,1,0))).magnitude < 6 and
            token.CFrame.YVector.Y == 1
    end
    
    function canFarmTask(taskName) 
        if taskName == "getNearestBubble" and vitaly.autoFarmSettings.farmBubbles  
            or taskName == "getNearestFuzz" and vitaly.autoFarmSettings.farmFuzzyBombs  
            or taskName == "getNearestCloud" and vitaly.autoFarmSettings.farmUnderClouds  
            or taskName == "getNearestFlame" and vitaly.autoFarmSettings.farmFlames  
            or taskName == "getNearestToken" and true
        then return true else return false end
    end
    function dig()
        std(2)
        require(game.ReplicatedStorage.Collectors.LocalCollect).Run()
        std(8)
    end
    local NearestTable = {}
    
    NearestTable.getNearestBubble = function(callback)
        local nearest = {bubble = nil, distance = math.huge}
        for _,bubble in pairs(Workspace.Particles:GetChildren()) do
            if bubble.Name ~= "Bubble" then continue end
            if callback and not callback(bubble) then continue end
            local distance = api.magnitude(bubble.Position)
            if distance < nearest.distance then
                nearest = {bubble = bubble, distance = distance}
            end
        end
        return nearest.bubble, nearest.distance
    end
    
    NearestTable.getNearestFuzz = function(callback)
        local nearest = {fuzz = nil, distance = math.huge}
        for _,fuzz in pairs(Workspace.Particles:GetChildren()) do
            if fuzz.Name ~= "DustBunnyInstance" then continue end
            if callback and not callback(fuzz.Plane) then continue end
            local distance = api.magnitude(fuzz.Plane.Position)
            if distance < nearest.distance then
                nearest = {fuzz = fuzz.Plane, distance = distance}
            end
        end
        return nearest.fuzz, nearest.distance
    end
    
    NearestTable.getNearestToken = function(blacklistedTokens, callback)
        local nearest = {token = nil, distance = math.huge}
        for _, token in ipairs(temptable.tokenpath:GetChildren()) do
            if blacklistedTokens and table.find(blacklistedTokens, token) then warn("Token blacklisted") continue end
            if callback and not callback(token) then continue end
            if canCollectToken(token) then
                local distance = api.magnitude(token.Position)
                if distance < nearest.distance then
                    nearest = {token = token, distance = distance}
                end
            end
        end
        return nearest.token, nearest.distance
    end
    
    NearestTable.getNearestCloud = function(callback)
        local nearest = {cloud = nil, distance = math.huge}
        for _, cloud in ipairs(Workspace.Clouds:GetChildren()) do
            if not cloud:FindFirstChild("Plane") then continue end
            if callback and not callback(cloud.Plane) then continue end
            local distance = api.magnitude(cloud.Plane.Position)
            if distance < nearest.distance then
                nearest = {cloud = cloud.Plane, distance = distance}
            end
        end
        return nearest.cloud, nearest.distance
    end
    
    NearestTable.getNearestFlame = function(callback)
        local nearest = {flame = nil, distance = math.huge}
        for _, flame in ipairs(Workspace.PlayerFlames:GetChildren()) do
            if not flame:FindFirstChild("PF") or flame:FindFirstChild("PF") and flame.PF.Color.Keypoints[1].Value.G == 0 then continue end
            if callback and not callback(flame) then continue end
            local distance = api.magnitude(flame.Position)
            if distance < nearest.distance then
                nearest = {flame = flame, distance = distance}
            end
        end
        return nearest.flame, nearest.distance
    end
    
    getNearestBalloon = function(callback) 
        local nearest = {token = nil, distance = math.huge}
        for _, balloon in pairs(temptable.balloonsTable) do
            if callback and not callback(balloon.BalloonBody) then continue end
            if not balloon:FindFirstChild("BalloonBody") then continue end
            local distance = api.magnitude(balloon.BalloonBody.Position)
            if distance < nearest.distance then
                nearest = {balloon = balloon.BalloonBody, distance = distance}
            end
        end
        return nearest.balloon, nearest.distance
    end
    
    function getNearestTask(callback)
        local nearest = {taskName = "", distance = math.huge, object = nil}
        local distanceTable = {}
        for i, v in pairs(NearestTable) do
            if not canFarmTask(i) then continue end
    
            if i ~= "getNearestToken" then
                local temp = string.gsub(i, "getNearest", "")
                local Name = tostring(temp)
                local values = {v(callback)}
                local tableToAdd={Name, i, values[1], values[2]}
                table.insert(distanceTable, tableToAdd)
            else
                local temp = string.gsub(i, "getNearest", "")
                local Name = tostring(temp)
                local values = {v(nil, callback)}
                local tableToAdd={Name, i, values[1], values[2]}
                table.insert(distanceTable, tableToAdd)
            end
        end
        for i, v in pairs(distanceTable) do
            if v[4] < nearest.distance then
                nearest = {taskName = v[1], distance = v[4], object = v[2]}
            end
        end
        return nearest.taskName, nearest.object
    end
    
    function farmNearest(callback)
        local nearestName = getNearestTask(callback)
        if nearestName == "Bubble" then
            return farmBubble(callback)
        elseif nearestName == "Token" then
            return farmToken(callback)
        elseif nearestName == "Fuzz" then
            return farmFuzzy(callback)
        end
        return false
    end
    
    function getTokenLink()
        local nearestTokenLink = {token = nil, distance = math.huge}
        for _,token in ipairs(temptable.tokenpath:GetChildren()) do
            if getTokenId(token) == 1629547638 and token.CFrame.YVector.Y == 1 and not token:FindFirstChild("Collected") then
                local distance = (token.Position - player.Character.HumanoidRootPart.Position).magnitude
                if distance < nearestTokenLink.distance then
                    nearestTokenLink = {token = token, distance = distance}
                end
            end
        end
        return nearestTokenLink.token
    end
    
    function collectToken(token)
        if not token.Parent or token:FindFirstChild("Collected") then return false end
        local startedCollecting = tick()
        local moveToCalled = -1
        local collected = false
        while true do
            if (api.humanoidrootpart().Position - token.Position).magnitude < 4 or
                token.CFrame.YVector.Y ~= 1 or
                not workspace:FindPartOnRay(Ray.new(api.humanoidrootpart().Position, token.Position - api.humanoidrootpart().Position)) or
                (token.Position - api.humanoidrootpart().Position).magnitude < 4 or
                (tick() - startedCollecting) >= 3
            then
                if (tick() - startedCollecting) >= 3 then break end
                collected = true
                break
            elseif (api.humanoidrootpart().Position - token.Position).magnitude > 200 then break end
    
            if tick() - moveToCalled > 0.25 then
                if (tick() - temptable.lastTweenToRare) < 5 then break end
                if not pcall(function()
                        api.humanoid():MoveTo(token.Position)
                    end) then break end
                moveToCalled = tick()
            end
    
            task.wait()
        end
        if collected then
            markAsCollected(token)
            return true
        else
            return false
        end
    end
    
    function farmToken(customCallback)
        local nearestTokenLink = getTokenLink()
        if nearestTokenLink then
            collectToken(nearestTokenLink)
            return true
        else
            local tokenToCollect = NearestTable.getNearestToken(nil, function(token)
                if customCallback and not customCallback(token) then 
                    return false
                end
                if token.CFrame.YVector.Y == 1 and not token:FindFirstChild("Collected") and not table.find(temptable.susTokenPositions, token.Position) then 
                    return true 
                end 
            end)
            if not tokenToCollect then return end
            collectToken(tokenToCollect)
            return true
        end
    end
    
    function farmBubble(customCallback)
        local nearestBubble = NearestTable.getNearestBubble(function(bubble)
            if not bubble or customCallback and not customCallback(bubble) then 
                return false
            end    
            if not bubble:FindFirstChild("Collected") then return true end
        end)
        if not nearestBubble then return false end
    
        local startedCollecting = tick()
        local moveToCalled = -1
    
        while true do
            if api.magnitude(nearestBubble.Position) < 8.5 or
                not nearestBubble.Parent or
                (tick() - startedCollecting) >= 8 then
                break
            end
    
            if tick() - moveToCalled > 0.5 then
                api.humanoid():MoveTo(nearestBubble.Position)
                moveToCalled = tick()
            end
    
            RunService.Heartbeat:Wait()
        end
    
        markAsCollected(nearestBubble)
        return true
    end
    
    function farmFuzzy(customCallback) --Sakata Jump Delete if you see this
        local nearestFuzz = NearestTable.getNearestFuzz(function(fuzz)
            if customCallback and not customCallback(fuzz) then 
                return false
            end    
            if not fuzz:FindFirstChild("Collected") then return true end
        end)
        if not nearestFuzz then return false end
    
        local startedCollecting = tick()
        local moveToCalled = -1
    
        while true do
            if api.magnitude(nearestFuzz.Position) < 8.5 or
                not nearestFuzz.Parent or
                (tick() - startedCollecting) >= 8 then
                break
            end
    
            if tick() - moveToCalled > 0.5 then
                api.humanoid():MoveTo(nearestFuzz.Position)
                moveToCalled = tick()
            end
    
            RunService.Heartbeat:Wait()
        end
    
        markAsCollected(nearestFuzz)
        return true
    end
    
    function farmCoco() --will be added after priority system
    
    end
    
    function farmFire()  --will be added after priority system
    
    end
    
    function farmCloud()  --will be added after priority system
    
    end
    
    -- Sort items and tokens to make it easier to use
    local Items = EggTypes.GetTypes()
    
    local FormattedItems = {FullData = {}, NamesOnly = {}}
    
    EggItems = {}
    
    task.spawn(function()
        for i,v in pairs(Items) do
            if not v.Hidden then
                if v.DisplayName then
                    local succ = pcall(function() HttpService:JSONEncode(v) end)
                    if not succ then continue end
                    v["SystemName"] = i
                    FormattedItems["FullData"][v.DisplayName] = v
                    table.insert(FormattedItems["NamesOnly"], v.DisplayName)
                    table.insert(EggItems, v.DisplayName)
                end
            end
        end
        for i,v in pairs(ReplicatedStorage.Collectibles:GetChildren()) do
            if v:IsA("ModuleScript") then
                if v:FindFirstChild("Icon") then
                    FormattedItems["FullData"][v.Name] = {Icon = tostring(v.Icon.Texture)}
                    table.insert(FormattedItems["NamesOnly"], v.Name)
                    if v:FindFirstChild("IconPlus") then
                        FormattedItems["FullData"][v.Name.."Plus"] = {DisplayName = v.Name, Icon = tostring(v.IconPlus.Texture)}
                        table.insert(FormattedItems["NamesOnly"], v.Name.."Plus")
                    end
                end
            end
        end
        for i,v in pairs(ReplicatedStorage.Buffs:GetChildren()) do
            if v.Name:find("Icon") then
                local tokenName = v.Name:gsub(" Icon", "")
                FormattedItems["FullData"][tokenName] = {DisplayName = tokenName, Icon = tostring(v.Texture)}
                table.insert(FormattedItems["NamesOnly"], tokenName)
            end
        end
    end)
    
    function getItemByName(name)
        if not table.find(FormattedItems["NamesOnly"],tostring(name)) then return nil, tostring(name).." not found in the NamesOnly list" end
        for i,v in pairs(FormattedItems["FullData"]) do
            if v.DisplayName == name then
                return v
            end
        end
        return nil, "Not found full data of "..name
    end
    
    function gotoNearestBalloon(waitForMoveFinish)
        local semiFarmed = false
        local balloon = getNearestBalloon(function(balloon) 
            if balloon and balloon.Parent and balloon:FindFirstChild("BalloonBody") and isFieldSame((temptable.fieldSelected and temptable.fieldSelected.Position or api.humanoidrootpart().Position), balloon.BalloonBody.Position - Vector3.new(0,15,0)) then return true end
        end)
        if balloon and balloon:FindFirstChild("BalloonBody") and api.magnitude(balloon.BalloonBody.Position) > 10 then
            api.humanoid():MoveTo(balloon.BalloonBody.Position)
            if waitForMoveFinish then
                local startMove = tick()
                repeat task.wait() until api.magnitude(balloon.BalloonBody.Position) < 6 or (tick() - startMove) > 1
                semiFarmed = true
            else
                task.wait()
            end
        end
        return semiFarmed
    end
    
    local puffsRarityList = {
        Common = 1,
        Rare = 2,
        Epic = 3,
        Legendary = 4,
        Mythic = 5
    }
    
    function checkPuffshrooms()
        local puffFound = false
        if #Workspace.Happenings.Puffshrooms:GetChildren() > 0 then
            puffFound = true
        else
            for i,v in pairs(Workspace.Particles:GetChildren()) do
                if v.Name == "SporeCloud" then
                    puffFound = true
                    break
                end
            end
        end
        temptable.puffsDetected = puffFound
        return puffFound
    end
    
    function checkPopStar()
        if not Workspace.Particles:FindFirstChild("PopStars") then return false end
        local popStarFound = false
        for i,v in pairs(Workspace.Particles.PopStars:GetChildren()) do
            if (player.Character.HumanoidRootPart.Position - v.Position).magnitude < 13
                and getBuffTime("Pop Star Aura") > 0 then
                popStarFound = true
                break 
            end
        end
        temptable.popStarActive = popStarFound
        return popStarFound
    end
    
    -- function checkLeafsAndSparkles()
    --     local leafTable = {}
    --     for _, flower in ipairs(Flowers:GetChildren()) do
    --         if flower:FindFirstChild("LeafBurst") then
    --             table.insert(leafTable, flower)
    --         elseif flower:FindFirstChild("Sparkles")then
    --             table.insert(sparklesTable, flower)
    --         end
    --     end
    --     temptable.leafTable = leafTable
    --     return leafTable
    -- end
    
    function getBestFieldBalloon()
        if not api.humanoidrootpart() then return warn(1) end
        local humanoidRootPart = api.humanoidrootpart()
    
        local bestFieldBalloon = {instance = nil, mostBalloonsInRow = -1}
    
        for _,balloon in pairs(temptable.balloonsTable) do
            if not balloon:FindFirstChild("BalloonBody") then continue end
            local playerPos = humanoidRootPart.Position + Vector3.new(0,16,0)
            local balloonPos = balloon.BalloonBody.Position
    
            if not isFieldSame(playerPos - Vector3.new(0,16,0), balloonPos - Vector3.new(0,16,0)) then continue end
    
            local __, res = pcall(function()  
                if balloon.BalloonBody.GuiAttach.Gui.Bar.BackgroundTransparency ~= 1 then return true end
            end)
            if res ~= true then warn(isOK, res) continue end
    
            local ray = Ray.new(playerPos, (Vector3.new(balloonPos.X, playerPos.Y, balloonPos.Z) - playerPos))
    
            local intersection = getPartsFromRay(ray, temptable.FieldBalloons)
    
            if intersection and #intersection >= bestFieldBalloon.mostBalloonsInRow then
                bestFieldBalloon.mostBalloonsInRow = #intersection
                bestFieldBalloon.instance = balloon
            end
        end
    
        return bestFieldBalloon.instance
    end
    
    function getPuffsOnField(field)
        local puffsOnField = {}
        for i,v in pairs(Workspace.Happenings.Puffshrooms:GetChildren()) do
            if findField(v.PrimaryPart.Position) == field then
                table.insert(puffsOnField, v)
            end
        end
        return puffsOnField
    end
    
    function getBestPuffshroom()
        local puffs = Workspace.Happenings.Puffshrooms:GetChildren()
        if #puffs == 0 then return nil end
        local bestPuffs = {}
    
        local maxRarity = vitaly.autoPuffshroomSettings.rarityPriority == "Mythic > Common" and 0 or 6
    
        for i, puff in ipairs(puffs) do
            local puffName
            pcall(function()
                puffName = puff["Puffball Top"].Attachment.Gui.NameRow.TextLabel.Text
            end)
            if not puffName then warn("No puff name") return {} end
            local puffRarity = string.match(puffName, "(%a*)%s+Puffshroom") or "Common"
            local puffLevel = tonumber(string.match(puffName, "Lvl (%d+)"))
            if not tonumber(puffLevel)
                or not puffLevel 
                or tonumber(puffLevel) < vitaly.autoPuffshroomSettings.minimumLevel
                or tonumber(puffLevel) > vitaly.autoPuffshroomSettings.maximumLevel 
                or not puff:FindFirstChild("Puffball Stem")
                or not findField(puff["Puffball Stem"].Position)
            then continue end
            local rarityValue = puffsRarityList[puffRarity] or 1
    
            if (vitaly.autoPuffshroomSettings.rarityPriority == "Mythic > Common" and rarityValue > maxRarity) or
                (vitaly.autoPuffshroomSettings.rarityPriority == "Common > Mythic" and rarityValue < maxRarity) then
                maxRarity = rarityValue
                bestPuffs = { puff }
            elseif rarityValue == maxRarity then
                table.insert(bestPuffs, puff)
            end
        end
    
        table.sort(bestPuffs, function(a, b)
            local aName = a["Puffball Top"].Attachment.Gui.NameRow.TextLabel.Text
            local aRarity, aLevel = string.match(aName, "(%a*)%s+Puffshroom") or "Common", tonumber(string.match(aName, "Lvl (%d+)"))
    
            local bName = b["Puffball Top"].Attachment.Gui.NameRow.TextLabel.Text
            local bRarity, bLevel = string.match(bName, "(%a*)%s+Puffshroom") or "Common", tonumber(string.match(bName, "Lvl (%d+)"))
            -- local aRarity, aLevel = a.Name:match("(%a*)%s+Puffshroom%s+%(%a*%s*(%d+)%)")
            -- local bRarity, bLevel = b.Name:match("(%a*)%s+Puffshroom%s+%(%a*%s*(%d+)%)")
            aLevel, bLevel = tonumber(aLevel), tonumber(bLevel)
            local aRarityValue, bRarityValue = puffsRarityList[aRarity] or 1, puffsRarityList[bRarity] or 1
            if aRarityValue == bRarityValue then
                if vitaly.autoPuffshroomSettings.levelPriority == "High > Low" then
                    return aLevel > bLevel
                else
                    return aLevel < bLevel
                end
            else
                if vitaly.autoPuffshroomSettings.rarityPriority == "Mythic > Common" then
                    return aRarityValue > bRarityValue
                else
                    return aRarityValue < bRarityValue
                end
            end
        end)
    
        local bestPuff = bestPuffs[1]
        -- print(bestPuff["Puffball Top"].Attachment.Gui.NameRow.TextLabel.Text)
        if bestPuff then
            local puffName = bestPuff["Puffball Top"].Attachment.Gui.NameRow.TextLabel.Text
            local puffRarity = string.match(puffName, "(%a*)%s+Puffshroom") or "Common"
            local puffLevel = tonumber(string.match(puffName, "Lvl (%d+)"))
            return { Rarity = puffRarity, Level = tonumber(puffLevel), Model = bestPuff }
        end
    
        return nil
    end
    
    function farmPuffshroom(puffToFarm)
        local farmed = false
        local stem = puffToFarm.PrimaryPart
        if stem and puffToFarm.Parent == Workspace.Happenings.Puffshrooms then
            local stemPos = stem.Position
            if not isFieldSame(api.humanoidrootpart().Position, stemPos) then
                moveTo(stemPos)
            end
            placeSprinkler(stemPos, true, true)
            while task.wait() and puffToFarm.Parent == Workspace.Happenings.Puffshrooms and vitaly.autoPuffshroomSettings.farmPuffshrooms and vitaly.toggles.autofarm do
                if getBagPercentage() >= 99 then return false, "Bag is full" end
                if not isFieldSame(api.humanoidrootpart().Position, stemPos) then
                    moveTo(stemPos)
                elseif api.magnitude(stemPos) >= 20 then
                    task.wait()
                    local temp1 = nil
                    task.spawn(function() temp1 = walkTo(stemPos, 0.5) end)
                    repeat task.wait() until temp1 ~= nil
                elseif api.magnitude(stemPos) < 20 then
                    collectNearestTokens(stemPos, 30)
                    task.wait()
                else
                    moveTo(stemPos)
                end
                farmed = true
            end
            if farmed and puffToFarm.Parent ~= Workspace.Happenings.Puffshrooms and vitaly.toggles.autofarm and vitaly.autoPuffshroomSettings.farmPuffshrooms then
                task.wait(0.5)
                for i=1,2 do
                    collectNearestTokens()
                    task.wait()
                end
                return true
            end
        end
        return false
    end
    
    function farmPuffshrooms()
        local firstPuff = getBestPuffshroom()
        if not firstPuff or not firstPuff.Model then return end
        local puffsOnField = {}
    
        local puffSelected = firstPuff.Model
        local fieldSelected = findField(firstPuff.Model.PrimaryPart.Position)
    
        while puffSelected and puffSelected.Parent do
            task.wait()
            local done, msg = farmPuffshroom(puffSelected)
            if msg == "Bag is full" then return false end
            task.wait()
            if vitaly.autoPuffshroomSettings.farmRemaining then
                puffsOnField = getPuffsOnField(fieldSelected)
                if #puffsOnField > 0 then
                    for i,v in pairs(puffsOnField) do
                        if v.Parent then
                            puffSelected = v
                            break
                        end
                    end
                end
                task.wait()
            end
        end
    end
    
    function avoidWarningDisks()
        local playerPos = api.humanoidrootpart().Position
        local warningDisks = getWarningDisks()
    
        local ray = Ray.new(playerPos + Vector3.new(0, 100, 0), Vector3.new(1, -735, 1))
        local touchedWarningDisk = Workspace:FindPartOnRayWithWhitelist(ray, warningDisks)
    
        if touchedWarningDisk then
            local diskRadius = touchedWarningDisk.Size.X / 2
            local dirToPlayer = (playerPos - touchedWarningDisk.Position).Unit
    
            -- Calculate the safe position to move to
            local diskCenter = touchedWarningDisk.Position
            local playerToCenter = (playerPos - diskCenter).Magnitude
            local playerToDisk = playerToCenter - diskRadius
            local safePos = diskCenter + dirToPlayer * (diskRadius + 4 + playerToDisk + 5)
            if (safePos - api.humanoidrootpart().Position).magnitude < 0.5 then safePos = api.humanoidrootpart().Position + Vector3.new(1,0,0) end
            api.humanoid():MoveTo(safePos + Vector3.new(1,0,1))
            task.wait()
            return true
        end
        task.wait()
        return false
    end
    
    function shouldIConvert(converting, check1)
        check1 = check1 or true
        local timeSinceLastFullBag = tick() - temptable.lastFullBag -- Calculate the time elapsed since the last conversion
    
        if timeSinceLastFullBag < vitaly.convertSettings.secondsBeforeConvert then -- Check if the user wants to wait before converting, and if enough time has elapsed
            return false
        elseif converting and getBagPercentage() > 0 or getBagPercentage() >= vitaly.convertSettings.convertat then -- Check if the bag is full or if the user wants to convert manually
            if vitaly.convertSettings.instantToggle and check1 then
                instaConvFunc()
                task.wait(1.5)
                return shouldIConvert()
            end
            return true
        else
            if temptable.puffsDetected and vitaly.autoPuffshroomSettings.farmPuffshrooms then return false end
    
            if vitaly.toggles.converthiveballoon and gethiveballoon() then
                if vitaly.convertSettings.convertballoonat == 0 and converting then
                    return true
                elseif vitaly.convertSettings.convertballoonat ~= 0 and (tonumber(getBuffTime("Balloon Blessing"))/60) <= vitaly.convertSettings.convertballoonat then
                    return true
                else
                    return false
                end
            else
                return false
            end
        end
    end
    
    function getBagPercentage()
        local pollencount = player.CoreStats:FindFirstChild("Pollen") and player.CoreStats.Pollen.Value or 0
        local maxpollen = player.CoreStats:FindFirstChild("Capacity") and player.CoreStats.Capacity.Value or 0
        -- print(pollencount, maxpollen)
    
        local percentage = (pollencount / maxpollen * 100) or 0
    
        if temptable.lastFullBag == 0 and percentage >= vitaly.convertSettings.convertat then
            temptable.lastFullBag = tick()
        elseif not (percentage >= vitaly.convertSettings.convertat) then
            temptable.lastFullBag = 0
        end
    
        return percentage
    end
    
    function canToyBeUsed(toyName)
        local toy = Workspace.Toys[toyName]
        if toy then
            local _, buttonColor = secureCall(ActivatablesToys.ButtonText, Activatables, nil, toy)
            if not buttonColor then
                return true
            elseif buttonColor == "Red" then
                return false    
            end
        end
    end
    
    function useToy(toyName, collectTokens)
        if not canToyBeUsed(toyName) then return end
        local used = false
        local patformPosition = Workspace.Toys[toyName].Platform.Position + Vector3.new(0,3,0)
        task.wait()
        while 
            not temptable.convertingHoney
            and canToyBeUsed(toyName) 
        do
            if api.magnitude(patformPosition) > 20 then
                moveTo(patformPosition)
                task.wait(0.25)
            end
            if api.magnitude(patformPosition) < 20 then
                secureCall(ActivatablesToys.ButtonEffect, Activatables, player, workspace.Toys[toyName])
                -- setIdentity(2)
                -- ActivatablesToys.ButtonEffect(player, workspace.Toys[toyName])
                -- setIdentity(7)
            end
            task.wait(2)
        end
        if collectTokens then 
            task.wait(1.5)
            local tokensNear = {}
            for _, token in pairs(temptable.tokenpath:GetChildren()) do
                if api.magnitude(token.Position, patformPos) < 25
                    and token.CFrame.YVector.Y == 1
                    and getTokenId(token) ~= 65867881 then
                    table.insert(tokensNear, token)
                end
            end
            while #tokensNear > 0 do
                for _, token in pairs(tokensNear) do
                    if api.magnitude(patformPosition) > 25 then
                        moveTo(patformPosition)
                    end
                    if not token.Parent then table.remove(tokensNear, _) continue end
                    collectToken(token)
                end
                task.wait()
            end 
        end
    end
    
    local InstantConverterNames = {"Instant Converter","Instant Converter B","Instant Converter C"}
    
    local instantConvList = {"All", "Ticket/Instant Converter", "Micro-Converter"}
    
    function instaConvFunc()
        local isConverted = false
        for i,v in pairs(vitaly.convertSettings.selectedInstant) do
            --sakata jump
            if v:find("Ticket") and getClientStatCache("Eggs", "Ticket") ~= 0 and (tick() - temptable.IConverterUsedAt) > 15  then
                for _,c in pairs(InstantConverterNames) do
                    if canToyBeUsed(c) then
                        useToy(c)
                        task.wait(1)
                        temptable.IConverterUsedAt = tick()
                        if not canToyBeUsed(c) then isConverted = true break end
                    end
                end
                --  elseif v:find("Coconuts") and getClientStatCache("Eggs", "Coconut") ~= 0 then
                --     Events.ClientCall("PlayerActivesCommand", {Name = "Coconut"})
                --     isConverted = true 
                --     break
            elseif v:find("Micro") and getClientStatCache("Eggs", "Micro-Converter") ~= 0 and (tick() - temptable.MConverterUsedAt) > 15 then
                Events.ClientCall("PlayerActivesCommand", {Name = "Micro-Converter"})
                temptable.MConverterUsedAt = tick()
                isConverted = true 
                break
            elseif v == "All" then
                for _,c in pairs(InstantConverterNames) do
                    if getClientStatCache("Eggs", "Ticket") == 0 then continue end
                    if canToyBeUsed(c) then
                        useToy(c)
                        task.wait(1)
                        if not canToyBeUsed(c) then isConverted = true break end
                    end
                end
                -- if getClientStatCache("Eggs", "Coconut") ~= 0 then
                --     Events.ClientCall("PlayerActivesCommand", {Name = "Coconut"})
                --     isConverted = true 
                --     break
                -- end
                if getClientStatCache("Eggs", "Micro-Converter") ~= 0 then
                    Events.ClientCall("PlayerActivesCommand", {Name = "Micro-Converter"})
                    isConverted = true 
                    break
                end
            end
        end
        return isConverted
    end
    
    function convertHoney(defaultMask)
        -- print("Convert Honey Called")
        local hivePos = (player.SpawnPos.Value * CFrame.fromEulerAnglesXYZ(0, 110, 0) + Vector3.new(0, 0, 9)).p
        while shouldIConvert(true) and vitaly.toggles.convertHoney do
            if vitaly.toggles.AutoHoneyM then requestAccessoryEquip("Honey Mask") end
            temptable.convertingHoney = true
            if api.magnitude(player.SpawnPos.Value.p) > 10 then
                moveTo(hivePos)
            end
            setIdentity(2)
            local hiveInfo = ActivatablesHives.ButtonText(player)
            setIdentity(origThreadIdentity)
            -- print(hiveInfo)
            if hiveInfo == "Make Honey" then
                secureCall(ActivatablesHives.ButtonEffect, Activatables, player, plrHive.Platform.Value)
                -- setIdentity(2)
                -- ActivatablesHives.ButtonEffect(player, plrHive.Platform.Value)
                -- setIdentity(7)
                task.wait(3)
            elseif hiveInfo == "To Make Honey, Collect Pollen From Flower Fields." then
                break
            end
            task.wait(1)
        end
        task.wait(5)
        temptable.convertingHoney = false
        if defaultMask == nil or defaultMask == true then
            if vitaly.toggles.AutoHoneyM then requestAccessoryEquip(vitaly.vars.defaultmask) end
        end
        temptable.lastConvertAtHive = tick()
    end
    
    function useMemoryMatch(memoryMatch, isQuest)
        if canToyBeUsed(memoryMatch) and not temptable.convertingHoney then disableall() else return "first" end
        local patformPos = Workspace.Toys[memoryMatch].Platform.Position
        local used = false
        while canToyBeUsed(memoryMatch) 
            and (not isQuest and vitaly.toggles.automemorymatch or isQuest and vitaly.autoQuestSettings.useMemoryMatch)
            and not temptable.activeMemoryMatch
        do
            moveTo(patformPos)
            task.wait(0.5)
            if (patformPos - api.humanoidrootpart().Position).Magnitude < 15 then
                secureCall(ActivatablesToys.ButtonEffect, Activatables, player, workspace.Toys[memoryMatch])
                used = true
            end
            task.wait(1)
        end
        if not used then return end
        warn("MM step 1")
        repeat task.wait() until temptable.activeMemoryMatch
        warn("MM step 2")
        repeat task.wait() until not temptable.activeMemoryMatch
        warn("MM step 3: Done.")
        enableall()
    end
    function getAllNectar(bool)
        if bool then
            local tablereturn = {}
            for i, v in pairs(nectarsDropdownTable) do
                table.insert(tablereturn, {name = v, time = getBuffTime(v, true)})
            end
            return tablereturn
        end
    end
    
    function useGlueDispenser()
        local gumdropsCount = getClientStatCache("Eggs", "Gumdrops")
        local used = false
        while canToyBeUsed("Glue Dispenser") and gumdropsCount and gumdropsCount > 0 do
            moveTo(Vector3.new(4, 87, 487))
            task.wait(0.5)
            if api.magnitude(Vector3.new(4, 87, 487)) > 0.75 then continue end
            gumdropsCount = getClientStatCache("Eggs", "Gumdrops")
            task.wait()
            PlayerActivesCommand:FireServer({["Name"] = "Gumdrops"})
            task.wait(0.5)
            while getClientStatCache("Eggs", "Gumdrops") == gumdropsCount do task.wait() end
            if api.magnitude(Vector3.new(272, 25260, -744)) > 30 then continue end
            api.humanoid():MoveTo(Vector3.new(270.8, 25257, -722.5))
            api.humanoid().MoveToFinished:Wait(2)
            task.wait(0.5)
            useToy("Glue Dispenser")
            used = true
        end
        if used then 
            player.Character:BreakJoints()
            player.CharacterAdded:Wait(10)
            task.wait(5)
        end
    end
    
    function getToys()
        for toysTableName, toysTable in pairs(AllToysTable) do
            for configToyName, toyName in pairs(toysTable) do 
                if toysTableName == "toysTable" and vitaly.toggles[configToyName]
                    or toysTableName == "boostersTable" and vitaly.autoboostersettings[configToyName] and vitaly.toggles.autoboosters
                    or toysTableName == "dispensersTable" and vitaly.autodispensersettings[configToyName] and vitaly.toggles.autodispensers
                then
                    if toyName ~= "Glue Dispenser" then
                        useToy(toyName)
                    else
                        useGlueDispenser()
                    end
                elseif toysTableName == "beesmasToysTable" and vitaly.toggles[configToyName] and scriptType == LPH_STRENC("Paid") then
                    useToy(toyName, true)
                elseif toysTableName == "memoryMatchTable" and vitaly.toggles.automemorymatch then
                    useMemoryMatch(toyName)
                end
            end
        end
    end
    
    function lockMovement(bool)
        if bool then
            setIdentity(origThreadIdentity)
            player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
        else
            setIdentity(origThreadIdentity)
            player.DevComputerMovementMode = Enum.DevComputerMovementMode.UserChoice
        end
    end
    
    function getCrosshairs()
        local crosshairs = {all = {}, purple = {}}
        for i,v in pairs(Workspace.Particles:GetChildren()) do
            if v.Name == "Crosshair" and findField(v.Position) == findField(api.humanoidrootpart().Position) then
                if not v:FindFirstChild("Collected") then
                    if v.BrickColor == BrickColor.new("Red flip/flop") then
                        table.insert(crosshairs.all, v)
                    elseif v.BrickColor == BrickColor.new("Alder") then
                        table.insert(crosshairs.all, v)
                        table.insert(crosshairs.purple, v)
                    end
                end
            end
        end
        return {all = crosshairs.all, purple = crosshairs.purple}
    end
    
    function updateCrosshairs(shouldLock,exception) 
        for i,v in pairs(getCrosshairs().all) do
            if shouldLock and v ~= exception and v.BrickColor == BrickColor.new("Red flip/flop") then
                v.CanCollide = true
            elseif not shouldLock then
                v.CanCollide = false
            end
        end
    end
    
    function farmCrosshair(crosshair, save_height)
        local Path = PathfindingService:CreatePath({
            AgentRadius = 5,
            WaypointSpacing = 6,
            Costs = {
                Crosshair = math.huge
            }
        })
        updateCrosshairs(true, crosshair)
        Path:ComputeAsync(api.humanoidrootpart().Position, crosshair.Position)
        if Path then
            local points = Path:GetWaypoints()
            lockMovement(true)
            for _,v in pairs(points) do
                if (crosshair.Position - api.humanoidrootpart().Position).magnitude < 4 then break end
                if not crosshair.Parent or save_height ~= crosshair.Position.y then return lockMovement(false) end
                local moveComplete = false
                local startTime = tick()
                api.humanoid():MoveTo(v.Position)
                local signal
                signal = api.humanoid().MoveToFinished:Connect(function() moveComplete = true signal:Disconnect() end)
                repeat task.wait() until moveComplete or (tick() - startTime) > 0.85 or not crosshair.Parent or save_height ~= crosshair.Position.y or api.magnitude(crosshair.Position) < 5
            end
            lockMovement(false)
        end
        markAsCollected(crosshair)
        repeat task.wait() api.humanoid():MoveTo(crosshair.Position) until not crosshair.Parent or save_height ~= crosshair.Position.y
        updateCrosshairs(false)
    end
    
    function smartFarmCrosshairs()
        local buffStack = tonumber(getBuffStack("Precision"))
        local buffTime = tonumber(getBuffTime("Precision"))
        local isFarmed = false
    
        if (buffStack < 10 or buffTime <= 30) then
            for _,crosshair in pairs(getCrosshairs().all) do
                if not crosshair.Parent then continue end
                local MoveToFinished, started = false, tick()
                local save_height = crosshair.Position.y
                if crosshair.BrickColor == BrickColor.new("Forest green") or crosshair.BrickColor == BrickColor.new("Royal purple") then continue end
                lockMovement(true)
                api.humanoid():MoveTo(crosshair.Position)
                local signal
                signal = api.humanoid().MoveToFinished:Connect(function() MoveToFinished = true signal:Disconnect() end)
                repeat task.wait() until MoveToFinished or save_height ~= crosshair.Position.y or (tick() - started) > 5 or api.magnitude(crosshair.Position) < 4 or not crosshair.Parent
                lockMovement(false)
                markAsCollected(crosshair)
                isFarmed = true
            end
        elseif (buffStack == 10 and buffTime > 30) then
            for _,crosshair in pairs(getCrosshairs().purple) do
                if not crosshair.Parent then continue end
                local save_height = crosshair.Position.y
                if vitaly.autoFarmSettings.smartPreciseMethod == "Walk" then
                    isFarmed = true
                    farmCrosshair(crosshair, save_height)
                else
                    repeat task.wait() 
                        if api.magnitude(crosshair.Position) > 5 then
                            startTween(crosshair.Position - Vector3.new(0,1.8,0), 350)
                        end
                    until not crosshair.Parent or save_height ~= crosshair.Position.y or (#getCrosshairs().purple > 1)
                    markAsCollected(crosshair)
                    isFarmed = true
                end
                break
            end
        end
        return isFarmed
    end
    
    function getSpawnerTime(spawner, extraSeconds)
        local spawnerInfo = monstersTable[spawner.Name]
        if not spawnerInfo then return math.huge end
    
        local lastKillTime = getClientStatCache("MonsterTimes", spawner.Name) or 0
        local spawnerCooldown = ClientMonsterTools.GetSpawnerCooldown(spawner.Name)
        local currentTime = ServerTime()
    
        if not spawnerCooldown then return math.huge end
    
    
        local timeLeft = (lastKillTime + spawnerCooldown - currentTime) + (tonumber(extraSeconds) or 0)
        if timeLeft < 0 then
            timeLeft = 0
        end
    
        return timeLeft
    end
    
    function getSpawnerCooldownText(spawnerName)
        local spawner = ClientMonsterTools.GetSpawner(spawnerName)
        if not spawner then return "???", -1 end
    
        local timeLeft = math.round(getSpawnerTime(spawner))
        if timeLeft == math.huge then 
            return "???", -1 
        end
    
        local cooldownText
        if timeLeft == 0 then
            cooldownText = "✅"
        else
            cooldownText = truncatetime(timeLeft)
        end
    
        return cooldownText, timeLeft
    end
    
    function getAliveMonsters(monsterName)
        local aliveMonsters = {}
        for i,v in pairs(Workspace.Monsters:GetChildren()) do
            if v.Name:find(monsterName) and v.Target.Value == player.Character then
                table.insert(aliveMonsters, v)
            end
        end
        return aliveMonsters
    end
    
    function getSpawnedMonsters(mob)
        local respawnedMonsters = {}
        for spawnerName,spawnerConfig in pairs(monstersTable) do
            if spawnerConfig.MonsterType == mob then
                local timeLeft = getSpawnerTime(spawnerConfig.Spawner, 30)
                if timeLeft == 0 then
                    table.insert(respawnedMonsters, spawnerConfig)
                end
            end
        end
        return respawnedMonsters
    end
    
    function isMonsterKilled(mobSpawner)
        local spawner = ClientMonsterTools.GetSpawner(mobSpawner)
        if not mobSpawner or not spawner then --[[warn(1)]] return true end
    
        local timeLeft = getSpawnerTime(spawner)
        if timeLeft > 0 then
            return true
        else 
            return false
        end
    end
    
    function killMonster(territory, spawner)
        local startTimeStamp = tick()
        temptable.doingMonster = true
        while not isMonsterKilled(spawner.Name) do
            if (tick() - startTimeStamp) > 60 then break end
            if api.magnitude(territory.Position) > 60 then
                moveTo(territory.Position)
                task.wait(0.25)
            end
            if spawner.Name:find("ForestMantis") then 
                if api.magnitude(territory.Position + Vector3.new(0,0,15)) < 6 then
                    api.humanoid():MoveTo(territory.Position - Vector3.new(0,0,15))
                else
                    api.humanoid():MoveTo(territory.Position + Vector3.new(0,0,15))
                end
            end
            task.wait(0.5)
            jump()
            task.wait(1)
        end
        temptable.doingMonster = false
        return isMonsterKilled(spawner)
    end
    
    function killVicious()
        if vitaly.combatSettings.killVicious and temptable.detected.vicious then
            local viciousModel
            for i, v in pairs(Workspace.Particles:GetChildren()) do
                if v.Name:find("Vicious") then
                    for i2, v2 in pairs(Workspace.Monsters:GetChildren()) do 
                        if v2.Name:find("Vicious") and v2:FindFirstChild("HumanoidRootPart") then
                            local level = tonumber(string.gmatch(v2.Name, "%d+")())
                            if level and level >= vitaly.combatSettings.viciousMinLevel and level <= vitaly.combatSettings.viciousMaxLevel then
                                viciousModel = v2
                                moveTo(v.Position)
                                task.wait(0.5)
                            end
                        end
                    end
                end
            end
            if viciousModel then
                local viciousOnField = findField(viciousModel.HumanoidRootPart.Position)
                -- warn(viciousOnField)
                local level = tonumber(string.gmatch(viciousModel.Name, "%d+")())
                while viciousModel and viciousOnField and viciousModel.Parent and vitaly.combatSettings.killVicious and temptable.detected.vicious and level and level >= vitaly.combatSettings.viciousMinLevel and level <= vitaly.combatSettings.viciousMaxLevel do
                    if not viciousModel.Parent then viciousModel = nil break end
                    if viciousOnField then
                        -- warn(findField(api.humanoidrootpart().Position))
                        if findField(api.humanoidrootpart().Position) ~= viciousOnField then
                            moveTo(viciousOnField.Position)
                        end
                        if api.magnitude(viciousModel.HumanoidRootPart.Position) > 50 then
                            api.humanoid():MoveTo(viciousModel.HumanoidRootPart.Position)
                            task.wait(0.75)
                        end
                        collectNearestTokens(nil, 70)
                        avoidWarningDisks()
                    end
                    task.wait()
                end
            end
        end
    end
    
    function getQuestInfo(questName)
        setIdentity(2)
        local toReturn = Quests.Get(nil, questName)
        setIdentity(origThreadIdentity)
        return toReturn
    end
    
    function getQuestProgress(questName)
        setIdentity(2)
        local toReturn = Quests.Progress(nil, questName, getClientStatCache())
        setIdentity(origThreadIdentity)
        return toReturn
    end
    
    function getQuestSetting(npc, Type)
        return(npc == "Black Bear" and (Type == "prio" and vitaly.autoQuestSettings.BlackBearPriority or Type == "toggle" and vitaly.autoQuestSettings.BlackBearQuests))
            or (npc == "Brown Bear" and (Type == "prio" and vitaly.autoQuestSettings.BrownBearPriority or Type == "toggle" and vitaly.autoQuestSettings.BrownBearQuests))
            or (npc == "Panda Bear" and (Type == "prio" and vitaly.autoQuestSettings.PandaBearPriority or Type == "toggle" and vitaly.autoQuestSettings.PandaBearQuests))
            or (npc == "Science Bear" and (Type == "prio" and vitaly.autoQuestSettings.ScienceBearPriority or Type == "toggle" and vitaly.autoQuestSettings.ScienceBearQuests))
            or (npc == "Polar Bear" and (Type == "prio" and vitaly.autoQuestSettings.PolarBearPriority or Type == "toggle" and vitaly.autoQuestSettings.PolarBearQuests))
            or (npc == "Spirit Bear" and (Type == "prio" and vitaly.autoQuestSettings.SpiritBearPriority or Type == "toggle" and vitaly.autoQuestSettings.SpiritsBearQuests))
            or (npc == "Bucko Bee" and (Type == "prio" and vitaly.autoQuestSettings.BuckoBeePriority or Type == "toggle" and vitaly.autoQuestSettings.BuckoBeeQuests))
            or (npc == "Riley Bee" and (Type == "prio" and vitaly.autoQuestSettings.RileyBeePriority or Type == "toggle" and vitaly.autoQuestSettings.RileyBeeQuests))
            or (npc == "Honey Bee" and (Type == "prio" and vitaly.autoQuestSettings.HoneyBeePriority or Type == "toggle" and vitaly.autoQuestSettings.HoneyBeeQuests))
            or (npc == "Onett" and (Type == "prio" and vitaly.autoQuestSettings.OnettQuests or Type == "toggle" and vitaly.autoQuestSettings.OnettQuests))
            or (npc == "Bee Bear 5" and (Type == "prio" and vitaly.autoQuestSettings.BeeBearPriority or Type == "toggle" and vitaly.autoQuestSettings.BeeBearQuests))
            or (Type == "prio" and 100 or Type == "toggle" and false)
    end
    
    function prioritizeQuests(quests)
        local prioritizedQuests = {}
        local tempQuestsTable = {}
        for i,questData in pairs(quests) do
            local prio = getQuestSetting(questData.npc, "prio") or 101
            table.insert(tempQuestsTable, {prio, i, questData.Name})
        end
        table.sort(tempQuestsTable, function(a, b)
            if a[1] == b[1] then
                return a[2] < b[2]
            else
                return a[1] < b[1]
            end
        end)
        for i,v in pairs(tempQuestsTable) do
            table.insert(prioritizedQuests, v[3])
        end
        return prioritizedQuests
    end
    
    function getActiveQuests(NPC)
        local quests = {}
        for _, v in pairs(getClientStatCache("Quests", "Active")) do
            local quest = getQuestInfo(v.Name)
    
            if quest and not quest.Hidden then
                local npc = quest.NPC
                if (not NPC and getQuestSetting(npc, "toggle")) or (NPC and npc == NPC) then
                    table.insert(quests, {Name = v.Name, npc = npc})
                end
            end
        end
    
        local questNames = prioritizeQuests(quests)
    
        return questNames
    end
    
    function collectNearestTokens(nearqui, magnitude)
        if not nearqui or typeof(nearqui) ~= "Vector3" then
            if (typeof(nearqui) == "Instance" and not nearqui.Position) then
                nearqui = nearqui.Position
            else
                nearqui = api.humanoidrootpart().Position
            end
        end
    
        for i,v in pairs(Workspace.Collectibles:GetChildren()) do
            if not v.Parent or not v.Position or table.find(temptable.susTokenPositions, v.Position) then continue end
            if api.magnitude(nearqui, v.Position) < (magnitude or 30)
                and api.magnitude(nearqui * Vector3.new(0,1,0), v.Position * Vector3.new(0,1,0)) < 10 then
                collectToken(v)
                task.wait()
            end
        end
    end
    
    function farmBubbles()
        local speedModified = false
        local bubblesToCollect = {}
        local bubbleRadius = vitaly.toggles
        for i,v in pairs(Workspace.Particles:GetChildren()) do
            if v.Name:find("Bubble") and findField(v.Position) == temptable.fieldSelected then
                if #bubblesToCollect == 0 then 
                    if not vitaly.toggles.smartBlueAutofarm then
                        table.insert(bubblesToCollect, v)
                    else
                        if temptable.fieldPosition and api.magnitude(temptable.fieldPosition, v.Position) < 30 then
                            table.insert(bubblesToCollect, v)
                        end
                    end
                else
                    -- print(#bubblesToCollect)
                    -- Check for nearest bubbles
                    if api.magnitude(v.Position, bubblesToCollect[#bubblesToCollect].Position) < 15 then
                        table.insert(bubblesToCollect, v)
                        -- print("bubble added,", #bubblesToCollect,"bubbles to collect")
                    end
                end
            end
        end
        if #bubblesToCollect >= 3 then
            if temptable.speedMultiplier == 1 then speedModified = true temptable.speedMultiplier = 1.3 end
            for i,bubble in ipairs(bubblesToCollect) do
                repeat task.wait()
                    api.humanoid():MoveTo(bubble.Position)
                until api.magnitude(api.humanoidrootpart().Position, bubble.Position) <= 14 or not vitaly.toggles.autofarm or not bubble.Parent
            end
        end
        if speedModified then temptable.speedMultiplier = 1 end
    end
    
    function farmShowerAndCoco()
        if #temptable.showersTable > 0 and vitaly.autoFarmSettings.farmShower then
            while #temptable.showersTable > 0 do
                local key, warningisk = next(temptable.showersTable)
                if warningisk and warningisk.Parent and warningisk.Transparency > 0.09 then
                    startTween(warningisk.Position, 350)
                    -- tween(0.05, warningisk.Position, true)
                    repeat task.wait()
                    until not warningisk.Parent or warningisk.Transparency <= 0.08
                    temptable.showersTable[key] = nil
                else
                    temptable.showersTable[key] = nil
                end
                task.wait()
            end
            collectNearestTokens()
        elseif #temptable.coconutsTable > 0 and vitaly.autoFarmSettings.farmCoconuts then
            while #temptable.showersTable <= 0 and #temptable.coconutsTable > 0 do
                local key, warningisk = next(temptable.coconutsTable)
                if warningisk and warningisk.Parent and warningisk.Transparency > 0.09 then
                    startTween(warningisk.Position, 350)
                    -- tween(150, warningisk.Position)
                    repeat task.wait()
                    until not warningisk.Parent or warningisk.Transparency <= 0.08
                    temptable.coconutsTable[key] = nil
                else
                    temptable.coconutsTable[key] = nil
                end
                task.wait()
            end
            collectNearestTokens()
        end
    end
    
    function farmSprout(sprout, field)
        if not sprout or not sprout.Parent or not vitaly.autoFarmSettings.farmSprouts then return end
    
        local farmed = false
    
        while sprout and sprout.Parent and vitaly.autoFarmSettings.farmSprouts and vitaly.toggles.autofarm do
            -- print(findField(api.humanoidrootpart().Position), field)
            if getBagPercentage() >= 99 then
                convertHoney()
            end
            if findField(api.humanoidrootpart().Position) ~= field then
                moveTo(field.Position)
                task.wait()
            end
            collectNearestTokens(field.Position, 60)
            farmed = true
            task.wait()
        end
    
        return vitaly.autoFarmSettings.farmSprouts and vitaly.toggles.autofarm and farmed 
    end
    
    function farmSprouts()
        if next(temptable.sproutsTable) then
            while next(temptable.sproutsTable) and vitaly.autoFarmSettings.farmSprouts and vitaly.toggles.autofarm do
                local key, sprout = next(temptable.sproutsTable)
                if sprout and sprout.Model.Parent then
                    if farmSprout(sprout.Model, sprout.Field) then
                        for i = 1, 30 do
                            collectNearestTokens(sprout.Field.Position, 100)
                            task.wait()
                        end
                    end
                else
                    temptable.sproutsTable[key] = nil
                end
                task.wait()
            end
        end
    end
    
    function selectField(fieldName)
        if fieldName == nil then
            temptable.fieldSelected = nil
            temptable.fieldPosition = nil
            return "Unselected field"
        end
        if temptable.fieldSelected and temptable.fieldSelected.Name == fieldName then return "Field already selected" end
        temptable.fieldSelected = Workspace.FlowerZones[fieldName] or "Dandelion Field"
        temptable.fieldPosition = temptable.fieldSelected.Position
        -- print("Selected field "..fieldName)
    end
    
    -- whitelistedTasks = {
    --     "Collect Pollen", 
    --     "Collect Goo",
    --     "Defeat Monsters",
    --     "Use Items",
    --     "Use Toy",
    --     "Match Pairs",
    --     "Complete Quests"
    -- }
    
    function getQuestTasks(NPC)
        NPC = NPC or false
        local quests = getActiveQuests(NPC)
        local defeatMonstersTasks = {} -- table to hold the "Defeat Monsters" tasks
        local tasksToDo = {}
    
        for _, quest in pairs(quests) do
            local questData = getQuestInfo(quest)
            local questName = questData.Name
            if not vitaly.autoQuestSettings.doRepeatables and questData.Repeatable then continue end
    
            for index, questTask in pairs(getQuestProgress(questName)) do
                local iscompleted = questTask[1]
    
                if iscompleted >= 1 then continue end
    
                local fullTask = questData.Tasks[index]
                fullTask.Progress = questTask
    
                local taskDescription = fullTask.Description
                if typeof(taskDescription) ~= "string" then 
                    setIdentity(2)
                    taskDescription = taskDescription(getClientStatCache()) 
                    setIdentity(origThreadIdentity)
                end
    
                local add = false
    
                if fullTask.Type == "Collect Pollen" and vitaly.autoQuestSettings.farmPollen
                    or fullTask.Type == "Collect Goo" and vitaly.autoQuestSettings.farmGoo
                    or fullTask.Type == "Defeat Monsters" and vitaly.autoQuestSettings.killMobs
                    or fullTask.Type == "Use Toy" and vitaly.autoQuestSettings.useToys
                    or fullTask.Type == "Match Pairs" and macvitalyrov2.autoQuestSettings.useMemoryMatch
                    or fullTask.Type == "Complete Quests" and vitaly.autoQuestSettings.doQuestQuests
                    or fullTask.Type == "Use Items" and taskDescription:find("Feed") and vitaly.autoQuestSettings.feedBees
                then
                    add = true
                end
    
                if not add then continue end
    
                if fullTask.Type == "Defeat Monsters" then
                    table.insert(defeatMonstersTasks, fullTask)
                else
                    table.insert(tasksToDo, fullTask)
                end
            end
        end
    
        if vitaly.autoQuestSettings.prioritizeMobKill then
            for _, task in ipairs(defeatMonstersTasks) do
                table.insert(tasksToDo, 1, task)
            end
        else
            for _, task in ipairs(defeatMonstersTasks) do
                table.insert(tasksToDo, task)
            end
        end
    
        return tasksToDo
    end
    
    function getQuestTaskField(questTask)
        if questTask.Type == "Collect Pollen" or questTask.Type == "Collect Goo" then
            if questTask.Zone then
                return questTask.Zone
            elseif questTask.Color then
                return vitaly.autoQuestSettings["best"..questTask.Color.."Field"]
            end
        end
    end
    
    function claimQuests()
        for i, v in next, Workspace.NPCs:GetChildren() do
            if getQuestSetting(v.Name, "toggle") or 
                (vitaly.autoQuestSettings.acceptAllQuests and v.Name ~= "Honey Bee" and v.Name ~= "Gummy Bear" and v.Name ~= "Bubble Bee Man 2" and v.Name ~= "Ant Challenge Info" and v.Name ~= "Wind Shrine")
                and vitaly.autoQuestSettings.doQuests
            then
                local image = v.Platform.AlertPos.AlertGui.ImageLabel
                if image.ImageTransparency == 0 then
                    if vitaly.toggles.tptonpc then
                        api.humanoidrootpart().CFrame = CFrame.new(v.Platform.Position + Vector3.new(0,3,0))
                    else
                        moveTo(v.Platform.Position)
                        task.wait(0.03)
                    end
    
    
                    local attempts = 0
                    while image.ImageTransparency == 0 and api.magnitude(v.Platform.Position) <= 25 and attempts < 5 do
                        if api.magnitude(v.Platform.Position) <= 25 and not ScreenGui.NPC.Visible then
                            while not ScreenGui.NPC.Visible do
                                if not (api.magnitude(v.Platform.Position) < 25) then break end
                                -- secureCall(ActivatablesNPC.ButtonEffect, Activatables, player, v)
                                setIdentity(2)
                                ActivatablesNPC.ButtonEffect(player, Workspace.NPCs[v.Name])
                                setIdentity(origThreadIdentity)
                                task.wait(1.5)
                            end
                        end
    
                        local tempTimestamp = tick()
    
                        repeat task.wait() until ScreenGui.NPC.Visible or tick() - tempTimestamp > 10
    
                        while ScreenGui.NPC.Visible do
                            if ScreenGui.NPC.OptionFrame.Visible 
                                and ScreenGui.NPC.OptionFrame.Option2.Visible 
                                and ScreenGui.NPC.OptionFrame.Option2.Text:find("Talk to") then
                                setIdentity(2)
                                firesignal(ScreenGui.NPC.OptionFrame.Option2.MouseButton1Click)
                                setIdentity(origThreadIdentity)
                            else
                                setIdentity(2)
                                firesignal(ScreenGui.NPC.ButtonOverlay.MouseButton1Click)
                                setIdentity(origThreadIdentity)
                            end
                            task.wait()
                        end
    
                        task.wait(2.5)
                        attempts = attempts + 1
                    end
                    task.wait(0.5)
                end
            end
        end
    end
    
    function doQuests(NPC)
        NPC = NPC or false
        claimQuests()
        local questTasks = getQuestTasks(NPC)
        for taskIndex, questTask in pairs(questTasks) do
            -- print(questTask.Type, questTask.MonsterType, questTask.Amount)
            if questTask then
                local taskDescription = questTask.Description
                if typeof(taskDescription) ~= "string" then 
                    setIdentity(2)
                    -- print(1)
                    taskDescription = taskDescription(getClientStatCache())
                    -- print(2)
                    setIdentity(origThreadIdentity)
                end
    
                if questTask.Type == "Collect Pollen" or questTask.Type == "Collect Goo" then
                    local newField = getQuestTaskField(questTask)
                    if newField and Workspace.FlowerZones:FindFirstChild(newField) then
                        selectField(newField)
                        break
                    end
                elseif questTask.Type == "Defeat Monsters" then
                    local monsterToKill = questTask.MonsterType
                    local numberOfMonsters = questTask.Amount
                    local monsterSpawners = getSpawnedMonsters(monsterToKill)
                    local remainingAmount = numberOfMonsters - questTask.Progress[2]
                    -- print("Alive",monsterToKill,":",#monsterSpawners)
                    if #monsterSpawners > 0 then
                        local monstersKilled = 0
                        for i,v in pairs(monsterSpawners) do
                            if remainingAmount <= 0 then print("brk!") break end
                            if not isMonsterKilled(v.Spawner.Name) then
                                local isKilled = killMonster(v.Territory, v.Spawner)
                                if isKilled then
                                    monstersKilled += 1
                                    task.wait(1)
                                    for i=1,5 do
                                        collectNearestTokens(nil, 20)
                                    end
                                    remainingAmount = remainingAmount - 1
                                end
                            end
                        end
                    end
                elseif questTask.Type == "Use Items" then
                    if false and not string.find(taskDescription, "Feed") and not questTask.Item:find("Jelly") then
                        --UseItem
                        if not temptable.questUseItemCooldown then
                            game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"]=questTask.Item})
                            task.spawn(function()
                                temptable.questUseItemCooldown = true
                                task.wait(100)
                                temptable.questUseItemCooldown = false                        
                            end)
                        end
                    elseif string.find(taskDescription, "Feed") then
                        --Feed
                        if not temptable.questFeedCooldown then
                            Events.ClientCall("ConstructHiveCellFromEgg", math.random(1,5), 1, questTask.Item, questTask.Amount, false) 
                            temptable.questFeedCooldown = true
                            task.wait(5)
                            temptable.questFeedCooldown = false  
                        end
                    end
                elseif questTask.Type == "Use Toy" then
                    if canToyBeUsed(questTask.Toy) and not temptable.questUseToyCooldown then
                        if not questTask.Toy:find("Glue") then
                            useToy(questTask.Toy)
                        else
                            useGlueDispenser()
                        end
                        temptable.questUseToyCooldown = true
                        task.wait(15)
                        temptable.questUseToyCooldown = false 
                        continue
                    end
                elseif questTask.Type == "Match Pairs" then
                    for i,v in pairs(AllToysTable["memoryMatchTable"]) do
                        useMemoryMatch(v, true)
                    end
                elseif questTask.Type == "Complete Quests" then
                    doQuests(questTask.Pool or "Polar Bear")
                end
            end
        end
    end
    
    function handleMonsterKill(monsterName)
        for _,monster in pairs(getSpawnedMonsters(monsterName)) do
            if monster.Spawner and monster.Territory then
                killMonster(monster.Territory, monster.Spawner)
                task.wait(1)
                for i=1,3 do
                    collectNearestTokens(nil, 20)
                end
            end
        end
    end
    
    function tryKillMonsters()
        if vitaly.combatSettings.killSpidor then
            handleMonsterKill("Spider")
        end
        if vitaly.combatSettings.killMantis then
            handleMonsterKill("Mantis")
        end
        if vitaly.combatSettings.killScorpion then
            handleMonsterKill("Scorpion")
        end
        if vitaly.combatSettings.killWerewolf then
            handleMonsterKill("Werewolf")
        end
    end
    
    function trainTunnelBear()
        if vitaly.combatSettings.trainTunnelBear then
            if #getSpawnedMonsters("Tunnel Bear") == 1 then
                tunnelPart.CanCollide = true
                local spawner = getSpawnedMonsters("Tunnel Bear")[1].Spawner
                while vitaly.combatSettings.trainTunnelBear and not isMonsterKilled(spawner.Name) do
                    if api.magnitude(tunnelPart.Position) > 10 then
                        moveTo(tunnelPart.Position)
                        task.wait()
                    end
                    task.wait(0.1)
                end
                tunnelPart.CanCollide = false
                task.wait(1)
                if #getSpawnedMonsters("Tunnel Bear") == 0 then
                    task.wait(0.5)
                    for i=1,10 do
                        if api.magnitude(tunnelPart.Position) > 250 then
                            moveTo(tunnelPart.Position - Vector3.new(0,16,0))
                        end
                        collectNearestTokens(nil, 250)
                    end
                    task.wait(0.5)
                end
            end
        end
    end
    
    function trainCrab()
        if vitaly.combatSettings.trainCrab then
            if #getSpawnedMonsters("Coconut Crab") == 1 then
                local coconutField = Workspace.FlowerZones["Coconut Field"]
                local oldMask = getClientStatCache("EquippedAccessories", "Hat")
                if oldMask ~= "Demon Mask" and oldMask ~= "Gummy Mask" then
                    requestAccessoryEquip("Demon Mask")
                end
                cocoPad.CanCollide = true
                local spawner = getSpawnedMonsters("Coconut Crab")[1].Spawner
                while vitaly.combatSettings.trainCrab and not isMonsterKilled(spawner.Name) do
                    if api.magnitude(Vector3.new(-258, 109, 483)) > 50 then
                        moveTo(Vector3.new(-441, 123, 498))
                        task.wait(6)
                        moveTo(Vector3.new(-258, 109, 483))
                        task.wait()
                    elseif api.magnitude(Vector3.new(-258, 109, 483)) > 15 then
                        api.humanoid():MoveTo(Vector3.new(-258, 109, 483))
                        api.humanoid().MoveToFinished:Wait(2)
                    end
                    if api.magnitude(Vector3.new(-258, 109, 483)) < 20 then
                        collectNearestTokens(Vector3.new(-258, 109, 483), 20)
                    end
                    task.wait()
                end
                cocoPad.CanCollide = false
                if #getSpawnedMonsters("Coconut Crab") == 0 then
                    task.wait(1)
                    for i=1,25 do
                        if findField(player.Character.HumanoidRootPart.Position) ~= coconutField then
                            moveTo(coconutField.Position)
                        end
                        collectNearestTokens(coconutField.Position, 50)
                    end
                    task.wait(0.5)
                end
                if oldMask == "Diamond Mask" then
                    requestAccessoryEquip("Diamond Mask")
                end
            end
        end
    end
    
    function trainStumpSnail()
        if not vitaly.combatSettings.trainStumpSnail then return false end
        if not (#getSpawnedMonsters("Stump Snail") >= 1) then return false end
    
        if vitaly.combatSettings.snailConvertHoney and getBagPercentage() >= 99 then return convertHoney(false) end
    
        if not isFieldSame(api.humanoidrootpart().Position, FlowerZones["Stump Field"].Position) then
            moveTo(FlowerZones["Stump Field"].Position)
            task.wait(2)
            placeSprinkler(nil, true, true)
        end
    
        local importantCallback = function(token) 
            if not (findField(token.Position) == FlowerZones["Stump Field"]) then return false end
            local Snail = getAliveMonsters("Stump Snail")[1]
            if not Snail then 
                return true
            else
                if Snail:FindFirstChild("Head") and api.magnitude(token.Position, (Snail.Head.Position - Vector3.new(0,10,0))) < 21 then return false end
                return true
            end
        end
        local isFarmed = false
        for i=1,5 do
            local farmed = farmToken(importantCallback)
            isFarmed = isFarmed or farmed
        end
        if not isFarmed and (tick() - temptable.lastWalkToNearest > 1.5) then
            local randomFlower = getRandomFlower(FlowerZones["Stump Field"])
            local Snail = getAliveMonsters("Stump Snail")[1]
            if randomFlower and 
                Snail and Snail:FindFirstChild("Head") and 
                api.magnitude(randomFlower.Position, (Snail.Head.Position - Vector3.new(0,10,0))) > 40
            then
                temptable.lastWalkToNearest = tick()
                api.humanoid():MoveTo(randomFlower.Position)
                task.wait(0.1)
            end
        end
        return true
    end
    
    function trainKingBeetle()
        if vitaly.combatSettings.trainKingBeetle then
            if #getSpawnedMonsters("King Beetle") == 1 then
                local spawner = getSpawnedMonsters("King Beetle")[1].Spawner
    
                temptable.customWalkSpeed.enabled = true
                temptable.customWalkSpeed.speed = 18
    
                while vitaly.combatSettings.trainKingBeetle and not isMonsterKilled(spawner.Name) do
                    if api.magnitude(Vector3.new(179, 4, 194)) > 100 then
                        moveTo(Vector3.new(172, 4, 144))
                        task.wait(1)
                        -- moveTo(Vector3.new(108, 4, 227))
                        -- task.wait()
                        api.humanoid():MoveTo(Vector3.new(109, 4, 253))
                    end
                    task.wait()
                end
                temptable.customWalkSpeed.speed = 50
                task.wait(1)
                if #getSpawnedMonsters("King Beetle") == 0 then
                    for i=1,10 do
                        collectNearestTokens(Vector3.new(179, 4, 194), 60)
                    end
                    task.wait(0.5)
                end
                temptable.customWalkSpeed.enabled = false
            end
        end
    end
    
    function isFieldOccupied(field)
        local planters = getMinePlanters()
        for _,planter in pairs(planters) do
            if planter.PotModel and planter.PotModel.Parent and planter.PotModel.PrimaryPart then
                if findField(planter.PotModel.PrimaryPart.Position).Name == field then
                    return true
                end
            end
        end
        return false
    end
    
    function isPlanterPlanted(planterName)
        local planters = getMinePlanters()
        local planterData = getPlanterData(planterName)
        for _,planter in pairs(planters) do
            -- warn(planter.Type, planterData.systemName)
            if planter.Active and not planter.Collected and planter.Type == planterData.systemName then
                return true
            end
        end
        return false
    end
    
    function getBestPlanter(nectar, field, blacklisted)
        local bestPlanter = ""
        local bestZone = ""
        local bestNectarMultiplier = 0
        local bestZoneMultiplier = 0
    
        for planterName, planter in pairs(plantersTable) do
            if not table.find(vitaly.autoPlantersSettings.blacklistedPlanters, planter.systemName) 
                and not isPlanterPlanted(planterName) 
                and (planterName ~= "Plenty" and getClientStatCache("Eggs", planterName.."Planter") or getClientStatCache("Eggs", "The Planter Of Plenty")) then
                local fieldColor = Workspace.FlowerZones[field].ColorGroup.Value
                local nectarMultiplier = planter.nectarMultipliers[nectar] or 1
                local zoneMultiplier = planter.pollenMultipliers.Zones[fieldColor] or 1
                local colorMultiplier = planter.pollenMultipliers.Colors[fieldColor] or 1
                local overallMultiplier = nectarMultiplier * zoneMultiplier * colorMultiplier
    
                if overallMultiplier > bestNectarMultiplier * bestZoneMultiplier then
                    bestPlanter = planterName
                    bestZone = fieldColor
                    bestNectarMultiplier = nectarMultiplier
                    bestZoneMultiplier = zoneMultiplier * colorMultiplier
                end
            end
        end
    
        return bestPlanter, bestZone
    end
    
    function isNectarPending(nectartype)
        local planters = getMinePlanters()
        for i, v in pairs(planters) do
            local location = findField(v.PotModel.PrimaryPart.Position)
            if location then
                local conftype = NectarTypes.PickForField(location.Name)
                if conftype then
                    if conftype.." Nectar" == nectartype then
                        return true
                    end
                end
            end
        end
        return false
    end
    
    function getBestNectarField(nectar)
        nectar = tostring(nectar)
        local nectar = nectar:gsub(" Nectar", "")
        if not nectarsTable[nectar] then return --[[warn(nectar, "not found")]] end
        local bestField = ""
        for index, nectarField in pairs(nectarsTable[nectar]) do
            if not isFieldOccupied(nectarField) and not (nectarField == "Ant Field") then
                bestField = nectarField
            end
        end
        return bestField
    end
    
    function calculateLeastNectar()
        local blacklistedNectars = vitaly.autoPlantersSettings.blacklistedNectars
        local leastNectar
        local leastNectarTime = math.huge
        for i,v in pairs(nectarsDropdownTable) do
            if table.find(blacklistedNectars, v) or isNectarPending(v) then continue end
            -- print(table.find(blacklistedNectars, v), isNectarPending(v))
            local currentNectarTime = getBuffTime(v)
            if currentNectarTime < leastNectarTime then
                leastNectar = v
                leastNectarTime = currentNectarTime
            end
        end
        -- warn(leastNectar)
        return leastNectar
    end
    
    function collectSpecificPlanter(planterPart, id)
        if planterPart and api.humanoid() and api.humanoid().Health > 0 and api.humanoidrootpart() then
            moveTo(planterPart.Position - Vector3.new(0,3,0))
            task.wait(1)
            if api.magnitude(api.humanoidrootpart().Position, planterPart.Position) < 20 then
                setIdentity(2)
                Events.ClientCall("PlanterModelCollect", id)
                -- LocalPlanters.PromptCollect(id)
                setIdentity(origThreadIdentity)
                task.wait(3)
                for i = 1, 5 do
                    collectNearestTokens(nil, 50)
                end
                task.wait()
            end
        end
    end
    
    if _G.debugging then
        warn("Functions init done. Waiting 1 second")
        task.wait(1)
    end
    
    if _G.debugging then
        warn("Other Functions init.")
    end
    
    -- writefile("plantersData.json", jsonEncode(plantersTable))
    
    function isPlanterExists(pNum)
        local exists = false
        local stuffs = getMinePlanters()
        if stuffs ~= {} then
            for i, v in pairs(stuffs) do
                if v["ActorID"] == pNum and v.Active and not v.Collected then
                    exists = true
                end
            end
        end
        return exists
    end
    
    function plantPlanter(planterName, fieldName)
        if not planterName or not fieldName then return end
        local planterData = getPlanterData(planterName)
        -- print(planterName)
        local fieldSelected = Workspace.FlowerZones:FindFirstChild(fieldName)
        if not fieldSelected then return end
        local stepTable = {field = fieldName, planter = planterName}
        temptable.plantingPlanter = true
        while api.humanoidrootpart() and api.humanoid().Health > 0 and not checkIfPlanted(stepTable) and not isFieldOccupied(fieldName) do
            while not (api.magnitude(fieldSelected.Position) < 8) do
                moveTo(fieldSelected.Position)
                task.wait()
            end
            task.wait(0.5)
            PlayerActivesCommand:FireServer({["Name"] = planterData.displayName})
            task.wait(1)
        end
        plantingPlanter = false
    end
    
    function collectAllPlanters(collectPercentage)
        local plantersToCollect = {}
        for _,planter in pairs(getMinePlanters()) do
            if planter.GrowthPercent ~= nil then
    
                if planter.GrowthPercent >= ((collectPercentage or vitaly.autoPlantersSettings.planterHarvestAt) / 100) then
                    table.insert(plantersToCollect, {
                        ["PM"] = planter["PotModel"].PrimaryPart,
                        ["AID"] = planter["ActorID"]
                    })
                end
            end
        end
        if #plantersToCollect > 0 then
            for _,planter in pairs(plantersToCollect) do
                while isPlanterExists(planter.AID) do
                    collectSpecificPlanter(planter.PM, planter.AID)
                    task.wait(1)
                end
            end
        end
    end
    
    function getPlantersCacheFromFile()
        if not isfile(plantersCacheFilePath) then
            local defaultPlantersCache = {
                customPlanters1 = 1,
                customPlanters2 = 1,
                customPlanters3 = 1
            }
            writefile(plantersCacheFilePath, game.HttpService:JSONEncode(defaultPlantersCache))
        end
        return game.HttpService:JSONDecode(readfile(plantersCacheFilePath))
    end
    
    function getPlantersCache() 
        local Cache = plantersCache
        local isFromCache = true
        if not Cache then 
            isFromCache = false
            Cache = getPlantersCacheFromFile()
            plantersCache = Cache
        end
        -- print((isFromCache and "Loaded from Cache") or "Loaded from File")
        return Cache
    end
    
    function updatePlantersCache(cycle, newValue)
        local Cache = getPlantersCache()
        Cache["customPlanters"..cycle] = newValue
        plantersCache = Cache
        writefile(plantersCacheFilePath, game.HttpService:JSONEncode(Cache))
    end
    
    function checkIfPlanted(stepTable)
        local isPlanted,planter = false,nil
        for i,v in pairs(getMinePlanters()) do
            local planterName = getPlanterData(v.Type).displayName
            local planterField = findField(v.Pos)
            -- warn(stepTable.planter, planterName)
    
            if (stepTable.field == (planterField and planterField.Name))
                and(stepTable.planter == planterName) then
                -- print("FOUND PLANTER!")
                isPlanted = true
                planter = v
                break
            end
        end
        -- warn(isPlanted,planter)
        return isPlanted,planter
    end
    
    function isPlanterInConfig(planter)
        for i=1,3 do
            local cycleName = "customPlanters"..i
            local stepsTable = vitaly.customPlanterSettings[cycleName]
            for j=1,5 do
                local stepTable = stepsTable[j]
                if not (stepTable.planter and table.find(plantersDropdownTable, stepTable.planter))
                    or not (stepTable.field and table.find(fieldsTable, stepTable.field))
                then
                    continue
                else
                    local isInConfig = (getPlanterData(stepTable.planter).displayName == planter.Name and stepTable.field == planter.Field)
                    if isInConfig then return true end
                end
            end
        end
        return false
    end
    
    function autoPlanters()
        local shouldReturn = false
        if vitaly.autoPlantersSettings.doCustomPlanters then
            local planterCycles = vitaly.customPlanterSettings
    
            local steps = {
                customPlanters1 = 5, 
                customPlanters2 = 5, 
                customPlanters3 = 5
            }
    
            for i=1,3 do
                local cycleName = "customPlanters"..i
                local stepsTable = planterCycles[cycleName]
                for j=1,5 do
                    local stepTable = stepsTable[j]
                    if not (stepTable.planter and table.find(plantersDropdownTable, stepTable.planter))
                        or not (stepTable.field and table.find(fieldsTable, stepTable.field))
                    then
                        steps[cycleName] -= 1
                    else
                        local isPlanted = checkIfPlanted(stepTable)
                        -- warn("Is Planted: "..tostring(isPlanted))
                        if isPlanted then updatePlantersCache(i,j) break end
                    end
                end
            end
    
            local currentSteps = getPlantersCache()
    
            for i,planter in pairs(getMinePlanters()) do
                local planterName = getPlanterData(planter.Type).displayName
                local planterField = findField(planter.Pos) and findField(planter.Pos).Name
    
                if not isPlanterInConfig({Name = planterName, Field = planterField}) then
                    -- print("NOT IN CONFIG")
                    collectSpecificPlanter(planter.PotModel.PrimaryPart, planter.ActorID)
                    shouldReturn = true
                end
            end
    
            for i=1,3 do
                local cycleName = "customPlanters"..i
                local stepsTable = planterCycles[cycleName]
    
                if steps[cycleName] == 0 then continue end
                local currentStep = currentSteps[cycleName]
                local config = stepsTable[currentStep]
                if currentStep > steps[cycleName] then 
                    -- print("Step limit ",cycleName,currentStep,steps[cycleName])
                    currentStep = 1 
                    updatePlantersCache(i,1)
                    currentSteps = getPlantersCache()
                end
                local isPlanted,Planter = checkIfPlanted(config)
                -- print(isPlanted, config)
                if not isPlanted and #getMinePlanters() < 3 then
                    -- print("Not Planted")
                    local planter = config.planter
                    if planter:find("Plenty") then planter = "The Planter Of Plenty" elseif not table.find(plantersDropdownTable, planter) then continue end
                    local planterData = getPlanterData(planter)
                    local planterCount = getClientStatCache("Eggs", (planter:find("Plenty") and "Plenty" or planterData.systemName).."Planter") or 0
                    if isFieldOccupied(config.field) or planterCount <= 0 or isPlanterPlanted(planterData.systemName) then
                        warn("Skipped", cycleName, planter, config.field)
                        updatePlantersCache(i,currentStep + 1)
                        currentSteps = getPlantersCache()
                        warn(currentSteps[cycleName])
                    else
                        plantPlanter(planterData.systemName, config.field)
                        task.wait()
                        shouldReturn = true
                    end
                else
                    if Planter.GrowthPercent >= (config.harvestAmount / 100) then
                        if Planter.PotModel.Name == config.planter and findField(Planter.PotModel.PrimaryPart.Position).Name == config.field then
                            collectSpecificPlanter(Planter.PotModel.PrimaryPart, Planter.ActorID)
                            updatePlantersCache(i,currentStep + 1)
                            currentSteps = getPlantersCache()
                            shouldReturn = true
                        end
                    end
                end
            end
        end
        return shouldReturn
    end
    
    function farmDupedTokens()
        if #temptable.dupedTokensTable > 0 then
            local dupedToken = next(temptable.dupedTokensTable)
            if tonumber(dupedToken) then dupedToken = temptable.dupedTokensTable[dupedToken] end
            local succ,err = pcall(function()
                while dupedToken.Attachment.BillboardGuiFront.Smile.ImageColor3 ~= Color3.fromRGB(255, 0, 255) do
                    local pos = dupedToken.Position - Vector3.new(0,10,0)
    
                    player.Character.Humanoid:MoveTo(pos)
    
                    task.wait(.05)
                end
                local index = table.find(temptable.dupedTokensTable, dupedToken)
                table.remove(temptable.dupedTokensTable, index)
            end)
            if not succ then warn(err) end
            if succ then return true end
        end
        return false
    end
    
    function mainAutofarmFunction()
        local function importantFarmTaskCallback(token)
            return findField(token.Position) == temptable.fieldSelected
        end
    
        while task.wait() do
            xpcall(function() 
                if temptable.stopEverything then return task.wait(.03) end
    
                if temptable.autoRBC.isActive then return task.wait(.03) end
                if canTaskBeSpawned("getToys") then
                    getToys()
                end
                if vitaly.autoPlantersSettings.doCustomPlanters and canTaskBeSpawned("farmPlanters") then
                    if autoPlanters() then return end
                end
    
                if vitaly.combatSettings.killVicious and temptable.detected.vicious and canTaskBeSpawned("killVicious") then
                    killVicious()
                end
    
                tryKillMonsters()
                if canTaskBeSpawned("trainBosses") then
                    if vitaly.combatSettings.trainKingBeetle then
                        trainKingBeetle()
                    end
    
                    if vitaly.combatSettings.trainTunnelBear then
                        trainTunnelBear()
                    end
    
                    if vitaly.combatSettings.trainCrab then
                        trainCrab()
                    end
    
                    if vitaly.combatSettings.trainStumpSnail then
                        if trainStumpSnail() then return end
                    end
                end
                if not vitaly.toggles.convertHoney or not shouldIConvert() then
    
                    if temptable.shouldEquipDefaultMask then
                        temptable.shouldEquipDefaultMask = false
                        requestAccessoryEquip(vitaly.vars.defaultmask)
                        return
                    end
    
                    if temptable.puffsDetected and vitaly.autoPuffshroomSettings.farmPuffshrooms then
                        farmPuffshrooms()
                        return
                    end
    
                    if vitaly.autoFarmSettings.farmSprouts then
                        farmSprouts()
                    end
    
                    selectField(vitaly.autoFarmSettings.field)
    
                    if vitaly.autoQuestSettings.doQuests then
                        doQuests()
                    end
    
                    if not isFieldSame(api.humanoidrootpart().Position, temptable.fieldPosition) then
                        moveTo(temptable.fieldPosition + Vector3.new(0,3,0))
                        if vitaly.autoFarmSettings.autoSprinkler then
                            task.wait()
                            placeSprinklers(temptable.fieldPosition)
                        end
                    end
    
                    if vitaly.autoFarmSettings.smartPreciseCrosshair and #getCrosshairs().all > 0 then
                        if smartFarmCrosshairs() then return end 
                    end
    
                    if vitaly.autoFarmSettings.farmDupedTokens then
                        farmDupedTokens()
                    end
    
                    if vitaly.autoFarmSettings.farmShower or vitaly.autoFarmSettings.farmCoconuts then
                        farmShowerAndCoco()
                    end
    
                    local isFarmed = false
                    isFarmed = farmNearest(importantFarmTaskCallback)
                    -- for i=1,3 do
                    -- isFarmed = isFarmed or farmed
                    -- end
    
                    if vitaly.autoFarmSettings.farmUnderBalloons and math.random(68,70) == 69 then
                        local farmed = gotoNearestBalloon()
                        isFarmed = isFarmed or farmed
                    end
    
                    if not isFarmed and (tick() - temptable.lastWalkToNearest > 1.5) then
                        local randomFlower = getRandomFlower(temptable.fieldSelected)
                        if randomFlower then
                            temptable.lastWalkToNearest = tick()
                            api.humanoid():MoveTo(randomFlower.Position)
                        end
                    end
                elseif vitaly.toggles.convertHoney and shouldIConvert(false, false) then
                    convertHoney(vitaly.toggles.converthiveballoon)
                end
            end, function(err) warn(("[Macro V3] (%s) | An error has occurred: %s"):format(temptable.version, err)) end)
        end
    end
    
    local autoDig
    
    local autoRBC = {
        Listeners = {}, 
        Functions = {takeRBQuest, getActiveChallange}, 
        redBeesPriorityList = {["Rage"] = 6,["Bear"] = 1,["Shy"] = 15,["Rad"] = 16,["Shy"] = 15,["Rad"] = 16,["Shy"] = 15,["Rad"] = 16,["Brave"] = 9,["Baby"] = 13,["Windy"] = 5,["Spicy"] = 7,["Fire"] = 20,["Tabby"] = 2,["Cool"] = 36,["Demo"] = 32,["Lion"] = 41,["Honey"] = 30,["Demon"] = 37,["Riley"] = 26,["Vector"] = 8,["Hasty"] = 40,["Ninja"] = 42,["Bucko"] = 34,["Fuzzy"] = 23,["Music"] = 14,["Gummy"] = 17,["Puppy"] = 43,["Basic"] = 18,["Bumble"] = 27,["Bomber"] = 31,["Bubble"] = 33,["Cobalt"] = 35,["Frosty"] = 39,["Rascal"] = 44,["Tadpole"] = 21,["Precise"] = 3,["Digital"] = 4,["Looker"] = 10,["Photon"] = 12,["Shocked"] = 45,["Diamond"] = 28,["Buoyant"] = 29,["Vicious"] = 22,["Festive"] = 24,["Crimson"] = 11,["Stubborn"] = 46,["Carpenter"] = 19,["Commander"] = 25,["Exhausted"] = 38 },
        farmField = function(field)
            if not (findField(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) == field)  then
                moveTo(field.Position + Vector3.new(0,3,0))
                task.wait(.5)
                PlayerActivesCommand:FireServer({["Name"] = "Sprinkler Builder"})
                task.wait()
            end
    
            if not macvitalyrov2.toggles.autodig then
                autoDig.Set(true)
            end
    
            local function importantFarmTaskCallback(token)
                return findField(token.Position) == field
            end
    
            local isFarmed = farmNearest(importantFarmTaskCallback)
    
            if not isFarmed and (tick() - temptable.lastWalkToNearest > 3) then
                local randomFlower = getRandomFlower(field)
                if randomFlower then
                    temptable.lastWalkToNearest = tick()
                    api.humanoid():MoveTo(randomFlower.Position)
                end
            end
        end,
        getTaskField = function(questTask)
            if questTask.Zone then
                return questTask.Zone
            elseif questTask.Color then
                return vitaly.autoQuestSettings["best"..questTask.Color.."Field"]
            else
                return vitaly.autoQuestSettings["bestRedField"]
            end
        end
    }
    
    
    autoRBC.Functions = {
        getActiveChallange = function() 
            return secureCall(RoboBearGui.GetActiveChallengeData, Activatables)
        end,
    
        selectQuest = function()
            Events.ClientCall("RoboBearQuestSelect", math.random(1,2))
        end,
    
        selectBee = function(beesTable)
            local playerFile = getClientStatCache()
            local bestBee = {priority = math.huge, index = 1, beeName = nil}
            for beeIndex=1, #beesTable do
                local obfuscatedBee = beesTable[beeIndex]
                local obfuscatedBeeX = obfuscatedBee[1]
                local obfuscatedBeeY = obfuscatedBee[2]
    
                local beeFile = secureCall(StatTools.GetBeeFile, Activatables, playerFile, obfuscatedBeeX, obfuscatedBeeY)
                if beeFile then
                    local beePriority = autoRBC.redBeesPriorityList[beeFile.Type]
                    if beePriority and beePriority < bestBee.priority then
                        bestBee.priority = beePriority
                        bestBee.index = beeIndex
                        bestBee.beeName = beeFile.Type
                    end
                end
            end
            Events.ClientCall("RoboBearBeeSelect", bestBee.index or 1)
        end,
    
        chooseUpgrades = function()
            Events.ClientCall("RoboBearRoundStart")
        end,
    
        onRoundStart = function()
            while task.wait() do
                local currentChallangeData = autoRBC.Functions.getActiveChallange()
                if not currentChallangeData then return end
    
                local playerFile = getClientStatCache()
    
                local ActiveQuest = currentChallangeData.ActiveQuest
    
                if not ActiveQuest or not ActiveQuest.Tasks then continue end
    
                local tasks = ActiveQuest.Tasks
                local progress = secureCall(Quests.GetProgression, Activatables, nil, tasks, playerFile)
                if progress then
                    writefile("rbc/progress_1.json", game.HttpService:JSONEncode(progress))
                    writefile("rbc/teasks_1.json", game.HttpService:JSONEncode(tasks))
                    for i,v in ipairs(tasks) do
                        if progress[i][1] < 1 then
                            local taskType = tasks[i].Type
                            if taskType == "Collect Pollen" or taskType == "Make Honey" or taskType == "Collect Goo" then
                                local taskTable = {}
                                if taskType == "Collect Pollen" then
                                    taskTable.Color = tasks[i].Color
                                    taskTable.Zone = tasks[i].Zone
                                elseif taskType == "Make Honey" or taskType == "Collect Goo" then
                                    taskTable.Color = "Red"
                                end
                                local fieldName = autoRBC.getTaskField(taskTable)
                                -- print(fieldName)
                                if fieldName and game.Workspace.FlowerZones:FindFirstChild(fieldName) then
                                    pcall(function() 
                                        autoRBC.farmField(game.Workspace.FlowerZones:FindFirstChild(fieldName))
                                    end)
                                end
                            end
                            break
                        end
                    end
                end
            end
        end,
    
        onRoundEnd = function()
            local playerInventory = getClientStatCache("Eggs")
            if playerInventory.Cogs then
                local function buyDrive(driveName)
                    if player:DistanceFromCharacter(Vector3.new(-473, 60, 106)) > 25 then
                        moveTo(Vector3.new(-473, 60, 106))
                        task.wait(.25)
                    end
                    task.wait(.25)
                    Events.ClientCall("ItemPackageEvent", "Purchase", {
                        Type = "Robo Bear "..driveName, Amount = 1, Category = "Bundle"
                    })
                    task.wait(.1)
                end
                while playerInventory.Cogs >= 50 do
                    if (playerInventory.WhiteDrive or 0) < 5 then
                        buyDrive("White Drive")
                    elseif (playerInventory.RedDrive or 0) < 5 then
                        buyDrive("Red Drive")
                    elseif (playerInventory.BlueDrive or 0) < 5 then
                        buyDrive("Blue Drive")
                    elseif (playerInventory.GlitchedDrive or 0) < 5 then
                        buyDrive("Gitched Drive")
                    else break end
                end
                task.wait()
            end
            autoRBC.Functions.takeRBQuest()
        end,
    
        onChallangeEnd = function() 
            for i,v in pairs(autoRBC["Listeners"]) do
                pcall(function() v:Disconnect() end)
            end
    
            Events.ClientCall("RoboBearClaimRewards")
    
            temptable.autoRBC.latestRBC = tick() + 5
    
            task.wait(2.5)
    
            temptable.autoRBC.isActive = false
        end,
        takeRBQuest = function()
            warn(2)
            local attempts = 0
            local activaChallange = autoRBC.Functions.getActiveChallange()
            while (not activaChallange or activaChallange.RoundState ~= "Running") and attempts < 5 do
    
                if api.magnitude(RoboBear.Platform.Position) <= 25 and not ScreenGui.NPC.Visible then
                    while not ScreenGui.NPC.Visible and not (api.magnitude(RoboBear.Platform.Position) > 25) do
                        secureCall(ActivatablesNPC.ButtonEffect, Activatables, player, RoboBear)
                        task.wait(.5)
                        continue
                    end
                elseif api.magnitude(RoboBear.Platform.Position) > 25 then
                    moveTo(RoboBear.Platform.Position + Vector3.new(0,3,0))
                    task.wait(.5)
                    continue
                end
    
                local tempTimestamp = tick()
    
                repeat task.wait() until ScreenGui.NPC.Visible or tick() - tempTimestamp > 10
    
                while ScreenGui.NPC.Visible do
                    local optionText = ScreenGui.NPC.OptionFrame.Option1.Text
                    if ScreenGui.NPC.OptionFrame.Visible 
                        and ScreenGui.NPC.OptionFrame.Option1.Visible 
                        and (optionText:find("Spend 1 Robo Pass") or optionText:find("Start Round")) then
                        setIdentity(2)
                        firesignal(ScreenGui.NPC.OptionFrame.Option1.MouseButton1Click)
                        setIdentity(origThreadIdentity)
                    else
                        setIdentity(2)
                        firesignal(ScreenGui.NPC.ButtonOverlay.MouseButton1Click)
                        setIdentity(origThreadIdentity)
                    end
                    task.wait()
                end
    
                task.wait(2.5)
                attempts = attempts + 1
                activaChallange = autoRBC.Functions.getActiveChallange()
            end
            task.wait(0.5)
            return autoRBC.Functions.getActiveChallange()
        end
    }
    
    
    
    function mainAutoRBCFunction()
        warn(1)
        autoRBC["Listeners"][1] = EventsDir.RoboBearQuestSelect.OnClientEvent:Connect(autoRBC.Functions.selectQuest)
        autoRBC["Listeners"][2] = EventsDir.RoboBearBeeSelect.OnClientEvent:Connect(autoRBC.Functions.selectBee)
        autoRBC["Listeners"][3] = EventsDir.RoboBearUpgradeSelect.OnClientEvent:Connect(autoRBC.Functions.chooseUpgrades)
        autoRBC["Listeners"][4] = EventsDir.RoboBearRoundStart.OnClientEvent:Connect(autoRBC.Functions.onRoundStart)
        autoRBC["Listeners"][5] = EventsDir.RoboBearRoundEnd.OnClientEvent:Connect(autoRBC.Functions.onRoundEnd)
        autoRBC["Listeners"][6] = EventsDir.RoboBearChallengeEnd.OnClientEvent:Connect(autoRBC.Functions.onChallangeEnd)
    
        if autoRBC.Functions.takeRBQuest() then temptable.autoRBC.isActive = true end
    end
    
    function webhookFieldsList()
        local currentHoney = getClientStatCache("Totals","Honey")
        local timePassed = math.round(tick() - currentvitalyLoadedAt)
        -- print(currentHoney, temptable.honeyAtStart)
        local honeyGained = currentHoney - temptable.honeyAtStart
        -- print(currentHoney, timePassed, honeyGained)
    
        local honeyPerHour = math.floor(honeyGained / timePassed) * 3600
        local dailyHoney = getDailyHoney()
    
        local totalHoneyString = truncate(currentHoney)
        local honeyGainedString = truncate(honeyGained)
        local honeyPerHourString = truncate(honeyPerHour)
        local honeyPerDayString = truncate(dailyHoney)
    
        if not vitaly.webhookSettings.onlyTruncated then
            totalHoneyString = addcommas(currentHoney).." ("..totalHoneyString..")"
            honeyGainedString = addcommas(honeyGained).." ("..honeyGainedString..")"
            honeyPerHourString = addcommas(honeyPerHour).." ("..honeyPerHourString..")"
            honeyPerDayString = addcommas(dailyHoney).." ("..honeyPerDayString..")"
        end
    
        local uptimeString = truncatetime(timePassed)
        local fields = {}
    
        if vitaly.webhookSettings.showTotalHoney then
            table.insert(fields, {
                ["name"] = "Total Honey:",
                ["value"] = totalHoneyString,
                ["inline"] =  false
            })
        end
        table.insert(fields, {
            ["name"] = "Session Honey:       ",
            ["value"] = honeyGainedString,
            ["inline"] =  true
        })
        table.insert(fields, {
            ["name"] = "Session Uptime:     ",
            ["value"] = uptimeString,
            ["inline"] =  true
        })
        if vitaly.webhookSettings.showHoneyPerHour then
            table.insert(fields, {
                ["name"] = "Honey Per Hour:       ",
                ["value"] = honeyPerHourString,
                ["inline"] = false
            })
        end
        if vitaly.webhookSettings.showDailyHoney then
            table.insert(fields, {
                ["name"] = "Honey Per Day:     ", -- 
                ["value"] = honeyPerDayString,
                ["inline"] = false
            })
        end
        if vitaly.webhookSettings.showNectars then
            local nectars = getAllNectar(true)
            local nectarsString = ""
            for index, nectar in pairs(nectars) do
                if nectar.time == 0 then continue end
                nectarsString = nectarsString..""..(nectarEmojis[nectar.name] or nectar.name..":").." "..nectar.time
                nectarsString = nectarsString.."\n"
            end
            if #nectarsString > 1 then
                table.insert(fields, {
                    ["name"] = "Nectars:",
                    ["value"] = nectarsString,
                    ["inline"] =  false
                })
            end
        end
        if vitaly.webhookSettings.showPlanters then
            local plantersString = ""
            pcall(function()
                local minePlanters = getMinePlanters()
                for i,v in pairs(minePlanters) do
                    plantersString = plantersString..""..plantersEmojis[v.PotModel.Name].." "..math.floor(v.GrowthPercent*1000)/10 .. "%\n"
                end
            end)
            if plantersString ~= "" then
                table.insert(fields, {
                    name = "Active Planters",
                    value = plantersString,
                    inline = false
                })
            end
        end
        if vitaly.webhookSettings.showItems then
            local itemsString = ""
            for index, item in pairs(vitaly.webhookSettings.itemsList) do
                local systemItem = getItemByName(item)
                if systemItem and systemItem.SystemName then 
                    local systemName = systemItem.SystemName
                    local count = getClientStatCache("Eggs", systemName) or 0
                    itemsString = itemsString .. item .. ": **" .. tostring(count) .. "**\n"
                end
            end
            if itemsString ~= "" then
                table.insert(fields, {
                    name = "Items",
                    value = itemsString,
                    inline = false
                })
            end
        end
        return fields
    end
    
    function generateWebhookBody(settings)
        local body = {
            ["username"] = player.Name,
            ["content"] = settings.content or "",
            ["embeds"] = {{
                ["title"] = "**"..settings.embedTitle.."**",
                ["description"] = settings.embedDescription or "",
                ["type"] = "rich",
                ["color"] = tonumber(settings.color) or tonumber(vitaly.webhookSettings.webhookColor),
                ["fields"] = settings.fields or {},
                ["footer"] = {
                    ["text"] = os.date("%x").." • "..os.date("%I")..":"..os.date("%M")..--[[":"..os.date("%S")..]]" "..os.date("%p")
                }
            }}
        }
        return body
    end
    
    function sendWebhook(body)
        local headers = {
            ["content-Type"] = "application/json"
        }
        xpcall(function()
            httpreq({
                Url = vitaly.webhookSettings.webhookUrl, 
                Body = HttpService:JSONEncode(body), 
                Method = "POST", 
                Headers = headers
            })
            task.wait()
            temptable.lastWebhookSent = math.round(tick())
        end, function(err) warn(("%s | Failed to send webhook: %s"):format(temptable.version, err)) end)
    end
    
    function questWebhook(npc,fields)
        local thumbnail = npcsIcons[npc]
        local data = generateWebhookBody({
            embedTitle = "Macro V3 | Quests",
            thumbnail = thumbnail,
            fields = fields
        })
        sendWebhook(data)
    end
    
    function sendHourlyWebhook(isTest)
        local ping = vitaly.webhookSettings.pingUser and "<@"..vitaly.webhookSettings.discordId..">" or ""
        local data = generateWebhookBody({
            content = (isTest and ping ~= "" and ping..", your webhook is working!") or (isTest and ping == "" and "Your webhook is working!") or ping,
            embedTitle = isTest and "Webhook Test" or "Honey Update",
            fields = webhookFieldsList()
        })
        sendWebhook(data)
    end
    
    function sendTestWebhook()
        local data = generateWebhookBody({
            embedTitle = "Test Webhook",
            embedDescription = "Hey from vitaly"
        })
        sendWebhook(data)
    end
    
    local newMemoryMatchStartGame = function() end
    local MemoryMatchStartGame
    
    if not getgenv().autoMMConfigured then
        getgenv().autoMMConfigured = true
        LPH_NO_VIRTUALIZE(function()
            MemoryMatchStartGame = MinigameGui.StartGame
    
            local function UpdateGameTable(a)
                local dupes = {}
                local exclude = a.Game.MatchedTiles
    
                for index, value in pairs(a.Game.RevealedTiles) do
                    if exclude[index] == nil then 
                        if dupes[value] == nil then
                            dupes[value] = {Indexes = {index}}
                        else
                            table.insert(dupes[value]["Indexes"], index)
                        end
                    end
                end
    
                for i,v in pairs(dupes) do
                    if #v.Indexes < 2 then dupes[i] = nil end
                end
    
                return dupes
            end
    
            newMemoryMatchStartGame = function(a)
                if not vitaly.toggles.automemorymatch and not vitaly.autoQuestSettings then return end
                repeat task.wait() until a and a.Game and a.Game.Grid and a.Game.Grid.InputActive
                temptable.activeMemoryMatch = a
                for Index = 1, a.Game.NumTiles do
                    task.wait()
                    warn("You have",a.Game.Chances,"chances left")
                    if a.Game.Chances == 0 then break end
                    setIdentity(2)
                    local tile
                    xpcall(function()tile=a.Game.Grid:GetTileAtIndex(Index)end,function(err)warn("Err:",err)end)
                    setIdentity(origThreadIdentity)
    
                    if a.Game.LastSelectedIndex ~= nil then
                        local searchFor = a.Game.RevealedTiles[a.Game.LastSelectedIndex]
                        local dupes = UpdateGameTable(a)
                        for i2,v2 in pairs(dupes) do
                            if i2 == searchFor and v2.Indexes[1] ~= Index then 
                                setIdentity(2)
                                tile = a.Game.Grid:GetTileAtIndex(v2.Indexes[1]) 
                                setIdentity(origThreadIdentity)
                                break 
                            end
                        end
                    else
                        local dupes = UpdateGameTable(a)
                        for i,v in pairs(dupes) do
                            if #v.Indexes > 1 then
                                setIdentity(2)
                                MemoryMatchModule.RegisterTileSelected(a.Game, a.Game.Grid:GetTileAtIndex(v.Indexes[1]))
                                setIdentity(origThreadIdentity)
                                repeat task.wait() until a.Game.Grid.InputActive or a.Game.Chances <= 0
                                setIdentity(2)
                                tile = a.Game.Grid:GetTileAtIndex(v.Indexes[2])
                                setIdentity(origThreadIdentity)
                                task.wait()
                                break
                            end
                        end
                    end
                    setIdentity(2)
                    MemoryMatchModule.RegisterTileSelected(a.Game, tile)
                    setIdentity(origThreadIdentity)
                    repeat task.wait() until a.Game.Grid.InputActive or a.Game.Chances <= 0
                    task.wait()
                end
                warn("Finishing memory Match")
                Events.ClientCall("MemoryMatchEvent", {
                    Action = "Finish"
                })
                warn("Ending Game")
                setIdentity(2)
                MinigameGui.EndGame()
                setIdentity(origThreadIdentity)
                warn("Game ended successfully")
                temptable.activeMemoryMatch = nil
            end
            local hookedMemoryMatchStartGame; hookedMemoryMatchStartGame = hookfunction(MemoryMatchStartGame, function(...)
                local a = hookedMemoryMatchStartGame(...)
                coroutine.wrap(function() task.wait(1) newMemoryMatchStartGame(a) end)()
                return a
            end)
        end)()
    end
    
    function hiddenQuestWebhookListener(isPoolQuest, arg1)
        task.wait(3)
        if not vitaly.webhookSettings.sendQuests then return end
    
        local fullQuest = (not isPoolQuest and getQuestInfo(arg1)) or nil
        local originalNPC = (not isPoolQuest and fullQuest and fullQuest.NPC) or arg1
        local NPC = originalNPC
        local QuestName = (not isPoolQuest and fullQuest and fullQuest.DisplayName) or nil
    
        local polarPower = tostring(getClientStatCache("Modifiers", "MaxBeeEnergy", "_", "Mods", 1, "Combo") or 0)
        local questCount = tostring(getClientStatCache("Totals", "QuestPoolCounts", originalNPC) or 0)
        pcall(function() NPC = originalNPC:gsub("Bear 2", "Bear") end)
    
        if isPoolQuest then
            local temp = getClientStatCache("Quests", "PoolLastQuests", tostring(originalNPC))
            local tempQuestInfo = getQuestInfo(temp)
            if temp then QuestName = (tempQuestInfo.DisplayName or tempQuestInfo.Name) end
        end
    
        local suffix = 
            (NPC=="Polar Bear" and "\n\n"..miscEmojis["Polar Power"].." x"..polarPower) or 
            ("\n\n"..(tonumber(questCount) and "Total "..NPC.."'s quests completed: "..questCount) or "...")
    
        local fields = {}
    
        if isPoolQuest then
            table.insert(fields,{
                name = "Completed Repeatable Quest",
                value = (QuestName or NPC)..suffix
            })
        else
            table.insert(fields,{
                name = "Completed Quest",
                value = QuestName
            })
        end
    
        questWebhook(NPC, fields)
    end
    
    getgenv().questWebhookListener = setmetatable({Active = true}, {
        __index = function(tbl, key) 
            if key == "HiddenListener" then
                return hiddenQuestWebhookListener
            else
                return rawget(tbl, key)
            end
        end
    })
    
    if false then
    
        if not getgenv().questListener then
            getgenv().questListener = true
    
            LPH_NO_VIRTUALIZE(function()
                local a = require(game:GetService("ReplicatedStorage").Events)
                local oldClientCall
                oldClientCall = hookfunction(a.ClientCall, function(...)
                    local event, arg1 = ...
                    if event == "CompleteQuest" or event == "CompleteQuestFromPool" then
                        xpcall(function()
                            coroutine.wrap(function(event, arg1) 
                                setIdentity(8)
                                questWebhookListener.HiddenListener((event == "CompleteQuest" and false) or true, arg1)
                            end)(event, arg1)
                        end, function(err) if vitaly.webhookSettings.sendQuests then warn("Cannot send ") end end)
                    end
                    return oldClientCall(...)
                end)
            end)()
        end
    
    end
    
    function placeSprinkler(position, withoutWait, withoutJump)
        -- Place a sprinkler at the specified position
        local humanoid = api.humanoid()
        if position then
            local temp1 = nil
            task.spawn(function() temp1 = walkTo(position, 2) end)
            repeat task.wait() until temp1 ~= nil
        end
    
        if not withoutJump then
            task.wait(.1)
            humanoid.Jump = true
            task.wait(.2)
        end
        PlayerActivesCommand:FireServer({["Name"] = "Sprinkler Builder"})
        if not withoutWait then
            task.wait(1)
        end
    end
    
    local sprinklerCounts = {
        ["The Supreme Saturator"] = 1,
        ["Basic Sprinkler"] = 1,
        ["Silver Soakers"] = 2,
        ["Golden Gushers"] = 3,
        ["Diamond Drenchers"] = 4
    }
    
    function placeSprinklers(fieldPos)
        if not fieldPos then return end
        print("sprinklers")
        local sprinkler = getClientStatCache("EquippedSprinkler")
        local flowerSize = 4
    
        local sprinklersToPlace = sprinklerCounts[sprinkler] or 0
        local placedSprinklersCount = 0
    
        local centerPos = fieldPos
    
        for _,v in pairs(Workspace.Gadgets:GetChildren()) do
            if v.Name == sprinkler and isFieldSame(centerPos, v.Base.Position) then
                placedSprinklersCount += 1
            end
        end
    
        if placedSprinklersCount >= sprinklersToPlace then return  end
    
        if sprinklersToPlace == 1 then
            placeSprinkler(centerPos, true, true)
        elseif sprinklersToPlace == 2 then
            placeSprinkler(centerPos + Vector3.new(-3*flowerSize, 0, -3*flowerSize))
            placeSprinkler(centerPos + Vector3.new(3*flowerSize, 0, 3*flowerSize), true, false)
        elseif sprinklersToPlace == 3 then
            placeSprinkler(centerPos + Vector3.new(3*flowerSize, 0, -3*flowerSize))
            placeSprinkler(centerPos + Vector3.new(-4*flowerSize, 0, -3*flowerSize))
            placeSprinkler(centerPos + Vector3.new(0*flowerSize, 0, 3*flowerSize), true, false)
        elseif sprinklersToPlace == 4 then
            placeSprinkler(centerPos + Vector3.new(-4*flowerSize, 0, 0*flowerSize))
            placeSprinkler(centerPos + Vector3.new(4*flowerSize, 0, 0*flowerSize))
            placeSprinkler(centerPos + Vector3.new(0*flowerSize, 0, 4*flowerSize))
            placeSprinkler(centerPos + Vector3.new(0*flowerSize, 0, -4*flowerSize), true, false)
        end
    end
    
    function getBeeRarity(beeName)
        local fullBeeData = beesTable.fullData[beeName:gsub(" Bee", "")]
        if fullBeeData then return fullBeeData.Rarity end
        return ""
    end
    
    function isBeeExpected(beeCell)
        local beeName = beeCell.CellType.Value:gsub("Bee", " Bee")
        local beeRarity = getBeeRarity(beeName)
        local isGifted = beeCell:FindFirstChild("GiftedCell") and true or false
    
        local stop = false
    
        if temptable.autoRJSettings.requireAnyGifted and isGifted then 
            stop = true 
        end
    
        if table.find(temptable.autoRJSettings.selectedRarities, "Any "..beeRarity) or table.find(temptable.autoRJSettings.selectedRarities, "Gifted Any "..beeRarity) and isGifted then
            stop = true
        end
    
        if table.find(temptable.autoRJSettings.selectedBees, beeName) or table.find(temptable.autoRJSettings.selectedBees, "Gifted "..beeName) and isGifted then
            stop = true
        end
        return stop
    end

local rnd = tostring(math.random(1,100000))
local Library = GetUi()

local Main = Library.CreateMain({Title = 'Bee Swarm Simulator', Desc = ''})

function huhuhaha() 
    local Page1 = Main.CreatePage({Page_Name = 'Main', Page_Title = 'Main Tab'})
    local Section1 = Page1.CreateSection('Item')
    Section1.CreateDropdown({Title = 'Sellect Item', List = TFItemHook, Search = true, Selected = true}, function(i,v)
    end)
    Section1.CreateButton({Title = 'Get Inf Item'}, function()
    
    end)
    local Section1 = Page1.CreateSection('Honey')
    Section1.CreateBox({Title = 'Sellect Amount Honey', Placeholder = 'Type here', Number_Only = true}, function(v)
        if v then
            x = tonumber(v)
        end
    end)
    Section1.CreateButton({Title = 'Get Honey'}, function()
    
    end)
end
huhuhaha()
