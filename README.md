# roblox-luau-type-utility

## Example

```lua
local remoteThingy = Instance.new("RemoteEvent") :: StrictRemoteEvent<string, number, boolean>

remoteThingy.OnServerEvent:Connect(function(player: Player, woah: string, what: number, is: boolean)

end)

remoteThingy.OnServerEvent:Connect(function(player: Player, woah: string, what: boolean, is: number) -- ERROR!

end)

remoteThingy:FireServer("woah", 123, false)
remoteThingy:FireServer("woah", false, 123) -- ERROR!
```
