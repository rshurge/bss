for i,v in pairs(workspace.Decorations["Diamond Mask Hall"]:GetChildren()) do
	if v:FindFirstChild("GateScript") and v.Name == "Part" then
		v.CanTouch = false
	end
end

local getcustomasset = getsynasset or getcustomasset or function() end
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function() end 
local isfile = isfile or function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end


workspace.Decorations["30BeeZone"].Pit.CanTouch = false

if not LPH_OBFUSCATED then
	getgenv().LPH_NO_VIRTUALIZE = function(...) return ... end
	getgenv().LPH_JIT = function(...) return ... end 
	getgenv().LPH_STRENC = function(str) return str end
end
local std = setthreadcaps or setthreadidentity
local scriptType = LPH_STRENC("Paid")

ExploitSpecific = "📜"
Danger = "⚠️"
Star = "⭐"

-- Variables
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
local library
local api
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

do
	if not setreadonly then game.Players.LocalPlayer:Kick("x.synapse.to") end

	setreadonly(table, false)

	local ver = 0

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
	vitaly["isSynapse"] = function()
		if syn then
			return true
		else
			return false
		end
	end
	vitaly["isSynV3"] = function()
		local exploit = identifyexecutor and table.concat({ identifyexecutor() }, " ") or "Unknown"
		if exploit:gmatch("/") then
			exploit = exploit:split("/")[1]
		end
		if vitaly.isSynapse() and exploit:lower():match("v3") then
			return true
		end
		return false
	end
	vitaly['isKrnl'] = function()
		if Krnl then
			return true
		else
			return false
		end
	end
	vitaly['isScriptWare'] = function()
		if identifyexecutor and tostring(identifyexecutor()):match("ScriptWare") then return true end
	end
	vitaly['isFluxus'] = function()
		if identifyexecutor and tostring(identifyexecutor()):match("Fluxus") then return true end
	end
	vitaly['isElectron'] = function()
		if identifyexecutor and tostring(identifyexecutor()):match("Electron") then return true end
	end
	vitaly["isValyse"] = function()
		return Valyse and true or false
	end
	vitaly['ver'] = ver
	vitaly['magnitude'] = function(v1, v2)
		return ((v2 or vitaly.humanoidrootpart().Position) - v1).magnitude
	end
	vitaly['afunc'] = function(f)
		local wa = coroutine.create(
			function()
				f()
			end)
		coroutine.resume(wa)
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

	do -- secure_call things
		local oldt;oldt = hookfunction(getrenv().debug.traceback, function(lol) -- prevent debug.traceback detection
			local traceback = oldt(lol)
			if checkcaller() then
				local a = traceback:split("\n")
				return string.format("%s\n%s\n", a[1], a[3])
			end
			return traceback
		end)
		local oldi;oldi = hookfunction(getrenv().debug.info, function(lvl, a) -- prevent debug.info detection
			if checkcaller() then
				return oldi(3, a)
			end
			return oldi(lvl, a)
		end)
	end

	getgenv().secureCall = function(Function, Script, ...)
		assert(Script ~= nil or typeof(Script) == "Instance", string.format("invalid argument #1 to '%s' (table expected, got %s)", "secureCall", typeof(Script)))
		assert(Function ~= nil or typeof(Function) == "function", string.format("invalid argument #2 to '%s' (table expected, got %s)", "secureCall", typeof(Function)))
		assert(Script.ClassName == "LocalScript" or Script.ClassName == "ModuleScript", string.format("bad argument to #3 to '%s' (LocalScript or ModuleScript expected, got %s)", "secureCall", Script.ClassName))

		if vitaly.isSynV3() then
			local Info = debug.getinfo(Function)
			local Options = {
				script = Script,
				identity = 2,
				env = getsenv(Script),
				thread = getscriptthread and getscriptthread(Script)
			}
			local Callstack = {Info}

			return syn.trampoline_call(Function, Callstack, Options, ...)
		elseif vitaly.isSynapse() then
			return syn.secure_call(Function, Script, ...)
		elseif vitaly.isKrnl() then
			return coroutine.wrap(function(...)
				setthreadcontext(2)
				setfenv(0, getsenv(Script))
				setfenv(1, getsenv(Script))
				return Function(...)
			end)(...)
		elseif vitaly.isScriptWare() then
			local func, env = Function, Script
			local functype, envtype = typeof(func), typeof(env)
			assert(functype == "function", string.format("bad argument #1 to 'secure_call' (function expected, got %s)", functype))
			assert(envtype == "Instance", string.format("bad argument #2 to 'secure_call' (Instance expected, got %s)", envtype))
			local envclass = env.ClassName
			assert(envclass == "LocalScript" or envclass == "ModuleScript", string.format("bad argument #2 to 'secure_call' (LocalScript or ModuleScript expected, got %s)", envclass))
			local _, fenv = xpcall(function()
				return getsenv(env)
			end, function()
				return getfenv(func)
			end)
			return coroutine.wrap(function(...)
				setidentity(2)
				setfenv(0, fenv)
				setfenv(1, fenv)
				return func(...)
			end)(...)
		elseif vitaly.isElectron() or vitaly.isFluxus() or vitaly.isValyse() then
			return coroutine.wrap(function(...)
				setthreadcontext(2)
				setfenv(0, getsenv(Script))
				setfenv(1, getsenv(Script))
				return Function(...)
			end)(...)
		else
			return coroutine.wrap(function(...) 
				(set_thread_identity or setthreadcontext)(2)
				return Function(...)
			end)(...)
		end
	end

	setreadonly(table, false)

	api = vitaly
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
