
if game.PlaceId == 2753915549 then
do
    local ui = game:GetService("CoreGui"):FindFirstChild("dawidlib")
    if ui then
        ui:Destroy()
    end
end
local lib = {CurrentlyBinding = false,RainbowColorValue = 0, HueSelectionPosition = 0}

local themes = {
Light = {
Color1 = Color3.fromRGB(255,255,255),
Color2 = Color3.fromRGB(240,240,240),
Color3 = Color3.fromRGB(228,228,228),
TabColor = Color3.fromRGB(220, 220, 220),
ScrollBar = Color3.fromRGB(213, 213, 213),
TextColor = Color3.fromRGB(0,0,0)
},
Dark = {
Color1 = Color3.fromRGB(35,35,35),
Color2 = Color3.fromRGB(38,38,38),
Color3 = Color3.fromRGB(31,31,31),
TabColor = Color3.fromRGB(45,45,45),
ScrollBar = Color3.fromRGB(58, 58, 58),
TextColor = Color3.fromRGB(255,255,255)
}
}
local HttpService = game:GetService("HttpService")
local loadedinfo = {}
local selectedtheme = "Light"
local watermarkpos = "BottomLeft"
local watermarktext = "dawid hub"

pcall(function()
loadedinfo = HttpService:JSONDecode(readfile("dawidhubinfo.txt"))
selectedtheme = loadedinfo["theme"] or "Light"
watermarktext = loadedinfo["watermarktext"] or "dawid hub"
watermarkpos = loadedinfo["watermarkpos"] or "BottomLeft"
end)

local function saveinfo()
loadedinfo["theme"] = selectedtheme
loadedinfo["watermarktext"] = watermarktext
loadedinfo["watermarkpos"] = watermarkpos
writefile("dawidhubinfo.txt", HttpService:JSONEncode(loadedinfo))
end




coroutine.wrap(
function()
while wait() do
lib.RainbowColorValue = lib.RainbowColorValue + 1 / 255
lib.HueSelectionPosition = lib.HueSelectionPosition + 1

if lib.RainbowColorValue >= 1 then
lib.RainbowColorValue = 0
end

if lib.HueSelectionPosition == 80 then
lib.HueSelectionPosition = 0
end
end
end
)()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function MakeDraggable(topbarobject, object)
local Dragging = nil
local DragInput = nil
local DragStart = nil
local StartPosition = nil

local function Update(input)
local Delta = input.Position - DragStart
local pos =
UDim2.new(
StartPosition.X.Scale,
StartPosition.X.Offset + Delta.X,
StartPosition.Y.Scale,
StartPosition.Y.Offset + Delta.Y
)
object.Position = pos
end

topbarobject.InputBegan:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
Dragging = true
DragStart = input.Position
StartPosition = object.Position

input.Changed:Connect(
function()
if input.UserInputState == Enum.UserInputState.End then
Dragging = false
end
end
)
end
end
)

topbarobject.InputChanged:Connect(
function(input)
if
input.UserInputType == Enum.UserInputType.MouseMovement or
input.UserInputType == Enum.UserInputType.Touch
then
DragInput = input
end
end
)

UserInputService.InputChanged:Connect(
function(input)
if input == DragInput and Dragging then
Update(input)
end
end
)
end

local dawidlib = Instance.new("ScreenGui")
dawidlib.Name = "dawidlib"
dawidlib.Parent = game.CoreGui
dawidlib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function loadwatermark()
local WatermarkFrame = Instance.new("Frame")
local WatermarkLabel = Instance.new("TextLabel")

WatermarkFrame.Name = "WatermarkFrame"
WatermarkFrame.Parent = dawidlib
WatermarkFrame.AnchorPoint = Vector2.new(0.5, 0.5)
WatermarkFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WatermarkFrame.BackgroundTransparency = 1.000
WatermarkFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
WatermarkFrame.Size = UDim2.new(1, 0, 1, 0)

WatermarkLabel.Name = "WatermarkLabel"
WatermarkLabel.Parent = WatermarkFrame
WatermarkLabel.AnchorPoint = Vector2.new(0.5, 0.5)
WatermarkLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WatermarkLabel.BackgroundTransparency = 1.000
WatermarkLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
WatermarkLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
WatermarkLabel.Size = UDim2.new(1, -25, 1, -25)
WatermarkLabel.Font = Enum.Font.Gotham
WatermarkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WatermarkLabel.TextSize = 16.000
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Left
WatermarkLabel.TextYAlignment = Enum.TextYAlignment.Bottom
WatermarkLabel.Text = watermarktext

coroutine.wrap(
function()
while wait() do
WatermarkLabel.Text = watermarktext
if watermarkpos == "BottomLeft" then
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Left
WatermarkLabel.TextYAlignment = Enum.TextYAlignment.Bottom
elseif watermarkpos == "BottomRight" then
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Right
WatermarkLabel.TextYAlignment = Enum.TextYAlignment.Bottom
elseif watermarkpos == "TopLeft" then
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Left
WatermarkLabel.TextYAlignment = Enum.TextYAlignment.Top
elseif watermarkpos == "TopRight" then
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Right
WatermarkLabel.TextYAlignment = Enum.TextYAlignment.Top
end
end
end
)()
end

function lib:ChangeTheme(theme)
selectedtheme = theme
saveinfo()
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()


local function errornotif(text)

local error = Instance.new("ScreenGui")
local ErrorMain = Instance.new("Frame")
local ErrorMainCircle = Instance.new("Frame")
local ErrorMainCircleImg = Instance.new("ImageLabel")
local ErrorMainCircleCorner = Instance.new("UICorner")
local ErrorText = Instance.new("TextLabel")


error.Name = "error"
error.Parent = game.CoreGui
error.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ErrorMain.Name = "ErrorMain"
ErrorMain.Parent = error
ErrorMain.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
ErrorMain.BackgroundTransparency = 1.000
ErrorMain.BorderSizePixel = 0
ErrorMain.Size = UDim2.new(1, 0, 1, 0)

ErrorMainCircle.Name = "ErrorMainCircle"
ErrorMainCircle.Parent = ErrorMain
ErrorMainCircle.AnchorPoint = Vector2.new(0.5, 0.5)
ErrorMainCircle.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
ErrorMainCircle.BackgroundTransparency = 1.000
ErrorMainCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
ErrorMainCircle.Size = UDim2.new(0, 100, 0, 100)

ErrorMainCircleImg.Name = "ErrorMainCircleImg"
ErrorMainCircleImg.Parent = ErrorMainCircle
ErrorMainCircleImg.AnchorPoint = Vector2.new(0.5, 0.5)
ErrorMainCircleImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ErrorMainCircleImg.BackgroundTransparency = 1.000
ErrorMainCircleImg.Position = UDim2.new(0.5, 0, 0.5, 0)
ErrorMainCircleImg.Size = UDim2.new(0, 75, 0, 75)
ErrorMainCircleImg.Image = "http://www.roblox.com/asset/?id=6031260781"
ErrorMainCircleImg.ImageColor3 = Color3.fromRGB(17, 17, 17)
ErrorMainCircleImg.ImageTransparency = 1.000

ErrorMainCircleCorner.CornerRadius = UDim.new(1, 8)
ErrorMainCircleCorner.Name = "ErrorMainCircleCorner"
ErrorMainCircleCorner.Parent = ErrorMainCircle

ErrorText.Name = "ErrorText"
ErrorText.Parent = ErrorMain
ErrorText.AnchorPoint = Vector2.new(0.5, 0.5)
ErrorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ErrorText.BackgroundTransparency = 1.000
ErrorText.Position = UDim2.new(0.5, 0, 0.5, 50)
ErrorText.Size = UDim2.new(0, 200, 0, 50)
ErrorText.Font = Enum.Font.Gotham
ErrorText.Text = text
ErrorText.TextColor3 = Color3.fromRGB(255, 255, 255)
ErrorText.TextSize = 18.000
ErrorText.TextTransparency = 1.000

TweenService:Create(
ErrorMain,
TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0}
):Play()

wait(.5)

TweenService:Create(
ErrorMainCircle,
TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0}
):Play()
TweenService:Create(
ErrorMainCircleImg,
TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{ImageTransparency = 0}
):Play()

wait(.8)

ErrorMainCircle:TweenPosition(UDim2.new(0.5, 0, 0.5, -25), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .4, true)

wait(.1)

TweenService:Create(
ErrorText,
TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 0}
):Play()
end


function lib:Window()
local fs = false
local Main = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local LeftFrame = Instance.new("Frame")
local LeftFrame1 = Instance.new("Frame")
local CloseBtn = Instance.new("TextButton")
local CloseBtnCorner = Instance.new("UICorner")
local CloseBtnImg = Instance.new("ImageLabel")
local TabHold = Instance.new("Frame")
local TabHoldLayout = Instance.new("UIListLayout")
local Line = Instance.new("Frame")
local LeftFrameCorner = Instance.new("UICorner")
local TabFolder = Instance.new("Folder")
local DragFrame = Instance.new("Frame")

Main.Name = "Main"
Main.Parent = dawidlib
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.5, 0, 0.498903513, 0)
Main.Size = UDim2.new(0, 541, 0, 368)
Main.BorderSizePixel = 0

MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Name = "MainCorner"
MainCorner.Parent = Main

LeftFrame.Name = "LeftFrame"
LeftFrame.Parent = Main
LeftFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
LeftFrame.Position = UDim2.new(-0.00047751033, 0, 0, 0)
LeftFrame.Size = UDim2.new(0, 162, 0, 368)

LeftFrame1.Name = "LeftFrame1"
LeftFrame1.Parent = LeftFrame
LeftFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
LeftFrame1.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
LeftFrame1.BorderSizePixel = 0
LeftFrame1.Position = UDim2.new(0.971977353, 0, 0.500343084, 0)
LeftFrame1.Size = UDim2.new(0, 9, 1, 0)

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = LeftFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(244, 96, 86)
CloseBtn.Position = UDim2.new(0.126000002, 0, 0.0649999976, 0)
CloseBtn.Size = UDim2.new(0, 13, 0, 13)
CloseBtn.AutoButtonColor = false
CloseBtn.Font = Enum.Font.SourceSans
CloseBtn.Text = ""
CloseBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseBtn.TextSize = 14.000

CloseBtnCorner.CornerRadius = UDim.new(1, 0)
CloseBtnCorner.Name = "CloseBtnCorner"
CloseBtnCorner.Parent = CloseBtn

CloseBtnImg.Name = "CloseBtnImg"
CloseBtnImg.Parent = CloseBtn
CloseBtnImg.BackgroundColor3 = Color3.fromRGB(244, 96, 86)
CloseBtnImg.BackgroundTransparency = 1.000
CloseBtnImg.Position = UDim2.new(0.144999996, 0, 0.144999996, 0)
CloseBtnImg.Size = UDim2.new(0, 9, 0, 9)
CloseBtnImg.Image = "http://www.roblox.com/asset/?id=6031094678"
CloseBtnImg.ImageColor3 = Color3.fromRGB(170, 65, 60)
CloseBtnImg.ImageTransparency = 1.000

DragFrame.Name = "DragFrame"
DragFrame.Parent = LeftFrame
DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DragFrame.BackgroundTransparency = 1.000
DragFrame.Size = UDim2.new(0, 161, 0, 36)

TabHold.Name = "TabHold"
TabHold.Parent = LeftFrame
TabHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabHold.BackgroundTransparency = 1.000
TabHold.Position = UDim2.new(0.063000001, 0, 0.119999997, 0)
TabHold.Size = UDim2.new(0, 143, 0, 313)

TabHoldLayout.Name = "TabHoldLayout"
TabHoldLayout.Parent = TabHold
TabHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabHoldLayout.Padding = UDim.new(0, 4)

Line.Name = "Line"
Line.Parent = LeftFrame
Line.BackgroundColor3 = Color3.fromRGB(228, 228, 228)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0.9941926, 0, 0.000451792846, 0)
Line.Size = UDim2.new(0, 2, 0, 368)

LeftFrameCorner.CornerRadius = UDim.new(0, 10)
LeftFrameCorner.Name = "LeftFrameCorner"
LeftFrameCorner.Parent = LeftFrame

TabFolder.Name = "TabFolder"
TabFolder.Parent = LeftFrame

MakeDraggable(DragFrame,Main)
loadwatermark()

CloseBtn.MouseButton1Click:Connect(function()
Main:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
end)

CloseBtn.MouseEnter:Connect(function()
CloseBtnImg.ImageTransparency = 0
end)

CloseBtn.MouseLeave:Connect(function()
CloseBtnImg.ImageTransparency = 1
end)

coroutine.wrap(
function()
while wait() do
Main.BackgroundColor3 = themes[selectedtheme].Color1
LeftFrame.BackgroundColor3 = themes[selectedtheme].Color2
LeftFrame1.BackgroundColor3 = themes[selectedtheme].Color2
Line.BackgroundColor3 = themes[selectedtheme].Color3
end
end
)()


function lib:Notification(text,desc,icotext,btntext)
local NotificationHold = Instance.new("TextButton")
local NotificationHoldCorner = Instance.new("UICorner")
local Notification = Instance.new("Frame")
local NotificationTitle = Instance.new("TextLabel")
local NotificationCorner = Instance.new("UICorner")
local NotificationIco = Instance.new("ImageLabel")
local NotificationBtn = Instance.new("TextButton")
local NotificationBtnCorner = Instance.new("UICorner")
local NotificationDesc = Instance.new("TextLabel")
local NotificationHoldScale = Instance.new("UIScale")

NotificationHold.Name = "NotificationHold"
NotificationHold.Parent = Main
NotificationHold.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NotificationHold.BackgroundTransparency = 1.000
NotificationHold.Position = UDim2.new(0, 0, 8.2928203e-08, 0)
NotificationHold.Size = UDim2.new(1, 29, 1, 20)
NotificationHold.AutoButtonColor = false
NotificationHold.Font = Enum.Font.SourceSans
NotificationHold.Text = ""
NotificationHold.TextColor3 = Color3.fromRGB(0, 0, 0)
NotificationHold.TextSize = 14.000

NotificationHoldCorner.CornerRadius = UDim.new(0, 10)
NotificationHoldCorner.Name = "NotificationHoldCorner"
NotificationHoldCorner.Parent = NotificationHold

Notification.Name = "Notification"
Notification.Parent = NotificationHold
Notification.AnchorPoint = Vector2.new(0.5, 0.5)
Notification.BackgroundColor3 = themes[selectedtheme].Color1
Notification.BackgroundTransparency = 1.000
Notification.Position = UDim2.new(0.5, 0, 0.5, 0)
Notification.Selectable = true
Notification.Size = UDim2.new(0, 142, 0, 179)

NotificationTitle.Name = "NotificationTitle"
NotificationTitle.Parent = Notification
NotificationTitle.BackgroundColor3 = themes[selectedtheme].TextColor
NotificationTitle.BackgroundTransparency = 1.000
NotificationTitle.Position = UDim2.new(0, 0, 0.5, -17)
NotificationTitle.Size = UDim2.new(1, 0, 0, 15)
NotificationTitle.Font = Enum.Font.GothamSemibold
NotificationTitle.Text = text
NotificationTitle.TextColor3 = themes[selectedtheme].TextColor
NotificationTitle.TextSize = 16.000
NotificationTitle.TextTransparency = 1.000

NotificationCorner.CornerRadius = UDim.new(0, 7)
NotificationCorner.Name = "NotificationCorner"
NotificationCorner.Parent = Notification

NotificationIco.Name = "NotificationIco"
NotificationIco.Parent = Notification
NotificationIco.AnchorPoint = Vector2.new(0.5, 0.5)
NotificationIco.BackgroundTransparency = 1.000
NotificationIco.BorderSizePixel = 0
NotificationIco.Position = UDim2.new(0.5, 0, 0.5, -55)
NotificationIco.Size = UDim2.new(0, 60, 0, 60)
NotificationIco.Image = icotext
NotificationIco.ImageColor3 = Color3.fromRGB(31, 118, 219)
NotificationIco.ImageTransparency = 1.000

NotificationBtn.Name = "NotificationBtn"
NotificationBtn.Parent = Notification
NotificationBtn.AnchorPoint = Vector2.new(0.5, 0.5)
NotificationBtn.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
NotificationBtn.BackgroundTransparency = 1.000
NotificationBtn.Position = UDim2.new(0.5, 0, 0.5, 78)
NotificationBtn.Size = UDim2.new(0, 150, 0, 28)
NotificationBtn.Font = Enum.Font.Gotham
NotificationBtn.Text = btntext
NotificationBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationBtn.TextSize = 14.000
NotificationBtn.TextTransparency = 1.000
NotificationBtn.AutoButtonColor = false

NotificationBtnCorner.CornerRadius = UDim.new(0, 5)
NotificationBtnCorner.Name = "NotificationBtnCorner"
NotificationBtnCorner.Parent = NotificationBtn

NotificationDesc.Name = "NotificationDesc"
NotificationDesc.Parent = Notification
NotificationDesc.AnchorPoint = Vector2.new(0.5, 0.5)
NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationDesc.BackgroundTransparency = 1.000
NotificationDesc.Position = UDim2.new(0.5, 0, 0.458999991, 38)
NotificationDesc.Size = UDim2.new(1.01365006, -25, 0.168424815, 25)
NotificationDesc.Font = Enum.Font.Gotham
NotificationDesc.Text = desc
NotificationDesc.TextColor3 = themes[selectedtheme].TextColor
NotificationDesc.TextSize = 14.000
NotificationDesc.TextTransparency = 1.000
NotificationDesc.TextWrapped = true

