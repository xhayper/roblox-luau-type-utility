--!strict

--[[--
An object that runs connected functions upon a specific occurrence.

[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal)
]]--
export type StrictRBXScriptSignal<Variant... = ...any> = {
	--[[--
	Connects the given function to the event and returns an [RBXScriptConnection](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptConnection) that represents it.

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal#Connect)
	]]--
	Connect: (StrictRBXScriptSignal<Variant...>, func: (Variant...) -> ()) -> RBXScriptConnection,

	--[[--
	Connects the given function to the event and returns an [RBXScriptConnection](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptConnection) that represents it.

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal#ConnectParallel)
	]]--
	ConnectParallel: (StrictRBXScriptSignal<Variant...>, func: (Variant...) -> ()) -> RBXScriptConnection,

	--[[--
	Connects the given function to the event (for a single invocation) and returns an [RBXScriptConnection](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptConnection) that represents it.

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal#Once)
	]]--
	Once: (StrictRBXScriptSignal<Variant...>, func: (Variant...) -> ()) -> RBXScriptConnection,

	--[[--
	Yields the current thread until the signal fires and returns the arguments provided by the signal.

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal#Wait)
	]]--
	Wait: (StrictRBXScriptSignal<Variant...>) -> (Variant...),
}

--[[--
An object used to create custom Events that Scripts can fire and connect to.

```luau
local bindableEvent = script.Parent

-- Define a simple function to connect to the custom event
local function onEvent(...)
	print(...)
end
bindableEvent.Event:Connect(onEvent)

-- Fire the event
bindableEvent:Fire("Hello, world")
```

[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/BindableEvent)
]]--
export type StrictBindableEvent<Variant... = ...any> = {
	--[[--
	The event that is fired when [Fire](https://create.roblox.com/docs/reference/engine/classes/BindableEvent#Fire) is called.

    [Learn more](https://create.roblox.com/docs/reference/engine/datatypes/BindableEvent#Event)
    ]]--
	Event: StrictRBXScriptSignal<Variant...>,

	--[[--
	Fires the [BindableEvent](https://create.roblox.com/docs/reference/engine/classes/BindableEvent), which fires the [BindableEvent.Event](https://create.roblox.com/docs/reference/engine/classes/BindableEvent#Event) event.

    [Learn more](https://create.roblox.com/docs/reference/engine/datatypes/BindableEvent#Fire)
    ]]--
	Fire: (StrictBindableEvent<Variant...>, Variant...) -> ()
} & Instance

--[[--
An object used to expose one function to other scripts.

```luau
local bindableFunction = script.Parent

-- Define a function for use with the BindableFunction
local function AddTwoNumbers(a, b)
	return a + b
end

-- Set the OnInvoke callback to be our function
bindableFunction.OnInvoke = AddTwoNumbers

-- Invoke the BindableFunction
print(bindableFunction:Invoke(25, 44))
```

[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/BindableFunction)
]]--
export type StrictBindableFunction<A... = ...any, R... = ...any> = {
	--[[--
	Callback for when the [BindableFunction](https://create.roblox.com/docs/reference/engine/classes/BindableFunction) is invoked with [BindableFunction:Invoke()](https://create.roblox.com/docs/reference/engine/classes/BindableFunction#OnInvoke).

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/BindableFunction#OnInvoke)
	]]--
	OnInvoke: (A...) -> (R...),

	--[[--
	Calls the [BindableFunction.OnInvoke](https://create.roblox.com/docs/reference/engine/classes/BindableFunction#OnInvoke) callback of the [BindableFunction](https://create.roblox.com/docs/reference/engine/classes/BindableFunction), returning any values returned by the callback.

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/BindableFunction#Invoke)
	]]--
	Invoke: (StrictBindableFunction<A..., R...>, A...) -> (R...)
} & Instance

--[[--
Simillar to `BindableEvent`, but allows crossing the client/server boundary.

```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local createPartEvent = Instance.new("RemoteEvent")
createPartEvent.Name = "CreatePartEvent"
createPartEvent.Parent = ReplicatedStorage

local function onCreatePartFired(player, color, position)
	print(player.Name, "wants to create a part")
	local newPart = Instance.new("Part")
	newPart.BrickColor = color
	newPart.Position = position
	newPart.Parent = workspace
end

createPartEvent.OnServerEvent:Connect(onCreatePartFired)
```

[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteEvent)
]]--
export type StrictRemoteEvent<Variant... = ...any> = {
	--[[--
	Fires listening functions in [LocalScript](https://create.roblox.com/docs/reference/engine/classes/LocalScript) when either [RemoteEvent:FireClient()](https://create.roblox.com/docs/reference/engine/classes/RemoteEvent#FireClient) or [RemoteEvent:FireAllClients()](https://create.roblox.com/docs/reference/engine/classes/RemoteEvent#FireAllClients) is called from a [Script](https://create.roblox.com/docs/reference/engine/classes/Script).

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteEvent#OnClientEvent)
	]]--
	OnClientEvent: StrictRBXScriptSignal<Variant...>,

	--[[--
	Fires listening functions in [Script](https://create.roblox.com/docs/reference/engine/classes/Script) when [RemoteEvent:FireServer()](https://create.roblox.com/docs/reference/engine/classes/RemoteEvent#FireServer) is called from a [LocalScript](https://create.roblox.com/docs/reference/engine/classes/LocalScript).

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteEvent#OnServerEvent)
	]]--
	OnServerEvent: StrictRBXScriptSignal<(Player, Variant...)>,

	--[[--
	Fires the [RemoteEvent.OnClientEvent](https://create.roblox.com/docs/reference/engine/classes/RemoteEvent#OnClientEvent) event for each client.

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteEvent#FireAllClients)
	]]--
	FireAllClients: (StrictRemoteEvent<Variant...>, Variant...) -> (),

	--[[--
	Fires [RemoteEvent.OnClientEvent](https://create.roblox.com/docs/reference/engine/classes/RemoteEvent#OnClientEvent) for the specified player.

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteEvent#FireClient)
	]]--
	FireClient: (StrictRemoteEvent<Variant...>, player: Player, Variant...) -> (),

	--[[
	Fires the [RemoteEvent.OnServerEvent](https://create.roblox.com/docs/reference/engine/classes/RemoteEvent#OnServerEvent) event on the server using the arguments specified with an additional player argument at the beginning.

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteEvent#FireServer)
	]]--
	FireServer: (StrictRemoteEvent<Variant...>, Variant...) -> (),
} & Instance

--[[--
Used to create in-game APIs that both the client and the server can use to communicate with each other.

```luau
local bindableFunction = script.Parent

-- Define a function for use with the BindableFunction
local function AddTwoNumbers(a, b)
	return a + b
end

-- Set the OnInvoke callback to be our function
bindableFunction.OnInvoke = AddTwoNumbers

-- Invoke the BindableFunction
print(bindableFunction:Invoke(25, 44))
```

[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteFunction)
]]--
export type StrictRemoteFunction<A... = ...any, R... = ...any> = {
	--[[--
	Calls the function bound to the [RemoteFunction](https://create.roblox.com/docs/reference/engine/classes/RemoteFunction) by [RemoteFunction.OnClientInvoke](https://create.roblox.com/docs/reference/engine/classes/RemoteFunction#OnClientInvoke) for the given [Player](https://create.roblox.com/docs/reference/engine/classes/Player). Use only in a [Script](https://create.roblox.com/docs/reference/engine/classes/Script).

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteFunction#InvokeClient)
	]]--
	InvokeClient: (StrictRemoteFunction<A..., R...>, player: Player, A...) -> (R...),

	--[[--
	Calls the function bound to the [RemoteFunction](https://create.roblox.com/docs/reference/engine/classes/RemoteFunction) by [RemoteFunction.OnServerInvoke](https://create.roblox.com/docs/reference/engine/classes/RemoteFunction#OnServerInvoke) and returns what that function returns. Use only in a [LocalScript](https://create.roblox.com/docs/reference/engine/classes/LocalScript).

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteFunction#InvokeServer)
	]]--
	InvokeServer: (StrictRemoteFunction<A..., R...>, A...) -> (R...),

	--[[--
	Called when the client is invoked by [RemoteFunction:InvokeClient()](https://create.roblox.com/docs/reference/engine/classes/RemoteFunction#InvokeClient).

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteEvent#OnClientEvent)
	]]--
	OnClientInvoke: (A...) -> (R...),

	--[[--
	Called when the server is invoked by [RemoteFunction:InvokeServer()](https://create.roblox.com/docs/reference/engine/classes/RemoteFunction#InvokeServer).

	[Learn more](https://create.roblox.com/docs/reference/engine/datatypes/RemoteEvent#OnServerEvent)
	]]--
	OnServerInvoke: (player: Player, A...) -> (R...)
} & Instance