local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UserInputService=game:GetService("UserInputService")
local TweenService=game:GetService("TweenService")
local Workspace=game:GetService("Workspace")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local VirtualInputManager=game:GetService("VirtualInputManager")
local TeleportService=game:GetService("TeleportService")
local HttpService=game:GetService("HttpService")
local Lighting=game:GetService("Lighting")
local StarterGui=game:GetService("StarterGui")
local CoreGui=game:GetService("CoreGui")
local LP=Players.LocalPlayer
local Cam=Workspace.CurrentCamera

local C={
AutoFarmLevel=false,AutoFarmChest=false,AutoFarmFruit=false,AutoFarmBoss=false,
AutoFarmElite=false,AutoFarmBounty=false,AutoFarmMastery=false,AutoFarmMoney=false,
AutoFarmBone=false,AutoFarmFlower=false,AutoFarmMaterial=false,AutoFarmSword=false,
AutoFarmGun=false,AutoFarmFishing=false,AutoFarmRaid=false,AutoFarmQuest=false,
AutoFarmCakePrince=false,AutoFarmDoughKing=false,AutoFarmSeaBeast=false,
AutoFarmTrial=false,AutoFarmRaceV4=false,AutoFarmLeviathan=false,
AutoFarmKitsune=false,AutoFarmHydra=false,AutoFarmPirateRaid=false,
AutoFarmMarineRaid=false,AutoFarmGhostShip=false,AutoFarmZou=false,
AutoFarmCursedShip=false,AutoFarmHauntedShip=false,AutoFarmCastleOnSea=false,
AutoFarmTurtleIsland=false,AutoFarmGreatTree=false,AutoFarmPrehistoric=false,
AutoFarmFloatingTurtle=false,
KillAura=false,FastAttack=false,Aimbot=false,AutoSkill=false,AutoCombo=false,
AutoHaki=false,AutoObservation=false,AutoBusoshoku=false,AutoKenbunshoku=false,
AutoHaoshoku=false,AutoGear=false,AutoAwaken=false,AutoSword=false,
AutoGun=false,AutoFruitSkill=false,AutoClicker=false,NoCooldown=false,
NoClip=false,InfiniteJump=false,Fly=false,SpeedHack=false,JumpHack=false,
AntiAFK=false,AntiBan=false,AntiKick=false,AntiFling=false,AntiVoid=false,
AntiRagdoll=false,AntiStun=false,GodMode=false,WalkOnWater=false,
WalkOnAir=false,FreezePlayer=false,GhostMode=false,Invisible=false,
FruitSniper=false,AutoBuyFruit=false,AutoStoreFruit=false,AutoRandomFruit=false,
AutoFruitNotifier=false,AutoFruitDrop=false,AutoFruitCollect=false,
FruitESP=false,FruitTP=false,FruitInfo=false,
ESP=false,PlayerESP=false,MobESP=false,ChestESP=false,FruitESP2=false,
IslandESP=false,BossESP=false,ItemESP=false,NameESP=false,HealthESP=false,
DistanceESP=false,TracerESP=false,BoxESP=false,SkeletonESP=false,
ServerHop=false,Rejoin=false,AutoRejoin=false,LowestPlayerHop=false,
RegionHop=false,JobIDHop=false,AutoServerHop=false,
FullBright=false,NoFog=false,Ambient=false,ClockTime=false,FOV=false,
ShowFPS=false,ShowPing=false,ShowCoords=false,ShowSpeed=false,ShowHealth=false,
ShowStats=false,ShowServerInfo=false,ShowPlayerCount=false,
AutoSell=false,AutoBuy=false,AutoStore=false,AutoEquip=false,AutoUnequip=false,
AutoDrop=false,AutoPickup=false,AutoTrade=false,AutoAcceptTrade=false,
AutoChest=false,AutoBoss=false,AutoElite=false,
AutoRace=false,AutoSaber=false,AutoPole=false,AutoDarkBlade=false,
AutoCursedDual=false,AutoDragonTrident=false,AutoSharkmanKarate=false,
AutoSuperhuman=false,AutoDeathStep=false,AutoElectricClaw=false,
AutoDragonTalon=false,AutoGodhuman=false,AutoSanguineArt=false,
WalkSpeed=16,JumpPower=50,FOVValue=70
}

local function New(class,props,parent)
local o=Instance.new(class)
for k,v in pairs(props or {}) do o[k]=v end
if parent then o.Parent=parent end
return o
end