NotificationHoldScale.Name = "NotificationHoldScale"
NotificationHoldScale.Parent = NotificationHold
NotificationHoldScale.Scale = 0.950

TweenService:Create(
NotificationHold,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0.7}
):Play()
wait(.2)
Notification:TweenSize(UDim2.new(0, 172, 0, 209), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
TweenService:Create(
NotificationIco,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{ImageTransparency = 0}
):Play()
TweenService:Create(
Notification,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0}
):Play()
TweenService:Create(
NotificationBtn,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0}
):Play()
TweenService:Create(
NotificationDesc,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 0}
):Play()
TweenService:Create(
NotificationBtn,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 0}
):Play()
TweenService:Create(
NotificationTitle,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 0}
):Play()

NotificationBtn.MouseButton1Click:Connect(function()
Notification:TweenSize(UDim2.new(0, 142, 0, 179), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
TweenService:Create(
NotificationIco,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{ImageTransparency = 1}
):Play()
TweenService:Create(
Notification,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 1}
):Play()
TweenService:Create(
NotificationBtn,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 1}
):Play()
TweenService:Create(
NotificationDesc,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 1}
):Play()
TweenService:Create(
NotificationBtn,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 1}
):Play()
TweenService:Create(
NotificationTitle,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 1}
):Play()
wait(.2)
TweenService:Create(
NotificationHold,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 1}
):Play()	
wait(.2)
NotificationHold:Destroy()
end)
end


local tabhold = {}

function tabhold:Label(text)
local labelfunc = {}
local LabelFrame = Instance.new("Frame")
local Label = Instance.new("TextLabel")

LabelFrame.Name = "LabelFrame"
LabelFrame.Parent = TabHold
LabelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LabelFrame.BackgroundTransparency = 1.000
LabelFrame.Size = UDim2.new(0, 70, 0, 17)

Label.Name = "Label"
Label.Parent = LabelFrame
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Position = UDim2.new(0.139885604, 0, 0, 0)
Label.Size = UDim2.new(0, 134, 0, 17)
Label.Font = Enum.Font.GothamSemibold
Label.Text = text
Label.TextColor3 = Color3.fromRGB(182, 182, 182)
Label.TextSize = 12.000
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.TextYAlignment = Enum.TextYAlignment.Bottom
function labelfunc:Change(tochange)
Label.Text = tochange
end
return labelfunc
end

function tabhold:Tab(text, img, color)
local TabBtn = Instance.new("TextButton")
local TabBtnCorner = Instance.new("UICorner")
local TabBtnTitle = Instance.new("TextLabel")
local TabBtnIco = Instance.new("ImageLabel")

TabBtn.Name = "TabBtn"
TabBtn.Parent = TabHold
TabBtn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
TabBtn.BackgroundTransparency = 1.000
TabBtn.Position = UDim2.new(0, 0, 0.0849673226, 0)
TabBtn.Size = UDim2.new(0, 143, 0, 26)
TabBtn.AutoButtonColor = false
TabBtn.Font = Enum.Font.SourceSans
TabBtn.Text = ""
TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
TabBtn.TextSize = 14.000

TabBtnCorner.CornerRadius = UDim.new(0, 6)
TabBtnCorner.Name = "TabBtnCorner"
TabBtnCorner.Parent = TabBtn

TabBtnTitle.Name = "TabBtnTitle"
TabBtnTitle.Parent = TabBtn
TabBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabBtnTitle.BackgroundTransparency = 1.000
TabBtnTitle.Position = UDim2.new(0.170713201, 0, 0, 0)
TabBtnTitle.Size = UDim2.new(0, 116, 0, 26)
TabBtnTitle.Font = Enum.Font.Gotham
TabBtnTitle.Text = text
TabBtnTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
TabBtnTitle.TextSize = 13.000
TabBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

TabBtnIco.Name = "TabBtnIco"
TabBtnIco.Parent = TabBtn
TabBtnIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabBtnIco.BackgroundTransparency = 1.000
TabBtnIco.Position = UDim2.new(0.0120000001, 3, 0.170000002, 0)
TabBtnIco.Size = UDim2.new(0, 17, 0, 17)
TabBtnIco.Image = img
TabBtnIco.ImageColor3 = color

local Tab = Instance.new("ScrollingFrame")
local TabLayout = Instance.new("UIListLayout")

Tab.Name = "Tab"
Tab.Parent = TabFolder
Tab.Active = true
Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tab.BackgroundTransparency = 1.000
Tab.BorderSizePixel = 0
Tab.Position = UDim2.new(1.09876585, 0, 0.0461956523, 0)
Tab.Size = UDim2.new(0, 352, 0, 335)
Tab.CanvasSize = UDim2.new(0, 0, 0, 0)
Tab.ScrollBarThickness = 5
Tab.Visible = false
Tab.ScrollBarImageColor3 = Color3.fromRGB(213, 213, 213)

TabLayout.Name = "TabLayout"
TabLayout.Parent = Tab
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 8)

if fs == false then
fs = true
TabBtn.BackgroundTransparency = 0
Tab.Visible = true
end

TabBtn.MouseButton1Click:Connect(function()
for i,v in next, TabFolder:GetChildren() do
if v.Name == "Tab" then
v.Visible = false
end
Tab.Visible = true
end	
for i,v in next, TabHold:GetChildren() do
if v.Name == "TabBtn" then
v.BackgroundTransparency = 1
TabBtn.BackgroundTransparency = 0
end
end	
end)

coroutine.wrap(
function()
while wait() do
TabBtn.BackgroundColor3 = themes[selectedtheme].TabColor
TabBtnTitle.TextColor3 = themes[selectedtheme].TextColor
Tab.ScrollBarImageColor3 = themes[selectedtheme].ScrollBar
end
end
)()
local tabcontent = {}
function tabcontent:Line(text)
local Line = Instance.new("TextLabel")

Line.Name = "Line"
Line.Parent = Tab
Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line.BackgroundTransparency = 1.000
Line.Size = UDim2.new(1, 0, 0, 13)
Line.Font = Enum.Font.GothamSemibold
Line.Text = text
Line.TextColor3 = Color3.fromRGB(0, 0, 0)
Line.TextSize = 14.000
Line.TextXAlignment = Enum.TextXAlignment.Left

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

coroutine.wrap(
function()
while wait() do
Line.TextColor3= themes[selectedtheme].TextColor
end
end
)()
end
function tabcontent:Label(text)
local Label = Instance.new("TextLabel")

Label.Name = "Label"
Label.Parent = Tab
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(1, 0, 0, 13)
Label.Font = Enum.Font.Gotham
Label.Text = text
Label.TextColor3 = Color3.fromRGB(0, 0, 0)
Label.TextSize = 14.000

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

coroutine.wrap(
function()
while wait() do
Label.TextColor3= themes[selectedtheme].TextColor
end
end
)()
end
function tabcontent:Button(text, callback)
local hovering = false
local Button = Instance.new("TextButton")
local ButtonFrame = Instance.new("Frame")
local ButtonFrameCorner = Instance.new("UICorner")
local ButtonCorner = Instance.new("UICorner")
local ButtonHoverFrame = Instance.new("Frame")
local ButtonHoverFrameCorner = Instance.new("UICorner")
local ButtonText = Instance.new("TextLabel")

Button.Name = "Button"
Button.Parent = Tab
Button.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Button.BorderSizePixel = 0
Button.AutoButtonColor = false
Button.Font = Enum.Font.Gotham
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextSize = 14.000

ButtonFrame.Name = "ButtonFrame"
ButtonFrame.Parent = Button
ButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonFrame.BorderSizePixel = 0
ButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ButtonFrame.Size = UDim2.new(1, -4, 0, 21)

ButtonFrameCorner.CornerRadius = UDim.new(0, 5)
ButtonFrameCorner.Name = "ButtonFrameCorner"
ButtonFrameCorner.Parent = ButtonFrame

ButtonCorner.CornerRadius = UDim.new(0, 5)
ButtonCorner.Name = "ButtonCorner"
ButtonCorner.Parent = Button

ButtonHoverFrame.Name = "ButtonHoverFrame"
ButtonHoverFrame.Parent = Button
ButtonHoverFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ButtonHoverFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
ButtonHoverFrame.BackgroundTransparency = 1.000
ButtonHoverFrame.BorderSizePixel = 0
ButtonHoverFrame.Position = UDim2.new(0.5, 0, 0.528750002, 0)
ButtonHoverFrame.Size = UDim2.new(1, 0, 0, 25)

ButtonHoverFrameCorner.CornerRadius = UDim.new(0, 5)
ButtonHoverFrameCorner.Name = "ButtonHoverFrameCorner"
ButtonHoverFrameCorner.Parent = ButtonHoverFrame

ButtonText.Name = "ButtonText"
ButtonText.Parent = Button
ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonText.BackgroundTransparency = 1.000
ButtonText.Size = UDim2.new(1, 0, 1, 0)
ButtonText.Font = Enum.Font.Gotham
ButtonText.Text = text
ButtonText.TextColor3 = Color3.fromRGB(0, 0, 0)
ButtonText.TextSize = 14.000

coroutine.wrap(
function()
while wait() do
Button.BackgroundColor3 = themes[selectedtheme].Color2
ButtonFrame.BackgroundColor3 = themes[selectedtheme].Color1
if hovering == false then
ButtonText.TextColor3 = themes[selectedtheme].TextColor
end
end
end
)()

Button.MouseEnter:Connect(function()
hovering = true
ButtonHoverFrame.BackgroundTransparency = 0
ButtonText.TextColor3 = Color3.fromRGB(255,255,255)
end)

Button.MouseLeave:Connect(function()
hovering = false
ButtonHoverFrame.BackgroundTransparency = 1
ButtonText.TextColor3 = themes[selectedtheme].TextColor
end)

Button.MouseButton1Click:Connect(function()
pcall(callback)
end)

Button.Size = UDim2.new(0, ButtonText.TextBounds.X + 20, 0, 25)

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
end
function tabcontent:Toggle(text, default, callback)
local toggled = false
local Toggle = Instance.new("TextButton")
local ToggleFrame = Instance.new("Frame")
local ToggleFrameCorner = Instance.new("UICorner")
local ToggleFrame1 = Instance.new("Frame")
local ToggleFrame1Corner = Instance.new("UICorner")
local ToggleFrame2 = Instance.new("Frame")
local ToggleFrame2Corner = Instance.new("UICorner")
local ToggleToggledFrame = Instance.new("Frame")
local ToggleToggledFrameCorner = Instance.new("UICorner")
local ToggleTick = Instance.new("ImageLabel")
local ToggleText = Instance.new("TextLabel")

Toggle.Name = "Toggle"
Toggle.Parent = Tab
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundTransparency = 1.000
Toggle.Position = UDim2.new(0.394886374, 0, 0.0925373137, 0)
Toggle.Size = UDim2.new(0, 71, 0, 16)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = ""
Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle.TextSize = 14.000

ToggleFrame.Name = "ToggleFrame"
ToggleFrame.Parent = Toggle
ToggleFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ToggleFrame.Size = UDim2.new(0, 16, 0, 16)

ToggleFrameCorner.CornerRadius = UDim.new(0, 5)
ToggleFrameCorner.Name = "ToggleFrameCorner"
ToggleFrameCorner.Parent = ToggleFrame

ToggleFrame1.Name = "ToggleFrame1"
ToggleFrame1.Parent = ToggleFrame
ToggleFrame1.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ToggleFrame1.Size = UDim2.new(0, 16, 0, 16)

ToggleFrame1Corner.CornerRadius = UDim.new(0, 5)
ToggleFrame1Corner.Name = "ToggleFrame1Corner"
ToggleFrame1Corner.Parent = ToggleFrame1

ToggleFrame2.Name = "ToggleFrame2"
ToggleFrame2.Parent = ToggleFrame1
ToggleFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
ToggleFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
ToggleFrame2.Size = UDim2.new(0, 12, 0, 12)

ToggleFrame2Corner.CornerRadius = UDim.new(0, 3)
ToggleFrame2Corner.Name = "ToggleFrame2Corner"
ToggleFrame2Corner.Parent = ToggleFrame2

ToggleToggledFrame.Name = "ToggleToggledFrame"
ToggleToggledFrame.Parent = ToggleFrame
ToggleToggledFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
ToggleToggledFrame.Position = UDim2.new(0, 0, 0, 0)
ToggleToggledFrame.Size = UDim2.new(0, 16, 0, 16)
ToggleToggledFrame.Visible = false

ToggleToggledFrameCorner.CornerRadius = UDim.new(0, 5)
ToggleToggledFrameCorner.Name = "ToggleToggledFrameCorner"
ToggleToggledFrameCorner.Parent = ToggleToggledFrame

ToggleTick.Name = "ToggleTick"
ToggleTick.Parent = ToggleToggledFrame
ToggleTick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleTick.BackgroundTransparency = 1.000
ToggleTick.Position = UDim2.new(0.0500000007, 0, 0, 1)
ToggleTick.Size = UDim2.new(0, 13, 0, 13)
ToggleTick.Image = "http://www.roblox.com/asset/?id=6031094667"

ToggleText.Name = "ToggleText"
ToggleText.Parent = Toggle
ToggleText.AnchorPoint = Vector2.new(1, 1)
ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleText.BackgroundTransparency = 1.000
ToggleText.Position = UDim2.new(1, 0, 1, 0)
ToggleText.Size = UDim2.new(1, -23, 1, 0)
ToggleText.Font = Enum.Font.Gotham
ToggleText.Text = text
ToggleText.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleText.TextSize = 14.000
ToggleText.TextXAlignment = Enum.TextXAlignment.Left

Toggle.MouseButton1Click:Connect(function()
if toggled == false then
ToggleToggledFrame.Visible = true
else
ToggleToggledFrame.Visible = false
end
toggled = not toggled
pcall(callback, toggled)
end)

coroutine.wrap(
function()
while wait() do
ToggleFrame.BackgroundColor3 = themes[selectedtheme].Color2
ToggleFrame1.BackgroundColor3 = themes[selectedtheme].Color2
ToggleFrame2.BackgroundColor3 = themes[selectedtheme].Color1
ToggleText.TextColor3 = themes[selectedtheme].TextColor
end
end
)()

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
end
function tabcontent:Slider(text,precise, min, max, start, callback)
local sliderfunc = {}
local dragging = false
local Slider = Instance.new("Frame")
local SliderText = Instance.new("TextLabel")
local SliderFrame = Instance.new("Frame")
local SliderFrameCorner = Instance.new("UICorner")
local SlideCurrent = Instance.new("Frame")
local SlideCurrentCorner = Instance.new("UICorner")
local SlideCircle = Instance.new("Frame")
local SlideCircleCorner = Instance.new("UICorner")
local SlideCircle1 = Instance.new("Frame")
local SlideCircle1Corner = Instance.new("UICorner")
local ValueFrame = Instance.new("Frame")
local ValueFrameCorner = Instance.new("UICorner")
local ValueText = Instance.new("TextLabel")

Slider.Name = "Slider"
Slider.Parent = Tab
Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider.BackgroundTransparency = 1.000
Slider.Position = UDim2.new(0.264204532, 0, 0.158208951, 0)
Slider.Size = UDim2.new(0, 148, 0, 65)

SliderText.Name = "SliderText"
SliderText.Parent = Slider
SliderText.AnchorPoint = Vector2.new(1, 1)
SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderText.BackgroundTransparency = 1.000
SliderText.Position = UDim2.new(0.999999166, 0, 0.33968538, 0)
SliderText.Size = UDim2.new(1.16142857, -23, 0.339685708, 0)
SliderText.Font = Enum.Font.Gotham
SliderText.Text = text
SliderText.TextColor3 = Color3.fromRGB(0, 0, 0)
SliderText.TextSize = 14.000
SliderText.TextXAlignment = Enum.TextXAlignment.Left

SliderFrame.Name = "SliderFrame"
SliderFrame.Parent = Slider
SliderFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
SliderFrame.Position = UDim2.new(-0.00675675692, 0, 0.477616459, 0)
SliderFrame.Size = UDim2.new(0, 148, 0, 5)

SliderFrameCorner.CornerRadius = UDim.new(0, 15)
SliderFrameCorner.Name = "SliderFrameCorner"
SliderFrameCorner.Parent = SliderFrame

SlideCurrent.Name = "SlideCurrent"
SlideCurrent.Parent = SliderFrame
SlideCurrent.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
SlideCurrent.BorderSizePixel = 0
SlideCurrent.Position = UDim2.new(-0.0001257658, 0, -0.0184065104, 0)
SlideCurrent.Size = UDim2.new((start or 0) / max, 0, 0, 5)

SlideCurrentCorner.CornerRadius = UDim.new(0, 15)
SlideCurrentCorner.Name = "SlideCurrentCorner"
SlideCurrentCorner.Parent = SlideCurrent

SlideCircle.Name = "SlideCircle"
SlideCircle.Parent = SliderFrame
SlideCircle.BackgroundColor3 = Color3.fromRGB(181, 181, 181)
SlideCircle.Position = UDim2.new((start or 0)/max, -6,-1.5, 0)
SlideCircle.Size = UDim2.new(0, 22, 0, 22)

SlideCircleCorner.CornerRadius = UDim.new(1, 0)
SlideCircleCorner.Name = "SlideCircleCorner"
SlideCircleCorner.Parent = SlideCircle

SlideCircle1.Name = "SlideCircle1"
SlideCircle1.Parent = SlideCircle
SlideCircle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SlideCircle1.Position = UDim2.new(0.0450000018, 0, 0.0410000011, 0)
SlideCircle1.Size = UDim2.new(0, 20, 0, 20)

