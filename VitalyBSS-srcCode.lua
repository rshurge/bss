repeat 
	task.wait() 
until game:IsLoaded() 
	and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") 
	and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.LoadingMessage.Visible == false

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