local SG=New("ScreenGui",{Name="BananaHubV2",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},CoreGui)
local Main=New("Frame",{Size=UDim2.new(0,600,0,420),Position=UDim2.new(0.5,-300,0.5,-210),BackgroundColor3=Color3.fromRGB(18,18,24),BorderSizePixel=0},SG)
New("UICorner",{CornerRadius=UDim.new(0,10)},Main)
local Top=New("Frame",{Size=UDim2.new(1,0,0,34),BackgroundColor3=Color3.fromRGB(28,28,36),BorderSizePixel=0},Main)
New("UICorner",{CornerRadius=UDim.new(0,10)},Top)
New("TextLabel",{Size=UDim2.new(1,-100,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Text="Banana Hub V2 | Blox Fruits | NO KEY",TextColor3=Color3.fromRGB(255,220,60),Font=Enum.Font.GothamBold,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left},Top)
local X=New("TextButton",{Size=UDim2.new(0,34,0,34),Position=UDim2.new(1,-34,0,0),BackgroundTransparency=1,Text="X",TextColor3=Color3.fromRGB(255,80,80),Font=Enum.Font.GothamBold,TextSize=16},Top)
X.MouseButton1Click:Connect(function() SG:Destroy() end)

local drag,dInput,dStart,sPos
Top.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=true;dStart=i.Position;sPos=Main.Position;i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then drag=false end end) end end)
Top.InputChanged:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseMovement then dInput=i end end)
UserInputService.InputChanged:Connect(function(i) if i==dInput and drag then local d=i.Position-dStart;Main.Position=UDim2.new(sPos.X.Scale,sPos.X.Offset+d.X,sPos.Y.Scale,sPos.Y.Offset+d.Y) end end)

local TabBar=New("Frame",{Size=UDim2.new(0,130,1,-34),Position=UDim2.new(0,0,0,34),BackgroundColor3=Color3.fromRGB(22,22,30),BorderSizePixel=0},Main)
local Content=New("Frame",{Size=UDim2.new(1,-130,1,-34),Position=UDim2.new(0,130,0,34),BackgroundTransparency=1},Main)
local TabScroll=New("ScrollingFrame",{Size=UDim2.new(1,-6,1,-6),Position=UDim2.new(0,3,0,3),BackgroundTransparency=1,ScrollBarThickness=2,CanvasSize=UDim2.new(0,0,0,0)},TabBar)
New("UIListLayout",{Padding=UDim.new(0,3),SortOrder=Enum.SortOrder.LayoutOrder},TabScroll)

local function MakeTab(name)
local b=New("TextButton",{Size=UDim2.new(1,0,0,28),BackgroundColor3=Color3.fromRGB(36,36,46),Text=name,TextColor3=Color3.fromRGB(220,220,220),Font=Enum.Font.Gotham,TextSize=11},TabScroll)
New("UICorner",{CornerRadius=UDim.new(0,4)},b)
local f=New("ScrollingFrame",{Size=UDim2.new(1,-6,1,-6),Position=UDim2.new(0,3,0,3),BackgroundTransparency=1,ScrollBarThickness=3,CanvasSize=UDim2.new(0,0,0,0),Visible=false},Content)
New("UIListLayout",{Padding=UDim.new(0,3),SortOrder=Enum.SortOrder.LayoutOrder},f)
b.MouseButton1Click:Connect(function() for _,c in ipairs(Content:GetChildren()) do if c:IsA("ScrollingFrame") then c.Visible=false end end;f.Visible=true end)
return f
end

local FT=MakeTab("Farm")
local CT=MakeTab("Combat")
local PT=MakeTab("Player")
local FRT=MakeTab("Fruit")
local MT=MakeTab("Misc")
local ST=MakeTab("Server")
local VT=MakeTab("Visual")
local STA=MakeTab("Stats")
local UT=MakeTab("Utility")
local ET=MakeTab("Extras")
FT.Visible=true

local function Toggle(p,txt,key)
local b=New("TextButton",{Size=UDim2.new(1,-6,0,26),BackgroundColor3=Color3.fromRGB(42,42,54),Text="  "..txt..": OFF",TextColor3=Color3.fromRGB(200,200,200),Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left},p)
New("UICorner",{CornerRadius=UDim.new(0,4)},b)
b.MouseButton1Click:Connect(function()
C[key]=not C[key]
b.Text="  "..txt..": "..(C[key] and "ON" or "OFF")
b.TextColor3=C[key] and Color3.fromRGB(120,255,120) or Color3.fromRGB(200,200,200)
end)
end

local function Btn(p,txt,fn)
local b=New("TextButton",{Size=UDim2.new(1,-6,0,26),BackgroundColor3=Color3.fromRGB(50,50,70),Text=txt,TextColor3=Color3.fromRGB(255,220,60),Font=Enum.Font.Gotham,TextSize=11},p)
New("UICorner",{CornerRadius=UDim.new(0,4)},b)
b.MouseButton1Click:Connect(fn)
end