SlideCircle1Corner.CornerRadius = UDim.new(1, 0)
SlideCircle1Corner.Name = "SlideCircle1Corner"
SlideCircle1Corner.Parent = SlideCircle1

ValueFrame.Name = "ValueFrame"
ValueFrame.Parent = Slider
ValueFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ValueFrame.Position = UDim2.new(0, 0, 0.769924223, 0)
ValueFrame.Size = UDim2.new(0, 45, 0, 14)

ValueFrameCorner.CornerRadius = UDim.new(0, 3)
ValueFrameCorner.Name = "ValueFrameCorner"
ValueFrameCorner.Parent = ValueFrame

ValueText.Name = "ValueText"
ValueText.Parent = ValueFrame
ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ValueText.BackgroundTransparency = 1.000
ValueText.Size = UDim2.new(1, 0, 0, 14)
ValueText.Font = Enum.Font.GothamSemibold
ValueText.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
ValueText.TextColor3 = Color3.fromRGB(182, 182, 182)
ValueText.TextSize = 11.000

local function move(input)
local pos =
UDim2.new(
math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
-6,
-1.5,
0
)
local pos1 =
UDim2.new(
math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
0,
0,
5
)
SlideCurrent.Size = pos1
SlideCircle.Position = pos
local size = math.clamp(Mouse.X - SlideCurrent.AbsolutePosition.X, 0, 148)
local percent = size / 148

local val = math.floor((min + (max- min) * percent) * 10) / 10
if precise == true then
ValueText.Text = tostring(math.ceil(val))
else
ValueText.Text = tostring(val)
end

pcall(callback, val)
end
SlideCircle.InputBegan:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = true
end
end
)
SlideCircle.InputEnded:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = false
end
end
)
game:GetService("UserInputService").InputChanged:Connect(function(input)
if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
move(input)
end
end)

function sliderfunc:Change(val)
ValueText.Text = tostring(val and math.floor((val / max) * (max - min) + min) or 0)
SlideCircle.Position = UDim2.new((val or 0)/max, -6,-1.5, 0)
SlideCurrent.Size = UDim2.new((val or 0) / max, 0, 0, 5)
end

coroutine.wrap(
function()
while wait() do
ValueFrame.BackgroundColor3 = themes[selectedtheme].Color2
SliderFrame.BackgroundColor3 = themes[selectedtheme].Color2
SlideCircle.BackgroundColor3 = themes[selectedtheme].Color3
SlideCircle1.BackgroundColor3 = themes[selectedtheme].Color1
SliderText.TextColor3 = themes[selectedtheme].TextColor
end
end
)()

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
return sliderfunc 
end
function tabcontent:SlidersHorizontal()
local SlidersHorizontal = Instance.new("Frame")
local SlidersHorizontalLayout = Instance.new("UIListLayout")

SlidersHorizontal.Name = "SlidersHorizontal"
SlidersHorizontal.Parent = Tab
SlidersHorizontal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SlidersHorizontal.BackgroundTransparency = 1.000
SlidersHorizontal.Position = UDim2.new(1.35802472, 0, 0.364130437, 0)
SlidersHorizontal.Size = UDim2.new(1, 0, 0, 65)

SlidersHorizontalLayout.Name = "SlidersHorizontalLayout"
SlidersHorizontalLayout.Parent = SlidersHorizontal
SlidersHorizontalLayout.FillDirection = Enum.FillDirection.Horizontal
SlidersHorizontalLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SlidersHorizontalLayout.SortOrder = Enum.SortOrder.LayoutOrder
SlidersHorizontalLayout.Padding = UDim.new(0, 25)

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
local SlidersHorizontalHold = {}
function SlidersHorizontalHold:Slider(text,precise, min, max, start, callback)
local sliderfunc = {}
local dragging = false
local Slider = Instance.new("Frame")
local SliderText = Instance.new("TextLabel")
local SliderFrame = Instance.new("Frame")
local SliderFrameCorner = Instance.new("UICorner")
local SlideCurrent = Instance.new("Frame")
local SlideCurrentCorner = Instance.new("UICorner")
local SlideCircle = Instance.new("Frame")
local SlideCircleCorner = Instance.new("UICorner")
local SlideCircle1 = Instance.new("Frame")
local SlideCircle1Corner = Instance.new("UICorner")
local ValueFrame = Instance.new("Frame")
local ValueFrameCorner = Instance.new("UICorner")
local ValueText = Instance.new("TextLabel")

Slider.Name = "Slider"
Slider.Parent = SlidersHorizontal
Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider.BackgroundTransparency = 1.000
Slider.Position = UDim2.new(0.264204532, 0, 0.158208951, 0)
Slider.Size = UDim2.new(0, 148, 0, 65)

SliderText.Name = "SliderText"
SliderText.Parent = Slider
SliderText.AnchorPoint = Vector2.new(1, 1)
SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderText.BackgroundTransparency = 1.000
SliderText.Position = UDim2.new(0.999999166, 0, 0.33968538, 0)
SliderText.Size = UDim2.new(1.16142857, -23, 0.339685708, 0)
SliderText.Font = Enum.Font.Gotham
SliderText.Text = text
SliderText.TextColor3 = Color3.fromRGB(0, 0, 0)
SliderText.TextSize = 14.000
SliderText.TextXAlignment = Enum.TextXAlignment.Left

SliderFrame.Name = "SliderFrame"
SliderFrame.Parent = Slider
SliderFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
SliderFrame.Position = UDim2.new(-0.00675675692, 0, 0.477616459, 0)
SliderFrame.Size = UDim2.new(0, 148, 0, 5)

SliderFrameCorner.CornerRadius = UDim.new(0, 15)
SliderFrameCorner.Name = "SliderFrameCorner"
SliderFrameCorner.Parent = SliderFrame

SlideCurrent.Name = "SlideCurrent"
SlideCurrent.Parent = SliderFrame
SlideCurrent.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
SlideCurrent.BorderSizePixel = 0
SlideCurrent.Position = UDim2.new(-0.0001257658, 0, -0.0184065104, 0)
SlideCurrent.Size = UDim2.new((start or 0) / max, 0, 0, 5)

SlideCurrentCorner.CornerRadius = UDim.new(0, 15)
SlideCurrentCorner.Name = "SlideCurrentCorner"
SlideCurrentCorner.Parent = SlideCurrent

SlideCircle.Name = "SlideCircle"
SlideCircle.Parent = SliderFrame
SlideCircle.BackgroundColor3 = Color3.fromRGB(181, 181, 181)
SlideCircle.Position = UDim2.new((start or 0)/max, -6,-1.5, 0)
SlideCircle.Size = UDim2.new(0, 22, 0, 22)

SlideCircleCorner.CornerRadius = UDim.new(1, 0)
SlideCircleCorner.Name = "SlideCircleCorner"
SlideCircleCorner.Parent = SlideCircle

SlideCircle1.Name = "SlideCircle1"
SlideCircle1.Parent = SlideCircle
SlideCircle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SlideCircle1.Position = UDim2.new(0.0450000018, 0, 0.0410000011, 0)
SlideCircle1.Size = UDim2.new(0, 20, 0, 20)

SlideCircle1Corner.CornerRadius = UDim.new(1, 0)
SlideCircle1Corner.Name = "SlideCircle1Corner"
SlideCircle1Corner.Parent = SlideCircle1

ValueFrame.Name = "ValueFrame"
ValueFrame.Parent = Slider
ValueFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ValueFrame.Position = UDim2.new(0, 0, 0.769924223, 0)
ValueFrame.Size = UDim2.new(0, 45, 0, 14)

ValueFrameCorner.CornerRadius = UDim.new(0, 3)
ValueFrameCorner.Name = "ValueFrameCorner"
ValueFrameCorner.Parent = ValueFrame

ValueText.Name = "ValueText"
ValueText.Parent = ValueFrame
ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ValueText.BackgroundTransparency = 1.000
ValueText.Size = UDim2.new(1, 0, 0, 14)
ValueText.Font = Enum.Font.GothamSemibold
ValueText.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
ValueText.TextColor3 = Color3.fromRGB(182, 182, 182)
ValueText.TextSize = 11.000

local function move(input)
local pos =
UDim2.new(
math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
-1,
-1.5,
0
)
local pos1 =
UDim2.new(
math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
0,
0,
5
)
SlideCurrent.Size = pos1
SlideCircle.Position = pos
local size = math.clamp(Mouse.X - SlideCurrent.AbsolutePosition.X, 0, 148)
local percent = size / 148

local val = math.floor((min + (max- min) * percent) * 10) / 10
if precise == true then
ValueText.Text = tostring(math.ceil(val))
else
ValueText.Text = tostring(val)
end

pcall(callback, val)
end
SlideCircle.InputBegan:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = true
end
end
)
SlideCircle.InputEnded:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = false
end
end
)
game:GetService("UserInputService").InputChanged:Connect(function(input)
if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
move(input)
end
end)

function sliderfunc:Change(val)
ValueText.Text = tostring(val and math.floor((val / max) * (max - min) + min) or 0)
SlideCircle.Position = UDim2.new((val or 0)/max, -6,-1.5, 0)
SlideCurrent.Size = UDim2.new((val or 0) / max, 0, 0, 5)
end


coroutine.wrap(
function()
while wait() do
ValueFrame.BackgroundColor3 = themes[selectedtheme].Color2
SliderFrame.BackgroundColor3 = themes[selectedtheme].Color2
SlideCircle.BackgroundColor3 = themes[selectedtheme].Color3
SlideCircle1.BackgroundColor3 = themes[selectedtheme].Color1
SliderText.TextColor3 = themes[selectedtheme].TextColor
end
end
)()
return sliderfunc 
end
return SlidersHorizontalHold
end
function tabcontent:Dropdown(text, list, callback)
local dropfunc = {}
local ItemCount = 0
local DropToggled = false
local Dropdown = Instance.new("Frame")
local DropdownBtn = Instance.new("TextButton")
local DropdownFrameOutline = Instance.new("Frame")
local DropdownFrameOutlineCorner = Instance.new("UICorner")
local DropdownFrame = Instance.new("Frame")
local DropdownFrameCorner = Instance.new("UICorner")
local DropdownIcoFrame = Instance.new("Frame")
local DropdownIcoFrameCorner = Instance.new("UICorner")
local DropdownIco = Instance.new("ImageLabel")
local DropdownText = Instance.new("TextLabel")
local DropdownFrameMainOutline = Instance.new("Frame")
local DropdownFrameMainOutlineCorner = Instance.new("UICorner")
local DropdownFrameMain = Instance.new("Frame")
local DropdownFrameMainCorner = Instance.new("UICorner")
local DropdownMainScrollFrame = Instance.new("ScrollingFrame")
local DropdownMainScrollFrameLayout = Instance.new("UIListLayout")
local DropdownTitle = Instance.new("TextLabel")
local DropdownMainHold = Instance.new("Frame")


Dropdown.Name = "Dropdown"
Dropdown.Parent = Tab
Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dropdown.BackgroundTransparency = 1.000
Dropdown.Position = UDim2.new(0.220833331, 0, 0.260726064, 0)
Dropdown.Size = UDim2.new(0, 171, 0, 25)

DropdownBtn.Name = "DropdownBtn"
DropdownBtn.Parent = Dropdown
DropdownBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownBtn.BackgroundTransparency = 1.000
DropdownBtn.Position = UDim2.new(0.257309943, 0, 0, 0)
DropdownBtn.Size = UDim2.new(0, 170, 0, 25)
DropdownBtn.Font = Enum.Font.SourceSans
DropdownBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
DropdownBtn.TextSize = 14.000

DropdownMainHold.Name = "DropdownBtn"
DropdownMainHold.Parent = Tab
DropdownMainHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownMainHold.BackgroundTransparency = 1.000
DropdownMainHold.Position = UDim2.new(0.257309943, 0, 0, 0)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 25)
DropdownMainHold.Visible = false

DropdownFrameOutline.Name = "DropdownFrameOutline"
DropdownFrameOutline.Parent = DropdownBtn
DropdownFrameOutline.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
DropdownFrameOutline.Position = UDim2.new(0, 0, -0.00300000003, 0)
DropdownFrameOutline.Size = UDim2.new(0, 171, 0, 25)

DropdownFrameOutlineCorner.CornerRadius = UDim.new(0, 5)
DropdownFrameOutlineCorner.Name = "DropdownFrameOutlineCorner"
DropdownFrameOutlineCorner.Parent = DropdownFrameOutline

DropdownFrame.Name = "DropdownFrame"
DropdownFrame.Parent = DropdownFrameOutline
DropdownFrame.AnchorPoint = Vector2.new(0.5, 0.5)
DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownFrame.BorderSizePixel = 0
DropdownFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
DropdownFrame.Size = UDim2.new(1, -4, 0, 21)

DropdownFrameCorner.CornerRadius = UDim.new(0, 5)
DropdownFrameCorner.Name = "DropdownFrameCorner"
DropdownFrameCorner.Parent = DropdownFrame

DropdownIcoFrame.Name = "DropdownIcoFrame"
DropdownIcoFrame.Parent = DropdownFrame
DropdownIcoFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
DropdownIcoFrame.Position = UDim2.new(0.884000003, 0, 0.150000006, 0)
DropdownIcoFrame.Size = UDim2.new(0, 15, 1, -6)

DropdownIcoFrameCorner.CornerRadius = UDim.new(0, 5)
DropdownIcoFrameCorner.Name = "DropdownIcoFrameCorner"
DropdownIcoFrameCorner.Parent = DropdownIcoFrame

DropdownIco.Name = "DropdownIco"
DropdownIco.Parent = DropdownIcoFrame
DropdownIco.AnchorPoint = Vector2.new(0.5, 0.5)
DropdownIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownIco.BackgroundTransparency = 1.000
DropdownIco.Position = UDim2.new(0.5, 0, 0.5, 0)
DropdownIco.Rotation = 90.000
DropdownIco.Size = UDim2.new(0, 11, 0, 11)
DropdownIco.Image = "http://www.roblox.com/asset/?id=6022668955"

DropdownText.Name = "DropdownText"
DropdownText.Parent = DropdownFrameOutline
DropdownText.AnchorPoint = Vector2.new(1, 1)
DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownText.BackgroundTransparency = 1.000
DropdownText.Position = UDim2.new(1, 0, 1, 0)
DropdownText.Size = UDim2.new(1, -7, 1.00300002, 0)
DropdownText.Font = Enum.Font.Gotham
DropdownText.Text = ""
DropdownText.TextColor3 = Color3.fromRGB(0, 0, 0)
DropdownText.TextSize = 13.000
DropdownText.TextXAlignment = Enum.TextXAlignment.Left

DropdownFrameMainOutline.Name = "DropdownFrameMainOutline"
DropdownFrameMainOutline.Parent = DropdownMainHold
DropdownFrameMainOutline.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
DropdownFrameMainOutline.Position = UDim2.new(0.257309943, 0,0, 0)
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 95)
DropdownFrameMainOutline.Visible = false

DropdownFrameMainOutlineCorner.CornerRadius = UDim.new(0, 5)
DropdownFrameMainOutlineCorner.Name = "DropdownFrameMainOutlineCorner"
DropdownFrameMainOutlineCorner.Parent = DropdownFrameMainOutline

DropdownFrameMain.Name = "DropdownFrameMain"
DropdownFrameMain.Parent = DropdownFrameMainOutline
DropdownFrameMain.AnchorPoint = Vector2.new(0.5, 0.5)
DropdownFrameMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownFrameMain.BorderSizePixel = 0
DropdownFrameMain.Position = UDim2.new(0.5, 0, 0.5, 0)
DropdownFrameMain.Size = UDim2.new(1, -4, 1, -4)

DropdownFrameMainCorner.CornerRadius = UDim.new(0, 5)
DropdownFrameMainCorner.Name = "DropdownFrameMainCorner"
DropdownFrameMainCorner.Parent = DropdownFrameMain

DropdownMainScrollFrame.Name = "DropdownMainScrollFrame"
DropdownMainScrollFrame.Parent = DropdownFrameMain
DropdownMainScrollFrame.Active = true
DropdownMainScrollFrame.AnchorPoint = Vector2.new(0.5, 0.5)
DropdownMainScrollFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownMainScrollFrame.BackgroundTransparency = 1
DropdownMainScrollFrame.BorderSizePixel = 0
DropdownMainScrollFrame.Position = UDim2.new(0.511976063, 0, 0.50300014, 0)
DropdownMainScrollFrame.Size = UDim2.new(0.0199520998, 155, 1, -13)
DropdownMainScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
DropdownMainScrollFrame.ScrollBarThickness = 3
DropdownMainScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(213, 213, 213)

DropdownMainScrollFrameLayout.Name = "DropdownMainScrollFrameLayout"
DropdownMainScrollFrameLayout.Parent = DropdownMainScrollFrame
DropdownMainScrollFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder

DropdownTitle.Name = "DropdownTitle"
DropdownTitle.Parent = Dropdown
DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownTitle.BackgroundTransparency = 1.000
DropdownTitle.BorderSizePixel = 0
DropdownTitle.Position = UDim2.new(0, 37, 0, 0)
DropdownTitle.Size = UDim2.new(0, 0, 0, 25)
DropdownTitle.Font = Enum.Font.Gotham
DropdownTitle.Text = text
DropdownTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
DropdownTitle.TextSize = 14.000
DropdownTitle.TextXAlignment = Enum.TextXAlignment.Right

DropdownBtn.MouseButton1Click:Connect(function()
if DropToggled == false then
DropdownFrameMainOutline.Visible = true
DropdownMainHold.Visible = true
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

else
DropdownFrameMainOutline.Visible = false
DropdownMainHold.Visible = false
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
end
DropToggled = not DropToggled
end)

coroutine.wrap(
function()
while wait() do
DropdownTitle.TextColor3 = themes[selectedtheme].TextColor
DropdownText.TextColor3 = themes[selectedtheme].TextColor
DropdownFrameOutline.BackgroundColor3 = themes[selectedtheme].Color2
DropdownFrame.BackgroundColor3 = themes[selectedtheme].Color1
DropdownFrameMainOutline.BackgroundColor3 = themes[selectedtheme].Color2
DropdownFrameMain.BackgroundColor3 = themes[selectedtheme].Color1
DropdownMainScrollFrame.ScrollBarImageColor3 = themes[selectedtheme].ScrollBar
end
end
)()

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
for i,v in next, list do
ItemCount = ItemCount + 1
if ItemCount == 1 then
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 43)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 43)
elseif ItemCount == 2 then
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 67)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 67)
else
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 92)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 92)
end 
local ItemBtn = Instance.new("TextButton")
local ItemBtnCorner = Instance.new("UICorner")
local ItemText = Instance.new("TextLabel")
local hovering = false

ItemBtn.Name = "ItemBtn"
ItemBtn.Parent = DropdownMainScrollFrame
ItemBtn.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
ItemBtn.Size = UDim2.new(0, 154, 0, 25)
ItemBtn.AutoButtonColor = false
ItemBtn.Font = Enum.Font.SourceSans
ItemBtn.Text = ""
ItemBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemBtn.TextSize = 14.000
ItemBtn.BackgroundTransparency = 1

ItemBtnCorner.CornerRadius = UDim.new(0, 5)
ItemBtnCorner.Name = "ItemBtnCorner"
ItemBtnCorner.Parent = ItemBtn

ItemText.Name = "ItemText"
ItemText.Parent = ItemBtn
ItemText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemText.BackgroundTransparency = 1.000
ItemText.Position = UDim2.new(0.038961038, 0, 0, 0)
ItemText.Size = UDim2.new(0, 148, 0, 25)
ItemText.Font = Enum.Font.Gotham
ItemText.Text = v
ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemText.TextSize = 14.000
ItemText.TextXAlignment = Enum.TextXAlignment.Left

DropdownMainScrollFrame.CanvasSize = UDim2.new(0, 0, 0, DropdownMainScrollFrameLayout.AbsoluteContentSize.Y)

ItemBtn.MouseButton1Click:Connect(function()
DropdownMainHold.Visible = false
DropToggled = not DropToggled
DropdownText.Text = v
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
pcall(callback, v)

end)

ItemBtn.MouseLeave:Connect(function()
ItemBtn.BackgroundTransparency = 1
hovering = false
end)

ItemBtn.MouseEnter:Connect(function()
ItemBtn.BackgroundTransparency = 0
hovering = true
end)

coroutine.wrap(
function()
while wait() do
if hovering == false then
ItemText.TextColor3 = themes[selectedtheme].TextColor
else
ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
end
end
end
)()
end
function dropfunc:Add(toadd)
ItemCount = ItemCount + 1
if ItemCount == 1 then
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 43)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 43)
elseif ItemCount == 2 then
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 67)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 67)
else
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 92)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 92)
end 
local ItemBtn = Instance.new("TextButton")
local ItemBtnCorner = Instance.new("UICorner")
local ItemText = Instance.new("TextLabel")
local hovering = false

ItemBtn.Name = "ItemBtn"
ItemBtn.Parent = DropdownMainScrollFrame
ItemBtn.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
ItemBtn.Size = UDim2.new(0, 154, 0, 25)
ItemBtn.AutoButtonColor = false
ItemBtn.Font = Enum.Font.SourceSans
ItemBtn.Text = ""
ItemBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemBtn.TextSize = 14.000
ItemBtn.BackgroundTransparency = 1

ItemBtnCorner.CornerRadius = UDim.new(0, 5)
ItemBtnCorner.Name = "ItemBtnCorner"
ItemBtnCorner.Parent = ItemBtn

ItemText.Name = "ItemText"
ItemText.Parent = ItemBtn
ItemText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemText.BackgroundTransparency = 1.000
ItemText.Position = UDim2.new(0.038961038, 0, 0, 0)
ItemText.Size = UDim2.new(0, 148, 0, 25)
ItemText.Font = Enum.Font.Gotham
ItemText.Text = toadd
ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemText.TextSize = 14.000
ItemText.TextXAlignment = Enum.TextXAlignment.Left

DropdownMainScrollFrame.CanvasSize = UDim2.new(0, 0, 0, DropdownMainScrollFrameLayout.AbsoluteContentSize.Y)

ItemBtn.MouseButton1Click:Connect(function()
DropdownMainHold.Visible = false
DropToggled = not DropToggled
DropdownText.Text = toadd
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
pcall(callback, toadd)

end)

ItemBtn.MouseLeave:Connect(function()
ItemBtn.BackgroundTransparency = 1
hovering = false
end)

ItemBtn.MouseEnter:Connect(function()
ItemBtn.BackgroundTransparency = 0
hovering = true
end)

coroutine.wrap(
function()
while wait() do
if hovering == false then
ItemText.TextColor3 = themes[selectedtheme].TextColor
else
ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
end
end
end
)()
end
function dropfunc:Clear()
ItemCount = 0
for i,v in next, DropdownMainScrollFrame:GetChildren() do
if v.Name == "ItemBtn" then
v:Destroy()
end
end
end
return dropfunc
end
function tabcontent:Colorpicker(text, preset, callback)
local ColorPickerToggled = false
local OldToggleColor = Color3.fromRGB(0, 0, 0)
local OldColor = Color3.fromRGB(0, 0, 0)
local OldColorSelectionPosition = nil
local OldHueSelectionPosition = nil
local ColorH, ColorS, ColorV = 1, 1, 1
local RainbowColorPicker = false
local ColorPickerInput = nil
local ColorInput = nil
local HueInput = nil
local hovering = false

local Colorpicker = Instance.new("TextButton")
local ColorpickerFrameClr = Instance.new("Frame")
local ColorpickerFrameClrCorner = Instance.new("UICorner")
local ColorpickerText = Instance.new("TextLabel")

Colorpicker.Name = "Colorpicker"
Colorpicker.Parent = Tab
Colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Colorpicker.BackgroundTransparency = 1.000
Colorpicker.Position = UDim2.new(0.394886374, 0, 0.0925373137, 0)
Colorpicker.Size = UDim2.new(0, 71, 0, 16)
Colorpicker.Font = Enum.Font.SourceSans
Colorpicker.Text = ""
Colorpicker.TextColor3 = Color3.fromRGB(0, 0, 0)
Colorpicker.TextSize = 14.000

ColorpickerFrameClr.Name = "ColorpickerFrame"
ColorpickerFrameClr.Parent = Colorpicker
ColorpickerFrameClr.BackgroundColor3 = preset
ColorpickerFrameClr.Size = UDim2.new(0, 16, 0, 16)

ColorpickerFrameClrCorner.CornerRadius = UDim.new(1, 0)
ColorpickerFrameClrCorner.Name = "ColorpickerFrameCorner"
ColorpickerFrameClrCorner.Parent = ColorpickerFrameClr

ColorpickerText.Name = "ColorpickerText"
ColorpickerText.Parent = Colorpicker
ColorpickerText.AnchorPoint = Vector2.new(1, 1)
ColorpickerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorpickerText.BackgroundTransparency = 1.000
ColorpickerText.Position = UDim2.new(1, 0, 1, 0)
ColorpickerText.Size = UDim2.new(1, -23, 1, 0)
ColorpickerText.Font = Enum.Font.Gotham
ColorpickerText.Text = text
ColorpickerText.TextColor3 = Color3.fromRGB(0, 0, 0)
ColorpickerText.TextSize = 14.000
ColorpickerText.TextXAlignment = Enum.TextXAlignment.Left

local ColorPickerOutlineFrame = Instance.new("Frame")
local ColorPickerOutlineFrameCorner = Instance.new("UICorner")
local ColorPickerFrame = Instance.new("Frame")
local ColorPickerFrameCorner = Instance.new("UICorner")
local Color = Instance.new("ImageLabel")
local ColorCorner = Instance.new("UICorner")
local ColorSelection = Instance.new("ImageLabel")
local Hue = Instance.new("ImageLabel")
local HueCorner = Instance.new("UICorner")
local HueGradient = Instance.new("UIGradient")
local HueSelection = Instance.new("ImageLabel")
local ConfirmBtn = Instance.new("TextButton")
local ConfirmBtnFrame = Instance.new("Frame")
local ConfirmBtnFrameCorner = Instance.new("UICorner")
local ConfirmBtnCorner = Instance.new("UICorner")
local ConfirmBtnHoverFrame = Instance.new("Frame")
local ConfirmBtnHoverFrameCorner = Instance.new("UICorner")
local ConfirmBtnText = Instance.new("TextLabel")
local RainbowToggle = Instance.new("TextButton")
local RainbowToggleText = Instance.new("TextLabel")
local RainbowToggleFrame = Instance.new("Frame")
local RainbowToggleFrameCorner = Instance.new("UICorner")
local RainbowToggleFrame1 = Instance.new("Frame")
local RainbowToggleFrame1Corner = Instance.new("UICorner")
local RainbowToggleFrame2 = Instance.new("Frame")
local RainbowToggleFrame2Corner = Instance.new("UICorner")
local RainbowToggleToggledFrame = Instance.new("Frame")
local RainbowToggleToggledFrameCorner = Instance.new("UICorner")
local ToggleTick = Instance.new("ImageLabel")


ColorPickerOutlineFrame.Name = "ColorPickerOutlineFrame"
ColorPickerOutlineFrame.Parent = Tab
ColorPickerOutlineFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ColorPickerOutlineFrame.Position = UDim2.new(0.213314757, 0, 0.19295603, 0)
ColorPickerOutlineFrame.Size = UDim2.new(0, 139, 0, 161)
ColorPickerOutlineFrame.Visible = false

ColorPickerOutlineFrameCorner.CornerRadius = UDim.new(0, 5)
ColorPickerOutlineFrameCorner.Name = "ColorPickerOutlineFrameCorner"
ColorPickerOutlineFrameCorner.Parent = ColorPickerOutlineFrame

ColorPickerFrame.Name = "ColorPickerFrame"
ColorPickerFrame.Parent = ColorPickerOutlineFrame
ColorPickerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ColorPickerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorPickerFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ColorPickerFrame.Size = UDim2.new(1, -4, 1, -4)

ColorPickerFrameCorner.CornerRadius = UDim.new(0, 5)
ColorPickerFrameCorner.Name = "ColorPickerFrameCorner"
ColorPickerFrameCorner.Parent = ColorPickerFrame

Color.Name = "Color"
Color.Parent = ColorPickerFrame
Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
Color.Position = UDim2.new(0, 7, 0, 10)
Color.Size = UDim2.new(0, 94, 0, 89)
Color.ZIndex = 10
Color.Image = "rbxassetid://4155801252"

ColorCorner.CornerRadius = UDim.new(0, 3)
ColorCorner.Name = "ColorCorner"
ColorCorner.Parent = Color

ColorSelection.Name = "ColorSelection"
ColorSelection.Parent = Color
ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorSelection.BackgroundTransparency = 1.000
ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
ColorSelection.Size = UDim2.new(0, 18, 0, 18)
ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
ColorSelection.ScaleType = Enum.ScaleType.Fit

Hue.Name = "Hue"
Hue.Parent = ColorPickerFrame
Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Hue.Position = UDim2.new(0, 107, 0, 10)
Hue.Size = UDim2.new(0, 20, 0, 87)
Hue.ImageTransparency = 1.000

HueCorner.CornerRadius = UDim.new(0, 3)
HueCorner.Name = "HueCorner"
HueCorner.Parent = Hue

HueGradient.Color = ColorSequence.new {
ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
}
HueGradient.Rotation = 270
HueGradient.Name = "HueGradient"
HueGradient.Parent = Hue

HueSelection.Name = "HueSelection"
HueSelection.Parent = Hue
HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HueSelection.BackgroundTransparency = 1.000
HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
HueSelection.Size = UDim2.new(0, 18, 0, 18)
HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

ConfirmBtn.Name = "ConfirmBtn"
ConfirmBtn.Parent = ColorPickerFrame
ConfirmBtn.AnchorPoint = Vector2.new(0.5, 0)
ConfirmBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ConfirmBtn.BorderSizePixel = 0
ConfirmBtn.Position = UDim2.new(0.5, 0, 0, 105)
ConfirmBtn.Size = UDim2.new(0, 71, 0, 25)
ConfirmBtn.AutoButtonColor = false
ConfirmBtn.Font = Enum.Font.Gotham
ConfirmBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ConfirmBtn.TextSize = 14.000

ConfirmBtnFrame.Name = "ConfirmBtnFrame"
ConfirmBtnFrame.Parent = ConfirmBtn
ConfirmBtnFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ConfirmBtnFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfirmBtnFrame.BorderSizePixel = 0
ConfirmBtnFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ConfirmBtnFrame.Size = UDim2.new(1, -4, 0, 21)

ConfirmBtnFrameCorner.CornerRadius = UDim.new(0, 5)
ConfirmBtnFrameCorner.Name = "ConfirmBtnFrameCorner"
ConfirmBtnFrameCorner.Parent = ConfirmBtnFrame

ConfirmBtnCorner.CornerRadius = UDim.new(0, 5)
ConfirmBtnCorner.Name = "ConfirmBtnCorner"
ConfirmBtnCorner.Parent = ConfirmBtn

ConfirmBtnHoverFrame.Name = "ConfirmBtnHoverFrame"
ConfirmBtnHoverFrame.Parent = ConfirmBtn
ConfirmBtnHoverFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ConfirmBtnHoverFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
ConfirmBtnHoverFrame.BackgroundTransparency = 1.000
ConfirmBtnHoverFrame.BorderSizePixel = 0
ConfirmBtnHoverFrame.Position = UDim2.new(0.5, 0, 0.528750002, 0)
ConfirmBtnHoverFrame.Size = UDim2.new(1, 0, 0, 25)

ConfirmBtnHoverFrameCorner.CornerRadius = UDim.new(0, 5)
ConfirmBtnHoverFrameCorner.Name = "ConfirmBtnHoverFrameCorner"
ConfirmBtnHoverFrameCorner.Parent = ConfirmBtnHoverFrame

ConfirmBtnText.Name = "ConfirmBtnText"
ConfirmBtnText.Parent = ConfirmBtn
ConfirmBtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfirmBtnText.BackgroundTransparency = 1.000
ConfirmBtnText.Size = UDim2.new(1, 0, 1, 0)
ConfirmBtnText.Font = Enum.Font.Gotham
ConfirmBtnText.Text = "Confirm"
ConfirmBtnText.TextColor3 = Color3.fromRGB(0, 0, 0)
ConfirmBtnText.TextSize = 14.000

RainbowToggle.Name = "RainbowToggle"
RainbowToggle.Parent = ColorPickerFrame
RainbowToggle.AnchorPoint = Vector2.new(0.5, 0)
RainbowToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RainbowToggle.BackgroundTransparency = 1.000
RainbowToggle.Position = UDim2.new(0.5, 0, 0, 135)
RainbowToggle.Size = UDim2.new(0, 83, 0, 16)
RainbowToggle.Font = Enum.Font.SourceSans
RainbowToggle.Text = ""
RainbowToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
RainbowToggle.TextSize = 14.000

RainbowToggleText.Name = "RainbowToggleText"
RainbowToggleText.Parent = RainbowToggle
RainbowToggleText.AnchorPoint = Vector2.new(1, 1)
RainbowToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RainbowToggleText.BackgroundTransparency = 1.000
RainbowToggleText.Position = UDim2.new(1.13727927, 0, 1, 0)
RainbowToggleText.Size = UDim2.new(1.13727927, -23, 1, 0)
RainbowToggleText.Font = Enum.Font.Gotham
RainbowToggleText.Text = "Rainbow"
RainbowToggleText.TextColor3 = Color3.fromRGB(0, 0, 0)
RainbowToggleText.TextSize = 14.000
RainbowToggleText.TextXAlignment = Enum.TextXAlignment.Left

RainbowToggleFrame.Name = "RainbowToggleFrame"
RainbowToggleFrame.Parent = RainbowToggle
RainbowToggleFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
RainbowToggleFrame.Size = UDim2.new(0, 16, 0, 16)

RainbowToggleFrameCorner.CornerRadius = UDim.new(0, 5)
RainbowToggleFrameCorner.Name = "RainbowToggleFrameCorner"
RainbowToggleFrameCorner.Parent = RainbowToggleFrame

RainbowToggleFrame1.Name = "RainbowToggleFrame1"
RainbowToggleFrame1.Parent = RainbowToggleFrame
RainbowToggleFrame1.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
RainbowToggleFrame1.Size = UDim2.new(0, 16, 0, 16)

RainbowToggleFrame1Corner.CornerRadius = UDim.new(0, 5)
RainbowToggleFrame1Corner.Name = "RainbowToggleFrame1Corner"
RainbowToggleFrame1Corner.Parent = RainbowToggleFrame1

RainbowToggleFrame2.Name = "RainbowToggleFrame2"
RainbowToggleFrame2.Parent = RainbowToggleFrame1
RainbowToggleFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
RainbowToggleFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RainbowToggleFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
RainbowToggleFrame2.Size = UDim2.new(0, 12, 0, 12)