local function Slider(p,txt,min,max,def,key)
local f=New("Frame",{Size=UDim2.new(1,-6,0,42),BackgroundColor3=Color3.fromRGB(42,42,54)},p)
New("UICorner",{CornerRadius=UDim.new(0,4)},f)
local l=New("TextLabel",{Size=UDim2.new(1,-8,0,20),Position=UDim2.new(0,4,0,1),BackgroundTransparency=1,Text=txt..": "..def,TextColor3=Color3.fromRGB(220,220,220),Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left},f)
local bar=New("Frame",{Size=UDim2.new(1,-10,0,6),Position=UDim2.new(0,5,1,-11),BackgroundColor3=Color3.fromRGB(60,60,75)},f)
New("UICorner",{CornerRadius=UDim.new(0,3)},bar)
local fill=New("Frame",{Size=UDim2.new((def-min)/(max-min),0,1,0),BackgroundColor3=Color3.fromRGB(255,220,60)},bar)
New("UICorner",{CornerRadius=UDim.new(0,3)},fill)
local function upd(x)
local rel=math.clamp((x-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
local val=math.floor(min+(max-min)*rel)
fill.Size=UDim2.new(rel,0,1,0);l.Text=txt..": "..val;C[key]=val
end
bar.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then upd(i.Position.X);local c;c=UserInputService.InputChanged:Connect(function(j) if j.UserInputType==Enum.UserInputType.MouseMovement or j.UserInputType==Enum.UserInputType.Touch then upd(j.Position.X) end end);UserInputService.InputEnded:Connect(function(j) if j.UserInputType==Enum.UserInputType.MouseButton1 or j.UserInputType==Enum.UserInputType.Touch then c:Disconnect() end end) end end)
end

for _,t in ipairs({{"Auto Farm Level","AutoFarmLevel"},{"Auto Farm Chest","AutoFarmChest"},{"Auto Farm Fruit","AutoFarmFruit"},{"Auto Farm Boss","AutoFarmBoss"},{"Auto Farm Elite","AutoFarmElite"},{"Auto Farm Bounty","AutoFarmBounty"},{"Auto Farm Mastery","AutoFarmMastery"},{"Auto Farm Money","AutoFarmMoney"},{"Auto Farm Bone","AutoFarmBone"},{"Auto Farm Flower","AutoFarmFlower"},{"Auto Farm Material","AutoFarmMaterial"},{"Auto Farm Sword","AutoFarmSword"},{"Auto Farm Gun","AutoFarmGun"},{"Auto Farm Fishing","AutoFarmFishing"},{"Auto Farm Raid","AutoFarmRaid"},{"Auto Farm Quest","AutoFarmQuest"},{"Auto Farm Cake Prince","AutoFarmCakePrince"},{"Auto Farm Dough King","AutoFarmDoughKing"},{"Auto Farm Sea Beast","AutoFarmSeaBeast"},{"Auto Farm Trial","AutoFarmTrial"},{"Auto Farm Race V4","AutoFarmRaceV4"},{"Auto Farm Leviathan","AutoFarmLeviathan"},{"Auto Farm Kitsune","AutoFarmKitsune"},{"Auto Farm Hydra","AutoFarmHydra"},{"Auto Farm Pirate Raid","AutoFarmPirateRaid"},{"Auto Farm Marine Raid","AutoFarmMarineRaid"},{"Auto Farm Ghost Ship","AutoFarmGhostShip"},{"Auto Farm Zou","AutoFarmZou"},{"Auto Farm Cursed Ship","AutoFarmCursedShip"},{"Auto Farm Haunted Ship","AutoFarmHauntedShip"},{"Auto Farm Castle On Sea","AutoFarmCastleOnSea"},{"Auto Farm Turtle Island","AutoFarmTurtleIsland"},{"Auto Farm Great Tree","AutoFarmGreatTree"},{"Auto Farm Prehistoric","AutoFarmPrehistoric"},{"Auto Farm Floating Turtle","AutoFarmFloatingTurtle"}}) do Toggle(FT,t[1],t[2]) end

for _,t in ipairs({{"Kill Aura","KillAura"},{"Fast Attack","FastAttack"},{"Aimbot","Aimbot"},{"Auto Skill","AutoSkill"},{"Auto Combo","AutoCombo"},{"Auto Haki","AutoHaki"},{"Auto Observation","AutoObservation"},{"Auto Busoshoku","AutoBusoshoku"},{"Auto Kenbunshoku","AutoKenbunshoku"},{"Auto Haoshoku","AutoHaoshoku"},{"Auto Gear","AutoGear"},{"Auto Awaken","AutoAwaken"},{"Auto Sword","AutoSword"},{"Auto Gun","AutoGun"},{"Auto Fruit Skill","AutoFruitSkill"},{"Auto Clicker","AutoClicker"},{"No Cooldown","NoCooldown"}}) do Toggle(CT,t[1],t[2]) end

for _,t in ipairs({{"NoClip","NoClip"},{"Infinite Jump","InfiniteJump"},{"Fly","Fly"},{"Speed Hack","SpeedHack"},{"Jump Hack","JumpHack"},{"Anti AFK","AntiAFK"},{"Anti Ban","AntiBan"},{"Anti Kick","AntiKick"},{"Anti Fling","AntiFling"},{"Anti Void","AntiVoid"},{"Anti Ragdoll","AntiRagdoll"},{"Anti Stun","AntiStun"},{"God Mode","GodMode"},{"Walk On Water","WalkOnWater"},{"Walk On Air","WalkOnAir"},{"Freeze Player","FreezePlayer"},{"Ghost Mode","GhostMode"},{"Invisible","Invisible"}}) do Toggle(PT,t[1],t[2]) end
Slider(PT,"WalkSpeed",16,500,16,"WalkSpeed")
Slider(PT,"JumpPower",50,500,50,"JumpPower")

for _,t in ipairs({{"Fruit Sniper","FruitSniper"},{"Auto Buy Fruit","AutoBuyFruit"},{"Auto Store Fruit","AutoStoreFruit"},{"Auto Random Fruit","AutoRandomFruit"},{"Auto Fruit Notifier","AutoFruitNotifier"},{"Auto Fruit Drop","AutoFruitDrop"},{"Auto Fruit Collect","AutoFruitCollect"},{"Fruit ESP","FruitESP"},{"Fruit TP","FruitTP"},{"Fruit Info","FruitInfo"}}) do Toggle(FRT,t[1],t[2]) end

for _,t in ipairs({{"ESP","ESP"},{"Player ESP","PlayerESP"},{"Mob ESP","MobESP"},{"Chest ESP","ChestESP"},{"Fruit ESP 2","FruitESP2"},{"Island ESP","IslandESP"},{"Boss ESP","BossESP"},{"Item ESP","ItemESP"},{"Name ESP","NameESP"},{"Health ESP","HealthESP"},{"Distance ESP","DistanceESP"},{"Tracer ESP","TracerESP"},{"Box ESP","BoxESP"},{"Skeleton ESP","SkeletonESP"}}) do Toggle(MT,t[1],t[2]) end

for _,t in ipairs({{"Server Hop","ServerHop"},{"Rejoin","Rejoin"},{"Auto Rejoin","AutoRejoin"},{"Lowest Player Hop","LowestPlayerHop"},{"Region Hop","RegionHop"},{"Job ID Hop","JobIDHop"},{"Auto Server Hop","AutoServerHop"}}) do Toggle(ST,t[1],t[2]) end
Btn(ST,"Rejoin Now",function() TeleportService:Teleport(game.PlaceId,LP) end)
Btn(ST,"Server Hop Now",function()
local ok,res=pcall(function() return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100")) end)
if ok and res and res.data then for _,s in pairs(res.data) do if s.playing<s.maxPlayers then TeleportService:TeleportToPlaceInstance(game.PlaceId,s.id,LP);break end end end
end)

for _,t in ipairs({{"Full Bright","FullBright"},{"No Fog","NoFog"},{"Ambient","Ambient"},{"Clock Time","ClockTime"},{"FOV","FOV"}}) do Toggle(VT,t[1],t[2]) end
Slider(VT,"FOV Value",30,120,70,"FOVValue")

for _,t in ipairs({{"Show FPS","ShowFPS"},{"Show Ping","ShowPing"},{"Show Coords","ShowCoords"},{"Show Speed","ShowSpeed"},{"Show Health","ShowHealth"},{"Show Stats","ShowStats"},{"Show Server Info","ShowServerInfo"},{"Show Player Count","ShowPlayerCount"}}) do Toggle(STA,t[1],t[2]) end

for _,t in ipairs({{"Auto Sell","AutoSell"},{"Auto Buy","AutoBuy"},{"Auto Store","AutoStore"},{"Auto Equip","AutoEquip"},{"Auto Unequip","AutoUnequip"},{"Auto Drop","AutoDrop"},{"Auto Pickup","AutoPickup"},{"Auto Trade","AutoTrade"},{"Auto Accept Trade","AutoAcceptTrade"},{"Auto Chest","AutoChest"},{"Auto Boss","AutoBoss"},{"Auto Elite","AutoElite"}}) do Toggle(UT,t[1],t[2]) end

for _,t in ipairs({{"Auto Race","AutoRace"},{"Auto Saber","AutoSaber"},{"Auto Pole","AutoPole"},{"Auto Dark Blade","AutoDarkBlade"},{"Auto Cursed Dual","AutoCursedDual"},{"Auto Dragon Trident","AutoDragonTrident"},{"Auto Sharkman Karate","AutoSharkmanKarate"},{"Auto Superhuman","AutoSuperhuman"},{"Auto Death Step","AutoDeathStep"},{"Auto Electric Claw","AutoElectricClaw"},{"Auto Dragon Talon","AutoDragonTalon"},{"Auto Godhuman","AutoGodhuman"},{"Auto Sanguine Art","AutoSanguineArt"}}) do Toggle(ET,t[1],t[2]) end

local function Char() return LP.Character or LP.CharacterAdded:Wait() end
local function HRP() local c=LP.Character;return c and c:FindFirstChild("HumanoidRootPart") end
local function Hum() local c=LP.Character;return c and c:FindFirstChildOfClass("Humanoid") end

local function NearestMob(dist)
dist=dist or 500;local hrp=HRP();if not hrp then return end
local n,d=nil,dist
for _,v in pairs(Workspace:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v~=LP.Character and v.Humanoid.Health>0 then
local m=(v.HumanoidRootPart.Position-hrp.Position).Magnitude
if m<d then n,d=v,m end
end
end
return n
end

local function Attack(mob)
if not mob then return end
local c=LP.Character;if not c then return end
local tool=c:FindFirstChildOfClass("Tool");if tool then tool:Activate() end
local cf=ReplicatedStorage:FindFirstChild("CombatFramework")
if cf then local rig=cf:FindFirstChild("Rig");if rig then local r=rig:FindFirstChild("Attack");if r then pcall(function() r:FireServer(mob.Humanoid) end) end end end
end

local function PressKey(k)
pcall(function()
VirtualInputManager:SendKeyEvent(true,k,false,game)
task.wait(0.05)
VirtualInputManager:SendKeyEvent(false,k,false,game)
end)
end

RunService.Heartbeat:Connect(function()
local h=Hum()
if h then
if C.WalkSpeed then h.WalkSpeed=C.WalkSpeed end
if C.JumpPower then h.JumpPower=C.JumpPower end
end

if C.AutoFarmLevel or C.AutoFarmBoss or C.AutoFarmElite or C.AutoFarmMastery or C.AutoFarmMoney or C.AutoFarmBone or C.AutoFarmFlower or C.AutoFarmMaterial or C.AutoFarmSword or C.AutoFarmGun or C.AutoFarmCakePrince or C.AutoFarmDoughKing or C.AutoFarmSeaBeast or C.AutoFarmLeviathan or C.AutoFarmKitsune or C.AutoFarmHydra or C.AutoFarmZou or C.AutoFarmPrehistoric then
local mob=NearestMob(C.AutoFarmBoss and 900 or 350)
if mob then local hrp=HRP();if hrp then hrp.CFrame=mob.HumanoidRootPart.CFrame*CFrame.new(0,0,5);Attack(mob) end end
end

if C.KillAura then
local hrp=HRP()
if hrp then
for _,v in pairs(Workspace:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v~=LP.Character and v.Humanoid.Health>0 then
if (v.HumanoidRootPart.Position-hrp.Position).Magnitude<60 then Attack(v) end
end
end
end
end

if C.NoClip then
local c=LP.Character
if c then for _,v in pairs(c:GetDescendants()) do if v:IsA("BasePart") and v.CanCollide then v.CanCollide=false end end end
end

if C.Fly then
local hrp=HRP()
if hrp then
local dir=Vector3.zero
if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir+=Cam.CFrame.LookVector end
if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir-=Cam.CFrame.LookVector end
if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir-=Cam.CFrame.RightVector end
if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir+=Cam.CFrame.RightVector end
if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir+=Vector3.new(0,1,0) end
if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir-=Vector3.new(0,1,0) end
hrp.CFrame=hrp.CFrame+dir*1.5
end
end

if C.FOV and C.FOVValue then Cam.FieldOfView=C.FOVValue end
end)

UserInputService.JumpRequest:Connect(function()
if C.InfiniteJump then local h=Hum();if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end end
end)

task.spawn(function()
while task.wait(0.5) do
if C.AutoHaki then PressKey(Enum.KeyCode.Z) end
if C.AutoObservation then PressKey(Enum.KeyCode.X) end
if C.AutoBusoshoku then PressKey(Enum.KeyCode.Z) end
if C.AutoKenbunshoku then PressKey(Enum.KeyCode.X) end
end
end)

task.spawn(function()
while task.wait(0.1) do
if C.AutoClicker then
VirtualInputManager:SendMouseButtonEvent(0,0,0,true,game,0)
task.wait(0.05)
VirtualInputManager:SendMouseButtonEvent(0,0,0,false,game,0)
end
end
end)

task.spawn(function()
while task.wait(1) do
if C.FullBright then
Lighting.Ambient=Color3.fromRGB(255,255,255)
Lighting.OutdoorAmbient=Color3.fromRGB(255,255,255)
Lighting.Brightness=2
Lighting.FogEnd=100000
Lighting.FogStart=100000
end
if C.NoFog then Lighting.FogEnd=100000;Lighting.FogStart=100000 end
if C.Ambient then Lighting.Ambient=Color3.fromRGB(150,150,150);Lighting.OutdoorAmbient=Color3.fromRGB(150,150,150) end
if C.ClockTime then Lighting.ClockTime=12 end
end
end)

task.spawn(function()
while task.wait(60) do
if C.AntiAFK then
local vu=game:GetService("VirtualUser")
vu:CaptureController()
vu:ClickButton2(Vector2.new())
end
end
end)

RunService.Heartbeat:Connect(function()
if C.AntiVoid then
local hrp=HRP()
if hrp and hrp.Position.Y<-50 then hrp.CFrame=CFrame.new(0,100,0) end
end
if C.WalkOnWater then
local hrp=HRP()
if hrp and hrp.Position.Y<5 then hrp.CFrame=CFrame.new(hrp.Position.X,5,hrp.Position.Z) end
end
end)

local ESPFolder=Instance.new("Folder",Workspace)
ESPFolder.Name="BananaESP"

local function ApplyESP(obj,color)
if not obj or not obj:FindFirstChild("HumanoidRootPart") then return end
local hl=ESPFolder:FindFirstChild(obj.Name)
if not hl then
hl=Instance.new("Highlight",ESPFolder)
hl.Name=obj.Name
hl.Adornee=obj
hl.FillColor=color
hl.OutlineColor=Color3.fromRGB(255,255,255)
hl.FillTransparency=0.5
end
end

task.spawn(function()
while task.wait(0.5) do
for _,v in pairs(ESPFolder:GetChildren())
Destroy()
end
if C.ESP or C.PlayerESP then
for _,p in pairs(Players:GetPlayers()) do
if p~=LP and p.Character then ApplyESP(p.Character,Color3.fromRGB(255,0,0)) end
end
end
if C.MobESP then
for _,v in pairs(Workspace:GetChildren()) do
if v:FindFirstChild("Humanoid") and v~=LP.Character and not Players:GetPlayerFromCharacter(v) then
ApplyESP(v,Color3.fromRGB(255,120,0))
end
end
end
if C.BossESP then
for _,v in pairs(Workspace:GetChildren()) do
if v:FindFirstChild("Humanoid") and (v.Name:lower():find("boss") or v.Name:lower():find("king") or v.Name:lower():find("lord")) then
ApplyESP(v,Color3.fromRGB(255,0,255))
end
end
end
if C.ChestESP then
for _,v in pairs(Workspace:GetDescendants()) do
if v:IsA("Part") and v.Name:lower():find("chest") then
local bb=Instance.new("BillboardGui",v)
bb.Size=UDim2.new(0,80,0,30)
bb.AlwaysOnTop=true
local tl=Instance.new("TextLabel",bb)
tl.Size=UDim2.new(1,0,1,0)
tl.BackgroundTransparency=1
tl.Text="CHEST"
tl.TextColor3=Color3.fromRGB(255,220,60)
tl.TextScaled=true
task.delay(1,function() bb:Destroy() end)
end
end
end
end
end)

task.spawn(function()
while task.wait(1) do
if C.FruitSniper or C.AutoFruitNotifier or C.FruitESP then
for _,v in pairs(Workspace:GetDescendants()) do
if v:IsA("Tool") and v:FindFirstChild("Handle") then
local name=v.Name:lower()
local fruitNames={"rocket","spin","chop","spring","bomb","smoke","spike","flame","falcon","ice","sand","dark","diamond","light","rubber","barrier","magma","door","quake","human","bird","love","spider","sound","phoenix","portal","rumble","pain","blizzard","gravity","mammoth","trex","dough","shadow","venom","control","spirit","dragon","leopard","kitsune","gas"}
for _,fn in ipairs(fruitNames) do
if name:find(fn) then
if C.AutoFruitNotifier then
StarterGui:SetCore("SendNotification",{Title="Fruit Detected",Text=v.Name.." | Dist: "..math.floor((v.Handle.Position-HRP().Position).Magnitude),Duration=5})
end
if C.FruitSniper or C.FruitTP then
local hrp=HRP()
if hrp then hrp.CFrame=v.Handle.CFrame+Vector3.new(0,3,0) end
end
if C.FruitESP then
local bb=Instance.new("BillboardGui",v.Handle)
bb.Size=UDim2.new(0,100,0,30)
bb.AlwaysOnTop=true
local tl=Instance.new("TextLabel",bb)
tl.Size=UDim2.new(1,0,1,0)
tl.BackgroundTransparency=1
tl.Text=v.Name
tl.TextColor3=Color3.fromRGB(0,255,120)
tl.TextScaled=true
task.delay(3,function() bb:Destroy() end)
end
break
end
end
end
end
end
end
end)

task.spawn(function()
while task.wait(1) do
if C.AutoStoreFruit then
local bp=LP:FindFirstChild("Backpack")
if bp then
for _,v in pairs(bp:GetChildren()) do
if v:IsA("Tool") and v:FindFirstChild("Handle") then
local store=ReplicatedStorage:FindFirstChild("StoreFruit")
if store then pcall(function() store:FireServer(v) end) end
end
end
end
end
end
end)

RunService.Heartbeat:Connect(function()
if C.AntiFling then
local hrp=HRP()
if hrp and hrp:FindFirstChild("AlignPosition") then hrp.AlignPosition:Destroy() end
if hrp and hrp:FindFirstChild("AlignOrientation") then hrp.AlignOrientation:Destroy() end
end
if C.AntiRagdoll then
local c=LP.Character
if c then
local h=c:FindFirstChildOfClass("Humanoid")
if h and h:GetState()==Enum.HumanoidStateType.Physics then h:ChangeState(Enum.HumanoidStateType.GettingUp) end
end
end
end)

RunService.Heartbeat:Connect(function()
if C.GodMode then
local h=Hum()
if h then h.Health=h.MaxHealth end
end
end)

LP.OnTeleport:Connect(function()
if C.AutoRejoin then
task.wait(3)
TeleportService:Teleport(game.PlaceId,LP)
end
end)

task.spawn(function()
while task.wait(5) do
if C.ServerHop or C.AutoServerHop or C.LowestPlayerHop then
local ok,res=pcall(function() return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100")) end)
if ok and res and res.data then
local best=nil
if C.LowestPlayerHop then
local low=999
for _,s in pairs(res.data) do
if s.playing<low and s.playing<s.maxPlayers then low=s.playing;best=s end
end
else
for _,s in pairs(res.data) do
if s.playing<s.maxPlayers then best=s;break end
end
end
if best then TeleportService:TeleportToPlaceInstance(game.PlaceId,best.id,LP) end
end
end
end
end)

local StatsGui=New("Frame",{Size=UDim2.new(0,200,0,100),Position=UDim2.new(0,10,0,10),BackgroundColor3=Color3.fromRGB(20,20,25),BackgroundTransparency=0.3,BorderSizePixel=0},SG)
New("UICorner",{CornerRadius=UDim.new(0,6)},StatsGui)
local StatsLabel=New("TextLabel",{Size=UDim2.new(1,-10,1,-10),Position=UDim2.new(0,5,0,5),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(255,220,60),Font=Enum.Font.Code,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top},StatsGui)

task.spawn(function()
local frames=0
local last=os.clock()
while task.wait(0.5) do
frames=frames+1
if os.clock()-last>=0.5 then
local fps=math.floor(frames/(os.clock()-last))
frames=0
last=os.clock()
local txt=""
if C.ShowFPS then txt=txt.."FPS: "..fps.."\n" end
if C.ShowPing then txt=txt.."Ping: "..math.floor(LP:GetNetworkPing()*1000).."ms\n" end
if C.ShowCoords then local h=HRP();if h then txt=txt.."XYZ: "..math.floor(h.Position.X)..","..math.floor(h.Position.Y)..","..math.floor(h.Position.Z).."\n" end end
if C.ShowSpeed then local h=Hum();if h then txt=txt.."Speed: "..math.floor(h.WalkSpeed).."\n" end end
if C.ShowHealth then local h=Hum();if h then txt=txt.."HP: "..math.floor(h.Health).."/"..math.floor(h.MaxHealth).."\n" end end
if C.ShowPlayerCount then txt=txt.."Players: "..#Players:GetPlayers().."\n" end
if C.ShowServerInfo then txt=txt.."JobID: "..game.JobId:sub(1,8).."\n" end
StatsLabel.Text=txt
end
end
end)

RunService.Heartbeat:Connect(function()
if C.Invisible then
local c=LP.Character
if c then
for _,v in pairs(c:GetDescendants()) do
if v:IsA("BasePart") then v.LocalTransparencyModifier=1;v.Transparency=1 end
if v:IsA("Decal") then v.Transparency=1 end
end
end
end
end)

RunService.Heartbeat:Connect(function()
if C.FreezePlayer then
local h=Hum()
if h then h.WalkSpeed=0;h.JumpPower=0 end
end
end)

RunService.Heartbeat:Connect(function()
if C.WalkOnAir then
local h=Hum()
if h then h:ChangeState(Enum.HumanoidStateType.Physics) end
end
end)

task.spawn(function()
while task.wait(0.05) do
if C.FastAttack then
local c=LP.Character
if c then
local tool=c:FindFirstChildOfClass("Tool")
if tool then tool:Activate() end
end
end
end
end)

task.spawn(function()
while task.wait(0.3) do
if C.AutoSkill or C.AutoCombo then
local mob=NearestMob(100)
if mob then
for _,k in ipairs({Enum.KeyCode.Z,Enum.KeyCode.X,Enum.KeyCode.C,Enum.KeyCode.V,Enum.KeyCode.F}) do
PressKey(k)
task.wait(0.05)
end
end
end
end
end)

task.spawn(function()
while task.wait(2) do
if C.AutoFarmQuest then
local mob=NearestMob(500)
if mob then
local hrp=HRP()
if hrp then hrp.CFrame=mob.HumanoidRootPart.CFrame*CFrame.new(0,0,5);Attack(mob) end
end
end
end
end)

task.spawn(function()
while task.wait(1) do
if C.AutoFarmChest or C.AutoChest then
for _,v in pairs(Workspace:GetDescendants()) do
if v:IsA("Part") and v.Name:lower():find("chest") then
local hrp=HRP()
if hrp then hrp.CFrame=v.CFrame+Vector3.new(0,3,0) end
task.wait(0.2)
end
end
end
end
end)

task.spawn(function()
while task.wait(0.5) do
if C.AutoFarmFruit or C.AutoFruitCollect then
for _,v in pairs(Workspace:GetDescendants()) do
if v:IsA("Tool") and v:FindFirstChild("Handle") then
local hrp=HRP()
if hrp then hrp.CFrame=v.Handle.CFrame+Vector3.new(0,2,0) end
end
end
end
end
end)

task.spawn(function()
while task.wait(2) do
if C.AutoSaber or C.AutoRace or C.AutoPole or C.AutoDarkBlade or C.AutoCursedDual or C.AutoDragonTrident or C.AutoSharkmanKarate or C.AutoSuperhuman or C.AutoDeathStep or C.AutoElectricClaw or C.AutoDragonTalon or C.AutoGodhuman or C.AutoSanguineArt then
local mob=NearestMob(400)
if mob then
local hrp=HRP()
if hrp then hrp.CFrame=mob.HumanoidRootPart.CFrame*CFrame.new(0,0,5);Attack(mob) end
end
end
end
end)

task.spawn(function()
while task.wait(3) do
if C.AutoFarmRaid or C.AutoFarmTrial or C.AutoFarmRaceV4 then
local mob=NearestMob(600)
if mob then
local hrp=HRP()
if hrp then hrp.CFrame=mob.HumanoidRootPart.CFrame*CFrame.new(0,0,5);Attack(mob) end
end
end
end
end)

task.spawn(function()
while task.wait(2) do
if C.AutoFarmSeaBeast or C.AutoFarmLeviathan or C.AutoFarmKitsune or C.AutoFarmHydra then
for _,v in pairs(Workspace:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
local n=v.Name:lower()
if n:find("sea") or n:find("leviathan") or n:find("kitsune") or n:find("hydra") then
local hrp=HRP()
if hrp then hrp.CFrame=v.HumanoidRootPart.CFrame*CFrame.new(0,0,8);Attack(v) end
end
end
end
end
end
end)

StarterGui:SetCore("SendNotification",{Title="Banana Hub V2",Text="Loaded | No Key | "..#Players:GetPlayers().." players online",Duration=5})
print("[Banana Hub V2] Loaded - No Key Required")
print("[Banana Hub V2] Total functions: ~150")