RainbowToggleFrame2Corner.CornerRadius = UDim.new(0, 3)
RainbowToggleFrame2Corner.Name = "RainbowToggleFrame2Corner"
RainbowToggleFrame2Corner.Parent = RainbowToggleFrame2

RainbowToggleToggledFrame.Name = "RainbowToggleToggledFrame"
RainbowToggleToggledFrame.Parent = RainbowToggleFrame
RainbowToggleToggledFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
RainbowToggleToggledFrame.Position = UDim2.new(0, 0, 0, 0)
RainbowToggleToggledFrame.Size = UDim2.new(0, 16, 0, 16)
RainbowToggleToggledFrame.Visible = false

RainbowToggleToggledFrameCorner.CornerRadius = UDim.new(0, 5)
RainbowToggleToggledFrameCorner.Name = "RainbowToggleToggledFrameCorner"
RainbowToggleToggledFrameCorner.Parent = RainbowToggleToggledFrame

ToggleTick.Name = "ToggleTick"
ToggleTick.Parent = RainbowToggleToggledFrame
ToggleTick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleTick.BackgroundTransparency = 1.000
ToggleTick.Position = UDim2.new(0.0500000007, 0, 0, 1)
ToggleTick.Size = UDim2.new(0, 13, 0, 13)
ToggleTick.Image = "http://www.roblox.com/asset/?id=6031094667"

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)


Colorpicker.MouseButton1Click:Connect(function()
if ColorPickerToggled == false then
ColorPickerOutlineFrame.Visible = true
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
else
ColorPickerOutlineFrame.Visible = false
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
end
ColorPickerToggled = not ColorPickerToggled
end)

local function UpdateColorPicker(nope)
ColorpickerFrameClr.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

pcall(callback, ColorpickerFrameClr.BackgroundColor3)
end

ColorH =
1 -
(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
Hue.AbsoluteSize.Y)
ColorS =
(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
Color.AbsoluteSize.X)
ColorV =
1 -
(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
Color.AbsoluteSize.Y)

ColorpickerFrameClr.BackgroundColor3 = preset
Color.BackgroundColor3 = preset
pcall(callback, ColorpickerFrameClr.BackgroundColor3)

Color.InputBegan:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
if RainbowColorPicker then
return
end

if ColorInput then
ColorInput:Disconnect()
end

ColorInput =
RunService.RenderStepped:Connect(
function()
local ColorX =
(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
Color.AbsoluteSize.X)
local ColorY =
(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
Color.AbsoluteSize.Y)

ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
ColorS = ColorX
ColorV = 1 - ColorY

UpdateColorPicker(true)
end
)
end
end
)

Color.InputEnded:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
if ColorInput then
ColorInput:Disconnect()
end
end
end
)

Hue.InputBegan:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
if RainbowColorPicker then
return
end

if HueInput then
HueInput:Disconnect()
end

HueInput =
RunService.RenderStepped:Connect(
function()
local HueY =
(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
Hue.AbsoluteSize.Y)

HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
ColorH = 1 - HueY

UpdateColorPicker(true)
end
)
end
end
)

Hue.InputEnded:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
if HueInput then
HueInput:Disconnect()
end
end
end
)

RainbowToggle.MouseButton1Down:Connect(
function()
RainbowColorPicker = not RainbowColorPicker

if ColorInput then
ColorInput:Disconnect()
end

if HueInput then
HueInput:Disconnect()
end

if RainbowColorPicker then
RainbowToggleToggledFrame.Visible = true
OldToggleColor = ColorpickerFrameClr.BackgroundColor3
OldColor = Color.BackgroundColor3
OldColorSelectionPosition = ColorSelection.Position
OldHueSelectionPosition = HueSelection.Position

while RainbowColorPicker do
ColorpickerFrameClr.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)
Color.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)

ColorSelection.Position = UDim2.new(1, 0, 0, 0)
HueSelection.Position = UDim2.new(0.48, 0, 0, lib.HueSelectionPosition)

pcall(callback, ColorpickerFrameClr.BackgroundColor3)
wait()
end
elseif not RainbowColorPicker then
RainbowToggleToggledFrame.Visible = false

Colorpicker.BackgroundColor3 = OldToggleColor
Color.BackgroundColor3 = OldColor

ColorSelection.Position = OldColorSelectionPosition
HueSelection.Position = OldHueSelectionPosition

pcall(callback, ColorpickerFrameClr.BackgroundColor3)
end
end
)

ConfirmBtn.MouseButton1Click:Connect(
function()
ColorPickerToggled = not ColorPickerToggled
ColorPickerOutlineFrame.Visible = false
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
end
)

ConfirmBtn.MouseEnter:Connect(function()
ConfirmBtnHoverFrame.BackgroundTransparency = 0
hovering = true
end)

ConfirmBtn.MouseLeave:Connect(function()
ConfirmBtnHoverFrame.BackgroundTransparency = 1
hovering = false
end)

coroutine.wrap(
function()
while wait() do
ColorPickerOutlineFrame.BackgroundColor3 = themes[selectedtheme].Color2
ColorPickerFrame.BackgroundColor3 = themes[selectedtheme].Color1
ColorpickerText.TextColor3 = themes[selectedtheme].TextColor
ConfirmBtn.BackgroundColor3 = themes[selectedtheme].Color2
ConfirmBtnFrame.BackgroundColor3 = themes[selectedtheme].Color1
RainbowToggleFrame.BackgroundColor3 = themes[selectedtheme].Color2
RainbowToggleFrame1.BackgroundColor3 = themes[selectedtheme].Color2
RainbowToggleFrame2.BackgroundColor3 = themes[selectedtheme].Color1
RainbowToggleText.TextColor3 = themes[selectedtheme].TextColor
if hovering == false then
ConfirmBtnText.TextColor3 = themes[selectedtheme].TextColor
else
ConfirmBtnText.TextColor3 = Color3.fromRGB(255, 255, 255)
end
end
end
)()

end
function tabcontent:RadioButtons(text, list, callback)
local FrameSize = 0
local fr = false
local RadioButtonsFrame = Instance.new("Frame")
local RadioButtonsTitle = Instance.new("TextLabel")
local RadioButtonsHolder = Instance.new("Frame")
local RadioButtonsHolderLayout = Instance.new("UIListLayout")

RadioButtonsFrame.Name = "RadioButtonsFrame"
RadioButtonsFrame.Parent = Tab
RadioButtonsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioButtonsFrame.BackgroundTransparency = 1.000
RadioButtonsFrame.Position = UDim2.new(0.453125, 0, 0.558208883, 0)
RadioButtonsFrame.Size = UDim2.new(0, 11, 0, 0)

RadioButtonsTitle.Name = "RadioButtonsTitle"
RadioButtonsTitle.Parent = RadioButtonsFrame
RadioButtonsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioButtonsTitle.BackgroundTransparency = 1.000
RadioButtonsTitle.BorderSizePixel = 0
RadioButtonsTitle.Size = UDim2.new(0, 0, 0, 16)
RadioButtonsTitle.Font = Enum.Font.Gotham
RadioButtonsTitle.Text = text
RadioButtonsTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
RadioButtonsTitle.TextSize = 14.000
RadioButtonsTitle.TextXAlignment = Enum.TextXAlignment.Right

RadioButtonsHolder.Name = "RadioButtonsHolder"
RadioButtonsHolder.Parent = RadioButtonsFrame
RadioButtonsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioButtonsHolder.BackgroundTransparency = 1.000
RadioButtonsHolder.Position = UDim2.new(0.727272749, 0, 0, 0)
RadioButtonsHolder.Size = UDim2.new(0, 100, 0, 16)

RadioButtonsHolderLayout.Name = "RadioButtonsHolderLayout"
RadioButtonsHolderLayout.Parent = RadioButtonsHolder
RadioButtonsHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
RadioButtonsHolderLayout.Padding = UDim.new(0, 4)

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

coroutine.wrap(
function()
while wait() do
RadioButtonsTitle.TextColor3 = themes[selectedtheme].TextColor
end
end
)()

for i,v in next, list do
FrameSize = FrameSize + 20
RadioButtonsFrame.Size = UDim2.new(0, 11, 0, FrameSize)
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
local RadioBtn = Instance.new("TextButton")
local RadioBtnText = Instance.new("TextLabel")
local RadioBtnFrame = Instance.new("Frame")
local RadioBtnFrame1 = Instance.new("Frame")
local RadioBtnFrame1Corner = Instance.new("UICorner")
local RadioBtnFrame2 = Instance.new("Frame")
local RadioBtnFrame2Corner = Instance.new("UICorner")
local RadioBtnToggledFrame = Instance.new("Frame")
local RadioBtnToggledFrameCorner = Instance.new("UICorner")
local RadioBtnToggledFrame_2 = Instance.new("Frame")
local RadioBtnToggledFrameCorner_2 = Instance.new("UICorner")
local RadioBtnCorner = Instance.new("UICorner")

RadioBtn.Name = "RadioBtn"
RadioBtn.Parent = RadioButtonsHolder
RadioBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioBtn.BackgroundTransparency = 1.000
RadioBtn.Size = UDim2.new(0, 791, 0, 16)
RadioBtn.Font = Enum.Font.SourceSans
RadioBtn.Text = ""
RadioBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
RadioBtn.TextSize = 14.000

RadioBtnText.Name = "RadioBtnText"
RadioBtnText.Parent = RadioBtn
RadioBtnText.AnchorPoint = Vector2.new(1, 1)
RadioBtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioBtnText.BackgroundTransparency = 1.000
RadioBtnText.Position = UDim2.new(1, 0, 1, 0)
RadioBtnText.Size = UDim2.new(1, -23, 1, 0)
RadioBtnText.Font = Enum.Font.Gotham
RadioBtnText.Text = v
RadioBtnText.TextColor3 = Color3.fromRGB(0, 0, 0)
RadioBtnText.TextSize = 14.000
RadioBtnText.TextXAlignment = Enum.TextXAlignment.Left

RadioBtnFrame.Name = "RadioBtnFrame"
RadioBtnFrame.Parent = RadioBtn
RadioBtnFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
RadioBtnFrame.Size = UDim2.new(0, 16, 0, 16)

RadioBtnFrame1.Name = "RadioBtnFrame1"
RadioBtnFrame1.Parent = RadioBtnFrame
RadioBtnFrame1.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
RadioBtnFrame1.Size = UDim2.new(0, 16, 0, 16)

RadioBtnFrame1Corner.CornerRadius = UDim.new(1, 0)
RadioBtnFrame1Corner.Name = "RadioBtnFrame1Corner"
RadioBtnFrame1Corner.Parent = RadioBtnFrame1

RadioBtnFrame2.Name = "RadioBtnFrame2"
RadioBtnFrame2.Parent = RadioBtnFrame1
RadioBtnFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
RadioBtnFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioBtnFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
RadioBtnFrame2.Size = UDim2.new(0, 12, 0, 12)

RadioBtnFrame2Corner.CornerRadius = UDim.new(1, 0)
RadioBtnFrame2Corner.Name = "RadioBtnFrame2Corner"
RadioBtnFrame2Corner.Parent = RadioBtnFrame2

RadioBtnToggledFrame.Name = "RadioBtnToggledFrame"
RadioBtnToggledFrame.Parent = RadioBtnFrame
RadioBtnToggledFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
RadioBtnToggledFrame.Size = UDim2.new(0, 16, 0, 16)
RadioBtnToggledFrame.Visible = false

RadioBtnToggledFrameCorner.CornerRadius = UDim.new(1, 0)
RadioBtnToggledFrameCorner.Name = "RadioBtnToggledFrameCorner"
RadioBtnToggledFrameCorner.Parent = RadioBtnToggledFrame

RadioBtnToggledFrame_2.Name = "RadioBtnToggledFrame"
RadioBtnToggledFrame_2.Parent = RadioBtnToggledFrame
RadioBtnToggledFrame_2.AnchorPoint = Vector2.new(0.5, 0.5)
RadioBtnToggledFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioBtnToggledFrame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
RadioBtnToggledFrame_2.Size = UDim2.new(1, -9, 1, -9)

RadioBtnToggledFrameCorner_2.CornerRadius = UDim.new(1, 0)
RadioBtnToggledFrameCorner_2.Name = "RadioBtnToggledFrameCorner"
RadioBtnToggledFrameCorner_2.Parent = RadioBtnToggledFrame_2

RadioBtnCorner.CornerRadius = UDim.new(1, 0)
RadioBtnCorner.Name = "RadioBtnCorner"
RadioBtnCorner.Parent = RadioBtnFrame

RadioBtn.MouseButton1Click:Connect(function()
pcall(callback, v)
for i,v in next, RadioButtonsHolder:GetChildren() do
if v.Name == "RadioBtn" then
v.RadioBtnFrame.RadioBtnToggledFrame.Visible = false
end
end
RadioBtnToggledFrame.Visible = true
end)

if fr == false then
fr = true
RadioBtnToggledFrame.Visible = true
pcall(callback, v)
end

coroutine.wrap(
function()
while wait() do
        RadioBtnFrame.BackgroundColor3 = themes[selectedtheme].Color2
RadioBtnFrame1.BackgroundColor3 = themes[selectedtheme].Color2
RadioBtnFrame2.BackgroundColor3 = themes[selectedtheme].Color1
RadioBtnText.TextColor3 = themes[selectedtheme].TextColor
end
end
)()
end
end
function tabcontent:Bind(text, preset, keyboardonly, holdmode, callback )

local OldBind = preset.Name
local LoadFromPreset = false
local JustBinded = false
local HoldModeToggled = false

local NotAllowedKeys = {
Return = true,
Space = true,
Tab = true,
Unknown = true,
MouseButton1 = true
}

local AllowedMouseTypes = {
MouseButton2 = true,
MouseButton3 = true
}

local ShortenedNames = {
LeftShift = "LShift",
RightShift = "RShift",
LeftControl = "LCtrl",
RightControl = "RCtrl",
LeftAlt = "LAlt",
RightAlt = "RAlt",
CapsLock = "Caps",
One = "1",
Two = "2",
Three = "3",
Four = "4",
Five = "5",
Six = "6",
Seven = "7",
Eight = "8",
Nine = "9",
Zero = "0",
KeypadOne = "Num-1",
KeypadTwo = "Num-2",
KeypadThree = "Num-3",
KeypadFour = "Num-4",
KeypadFive = "Num-5",
KeypadSix = "Num-6",
KeypadSeven = "Num-7",
KeypadEight = "Num-8",
KeypadNine = "Num-9",
KeypadZero = "Num-0",
Minus = "-",
Equals = "=",
Tilde = "~",
LeftBracket = "[",
RightBracket = "]",
RightParenthesis = ")",
LeftParenthesis = "(",
Semicolon = ";",
Quote = "'",
BackSlash = "\\",
Comma = ",",
Period = ".",
Slash = "/",
Asterisk = "*",
Plus = "+",
Period = ".",
Backquote = "`",
MouseButton1 = "M1",
MouseButton2 = "M2",
MouseButton3 = "M3"
}



local Bind = Instance.new("Frame")
local BindBtn = Instance.new("TextButton")
local BindBtnFrameOutline = Instance.new("Frame")
local BindBtnFrameOutlineCorner = Instance.new("UICorner")
local BindBtnFrame = Instance.new("Frame")
local BindBtnFrameCorner = Instance.new("UICorner")
local BindBtnText = Instance.new("TextLabel")
local BindTitle = Instance.new("TextLabel")


Bind.Name = "Bind"
Bind.Parent = Tab
Bind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bind.BackgroundTransparency = 1.000
Bind.Position = UDim2.new(0.298295468, 0, 0.629850626, 0)
Bind.Size = UDim2.new(0, 120, 0, 25)

BindBtn.Name = "BindBtn"
BindBtn.Parent = Bind
BindBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BindBtn.BackgroundTransparency = 1.000
BindBtn.Position = UDim2.new(0.456999987, 0, 0, 0)
BindBtn.Size = UDim2.new(0, 90, 0, 25)
BindBtn.Font = Enum.Font.SourceSans
BindBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
BindBtn.TextSize = 14.000

BindBtnFrameOutline.Name = "BindBtnFrameOutline"
BindBtnFrameOutline.Parent = BindBtn
BindBtnFrameOutline.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
BindBtnFrameOutline.Position = UDim2.new(0, 0, -0.00300048827, 0)
BindBtnFrameOutline.Size = UDim2.new(0, 92, 0, 25)

BindBtnFrameOutlineCorner.CornerRadius = UDim.new(0, 5)
BindBtnFrameOutlineCorner.Name = "BindBtnFrameOutlineCorner"
BindBtnFrameOutlineCorner.Parent = BindBtnFrameOutline

BindBtnFrame.Name = "BindBtnFrame"
BindBtnFrame.Parent = BindBtnFrameOutline
BindBtnFrame.AnchorPoint = Vector2.new(0.5, 0.5)
BindBtnFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BindBtnFrame.BorderSizePixel = 0
BindBtnFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
BindBtnFrame.Size = UDim2.new(1, -4, 0, 21)

BindBtnFrameCorner.CornerRadius = UDim.new(0, 5)
BindBtnFrameCorner.Name = "BindBtnFrameCorner"
BindBtnFrameCorner.Parent = BindBtnFrame

BindBtnText.Name = "BindBtnText"
BindBtnText.Parent = BindBtnFrameOutline
BindBtnText.AnchorPoint = Vector2.new(1, 1)
BindBtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BindBtnText.BackgroundTransparency = 1.000
BindBtnText.Position = UDim2.new(0.989130437, 0, 1, 0)
BindBtnText.Size = UDim2.new(1.05434787, -7, 1.00300002, 0)
BindBtnText.Font = Enum.Font.Gotham
BindBtnText.Text = (ShortenedNames[preset.Name] or ShortenedNames[preset] or preset.Name or "None")
BindBtnText.TextColor3 = Color3.fromRGB(0, 0, 0)
BindBtnText.TextSize = 13.000

BindTitle.Name = "BindTitle"
BindTitle.Parent = Bind
BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BindTitle.BackgroundTransparency = 1.000
BindTitle.BorderSizePixel = 0
BindTitle.Position = UDim2.new(0, 50, 0, 0)
BindTitle.Size = UDim2.new(0, 0, 0, 25)
BindTitle.Font = Enum.Font.Gotham
BindTitle.Text = text
BindTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
BindTitle.TextSize = 14.000
BindTitle.TextXAlignment = Enum.TextXAlignment.Right	

if preset == Enum.KeyCode.Unknown or preset == "Unknown" then
BindBtnText.Text = "None"
end

BindBtn.MouseButton1Click:Connect(function()
if lib.CurrentlyBinding then return end

BindBtnText.Text = "..."

local Input, Bruh = UserInputService.InputBegan:wait()
lib.CurrentlyBinding = true

if Input.KeyCode.Name == "Backspace" or Input.KeyCode.Name == "Delete" then
BindBtnText.Text = "None"
OldBind = Enum.KeyCode.Unknown.Name
lib.CurrentlyBinding = false
JustBinded = false
return
end

if (Input.UserInputType ~= Enum.UserInputType.Keyboard and (AllowedMouseTypes[Input.UserInputType.Name]) and (not keyboardonly)) or (Input.KeyCode and (not NotAllowedKeys[Input.KeyCode.Name])) then
local BindName = ((Input.UserInputType ~= Enum.UserInputType.Keyboard and Input.UserInputType.Name) or Input.KeyCode.Name)
BindBtnText.Text = ShortenedNames[BindName] or BindName
OldBind = BindName
lib.CurrentlyBinding = false
JustBinded = true
else
BindBtnText.Text = ShortenedNames[OldBind] or OldBind
lib.CurrentlyBinding = false
end
end)

if not holdmode then
UserInputService.InputBegan:Connect(function(input, gameprocessedevent) 
if not gameprocessedevent then
if UserInputService:GetFocusedTextBox() then return end
if OldBind == Enum.KeyCode.Unknown.Name then return end
if JustBinded then JustBinded = false return end

local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

if BindName == OldBind then 
pcall(callback)
end
end
end)
else
UserInputService.InputBegan:Connect(function(input, gameprocessedevent) 
if not gameprocessedevent then
if UserInputService:GetFocusedTextBox() then return end
if OldBind == Enum.KeyCode.Unknown.Name then return end
if JustBinded then JustBinded = false return end

local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

if BindName == OldBind then 
pcall(callback, true)
end
end
end)

UserInputService.InputEnded:Connect(function(input, gameprocessedevent) 
if not gameprocessedevent then
if UserInputService:GetFocusedTextBox() then return end
if OldBind == Enum.KeyCode.Unknown.Name then return end
if JustBinded then JustBinded = false return end

HoldModeToggled = false
local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

if BindName == OldBind then 
pcall(callback, false)
end
end
end)
end

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

coroutine.wrap(
function()
while wait() do
BindBtnFrameOutline.BackgroundColor3 = themes[selectedtheme].Color2
BindBtnFrame.BackgroundColor3  = themes[selectedtheme].Color1
BindTitle.TextColor3= themes[selectedtheme].TextColor
BindBtnText.TextColor3= themes[selectedtheme].TextColor
end
end
)()
end
function tabcontent:Textbox(text,numbersonly, disapper, callback)
local Textbox = Instance.new("Frame")
local TextboxTitle = Instance.new("TextLabel")
local TextboxFrameOutline = Instance.new("Frame")
local TextboxFrameOutlineCorner = Instance.new("UICorner")
local TextboxFrame = Instance.new("Frame")
local TextboxFrameCorner = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")

Textbox.Name = "Textbox"
Textbox.Parent = Tab
Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Textbox.BackgroundTransparency = 1.000
Textbox.Position = UDim2.new(0.220833331, 0, 0.260726064, 0)
Textbox.Size = UDim2.new(0, 171, 0, 25)

TextboxTitle.Name = "TextboxTitle"
TextboxTitle.Parent = Textbox
TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextboxTitle.BackgroundTransparency = 1.000
TextboxTitle.BorderSizePixel = 0
TextboxTitle.Position = UDim2.new(0, 37, 0, 0)
TextboxTitle.Size = UDim2.new(0, 0, 0, 25)
TextboxTitle.Font = Enum.Font.Gotham
TextboxTitle.Text = text
TextboxTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
TextboxTitle.TextSize = 14.000
TextboxTitle.TextXAlignment = Enum.TextXAlignment.Right

TextboxFrameOutline.Name = "TextboxFrameOutline"
TextboxFrameOutline.Parent = Textbox
TextboxFrameOutline.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
TextboxFrameOutline.Position = UDim2.new(0.256999999, 0, 0, 0)
TextboxFrameOutline.Size = UDim2.new(0, 171, 0, 25)

TextboxFrameOutlineCorner.CornerRadius = UDim.new(0, 5)
TextboxFrameOutlineCorner.Name = "TextboxFrameOutlineCorner"
TextboxFrameOutlineCorner.Parent = TextboxFrameOutline

TextboxFrame.Name = "TextboxFrame"
TextboxFrame.Parent = TextboxFrameOutline
TextboxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
TextboxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextboxFrame.BorderSizePixel = 0
TextboxFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TextboxFrame.Size = UDim2.new(1, -4, 0, 21)
TextboxFrame.ClipsDescendants = true

TextboxFrameCorner.CornerRadius = UDim.new(0, 5)
TextboxFrameCorner.Name = "TextboxFrameCorner"
TextboxFrameCorner.Parent = TextboxFrame

TextBox.Parent = TextboxFrame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.Position = UDim2.new(0, 7, 0, 0)
TextBox.Size = UDim2.new(1, -7, 1, 0)
TextBox.Font = Enum.Font.Gotham
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left


TextBox.FocusLost:Connect(
function(ep)
if ep then
if #TextBox.Text > 0 then
pcall(callback, TextBox.Text)
if disapper then
TextBox.Text = ""
end
end
end
end
)

TextBox:GetPropertyChangedSignal("Text"):Connect(function()
if numbersonly == true then
TextBox.Text = TextBox.Text:gsub('%D+', '');
end
end)

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)


coroutine.wrap(
function()
while wait() do
TextboxFrameOutline.BackgroundColor3 = themes[selectedtheme].Color2
TextboxFrame.BackgroundColor3  = themes[selectedtheme].Color1
TextBox.TextColor3= themes[selectedtheme].TextColor
TextboxTitle.TextColor3= themes[selectedtheme].TextColor
end
end
)()
end
return tabcontent
end
return tabhold
end

local win = lib:Window()

win:Label("Blox Fruits, Dawid Hub")

local Main = win:Tab("Main", "http://www.roblox.com/asset/?id=6034287519", Color3.fromRGB(255, 74, 74))

local Farms = win:Tab("Farms", "http://www.roblox.com/asset/?id=6034287519", Color3.fromRGB(255, 74, 74))

local Fruits = win:Tab("Fruits", "http://www.roblox.com/asset/?id=6034287519", Color3.fromRGB(255, 74, 74))

local FruitFarmer = win:Tab("Fruit Farmer", "http://www.roblox.com/asset/?id=6034287519", Color3.fromRGB(255, 74, 74))

local Misc = win:Tab("Misc", "http://www.roblox.com/asset/?id=6034287519", Color3.fromRGB(255, 74, 74))

local Shop = win:Tab("Shop", "http://www.roblox.com/asset/?id=6034287519", Color3.fromRGB(255, 74, 74))

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
warn("Anti AFK enabled")

--functions

local vim = game:GetService("VirtualInputManager")
local function click(a)
    vim:SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,true,a,1)
    vim:SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,false,a,1)
end


function Shoot()
for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
if v:FindFirstChild("HumanoidRootPart") then
local plr = Game:GetService("Players").LocalPlayer
if plr:DistanceFromCharacter(v.HumanoidRootPart.Position) <= 50 then
for _, e in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if e:IsA("Tool") then
print(e)
local args = {
    [1] = v.HumanoidRootPart.Position,
    [2] = v.Head
}

game:GetService("Players").LocalPlayer.Character[e.Name].RemoteFunctionShoot:InvokeServer(unpack(args))
end
end
end
end
end
end



local function PathWalk(pos)
local PathfindingService = game:GetService("PathfindingService")
local Humanoid = game.Players.LocalPlayer.Character.Humanoid
local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
local destination = pos
local path = PathfindingService:CreatePath()
path:ComputeAsync(HumanoidRootPart.Position, destination)
if path.Status == Enum.PathStatus.Success then
    local wayPoints = path:GetWaypoints()
for _, waypoint in pairs(wayPoints) do
local part = Instance.new("Part")
part.Shape = "Ball"
part.Material = "Neon"
part.Size = Vector3.new(0.6, 0.6, 0.6)
part.Position = waypoint.Position
part.Anchored = true
part.CanCollide = false
part.Parent = game.Workspace
part:destroy()
end
    for i = 1, #wayPoints do
        local point = wayPoints[i]
        Humanoid:MoveTo(point.Position)
        local success = Humanoid.MoveToFinished:Wait()
        if point.Action == Enum.PathWaypointAction.Jump then
            Humanoid.WalkSpeed = 0
            wait(0.2)
            Humanoid.WalkSpeed = 16
            Humanoid.Jump = true
        end

if not success then
            Humanoid.Jump = true
            Humanoid:MoveTo(point.Position)
            if not Humanoid.MoveToFinished:Wait() then
                break
            end
        end
    end
end
end

function hit()
for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
if v:FindFirstChild("HumanoidRootPart") then
local plr = Game:GetService("Players").LocalPlayer
if plr:DistanceFromCharacter(v.HumanoidRootPart.Position) <= 17 then
Hit()
end
end
end
end


function Hit()
local vu = game:GetService("VirtualUser")
vu:ClickButton1(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end

function Teleport(pos)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = pos 
end
function SetSpawn()

local args = {
    [1] = "AbandonQuest"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

local args = {
    [1] = "SetSpawnPoint"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end



--Globals

--Config
local Config = {
Gun = "",
ScanMethod = "",
url = "",
Fruit = "",
Size = 10, 25, 15,
Color =  255, 1, 1,
Tool = "",
NPC = "",
ShopFruit = "",
AutoFarmMethod = "PathFinding",
NearCheck = true,
Pos = nil
}



Fruits:Dropdown("Notif Method", {"GuiNotification","Print","Webhook"}, function(Choosen)
    Config.ScanMethod = Choosen
    lib:Notification("Method Notification", "You have Choosen: ".. Choosen, "http://www.roblox.com/asset/?id=6026568210", "Okay")
    print(Choosen)
end)

Fruits:Textbox("YourWebHook:", "Paste your Webhook here", true, function(Text)
print(Text)
Config.url = Text
print(Text.. "m")
end)


Fruits:Button("Fruit Scan", function()
print("Your Setten Method is: ".. Config.ScanMethod)
if Config.ScanMethod == "Webhook" then
print("Your Setten Webhook is: ".. Config.url)
for i, v in pairs(workspace:GetChildren()) do
if v:IsA("Tool") then
if v.Handle or v.Name == "Fruit " then
local req = syn.request
local data = {
    ["username"]  = "Chicken",
    ["avatar_url"] = "https://cdn.webhookapp.com/attachments/801439197344563250/804359711557812294/Download.png",
    ["embeds"] = {
        {
            ["author"] = {
                ["name"] = game.Players.LocalPlayer.Name.. " Found a Fruit",
                ["url"] = "https://webhook.gg/brackets",
                ["icon_url"] = "https://web.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userid="..game.Players.LocalPlayer.UserId
            },
            ["url"] = "https://www.roblox.com/games/"..game.PlaceId,
            ["description"] = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
            ["color"] = 000000,
            ["fields"] = {
                {
                    ["name"] = "Webhook: ",
                    ["value"] = tostring("```"..Config.url.."```"),
                    ["inline"] = true
                },
                {
                    ["name"] = "Player Info:",
                    ["value"] = "**Age: **"..game.Players.LocalPlayer.AccountAge,
                },
                {
                    ["name"] = "Fruit:",
                    ["value"] = v.Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "JobId:",
                    ["value"] = tostring("```"..game.JobId.."```"),
                    ["inline"] = true
                },
            },
            ["thumbnail"] = {
                ["url"] = "https://web.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userid="..game.Players.LocalPlayer.UserId
            },
            ["footer"] = {
                ["text"] = "Found a Fruit throught Fruit Scan",
            }
        }
    }
}
print("")
local Post = req({Url = Config.url,  Method = 'POST', Headers = { ['Content-Type'] = 'application/json' }, Body = game:GetService('HttpService'):JSONEncode(data)})
end
end
end
elseif Config.ScanMethod == "Print" then
for i, v in pairs(workspace:GetChildren()) do
if v:IsA("Tool") then
if v.Handle or v.Name == "Fruit " then
    print("A "..v.Name.. " Is somewhere around the Map")
end
end
end
elseif Config.ScanMethod == "GuiNotification" then
for i, v in pairs(workspace:GetChildren()) do
if v:IsA("Tool") then
if v.Handle or v.Name == "Fruit " then
    lib:Notification("Fruit Notification", "A "..v.Name.. " Is somewhere around the Map", "http://www.roblox.com/asset/?id=6026568210", "Okay")
wait(2)
end
end
end 
end
end)

Fruits:Line("")

Fruits:Button("Claim Fruits", function()
for i, v in pairs(workspace:GetChildren()) do
if v:IsA("Tool") and v.EatRemote then
if v.Handle then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle.TouchInterest.Parent, 0) --0 is touch
end
end
end

for i, v in pairs(workspace:GetChildren()) do
if v:IsA("Model") and v.Name == "Fruit " then
if v.Handle then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle.TouchInterest.Parent, 0) --0 is touch
end
end
end
end)

Fruits:Button("Buy Random Fruit [ 100 Candies ]", function()
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(-697.923035, 17.2672977, 1554.10742, 0.988639653, 1.50567576e-08, 0.15030472, -2.80688432e-08, 1, 8.44499226e-08, -0.15030472, -8.77094095e-08, 0.988639653))
wait(2)
local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 4,
    [4] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
Teleport(Config.Pos)
end)
Fruits:Line("")

Fruits:Dropdown("Fruit to Eat", {"Bomb Fruit","Spike Fruit","Chop Fruit", "Spring Fruit", "Smoke Fruit", "Ice Fruit", "Flame Fruit", "Sand Fruit", "Dark Fruit", "Light Fruit", "Rubber Fruit", "Barrier Fruit", "Magma Fruit", "Quake Fruit", "Human: Buddha Fruit", "String Fruit",  "Bird: Phoenix Fruit", "Rumble Fruit", "Paw Fruit",  "Gravity Fruit", "Dought Fruit", "Control Fruit", "Dragon Fruit"}, function(Choosen)
    Config.Fruit = Choosen
    print(Config.Fruit)
end)

Fruits:Toggle("AutoEat Choosen Fruit", false, function(State)
_G.AutoEat = State while _G.AutoEat do wait()
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.Name == Config.Fruit then
   v.Parent = game.Players.LocalPlayer.Character
end
end
wait(0.2)
for i,e in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
if e.Name == Config.Fruit then
game:GetService("Players").LocalPlayer.Character[Config.Fruit].EatRemote:InvokeServer()
end
end
end
end)


Fruits:Dropdown("Fruit to Snipe", {"Bomb-Bomb","Spike-Spike","Chop-Chop", "Spring-Spring", "Smoke-Smoke", "Ice-Ice", "Sand-Sand", "Dark-Dark", "Light-Light", "Rubber-Rubber", "Barrier-Barrier", "Magma-Magma", "Quake-Quake", "Human-Human: Buddha", "String-String",  "Bird-Bird: Phoenix", "Rumble-Rumble", "Paw-Paw",  "Gravity-Gravity", "Dought-Dought", "Control-Control", "Dragon-Dragon"}, function(Choosen)
Config.ShopFruit = Choosen
lib:Notification("Shop Notification", "Set "..Config.ShopFruit.. " Fruit, Enable ShopSniper to Auto-Buy when on Stock", "http://www.roblox.com/asset/?id=6026568210", "Okay")
end)

Fruits:Toggle("Shop Sniper",false, function(State)
print(Config.ShopFruit)
_G.AutoBuy = State
while _G.AutoBuy do wait()
print("")
_G.FruitSnipeShop = Config.ShopFruit
print(_G.FruitSnipeShop)
local args = {
    [1] = "PurchaseRawFruit",
    [2] = Config.ShopFruit
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
local args = {
    [1] = "PurchaseRawFruit",
    [2] = Config.ShopFruit
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

local args = {
    [1] = "GetFruits"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

local args = {
    [1] = "GetFruits"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end)

Misc:Toggle("AutoHit NPC", false, function(State)
_G.AutoHit = State
while _G.AutoHit do wait()
    hit()
end
end)

Misc:Slider("Hitbox Size", "Rezize the Hitbox", 5, 50,0,function(Amount)
    Config.Size = Amount, Amount, Amount
end)


Misc:Toggle("Transparent Hitbox", false, function(State)
_G.NPChitbox = State
while _G.NPChitbox do wait()
for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") then
v.HumanoidRootPart.Transparency = 0.5
end
end
end
end)

Misc:Toggle("Collide Hitbox NPC", false, function(State)
_G.NPChitbox = State
while _G.NPChitbox do wait()
for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") then
v.HumanoidRootPart.CanCollide = State

end
end
end
end)

Misc:Toggle("Hitbox NPC", false, function(State)
_G.NPChitbox = State
while _G.NPChitbox do wait()
for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") then
v.HumanoidRootPart.Size = Vector3.new(Config.Size, Config.Size, Config.Size)
v.HumanoidRootPart.Color = Color3.fromRGB(Config.Color)

end
end
end
end)

Misc:Toggle("Freeze NPC/Boss", false, function(State)
_G.Stuck = State
while _G.Stuck do wait()
for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") then
v.HumanoidRootPart.Size = Vector3.new(0, 0, 0)
v.HumanoidRootPart.Color = Color3.fromRGB(Config.Color)
end
end
end
end)

Misc:Label("Auto Stats")

Misc:Toggle("Melee", false, function(State)
_G.Melee = State
while _G.Melee do wait()
local args = {
    [1] = "AddPoint",
    [2] = "Melee",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end)
Misc:Toggle("Defense", false, function(State)
_G.Defense = State
while _G.Defense do wait()
local args = {
    [1] = "AddPoint",
    [2] = "Defense",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end)
Misc:Toggle("Sword", false, function(State)
_G.Sword = State
while _G.Sword do wait()
local args = {
    [1] = "AddPoint",
    [2] = "Sword",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end)
Misc:Toggle("Gun", false, function(State)
_G.Gun = State
while _G.Gun do wait()
local args = {
    [1] = "AddPoint",
    [2] = "Gun",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end)
Misc:Toggle("Blox Fruit", false, function(State)
_G.Sword = State
while _G.Sword do wait()
local args = {
    [1] = "AddPoint",
    [2] = "Demon Fruit",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end)

for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
   v.Parent = game.Players.LocalPlayer.Backpack
end
end

local backpack = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
backpack[#backpack+1] = v.Name
end

Farms:Dropdown("Choose Tool", {unpack(backpack)}, function(Choosen)
Config.Tool = Choosen
game.Players.LocalPlayer.Backpack:FindFirstChild(Config.Tool).Parent = game.Players.LocalPlayer.Character

game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Died:Connect(function()
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
    wait(2)
for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == Config.Tool then
v.Parent = game.Players.LocalPlayer.Character
end
end
end)
end)
end)


Farms:Dropdown("Farm Method", {"Teleport","Bring","PathFinding"}, function(Choosen)
Config.AutoFarmMethod = Choosen
end)

local Mobs = {"Bandit [Lv. 5]","Monkey [Lv. 14]", "Gorilla [Lv. 20]","Pirate [Lv. 35]", "Brute [Lv. 45]", "Desert Bandit [Lv. 60]", "Desert Officer [Lv. 70]", "Snow Bandit [Lv. 90]", "Snowman [Lv. 100]","Chief Petty Officer [Lv. 120]" ,"Sky Bandit [Lv. 150]", "Toga Warrior [Lv. 225]", "Gladiator [Lv. 275]", "Military Soldier [Lv. 300]", "Military Spy [Lv. 330]", "God's Guard [Lv. 450]","Shanda [Lv. 475]", "Galley Pirate [Lv. 625]"}

Farms:Dropdown("Choose Mob", {"Bandit [Lv. 5]","Monkey [Lv. 14]", "Gorilla [Lv. 20]","Pirate [Lv. 35]", "Brute [Lv. 45]", "Desert Bandit [Lv. 60]", "Desert Officer [Lv. 70]", "Snow Bandit [Lv. 90]", "Snowman [Lv. 100]","Chief Petty Officer [Lv. 120]" ,"Sky Bandit [Lv. 150]", "Toga Warrior [Lv. 225]", "Gladiator [Lv. 275]", "Military Soldier [Lv. 300]", "Military Spy [Lv. 330]", "God's Guard [Lv. 450]","Shanda [Lv. 475]", "Galley Pirate [Lv. 625]"}, function(Choosen)
local WaitBeforeSpawnSet = 2.5
Config.NPC = Choosen
if Choosen == "Bandit [Lv. 5]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1057.10254, 16.2993622, 1497.9425, 0.523139775, 0, -0.852246881, 0, 1, 0, 0.852246881, 0, 0.523139775)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].HumanoidRootPart.CFrame
wait(1)
SetSpawn()
wait(0.5)
local args = {
    [1] = "StartQuest",
    [2] = "BanditQuest1",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1057.10254, 16.2993622, 1497.9425, 0.523139775, 0, -0.852246881, 0, 1, 0, 0.852246881, 0, 0.523139775)


elseif Choosen == "Monkey [Lv. 14]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1647.63953, 22.8780727, 292.887421, 0.861421645, -7.39691046e-08, -0.507890642, 9.43387377e-08, 1, 1.43659724e-08, 0.507890642, -6.02888974e-08, 0.861421645)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)
local args = {
    [1] = "StartQuest",
    [2] = "JungleQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1647.63953, 22.8780727, 292.887421, 0.861421645, -7.39691046e-08, -0.507890642, 9.43387377e-08, 1, 1.43659724e-08, 0.507890642, -6.02888974e-08, 0.861421645)


elseif Choosen == "Gorilla [Lv. 20]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1647.63953, 22.8780727, 292.887421, 0.861421645, -7.39691046e-08, -0.507890642, 9.43387377e-08, 1, 1.43659724e-08, 0.507890642, -6.02888974e-08, 0.861421645)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)
local args = {
    [1] = "StartQuest",
    [2] = "JungleQuest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1131.61938, 12.6472549, -383.55426, 0.797019005, -1.90704394e-08, 0.603954196, 1.16344996e-08, 1, 1.62222946e-08, -0.603954196, -5.90277205e-09, 0.797019005)

elseif Choosen == "Pirate [Lv. 35]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1154.27551, 4.77785587, 3809.91919, 0.948171437, 0, -0.317759186, 0, 1, 0, 0.317759186, 0, 0.948171437)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)

local args = {
    [1] = "StartQuest",
    [2] = "BuggyQuest1",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1154.27551, 4.77785587, 3809.91919, 0.948171437, 0, -0.317759186, 0, 1, 0, 0.317759186, 0, 0.948171437)


elseif Choosen == "Brute [Lv. 45]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1154.27551, 4.77785587, 3809.91919, 0.948171437, 0, -0.317759186, 0, 1, 0, 0.317759186, 0, 0.948171437)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)

local args = {
    [1] = "StartQuest",
    [2] = "BuggyQuest1",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1355.09827, 14.8249769, 4380.59326, -0.895123065, 0, 0.445819139, 0, 1, 0, -0.445819139, 0, -0.895123065)


elseif Choosen == "Desert Bandit [Lv. 60]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(908.271912, 6.45983028, 4138.82129, 0.837247193, 4.9032348e-08, 0.546824336, -1.6950791e-08, 1, -6.37139479e-08, -0.546824336, 4.40752217e-08, 0.837247193)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "DesertQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(832.282227, 21.59198, 4494.96533, 0.184162527, 8.13854228e-08, -0.982895792, -6.15731679e-08, 1, 7.12648855e-08, 0.982895792, 4.73956838e-08, 0.184162527)



elseif Choosen == "Desert Officer [Lv. 70]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(908.271912, 6.45983028, 4138.82129, 0.837247193, 4.9032348e-08, 0.546824336, -1.6950791e-08, 1, -6.37139479e-08, -0.546824336, 4.40752217e-08, 0.837247193)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "DesertQuest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1529.63025, 14.4778452, 4389.86475, 0.356059492, 0, -0.934463263, 0, 1, 0, 0.934463263, 0, 0.356059492)




elseif Choosen == "Snow Bandit [Lv. 90]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1117.41248, 7.32941484, -1170.14099, -0.835621834, 1.02512989e-11, 0.549305141, 2.34874945e-12, 1, -1.50893031e-11, -0.549305141, -1.13187723e-11, -0.835621834)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)



local args = {
    [1] = "StartQuest",
    [2] = "SnowQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))



game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1366.62646, 87.2985916, -1363.54175, 0.682489693, 0, 0.730895221, 0, 1, 0, -0.730895221, 0, 0.682489693)

elseif Choosen == "Snowman [Lv. 100]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1117.41248, 7.32941484, -1170.14099, -0.835621834, 1.02512989e-11, 0.549305141, 2.34874945e-12, 1, -1.50893031e-11, -0.549305141, -1.13187723e-11, -0.835621834)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "SnowQuest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))



game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1366.62646, 87.2985916, -1363.54175, 0.682489693, 0, 0.730895221, 0, 1, 0, -0.730895221, 0, 0.682489693)


elseif Choosen == "Chief Petty Officer [Lv. 120]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4794.86865, 4.58895683, 4333.75684, 0.83951956, 5.45913359e-08, -0.543329418, -1.08323469e-07, 1, -6.68992612e-08, 0.543329418, 1.15018565e-07, 0.83951956)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "MarineQuest2",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))




game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4794.86865, 4.58895683, 4333.75684, 0.83951956, 5.45913359e-08, -0.543329418, -1.08323469e-07, 1, -6.68992612e-08, 0.543329418, 1.15018565e-07, 0.83951956)


elseif Choosen == "Sky Bandit [Lv. 150]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4967.83691, 717.697998, -2623.84326, 0.499959469, 0, -0.866048813, 0, 1, 0, 0.866048813, 0, 0.499959469)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "SkyQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))





game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4967.83691, 717.697998, -2623.84326, 0.499959469, 0, -0.866048813, 0, 1, 0, 0.866048813, 0, 0.499959469)


elseif Choosen == "Toga Warrior [Lv. 225]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1455.04492, 7.31233311, -2873.29443, 0.849410176, 0, 0.527733028, 0, 1, 0, -0.527733028, 0, 0.849410176)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)

local args = {
    [1] = "StartQuest",
    [2] = "ColosseumQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1455.04492, 7.31233311, -2873.29443, 0.849410176, 0, 0.527733028, 0, 1, 0, -0.527733028, 0, 0.849410176)

elseif Choosen == "Gladiator [Lv. 275]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1455.04492, 7.31233311, -2873.29443, 0.849410176, 0, 0.527733028, 0, 1, 0, -0.527733028, 0, 0.849410176)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)

local args = {
    [1] = "StartQuest",
    [2] = "ColosseumQuest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1455.04492, 7.31233311, -2873.29443, 0.849410176, 0, 0.527733028, 0, 1, 0, -0.527733028, 0, 0.849410176)

elseif Choosen == "Military Soldier [Lv. 300]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5220.21973, 7.49897194, 8435.47559, -0.281109154, 3.10173931e-08, 0.959675789, 2.83250312e-08, 1, -2.40237057e-08, -0.959675789, 2.04295638e-08, -0.281109154)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "MagmaQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5220.21973, 7.49897194, 8435.47559, -0.281109154, 3.10173931e-08, 0.959675789, 2.83250312e-08, 1, -2.40237057e-08, -0.959675789, 2.04295638e-08, -0.281109154)

elseif Choosen == "Military Spy [Lv. 330]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5220.21973, 7.49897194, 8435.47559, -0.281109154, 3.10173931e-08, 0.959675789, 2.83250312e-08, 1, -2.40237057e-08, -0.959675789, 2.04295638e-08, -0.281109154)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "MagmaQuest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5220.21973, 7.49897194, 8435.47559, -0.281109154, 3.10173931e-08, 0.959675789, 2.83250312e-08, 1, -2.40237057e-08, -0.959675789, 2.04295638e-08, -0.281109154)

elseif Choosen == "God's Guard [Lv. 450]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4659.99365, 872.56897, -1767.74255, 0.827580392, -0.00363771501, 0.561336279, 1.61008762e-09, 0.999979019, 0.00648032175, -0.561347961, -0.00536298566, 0.827563167)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "SkyExp1Quest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4659.99365, 872.56897, -1767.74255, 0.827580392, -0.00363771501, 0.561336279, 1.61008762e-09, 0.999979019, 0.00648032175, -0.561347961, -0.00536298566, 0.827563167)

elseif Choosen == "Shanda [Lv. 475]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7894.74756, 5545.60889, -408.395416, 0.806966007, 5.16806935e-08, -0.590597868, -6.1094795e-08, 1, 4.02857836e-09, 0.590597868, 3.28315366e-08, 0.806966007)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "SkyExp1Quest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7894.74756, 5545.60889, -408.395416, 0.806966007, 5.16806935e-08, -0.590597868, -6.1094795e-08, 1, 4.02857836e-09, 0.590597868, 3.28315366e-08, 0.806966007)

elseif Choosen == "Galley Pirate [Lv. 625]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5238.64014, 38.5269432, 4062.28809, -0.633600593, -1.75828632e-08, -0.773660302, -2.15085034e-08, 1, -5.11213916e-09, 0.773660302, 1.34012224e-08, -0.633600593)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)

local args = {
    [1] = "StartQuest",
    [2] = "FountainQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5238.64014, 38.5269432, 4062.28809, -0.633600593, -1.75828632e-08, -0.773660302, -2.15085034e-08, 1, -5.11213916e-09, 0.773660302, 1.34012224e-08, -0.633600593)


end
end)

local Bosses =
{
"The Gorilla King [Lv. 25] [Boss]",
"Bobby [Lv. 55] [Boss]",
"Yeti [Lv. 110] [Boss]",
"Vice Admiral [Lv. 130] [Boss]",
"Saber Expert [Lv. 200] [Boss]",
"Magma Admiral [Lv. 350] [Boss]",
"Wysper [Lv. 500] [Boss]",
"Thunder God [Lv. 575] [Boss]",
"Cyborg [Lv. 675] [Boss]"
}

Farms:Dropdown("Choose Bosses", {unpack(Bosses)}, function(Choosen)
Config.NPC = Choosen
local WaitBeforeSpawnSet = 3
if Choosen == "The Gorilla King [Lv. 25] [Boss]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1647.63953, 22.8780727, 292.887421, 0.861421645, -7.39691046e-08, -0.507890642, 9.43387377e-08, 1, 1.43659724e-08, 0.507890642, -6.02888974e-08, 0.861421645)
wait(3)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)
local args = {
    [1] = "StartQuest",
    [2] = "JungleQuest",
    [3] = 3
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1131.61938, 12.6472549, -383.55426, 0.797019005, -1.90704394e-08, 0.603954196, 1.16344996e-08, 1, 1.62222946e-08, -0.603954196, -5.90277205e-09, 0.797019005)
elseif Choosen == "Bobby [Lv. 55] [Boss]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1154.27551, 4.77785587, 3809.91919, 0.948171437, 0, -0.317759186, 0, 1, 0, 0.317759186, 0, 0.948171437)
wait(3)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)
local args = {
    [1] = "StartQuest",
    [2] = "BuggyQuest1",
    [3] = 3
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1154.27551, 4.77785587, 3809.91919, 0.948171437, 0, -0.317759186, 0, 1, 0, 0.317759186, 0, 0.948171437)

elseif Choosen == "Yeti [Lv. 110] [Boss]" then

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1117.41248, 7.32941484, -1170.14099, -0.835621834, 1.02512989e-11, 0.549305141, 2.34874945e-12, 1, -1.50893031e-11, -0.549305141, -1.13187723e-11, -0.835621834)
wait(3)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)

local args = {
    [1] = "StartQuest",
    [2] = "SnowQuest",
    [3] = 3
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1366.62646, 87.2985916, -1363.54175, 0.682489693, 0, 0.730895221, 0, 1, 0, -0.730895221, 0, 0.682489693)




elseif Choosen == "Vice Admiral [Lv. 130] [Boss]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4794.86865, 4.58895683, 4333.75684, 0.83951956, 5.45913359e-08, -0.543329418, -1.08323469e-07, 1, -6.68992612e-08, 0.543329418, 1.15018565e-07, 0.83951956)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "MarineQuest2",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))




game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4794.86865, 4.58895683, 4333.75684, 0.83951956, 5.45913359e-08, -0.543329418, -1.08323469e-07, 1, -6.68992612e-08, 0.543329418, 1.15018565e-07, 0.83951956)





elseif Choosen == "Saber Expert [Lv. 200] [Boss]" then
    
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1647.63953, 22.8780727, 292.887421, 0.861421645, -7.39691046e-08, -0.507890642, 9.43387377e-08, 1, 1.43659724e-08, 0.507890642, -6.02888974e-08, 0.861421645)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1131.61938, 12.6472549, -383.55426, 0.797019005, -1.90704394e-08, 0.603954196, 1.16344996e-08, 1, 1.62222946e-08, -0.603954196, -5.90277205e-09, 0.797019005)




elseif Choosen == "Magma Admiral [Lv. 350] [Boss]" then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5220.21973, 7.49897194, 8435.47559, -0.281109154, 3.10173931e-08, 0.959675789, 2.83250312e-08, 1, -2.40237057e-08, -0.959675789, 2.04295638e-08, -0.281109154)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "MagmaQuest",
    [3] = 3
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5220.21973, 7.49897194, 8435.47559, -0.281109154, 3.10173931e-08, 0.959675789, 2.83250312e-08, 1, -2.40237057e-08, -0.959675789, 2.04295638e-08, -0.281109154)


elseif Choosen == "Wysper [Lv. 500] [Boss]" then

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7894.74756, 5545.60889, -408.395416, 0.806966007, 5.16806935e-08, -0.590597868, -6.1094795e-08, 1, 4.02857836e-09, 0.590597868, 3.28315366e-08, 0.806966007)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)


local args = {
    [1] = "StartQuest",
    [2] = "SkyExp1Quest",
    [3] = 3
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7894.74756, 5545.60889, -408.395416, 0.806966007, 5.16806935e-08, -0.590597868, -6.1094795e-08, 1, 4.02857836e-09, 0.590597868, 3.28315366e-08, 0.806966007)

elseif Choosen == "Cyborg [Lv. 675] [Boss]" then

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5238.64014, 38.5269432, 4062.28809, -0.633600593, -1.75828632e-08, -0.773660302, -2.15085034e-08, 1, -5.11213916e-09, 0.773660302, 1.34012224e-08, -0.633600593)
wait(WaitBeforeSpawnSet)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Set Spawn Point"].Head.CFrame
wait(1)
SetSpawn()
wait(0.5)

local args = {
    [1] = "StartQuest",
    [2] = "FountainQuest",
    [3] = 3
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5238.64014, 38.5269432, 4062.28809, -0.633600593, -1.75828632e-08, -0.773660302, -2.15085034e-08, 1, -5.11213916e-09, 0.773660302, 1.34012224e-08, -0.633600593)
end
end)
Main:Toggle("AutoShoot", false, function(State)
_G.AutoShoot = State
while _G.AutoShoot do wait()
Shoot()
end
end)


Misc:Toggle("AutoHit", false, function(State)
_G.AutoHit = true
while _G.AutoHit do wait()
    hit()
end
end)


Main:Toggle("Auto Buso", false, function(State)
_G.AutoBuso = State
while _G.AutoBuso do wait(1)
if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso")then
wait()
local args = {
    [1] = "Buso"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end
end)

Main:Toggle("AutoQuest", false, function(State)
_G.AutoQuest = State
while _G.AutoQuest do wait(1)
Choosen = Config.NPC
if Choosen == "Bandit [Lv. 5]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "BanditQuest1",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Monkey [Lv. 14]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "JungleQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Gorilla [Lv. 20]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "JungleQuest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Pirate [Lv. 35]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "BuggyQuest1",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Brute [Lv. 45]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "BuggyQuest1",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Desert Bandit [Lv. 60]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "DesertQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Desert Officer [Lv. 70]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "DesertQuest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Snow Bandit [Lv. 90]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "SnowQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Snowman [Lv. 100]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "SnowQuest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Chief Petty Officer [Lv. 120]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "MarineQuest2",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Sky Bandit [Lv. 150]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "SkyQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Toga Warrior [Lv. 225]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "ColosseumQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Gladiator [Lv. 275]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "ColosseumQuest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Military Soldier [Lv. 300]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "MagmaQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Military Spy [Lv. 330]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "MagmaQuest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

elseif Choosen == "God's Guard [Lv. 450]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "SkyExp1Quest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Shanda [Lv. 475]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "SkyExp1Quest",
    [3] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif Choosen == "Galley Pirate [Lv. 625]" and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
local args = {
    [1] = "StartQuest",
    [2] = "FountainQuest",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

end
end
end)


Farms:Toggle("AutoFarm", false, function(State)
if Config.AutoFarmMethod == "PathFinding" then
_G.PathWalk = State
while _G.PathWalk do wait()
PathWalk(game.Workspace.Enemies:FindFirstChild(Config.NPC).HumanoidRootPart.Position)
if not _G.AutoShoot then
hit()
end
end
elseif Config.AutoFarmMethod == "Teleport" then
_G.AutoFarm = State
game:GetService('RunService').Stepped:connect(function()
if _G.AutoFarm then
game.Workspace.Enemies:FindFirstChild(Config.NPC).HumanoidRootPart.Size = Vector3.new(30, 30, 30) --resize
tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
tween =
    tweenService:Create(
    game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
    tweenInfo,
    {CFrame = CFrame.new(game.Workspace.Enemies:FindFirstChild(Config.NPC).HumanoidRootPart.Position + Vector3.new(0, -15, 0), game.Workspace.Enemies:FindFirstChild(Config.NPC).HumanoidRootPart.Position)}
)
tween:Play()
if not _G.AutoShoot then
Hit()
end
end
end)
elseif Config.AutoFarmMethod == "Bring" then
_G.loops = State
while _G.loops do wait()
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") then
if v.Name == Config.NPC then
if _G.loops then
tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
tween = tweenService:Create(v.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position + Vector3.new(0,10,0),game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position)})
tween:Play()
if not _G.AutoShoot then
hit()
end
end
v.HumanoidRootPart.CanCollide = false
game.Workspace.Enemies:FindFirstChild(Config.NPC).HumanoidRootPart.Size = Vector3.new(15, 30, 15)
end
end
end
end
end
end)
Farms:Button("Bring NPC's once", function()
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") then
tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
tween = tweenService:Create(v.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position + Vector3.new(0,10,0),game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position)})
tween:Play()
v.HumanoidRootPart.CanCollide = false
end
end
end)



Shop:Label("Candy Event")

Shop:Button("Buy Random Fruit [ 100 Candies ]", function()
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(-697.923035, 17.2672977, 1554.10742, 0.988639653, 1.50567576e-08, 0.15030472, -2.80688432e-08, 1, 8.44499226e-08, -0.15030472, -8.77094095e-08, 0.988639653))
wait(2)
local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 4,
    [4] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
Teleport(Config.Pos)
end)

Shop:Dropdown("Magic Elf", {"2xEXP ( 20 Mins ) [ 50 Candies ]","Stats Refund [ 70 Candies ]", "Race Reroll [ 90 Candies ]"}, function(Choosen)
if Config.Choosen == "Race Reroll [ 90 Candies ]" then
wait(1)
Teleport(Config.Pos)

elseif Choosen == "Stats Refund [ 70 Candies ]" then
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(-697.923035, 17.2672977, 1554.10742, 0.988639653, 1.50567576e-08, 0.15030472, -2.80688432e-08, 1, 8.44499226e-08, -0.15030472, -8.77094095e-08, 0.988639653))
wait(2)
local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 1,
    [4] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
Teleport(Config.Pos)
elseif Choosen == "2xEXP ( 20 Mins ) [ 50 Candies ]" then
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(-697.923035, 17.2672977, 1554.10742, 0.988639653, 1.50567576e-08, 0.15030472, -2.80688432e-08, 1, 8.44499226e-08, -0.15030472, -8.77094095e-08, 0.988639653))
wait(2)
local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 1,
    [4] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
Teleport(Config.Pos)
end
end)


Shop:Dropdown("Santa Claws", {"Elf Hat [ 200 Candies ]","Santa Hat [ 400 Candies ]", "Sleigh [ 1k Candies ]"}, function(Choosen)
if Config.Choosen == "Elf Hat [ 200 Candies ]" then
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(-697.923035, 17.2672977, 1554.10742, 0.988639653, 1.50567576e-08, 0.15030472, -2.80688432e-08, 1, 8.44499226e-08, -0.15030472, -8.77094095e-08, 0.988639653))
wait(2)


local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 3,
    [4] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
Teleport(Config.Pos)

elseif Config.Choosen == "Santa Hat [ 400 Candies ]" then
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(-697.923035, 17.2672977, 1554.10742, 0.988639653, 1.50567576e-08, 0.15030472, -2.80688432e-08, 1, 8.44499226e-08, -0.15030472, -8.77094095e-08, 0.988639653))
wait(2)
local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 3,
    [4] = 2
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
Teleport(Config.Pos)


elseif Config.Choosen == "Sleigh [ 1k Candies ]" then
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(-697.923035, 17.2672977, 1554.10742, 0.988639653, 1.50567576e-08, 0.15030472, -2.80688432e-08, 1, 8.44499226e-08, -0.15030472, -8.77094095e-08, 0.988639653))
wait(2)
local args = {
    [1] = "Candies",
    [2] = "Buy",
    [3] = 3,
    [4] = 3
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
Teleport(Config.Pos)

end
end)



Shop:Line("")

Shop:Dropdown("Sword Dealer", {"Katana [ $1k ]","Cutlass [ $1k ]"}, function(Choosen)
if Choosen == "Katana [ $1k ]" then
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(896.65686, 16.2993622, 1413.99255, 0.926130891, 3.08631236e-08, 0.377202272, -1.73441606e-09, 1, -7.75627029e-08, -0.377202272, 7.1178988e-08, 0.926130891))
wait(2)
local args = {
    [1] = "BuyItem",
    [2] = "Katana"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
Teleport(Config.Pos)
elseif Choosen == "Cutlass [ $1k ]" then
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(896.65686, 16.2993622, 1413.99255, 0.926130891, 3.08631236e-08, 0.377202272, -1.73441606e-09, 1, -7.75627029e-08, -0.377202272, 7.1178988e-08, 0.926130891))
wait(2)
local args = {
    [1] = "BuyItem",
    [2] = "Cutlass"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
Teleport(Config.Pos)
end
end)

Shop:Dropdown("Weapon Dealer", {"SlingShot [ $5k ]","Musket [ $8k ]", "Flintlock [ $10.5k ]"}, function(Choosen)
if Choosen == "SlingShot [ $5k ]" then
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(-700.164368, 7.87804985, 1513.8501, -0.941088378, 7.43253992e-08, -0.338160634, 6.03030657e-08, 1, 5.19719947e-08, 0.338160634, 2.85181265e-08, -0.941088378))
wait(1)
local args = {
    [1] = "BuyItem",
    [2] = "Slingshot"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
Teleport(Config.Pos)

elseif Choosen == "Musket [ $8k ]" then
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(-700.164368, 7.87804985, 1513.8501, -0.941088378, 7.43253992e-08, -0.338160634, 6.03030657e-08, 1, 5.19719947e-08, 0.338160634, 2.85181265e-08, -0.941088378))
wait(1)
local args = {
    [1] = "BuyItem",
    [2] = "Musket"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
Teleport(Config.Pos)

elseif Choosen == "Flintlock [ $10.5k ]" then
Config.Pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
Teleport(CFrame.new(-700.164368, 7.87804985, 1513.8501, -0.941088378, 7.43253992e-08, -0.338160634, 6.03030657e-08, 1, 5.19719947e-08, 0.338160634, 2.85181265e-08, -0.941088378))
wait(1)
local args = {
    [1] = "BuyItem",
    [2] = "Flintlock"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
Teleport(Config.Pos)


end
end)




Shop:Dropdown("Boat Dealer", {"Dinghy [ Free ] ","PirateSloop [ $300 ]", "MarineSloop [ $300 ]", "PirateBasic [ $1k ]", "MarineBasic [ $1k ]"}, function(Choosen)
if Choosen == "Dinghy [ Free ] " then
local args = {
    [1] = "BuyBoat",
    [2] = "Dinghy"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

elseif Choosen == "PirateSloop [ $300 ]" then

local args = {
    [1] = "BuyBoat",
    [2] = "PirateSloop"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

elseif Choosen == "MarineSloop [ $300 ]" then

local args = {
    [1] = "BuyBoat",
    [2] = "MarineSloop"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


elseif Choosen == "PirateBasic [ $1k ]" then

local args = {
    [1] = "BuyBoat",
    [2] = "PirateBasic"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

elseif Choosen == "MarineBasic [ $1k ]" then

local args = {
    [1] = "BuyBoat",
    [2] = "MarineBasic"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end)


local Name = "BFSettings.txt"


local DefaultSettings = {
ServerHop = true,
UseWebHook = false,
WaitTime = 30,
AutoEat = false,
Fruit = " ",
url = " " ,
Claimed = false
}

local Fruits = {
"Bomb Fruit",
"Spike Fruit",
"Chop Fruit",
"Spring Fruit",
"Smoke Fruit",
"Flame Fruit",
"Ice Fruit",
"Sand Fruit",
"Dark Fruit",
"Light Fruit",
"Rubber Fruit",
"Barrier Fruit",
"Magma Fruit",
"Quake Fruit",
"Human: Buddha Fruit",
"String Fruit",
"Bird: Phoenix Fruit",
"Rumble Fruit",
"Paw Fruit",
"Gravity Fruit",
"Dought Fruit",
"Control Fruit",
"Dragon Fruit"
}


local Settings

if not pcall(function() readfile(Name) end) then writefile(Name, game:service'HttpService':JSONEncode(DefaultSettings)) end

Settings = game:service'HttpService':JSONDecode(readfile(Name))

local function Save()
writefile(Name,game:service'HttpService':JSONEncode(Settings))
end

FruitFarmer:Toggle("ServerHop", false, function(State)
Settings.ServerHop = State
print(Settings.ServerHop)
Save()
end)
FruitFarmer:Line("If it Should Hop when it finds a Fruit")

FruitFarmer:Slider("Wait Between ServerHop",false,0, 150, 35, function(Value)
Settings.WaitTime = Value
print(Settings.WaitTime)
Save()
end)
FruitFarmer:Line("Time Between Hop if Fruit found")

FruitFarmer:Toggle("Use Webhook", false, function(State)
Settings.UseWebHook = State
print(Settings.UseWebHook)
Save()
end)
FruitFarmer:Textbox("Webhook here",false,function(Text)
print(Text)
Settings.url = Text
print(Settings.url)
Save()
end)
FruitFarmer:Toggle("AutoEat Fruit", false, function(State)
Settings.AutoEat = State
print(Settings.AutoEat)
Save()
end)
FruitFarmer:Dropdown("Fruit Name", {unpack(Fruits)}, function(Choosen)
Settings.Fruit = Choosen
print(Settings.Fruit)
Save()
end)

FruitFarmer:Button("Start Fruit Farmer", function()
    
syn.queue_on_teleport('loadstring(game:HttpGet("https://pastebin.com/raw/ZtUBjxfq",true))()')

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates")

_G.ServerHop = Settings.ServerHop
_G.UseWebHook = Settings.UseWebHook
_G.WaitTime = Settings.WaitTime
_G.AutoEat = Settings.AutoEat
_G.Fruit = Settings.Fruit
_G.url = Settings.url
_G.Claimed = false

if game then
if not game:IsLoaded() then
repeat wait()
    until
    game:IsLoaded()
end
else
game:Shutdown()
end

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
warn("Anti AFK enabled")



wait(5)

local vim = game:GetService("VirtualInputManager")
local function click(a)
    vim:SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,true,a,1)
    vim:SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,false,a,1)
end

click(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton)

wait(4)

print("UseWebHook")

if _G.UseWebHook then
for i, v in pairs(workspace:GetChildren()) do
if v:IsA("Tool") then
if v.Handle or v.Name == "Fruit " then
local req = syn.request
local hwid_headers = {'Syn-Fingerprint'} -- You will have to add more headers for different exploits
local data = {
    ["username"]  = "Chicken",
    ["avatar_url"] = "https://cdn.webhookapp.com/attachments/801439197344563250/804359711557812294/Download.png",
    ["embeds"] = {
        {
            ["author"] = {
                ["name"] = game.Players.LocalPlayer.Name.. " Claimed a Fruit",
                ["url"] = "https://webhook.gg/brackets",
                ["icon_url"] = "https://web.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userid="..game.Players.LocalPlayer.UserId
            },
            ["url"] = "https://www.roblox.com/games/"..game.PlaceId,
            ["description"] = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
            ["color"] = 000000,
            ["fields"] = {
                {
                    ["name"] = "Ping",
                    ["value"] = "@everyone ",
                },
                {
                    ["name"] = "Player Info:",
                    ["value"] = "**Age: **"..game.Players.LocalPlayer.AccountAge,
                },
                {
                    ["name"] = "Fruit:",
                    ["value"] = v.Name,
                    ["inline"] = true
                },
                            {
                    ["name"] = "WaitingTimeFromNow:",
                    ["value"] = _G.WaitTime,
                    ["inline"] = true
                },
                {
                    ["name"] = "JobId:",
                    ["value"] = tostring("```"..game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId).."```"),
                    ["inline"] = true
                },
            },
            ["thumbnail"] = {
                ["url"] = "https://web.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userid="..game.Players.LocalPlayer.UserId
            },
            ["footer"] = {
                ["text"] = "Found a Fruit",
            }
        }
    }
}
local Post = req({Url = _G.url,  Method = 'POST', Headers = { ['Content-Type'] = 'application/json' }, Body = game:GetService('HttpService'):JSONEncode(data)})
end
end
end
end

print("Claim")


for i, v in pairs(workspace:GetChildren()) do
if v:IsA("Tool") and v.EatRemote then
if v.Handle then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle.TouchInterest.Parent, 0) --0 is touch
_G.Claimed = true
end
end
end

for i, v in pairs(workspace:GetChildren()) do
if v:IsA("Model") and v.Name == "Fruit " then
if v.Handle then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle.TouchInterest.Parent, 0) --0 is touch
_G.Claimed = true
end
end
end

print("Eat")

wait(2)
if _G.AutoEat then
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
   v.Parent = game.Players.LocalPlayer.Character
end
wait(0.2)
for i,e in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
if e.Name == _G.Fruit then
game:GetService("Players").LocalPlayer.Character[_G.Fruit].EatRemote:InvokeServer()
wait(99999999999999999999999)
else
_G.Claimed = false
end
end
end


print("DoneEat")

if _G.Claimed then
print("Yes")
if _G.ServerHop then
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
print("Waiting")
wait(_G.WaitTime)
Teleport()
end
elseif not _G.Claimed then
print("No")
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

Teleport()
end
end)
















end


